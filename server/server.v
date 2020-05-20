// from: https://github.com/vlang/v/pull/1142
// See also: https://www.w3.org/Protocols/rfc2616/rfc2616-sec4.html

module server

import net
import net.http
import net.urllib
import strings
import router
import ctx
import utils
import time

const (
	separator = '\r\n'
	HTTP_REQUEST_TYPICAL_SIZE = 1024
)

pub type ServerHandlerFunc = fn (mut srv Server, mut req ctx.Req, mut res ctx.Resp)

pub struct Server {
pub mut:
	port int
	router router.Router
	middlewares []Middleware
	handler ServerHandlerFunc = handle
}

// create server
pub fn new() Server {
	return Server{ 
		router: router.new()
		middlewares: []
	}
}

pub fn (mut srv Server) serve(port int) {
	println('[vex] Vex HTTP Server has started.\n[vex] Serving on http://localhost:$port')
	srv.port = port
	listener := net.listen(srv.port) or {
		panic("Failed to listen to port $port")
	}
	for {
		conn := listener.accept() or {panic("conn accept() failed.")}
		handle_http_connection(mut srv, &conn)
	}
}

fn write_body(res &ctx.Resp, conn &net.Socket) {
	mut response := strings.new_builder(1024)
	statuscode_msg := utils.status_code_msg(res.status_code)
	response.write('HTTP/1.1 ${res.status_code} ${statuscode_msg}$separator')
	for header_name, header_value in res.headers {
		response.write('$header_name: ${header_value}$separator')
	}
	response.write('Content-Length: ${res.body.len}${separator}Connection: close$separator')
	conn.write(response.str()) or {}
	response.free()
	conn.send(res.body.str, res.body.len) or {}
	conn.close() or {}
}

fn send_500(conn &net.Socket){
	mut eres := ctx.Resp{}
	eres.send_status(500)
	write_body(eres, conn)
}

pub fn handle(mut srv Server, mut req ctx.Req, mut res ctx.Resp) {
	for mw in srv.middlewares {
		mwh := mw.handler
		mwh(mut req, mut res)
	}

	srv.router.listen(mut req, mut res)
}

fn handle_http_connection(mut srv Server, conn &net.Socket) {	
	mut stopwatch := time.new_stopwatch()
	stopwatch.start()
	request_lines := read_http_request_lines( conn )
	if request_lines.len < 1 {
		send_500(conn)
		return
	}

	first_line := request_lines[0]
	data := first_line.split(' ')
	if data.len < 2 {
		send_500(conn)
		return
	}
	
	req_path := urllib.parse(data[1]) or {
		send_500(conn)
		return
	}
	
	mut req := ctx.Req{
		headers: http.parse_headers(request_lines),
		method: data[0],
		path: req_path.path,
		cookies: map[string]string,
		query: map[string]string
	}
	
	req.parse_cookies()
	req.parse_queries(req_path)

	if req.method == 'POST' {
		body_arr := first_line.split(separator)
		req.body = body_arr[body_arr.len-1]
	}

	mut res := ctx.Resp{
		status_code: 200,
		path: req_path.path,
		headers: {
			'Content-Type': 'text/plain',
			'Server': 'Vex',
			'X-Powered-By': 'Vex'
		},
		time: stopwatch
	}

	srv_handler := srv.handler
	srv_handler(mut srv, mut req, mut res)
	write_body(&res, conn)
	stopwatch.restart()
}

fn read_http_request_lines(sock &net.Socket) []string {
	mut lines := []string{}
	mut buf := [HTTP_REQUEST_TYPICAL_SIZE]byte // where C.recv will store the network data

	for {
		mut res := '' // The buffered line, including the ending \n.
		mut line := '' // The current line segment. Can be a partial without \n in it.
		for {
			n := C.recv(sock.sockfd, buf, HTTP_REQUEST_TYPICAL_SIZE-1, net.MSG_PEEK)
			//println('>> recv: ${n:4d} bytes .')
			if n in [-1, 0] { return lines }
			buf[n] = `\0`
			mut eol_idx := -1
			for i := 0; i < n; i++ {
				if int(buf[i]) == 10 {
					eol_idx = i
					// Ensure that tos_clone(buf) later,
					// will return *only* the first line (including \n),
					// and ignore the rest
					buf[i+1] = `\0`
					break
				}
			}
			line = tos_clone(buf)
			if eol_idx > 0 {
				// At this point, we are sure that recv returned valid data,
				// that contains *at least* one line.
				// Ensure that the block till the first \n (including it)
				// is removed from the socket's receive queue, so that it does
				// not get read again.
				C.recv(sock.sockfd, buf, eol_idx+1, 0)
				res += line
				break
			}
			// recv returned a buffer without \n in it .
			C.recv(sock.sockfd, buf, n, 0)
			res += line
			break
		}
		trimmed_line := res.trim_right(separator)
		if trimmed_line.len == 0 { break }
		lines << trimmed_line
	}

	return lines
}