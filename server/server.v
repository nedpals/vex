// from: https://github.com/vlang/v/pull/1142
// See also: https://www.w3.org/Protocols/rfc2616/rfc2616-sec4.html
module server

import net
import io
import strings
import utils
import time
import term

const (
	sep = '\r\n'
)

pub interface Router {
	respond_error(code int) string
	receive(method string, path string, raw_headers []string, body []byte) (int, []byte, []byte)
}

// serve starts the server at the give port
pub fn serve(router Router, port int) {
	vex_log := term.rgb(255, 221, 76, '[VEX]')
	println('$vex_log ${term.green('HTTP Server Has Started')}')
	println('$vex_log Serving On ${term.cyan('http://localhost:$port')}')
	mut listener := net.listen_tcp(port) or { panic('Failed to listen to port $port') }
	for {
		mut conn := listener.accept() or {
			listener.close() or { }
			panic('conn accept() failed.')
		}
		handle_http_connection(router, mut conn)
	}
}

// write_body Writes The Response Body into the TCP server
fn write_body(code int, headers []byte, body []byte, mut conn net.TcpConn) {
	mut response := strings.new_builder(body.len)
	response.write('HTTP/1.1 $code ' + utils.status_code_msg(code))
	response.write_bytes(headers.data, headers.len)
	response.write('${server.sep}Content-Length: $body.len')
	response.write('${server.sep}Connection: close')
	response.write(server.sep.repeat(2))
	response.write_bytes(body.data, body.len)
	conn.write(response.buf) or { }
	unsafe { response.free() }
}

// Handle All HTTP Connections
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
	mut conlen := 0
	// encode headers
	for {
		header_line := reader.read_line() or {
			internal_err_body := router.respond_error(500)
			write_body(500, '', internal_err_body, mut conn)
			return
		}
		if header_line.starts_with('Content-Length: ') {
			conlen = header_line.all_after('Content-Length: ').int()
		}
		if header_line.len == 0 {
			break
		}
		raw_headers << header_line
	}
	if conlen > 0 {
	}
	status_code, enc_header, body := router.receive(data[0], data[1], raw_headers, mut
		reader)
	write_body(status_code, enc_header, body, mut conn)
	unsafe { raw_headers.free() }
}
