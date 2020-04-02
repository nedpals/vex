module ctx

import os
import utils

// response
pub fn (res mut Response) send(body string, status_code int) {
    res.body = body
    res.status_code = status_code
}

pub fn (res mut Response) send_file(filename string, status_code int) {
    _file := os.read_file(os.getwd() + '/${filename}') or { 
        res.send_status(404)
        return
    }

    res.send(_file, status_code)
    mimetype := utils.identify_mime(filename)
    res.set_header('Content-Type', mimetype)
}

pub fn (res mut Response) send_json(json_string string, status_code int) {
    res.send(json_string, status_code)
    res.set_header('Content-Type', 'application/json')
} 

pub fn (res mut Response) send_status(status_code int) {
    msg := utils.status_code_msg(status_code)
    res.set_header('Content-Type', 'text/html')
    res.send('<h1>$status_code $msg</h1>', status_code)
}

pub fn (res mut Response) redirect(url string) {
    res.status_code = 301
    res.set_header('Location', url)
}

pub fn (res mut Response) set_header(key string, value string) {
    res.headers[key] = value
}
