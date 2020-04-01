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

pub struct Server {
pub mut:
	port int
	router router.Router
	middlewares []Middleware
}

// create server
pub fn new() Server {
	return Server{ 
		router: router.new()
		middlewares: []
	}
}

pub fn (srv mut Server) serve(port int) {
	println('Serving at port: $port')
	srv.port = port
	listener := net.listen(srv.port) or {
		panic("Failed to listen to port $port")
	}
	for {
		conn := listener.accept() or {panic("conn accept() failed.")}
		srv.handle_http_connection(conn)
	}
}

fn write_body(res &ctx.Response, conn &net.Socket) {
	mut response := strings.new_builder(1024)
	statuscode_msg := utils.status_code_msg(res.status_code)
	response.write('HTTP/1.1 ${res.status_code} ${statuscode_msg}$separator')
	for header_name, header_value in res.headers {
		response.write('$header_name: ${header_value}$separator')
	}
	response.write('Content-Length: ${res.body.len}$separator')
	response.write('Connection: close$separator')
	conn.write(response.str()) or {}
	response.free()
	conn.send(res.body.str, res.body.len) or {}
	conn.close() or {}
}

fn send_500(conn &net.Socket){
	mut eres := ctx.Response{}
	eres.send('<h1>500 Internal Server Error</h1>', 500)
	write_body(eres, conn)
}

fn (srv mut Server) handle_http_connection(conn &net.Socket) {	
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
	
	mut req := ctx.Request{
		headers: http.parse_headers(request_lines),
		method: data[0],
		path: req_path.path,
		cookies: map[string]string,
		query: map[string]string,
		time: time.now()
	}
	
	req.parse_cookies()
	req.process_query(req_path)

	if req.method == 'POST' {
		body_arr := first_line.split(separator)
		req.body = body_arr[body_arr.len-1]
	}

	mut res := ctx.Response{
		status_code: 200,
		path: req_path.path,
		headers: {
			'Content-Type': 'text/plain',
			'Server': 'Vex',
			'X-Powered-By': 'Vex'
		},
		time: time.now()
	}

	for mw in srv.middlewares {
		mw.handler(mut req, mut res)
	}

	srv.router.listen(mut req, mut res)
	write_body(&res, conn)
}

fn read_http_request_lines(sock &net.Socket) []string {
	mut lines := []string
	mut buf := [HTTP_REQUEST_TYPICAL_SIZE]byte // where C.recv will store the network data

	for {
		mut res := '' // The buffered line, including the ending \n.
		mut line := '' // The current line segment. Can be a partial without \n in it.
		for {
			n := C.recv(sock.sockfd, buf, HTTP_REQUEST_TYPICAL_SIZE-1, net.MSG_PEEK)
			//println('>> recv: ${n:4d} bytes .')
			if n == -1 { return lines }
			if n == 0 {	return lines }
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