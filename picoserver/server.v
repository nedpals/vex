module picoserver

import net
import net.http
import picoev
import picohttpparser
import server { Router }
import utils

const sep = '\r\n'

struct Server {
	router Router
}

fn callback(mut server_ Server, req picohttpparser.Request, mut res picohttpparser.Response) {
	mut req_headers := []string{}
	for i in 0 .. req.num_headers {
		header := req.headers[i]
		req_headers << '${header.name}: ${header.value}'
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

// Starts the server at the given port
pub fn serve(router Router, port int) {
	println(utils.green_log('[PICO] HTTP Server has started.'))
	println(utils.green_log('Running On http://localhost:${port}'))
	mut picoserv := picoev.new(
		port: port
		cb: &callback
		user_data: &Server{
			router: router
		}
	)
	picoserv.serve()
}
