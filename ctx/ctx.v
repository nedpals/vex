module ctx

import net.urllib
import json
import os
import utils
import v.vmod
import strings
import context

const (
	vm              = vmod.decode(@VMOD_FILE) or { panic(err) }
	default_headers = {
		'Content-Type': ['text/html; charset=UTF-8']
		'X-Powered-By': ['$vm.name/$vm.version']
		'Server':       ['$vm.name']
	}
)

pub type HandlerFunc = fn (req &Req, mut res Resp)

pub type MiddlewareFunc = fn (mut req Req, mut res Resp)

// Server request data
pub struct Req {
pub mut:
	body      []u8
	method    string
	path      string
	params    map[string]string
	headers   map[string][]string
	raw_query string
	boundary  string
	ctx       context.Context
}

// parse_headers parses and injects the raw_headers into
// the request struct. Used internally by the router.
pub fn (mut req Req) parse_headers(raw_headers []string) {
	for rh in raw_headers {
		spl := rh.split(': ')
		req.headers[spl[0]] = [spl[1..].join(': ')]
	}
}

// parse_query parses the raw query string from the request
// and returns a map of strings
pub fn (req &Req) parse_query() ?map[string]string {
	mut queries := map[string]string{}
	if qvalues := urllib.parse_query(req.raw_query) {
		query_map := qvalues.to_map()
		for name, values in query_map {
			queries[name] = values[0]
		}
	}
	return queries
}

// parse_form parses the body based on its provided content-type
// and returns the output of it. Supports `application/x-www-form-urlencoded`
// and `application/json` content types. Returns an error if the body is blank,
// the "Content-Type" header is not present, or the content type header
// is not supported.
pub fn (req &Req) parse_form() ?map[string]string {
	if req.body.len == 0 {
		return error('Form body is empty.')
	} else if 'Content-Type' !in req.headers {
		return error('`Content-Type` header is not present.')
	}
	body := req.body.bytestr()
	match req.headers['Content-Type'][0] {
		'application/x-www-form-urlencoded' {
			mut form_data_map := map[string]string{}
			form_arr := body.split('&')
			for form_data in form_arr {
				form_data_arr := form_data.split('=')
				form_data_map[form_data_arr[0]] = form_data_arr[1]
			}
			return form_data_map
		}
		'application/json' {
			form_data_map := json.decode(map[string]string, body) or { return err }
			return form_data_map
		}
		'multipart/form-data' {
			multipart_form_data := req.parse_files() ?
			mut form_data_map := map[string]string{}
			for key, datum in multipart_form_data {
				for i, data in datum {
					if data.content_type != 'vex/form' {
						continue
					}
					name := if i > 0 { '${key}_${i + 1}' } else { key }
					form_data_map[name] = data.content.bytestr()
				}
			}
			unsafe { multipart_form_data.free() }
			return form_data_map
		}
		else {}
	}
	return error('No appropriate content type header for body found.')
}

// parse_files parses the `multipart/form-data` content-type
pub fn (req &Req) parse_files() ?map[string][]FormData {
	if req.headers['Content-Type'][0] != 'multipart/form-data' {
		return error('Content type must be `multipart/form-data`.')
	}
	mut start := 0
	mut filename := ''
	mut form_name := ''
	mut content_type := ''
	mut files := map[string][]FormData{}
	mut in_body := false
	for i := 0; i < req.body.len; i++ {
		chr := req.body[i]
		if i + req.boundary.len + 2 < req.body.len
			&& req.body[i..i + req.boundary.len + 2].bytestr().starts_with(req.boundary) {
			if in_body {
				if i - 2 >= start {
					files[form_name] << FormData{
						filename: filename
						content_type: content_type
						content: req.body[start..i - 2].clone()
					}
				}
				in_body = false
			}
			start = req.boundary.len + 2
			i += req.boundary.len + 2
			continue
		}
		if !in_body && i + 1 < req.body.len && chr == `\r` && req.body[i + 1] == `\n` {
			str := req.body[start..i].bytestr()
			if str.starts_with('Content-Disposition: ') {
				filename = ''
				content_type = 'vex/form'
				form_name = ''
				fields_tmp := str.all_after('Content-Disposition: ').split('; ')
				fields := fields_tmp[1..]
				for field in fields {
					vals := field.split('=')
					val := vals[1].find_between('"', '"')
					match vals[0] {
						'name' { form_name = val }
						'filename' { filename = val }
						else {}
					}
					unsafe { vals.free() }
				}
			} else if str.starts_with('Content-Type') {
				content_type = str.all_after('Content-Type: ')
			} else {
				in_body = true
			}
			start = i + 2
			i++
			unsafe { str.free() }
			continue
		}
	}

	unsafe {
		filename.free()
		form_name.free()
		content_type.free()
	}
	return files
}

// Server response data
pub struct Resp {
pub mut:
	body        []u8
	status_code int = 200
	headers     map[string][]string = ctx.default_headers
	stopped     bool
}

// send writes the body and status code to the response data.
[inline]
pub fn (mut res Resp) send(body string, status_code int) {
	res.body = body.bytes()
	res.status_code = status_code
}

// send_file writes the contents of the file to the response data.
[inline]
pub fn (mut res Resp) send_file(filename string, status_code int) {
	fl := os.read_bytes(os.join_path(os.getwd(), '/$filename')) or {
		res.send_status(404)
		return
	}
	res.body = fl
	res.status_code = status_code
	mimetype := utils.identify_mime(filename)
	res.headers['Content-Type'] = [mimetype]
}

// send_json is a generic function that encodes the payload and
// writes the JSON string to the response data.
[inline]
pub fn (mut res Resp) send_json<T>(payload T, status_code int) {
	json_string := json.encode(payload)
	res.send(json_string, status_code)
	res.headers['Content-Type'] = ['application/json']
}

// send_status sends an HTML response of the status code
[inline]
pub fn (mut res Resp) send_status(status_code int) {
	msg := utils.status_code_msg(status_code)
	res.headers['Content-Type'] = ['text/html']
	res.send('<h1>$status_code $msg</h1>', status_code)
}

// redirect writes a 301 response and redirects to the
// specified url or location
[inline]
pub fn (mut res Resp) redirect(url string) {
	res.status_code = 302
	res.headers['Location'] = [url]
}

[inline]
pub fn (mut res Resp) permanent_redirect(url string) {
	res.status_code = 301
	res.headers['Location'] = [url]
}

// send_html writes the body to the response data as an HTML content
[inline]
pub fn (mut res Resp) send_html(ht string, status_code int) {
	res.headers['Content-Type'] = ['text/html']
	res.send(ht, status_code)
}

pub fn (res &Resp) headers_bytes() []u8 {
	mut headers := strings.new_builder(res.headers.len * 10)
	for k, values in res.headers {
		for v in values {
			headers.write_string('\r\n$k: $v')
		}
	}
	buf := headers.clone()
	unsafe { headers.free() }
	return buf
}

// stop terminates the response
pub fn (mut res Resp) stop() {
	res.stopped = true
}

// used internally in router
pub const err_code_ctx_key = context.Key('status_code')

pub fn get_error_status_code(req &Req) int {
	if code := req.ctx.value(ctx.err_code_ctx_key) {
		if code is int {
			return *code
		}
	}
	return 500
}

pub fn error_route(req &Req, mut res Resp) {
	code := get_error_status_code(req)
	res.send_status(code)
}

pub struct FormData {
pub mut:
	filename     string
	content_type string
	content      []u8
}
