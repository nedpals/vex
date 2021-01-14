// from: https://github.com/vlang/v/pull/1142
// See also: https://www.w3.org/Protocols/rfc2616/rfc2616-sec4.html
module server

import net
import io
import strings
import utils
import time

const (
	sep = '\r\n'
)

pub interface Router {
	respond_error(code int) string
	receive(method string, path string, raw_headers []string, mut reader io.BufferedReader) (int, string, string)
}

// serve starts the server at the give port
pub fn serve(router Router, port int) {
	println('[vex] Vex HTTP Server has started.\n[vex] Serving on http://localhost:$port')
	listener := net.listen_tcp(port) or { panic('Failed to listen to port $port') }
	for {
		mut conn := listener.accept() or {
			listener.close() or { }
			panic('conn accept() failed.')
		}
		handle_http_connection(router, mut conn)
	}
}

// write_body writes the response body into the TCP server
fn write_body(code int, headers string, body string, mut conn net.TcpConn) {
	mut response := strings.new_builder(1024)
	response.write('HTTP/1.1 $code ' + utils.status_code_msg(code))
	response.write(if headers.len > 0 {
		sep + headers
	} else {
		headers
	})
	response.write('${sep}Content-Length: $body.len')
	response.write('${sep}Connection: close')
	response.write(sep.repeat(2) + body)
	conn.write(response.buf) or { }
	unsafe { response.free() }
}

fn handle_http_connection(router Router, mut conn net.TcpConn) {
	conn.set_read_timeout(1 * time.second)
	defer {
		conn.close() or { }
	}
	mut reader := io.new_buffered_reader(reader: io.make_reader(conn))
	first_line := reader.read_line() or {
		bad_req_body := router.respond_error(400)
		write_body(400, '', bad_req_body, mut conn)
		return
	}
	data := first_line.split(' ')
	if data.len < 2 {
		bad_req_body := router.respond_error(400)
		write_body(400, '', bad_req_body, mut conn)
		return
	}
	mut raw_headers := []string{}
	// encode headers
	for {
		header_line := reader.read_line() or {
			internal_err_body := router.respond_error(500)
			write_body(500, '', internal_err_body, mut conn)
			return
		}
		if header_line.len == 0 {
			break
		}
		raw_headers << header_line
	}
	status_code, enc_header, body := router.receive(data[0], data[1], raw_headers, mut
		reader)
	write_body(status_code, enc_header, body, mut conn)
	unsafe { raw_headers.free() }
}
