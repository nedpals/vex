module server

import os

pub struct Response {
pub mut:
    body string
    status_code int
    path string
    resource string
    cookies map[string]string
    headers map[string]string
}

// response
pub fn (res mut Response) send(body string, status_code int) {
    res.body = body
    res.status_code = status_code

    res.set_header('X-Powered-By', 'Vex')
    res.set_header('Content-Length', body.len.str())
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