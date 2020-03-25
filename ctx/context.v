module ctx

import time

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
    time time.Time
}

pub struct Response {
pub mut:
    body string
    status_code int
    path string
    resource string
    cookies map[string]string
    headers map[string]string
    time time.Time
}

pub type HandlerFunc fn (req Request, res mut Response)
pub type MutHandlerFunc fn (req mut Request, res mut Response)