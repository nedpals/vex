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
    time time.Time
}

pub struct Resp {
pub mut:
    body string
    status_code int
    path string
    resource string
    cookies map[string]string
    headers map[string]string
    time time.Time
}

pub type HandlerFunc fn (req Req, res mut Resp)
pub type MutHandlerFunc fn (req mut Req, res mut Resp)
