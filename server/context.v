module server

import os

struct Context {
mut:
    req Request
    res Response
}

pub struct Request {
pub mut:
    body string
    method string
    path string
    query map[string]string
    params map[string]string
    resource string
    cookies map[string]string
    headers map[string]string
}

pub struct Response {
pub mut:
    body string
    status_code int
    path string
    resource string
    cookies map[string]string
    headers map[string]string
}

// Request
pub fn (req Request) parse_form_body() map[string]string {
    mut form_data_map := map[string]string

    if 'Content-Type' in req.headers && req.headers['Content-Type'] == 'application/x-www-form-urlencoded' {
        form_arr := req.body.split('&')
        for form_data in form_arr {
            form_data_arr := form_data.split('=')

            form_data_map[form_data_arr[0]] = form_data_arr[1]
        }
    }

    return form_data_map
}

// response
pub fn (res mut Response) send(body string, status_code int) {
    res.body = body
    res.status_code = status_code

    res.set_header('Server', 'Vex')
    res.set_header('X-Powered-By', 'Vex')
}

pub fn (res mut Response) send_file(filename string, status_code int) {
    _file := os.read_file(os.getwd() + '/${filename}') or { return }

    res.send(_file, status_code)
    res.set_header('Content-Type', mimetype(filename))
}

pub fn (res mut Response) send_json(json_string string, status_code int) {
    res.send(json_string, status_code)
    res.set_header('Content-Type', 'application/json')
} 

pub fn (res mut Response) redirect(url string) {
    res.status_code = 301
    res.set_header('Location', url)
}

pub fn (res mut Response) set_header(key string, value string) {
    res.headers[key] = value
}
