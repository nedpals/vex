// from: https://github.com/vlang/v/pull/1142

module server

	net.urllib

const (
    separator = '\r\n'
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
		data := first_line.split(' ')

		req_path := urllib.parse(data[1]) or { return }
		params, matched_rte := srv.find(data[0], req_path.path)
		mut rte := if matched_rte.name.len != 0 { matched_rte } else { Route{ ctx: Context{ req: Request{}, res: Response{}}} }

		mut req := rte.ctx.req
		mut res := rte.ctx.res
		req.headers = http.parse_headers(s.split_into_lines())
		req.method = data[0]
		req.path = req_path.path
		res.path = req_path.path
		req.params = params

		if req_path.raw_query.len != 0 {
			query_map := req_path.query().data

			for q in query_map.keys() {
				req.query[q] = query_map[q].data[0]
			}
		}

		if 'Cookie' in req.headers {
			cookies_arr := req.headers['Cookie'].split('; ')

			for cookie_data in cookies_arr {
				ck := cookie_data.split('=')
				ck_val := urllib.query_unescape(ck[1]) or { 
					res.send('<h1>500 Internal Server Error</h1>', 500)
					write_body(res, conn) 
					conn.close() or { return }
					return
				}
				req.cookies[ck[0]] = ck_val
			}
		}

		if s == '' || data.len < 2 {
			res.send('<h1>500 Internal Server Error</h1>', 500)
			write_body(res, conn) 
			conn.close() or { return }
			return
		}

		if srv.middlewares.len != 0 {
			for mw in srv.middlewares {
					mw_handler := mw.handler
					mw_handler(req, mut res)
				}
			}
		}

		if rte.method == 'POST' {
			body_arr := s.split('\r\n')
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

		write_body(res, conn) 
		conn.close() or { return }
	}
}