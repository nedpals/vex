// from: https://github.com/vlang/v/pull/1142
// See also: https://www.w3.org/Protocols/rfc2616/rfc2616-sec4.html

module server

import net
import net.http
import io
import net.urllib
import strings
import router
import ctx
import utils

const (
	sep = '\r\n'
)

pub struct Server {
mut:
	router map[string]router.Route
}

// create server
pub fn new() Server {
	return Server{}
}

pub fn (mut s Server) route(method router.Method, path string, handlers ...ctx.HandlerFunc) {
	s.router.add(method, path, handlers...) or { panic(err) }
}

pub fn (mut srv Server) serve(port int) {
	println('[vex] Vex HTTP Server has started.\n[vex] Serving on http://localhost:$port') 
	listener := net.listen_tcp(port) or {
		panic("Failed to listen to port $port")
	}
	for {
		mut conn := listener.accept() or {
			listener.close() or { }
			panic("conn accept() failed.")
		}
		handle_http_connection(mut srv, mut conn)
	}
}

fn write_body(res &ctx.Resp, mut conn net.TcpConn) {
	mut response := strings.new_builder(1024)
	statuscode_msg := utils.status_code_msg(res.status_code)
	response.write('HTTP/1.1 ${res.status_code} ${statuscode_msg}$sep')
	for header_name, header_value in res.headers {
		response.write('$header_name: ${header_value}$sep')
	}
	response.write('Content-Length: ${res.body.len}${sep}Connection: close$sep$sep$res.body')
	conn.write(response.buf) or {}
	conn.close() or {}
	unsafe{ response.free() }
}

fn send_500(mut conn net.TcpConn){
	mut eres := ctx.Resp{}
	eres.send_status(500)
	write_body(&eres, mut conn)
}

fn handle_http_connection(mut srv Server, mut conn net.TcpConn) {	
	mut reader := io.new_buffered_reader(reader: io.make_reader(conn))
	first_line := reader.read_line() or {
		send_500(mut conn)
		return
	}

	data := first_line.split(' ')
	if data.len < 2 {
		send_500(mut conn)
		return
	}

	req_path := urllib.parse(data[1]) or {
		send_500(mut conn)
		return
	}

	mut headers := []string{}
	// encode headers
	for {
		header_line := reader.read_line() or {
			send_500(mut conn)
			return
		}
		if header_line.len == 0 {
			break
		}
		headers << header_line
	}

	mut req := ctx.Req{
		headers: http.parse_headers(headers),
		method: data[0],
		path: req_path.path
	}

	unsafe { headers.free() }
	
	// parse queries
	if req_path.raw_query.len > 0 {
		query_map := req_path.query().data
		for q in query_map.keys() {
			req.query[q] = query_map[q].data[0]
		}
	}

	if req.method == 'POST' && 'Content-Length' in req.headers {
		mut conlen := req.headers['Content-Length'].int()
		for conlen > 0 {
			content := reader.read_line() or {
				send_500(mut conn)
				return
			}

			conlen -= content.len
			req.body += content
		}
	}

	mut res := ctx.Resp{
		status_code: 200,
		path: req_path.path,
		headers: {
			'Content-Type': 'text/plain',
			'Server': 'Vex'
		},
	}

	// for mw in srv.middlewares {
	// 	mwh := mw.handler
	// 	mwh(mut req, mut res)
	// }

	params, handlers := srv.router.find(req.method.to_lower(), req.path) or {
		ctx.send_404(req, mut res)
		return
	}

	req.params = params
	for route_handler in handlers {
		route_handler(req, mut res)
	}
	write_body(&res, mut conn)
}