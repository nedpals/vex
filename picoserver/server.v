module picoserver

import net
import net.http
import picoev
import picohttpparser
import server { Router }

const sep = '\r\n'

struct Server {
	router Router
}

fn callback(mut server_ Server, req picohttpparser.Request, mut res picohttpparser.Response) {
	mut req_headers := []string{}
	for i in 0 .. req.num_headers {
		unsafe {
			name := req.headers[i].name.vstring_with_len(req.headers[i].name_len)
			value := req.headers[i].value.vstring_with_len(req.headers[i].value_len)
			req_headers << '${name}: ${value}'
		}
	}
	status_code, headers, body := server_.router.receive(req.method, req.path, req_headers,
		req.body.bytes())
	status_message := http.status_from_int(status_code)
	res.write_string('HTTP/1.1 ${status_code} ${status_message}')
	unsafe { res.write_string('${picoserver.sep}Date: ${tos(res.date, 29)}') }
	res.write_string('${picoserver.sep}Content-Length: ${body.len}')
	res.write_string(headers.bytestr())
	res.write_string(picoserver.sep.repeat(2))
	res.write_string(body.bytestr())
	res.end()
}

// !!!Careful, this thing doesn't work with tcc,
// be sure to specify a different compiler via `-cc gcc` before running.
// Starts the server at the given port
pub fn serve(router Router, port int) {
	println('Starting webserver on http://localhost:${port}/ ...')

	picoev.new(
		port: port
		cb: &callback
		user_data: &Server{
			router: router
		}
	).serve()
}
