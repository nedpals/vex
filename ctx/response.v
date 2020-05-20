module ctx

import html
import os
import utils

// response
pub fn (mut res Resp) send(body string, status_code int) {
    res.body = body
    res.status_code = status_code
}

pub fn (mut res Resp) send_file(filename string, status_code int) {
    fl := os.read_file(os.getwd() + '/${filename}') or { 
        res.send_status(404)
        return
    }

    res.send(fl, status_code)
    mimetype := utils.identify_mime(filename)
    res.set_header('Content-Type', mimetype)
}

pub fn (mut res Resp) send_json(json_string string, status_code int) {
    res.send(json_string, status_code)
    res.set_header('Content-Type', 'application/json')
} 

pub fn (mut res Resp) send_status(status_code int) {
    msg := utils.status_code_msg(status_code)
    res.set_header('Content-Type', 'text/html')
    res.send('<h1>$status_code $msg</h1>', status_code)
}

pub fn (mut res Resp) send_html(ht html.Tag, status_code int) {
    res.set_header('Content-Type', 'text/html')
    res.send(ht.html(), status_code)
}

pub fn (mut res Resp) redirect(url string) {
    res.status_code = 301
    res.set_header('Location', url)
}

pub fn (mut res Resp) set_header(key string, value string) {
    res.headers[key] = value
}
