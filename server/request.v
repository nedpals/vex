module server

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