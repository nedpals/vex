// from: https://github.com/vlang/v/pull/1142
// See also: https://www.w3.org/Protocols/rfc2616/rfc2616-sec4.html

module server

import (
	net
	http
	net.urllib
	os
	strings
)

const (
	separator = '\r\n'
	HTTP_REQUEST_TYPICAL_SIZE = 1024
)

struct Server {
pub mut:
	port int
	routes []Route
	middlewares []Middleware
}

// create server
pub fn new() Server {
	return Server{ routes: [], middlewares: [] }
}

pub fn (srv mut Server) serve(port int) {
	println('Serving at port: $port')
	srv.port = port
	listener := net.listen(srv.port) or {panic("Failed to listen to port $port")}
	for {
		conn := listener.accept() or {panic("conn accept() failed.")}
		srv.handle_http_connection(conn)
	}
}

pub fn (srv mut Server) serve_static(root_folder string) {
	location := os.getwd() + '/' + root_folder
	if !os.dir_exists(location) { return }
	files := os.ls(location) or { return }
	for file in files {
		srv.get('/${root_folder}/${file}', get_static_file_content)
	}
}

fn write_body(res &Response, conn &net.Socket) {
	mut response := strings.new_builder(1024)
	statuscode_msg := status_code_msg(res.status_code)
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

fn get_static_file_content(req Request, res mut Response) {
	res.send_file(req.path, 200)
}

fn con500(conn &net.Socket){
	mut eres := Response{}
	eres.send('<h1>500 Internal Server Error</h1>', 500)
	write_body(eres, conn)
}

fn (srv mut Server) handle_http_connection(conn &net.Socket){	
	request_lines := read_http_request_lines( conn )
	if request_lines.len < 1 {
		con500(conn)
		return
	}
	first_line := request_lines[0]
	data := first_line.split(' ')
	if data.len < 2 {
		con500(conn)
		return
	}
	
	req_path := urllib.parse(data[1]) or {
		con500(conn)
		return
	}
	
	params, matched_rte := srv.find(data[0], req_path.path)
	mut rte := if matched_rte.name.len != 0 { matched_rte } else { Route{ctx: Context{ req: Request{}, res: Response{}}} }
	
	mut req := rte.ctx.req
	mut res := rte.ctx.res
	res.status_code = 200
	req.headers = http.parse_headers(request_lines)
	req.method = data[0]
	req.path = req_path.path
	res.path = req_path.path
	req.params = params
	
	if 'Cookie' in req.headers {
		cookies_arr := req.headers['Cookie'].split('; ')
		
		for cookie_data in cookies_arr {
			ck := cookie_data.split('=')
			ck_val := urllib.query_unescape(ck[1]) or {
				con500(conn)
				return
			}
			req.cookies[ck[0]] = ck_val
		}
	}
	
	if req_path.raw_query.len != 0 {
		query_map := req_path.query().data
		for q in query_map.keys() {
			req.query[q] = query_map[q].data[0]
		}
	}

	if rte.method == 'POST' {
		body_arr := first_line.split(separator)
		req.body = body_arr[body_arr.len-1]
	}

	if matched_rte.name.len != 0 {
		handler := rte.handler
		handler(req, mut res)
	} else {
		res.set_header('Content-Type', 'text/html')
		res.send('<h1>404 Not Found</h1>', 404)
	}
	
	if !('Content-Type' in res.headers) {
		res.set_header('Content-Type', 'text/plain')
	}

	for mw in srv.middlewares {
		if '*' in mw.whitelist || (req_path.path in mw.whitelist || !(req_path.path in mw.blacklist)) {
			mw_handler := mw.handler
			mw_handler(req, mut res)
		}
	}

	write_body(res, conn)
}

fn read_http_request_lines(sock &net.Socket) []string {
	mut lines := []string
	mut buf := [HTTP_REQUEST_TYPICAL_SIZE]byte // where C.recv will store the network data

	for {
		mut res := '' // The buffered line, including the ending \n.
		mut line := '' // The current line segment. Can be a partial without \n in it.
		for {
			n := int(C.recv(sock.sockfd, buf, HTTP_REQUEST_TYPICAL_SIZE-1, net.MSG_PEEK))
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

