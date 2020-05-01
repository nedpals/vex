module ctx

import time

pub struct Req {
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

pub struct Resp {
pub mut:
    body string
    status_code int
    path string
    resource string
    cookies map[string]string
    headers map[string]string
    time time.StopWatch
}

pub type HandlerFunc = fn (req Req, res mut Resp)
pub type MutHandlerFunc = fn (req mut Req, res mut Resp)

fn send_404(req Req, res mut Resp) {
	res.send_status(404)
}