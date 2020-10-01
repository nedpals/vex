module server

import ctx

pub struct Middleware {
    handler ctx.MutHandlerFunc
}

pub fn (mut srv Server) use(handler fn (mut req ctx.Req, mut res ctx.Resp)) {
    mut mw := Middleware{ handler: ctx.MutHandlerFunc(handler) }
    
    srv.middlewares << mw
}