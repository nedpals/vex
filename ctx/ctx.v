module ctx

import net.urllib
import json
import os
import utils

pub type HandlerFunc = fn (req &Req, mut res Resp)
pub type MutHandlerFunc = fn (mut req Req, mut res Resp)

// Server request data
pub struct Req {
pub mut:
    body string
    method string
    path string
    query map[string]string
    params map[string]string
    headers map[string]string
}

// parse_form_body parses the body based on its provided content-type
// and returns the output of it. Supports `application/x-www-form-urlencoded`
// and `application/json` content types. Returns an error if the body is blank,
// the "Content-Type" header is not present, or the content type header
// is not supported.
pub fn (req Req) parse_form_body() ?map[string]string {
    if req.body.len == 0 {
        return error('empty body')
    } else if 'Content-Type' !in req.headers {
        return error('body content-type header not present')
    }

    match req.headers['Content-Type'] {
        'application/x-www-form-urlencoded' {
            mut form_data_map := map[string]string{}
            form_arr := req.body.split('&')
            for form_data in form_arr {
                form_data_arr := form_data.split('=')
                form_data_map[form_data_arr[0]] = form_data_arr[1]
            }
            return form_data_map
        }
        'application/json' {
            form_data_map := json.decode(map[string]string, req.body)?
            return form_data_map
        }
        else {}
    }
    
    return error('no appropriate content-type header for body found')
}

// parse_cookies parses the Cookie header content and returns the
// content. Returns an error if the header is not present.
pub fn (req Req) parse_cookies() ?map[string]string {
    if 'Cookie' !in req.headers { 
      return error('cookies not found')
    }
    mut cookies := map[string]string{}
	cookies_arr := req.headers['Cookie'].split('; ')
	for cookie_data in cookies_arr {
		ck := cookie_data.split('=')
		ck_val := urllib.query_unescape(ck[1])?
		cookies[ck[0]] = ck_val
	}
    return cookies
}

// Server response data
pub struct Resp {
pub mut:
    body string
    status_code int
    path string
    cookies map[string]string
    headers map[string]string
}

// send writes the body and status code to the response data.
[inline]
pub fn (mut res Resp) send(body string, status_code int) {
    res.body = body
    res.status_code = status_code
}

// send_file writes the contents of the file to the response data.
[inline]
pub fn (mut res Resp) send_file(filename string, status_code int) {
    fl := os.read_file(os.getwd() + '/${filename}') or { 
        res.send_status(404)
        return
    }

    res.send(fl, status_code)
    mimetype := utils.identify_mime(filename)
    res.headers['Content-Type'] = mimetype
}

// send_json is a generic function that encodes the payload and
// writes the JSON string to the response data.
[inline]
pub fn (mut res Resp) send_json<T>(payload T, status_code int) {
    json_string := json.encode(payload)
    res.send(json_string, status_code)
    res.headers['Content-Type'] = 'application/json'
} 

// send_status sends an HTML response of the status code
[inline]
pub fn (mut res Resp) send_status(status_code int) {
    msg := utils.status_code_msg(status_code)
    res.headers['Content-Type'] = 'text/html'
    res.send('<h1>$status_code $msg</h1>', status_code)
}

// redirect writes a 301 response and redirects to the 
// specified url or location
[inline]
pub fn (mut res Resp) redirect(url string) {
    res.status_code = 301
    res.headers['Location'] = url
}

// send_html writes the body to the response data as an HTML content
[inline]
pub fn (mut res Resp) send_html(ht string, status_code int) {
    res.headers['Content-Type'] = 'text/html'
    res.send(ht, status_code)
}

// send_404 is a handler for sending 404s
pub fn send_404(req Req, mut res Resp) {
	res.send_status(404)
}