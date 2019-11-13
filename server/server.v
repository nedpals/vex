// from: https://github.com/vlang/v/pull/1142

module server

import net
import http
import os

struct Server {
pub mut:
	port int
	routes []Route
}

// create server
pub fn server() Server {
	return Server{ routes: []Route }
}

fn write_body(res Response, conn net.Socket) {
	statuscode_msg := status_code_msg(res.status_code)

	conn.write('HTTP/1.1 ${res.status_code} ${statuscode_msg}\r')

	header_keys := res.headers.keys()	
	for header_name in header_keys {
		header_val := res.headers[header_name]
		conn.write(header_name + ': ' + header_val)
	}

	conn.write('')
	conn.write(res.body)
}

fn get_static_file_content(req Request, res mut Response) {
	res.send_file(req.path, 200)
}

pub fn (srv mut Server) serve_static(root_folder string) {
	location := os.getwd() + '/' + root_folder

	if !os.dir_exists(location) {
		return
	}

	files := os.ls(location) or { return }

	for file in files {
		srv.get('/${root_folder}/${file}', get_static_file_content)
	}
}

pub fn (srv mut Server) serve(port int) {
	srv.port = port
	listener := net.listen(srv.port) or {panic("Failed to listen to port $port")}
	for {
		conn := listener.accept() or {panic("conn accept() failed.")}
		s := conn.read_line()
		first_line := s.all_before('\n')
		vals := first_line.split(' ')

		path := if vals[1].starts_with('//') { vals[1].all_after('/') } else { vals[1] }
		params, matched_rte := srv.find(vals[0], path)
		mut rte := if matched_rte.name.len != 0 { matched_rte } else { Route{ ctx: Context{ req: Request{}, res: Response{}}} }

		mut req := rte.ctx.req
		mut res := rte.ctx.res
		req.headers = http.parse_headers(s.split_into_lines())
		req.method = vals[0]
		req.path = path
		res.path = path
		req.params = params

		query_arr := path.all_after('?').split('&')

		for q in query_arr {
			q_arr := q.split('=')

			req.query[q_arr[0]] = q_arr[1]
		}

		if s == '' || vals.len < 2 {
			res.send('<h1>500 Internal Server Error</h1>', 500)
			write_body(res, conn) 
			conn.close() or { return }
			return
		}

		if rte.method == 'POST' {
			req.body = s
		}

		if matched_rte.name.len != 0 {
			handler := rte.func
			handler(req, mut res)
		} else {
			res.set_header('Content-Type', 'text/html')
			res.send('<h1>404 Not Found</h1>', 404)
		}

		if !('Content-Type' in res.headers) {
			res.set_header('Content-Type', 'text/plain')
		}

		write_body(res, conn) 
		conn.close() or { return }
	}
}