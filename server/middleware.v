module server

import ctx

pub struct Middleware {
    handler ctx.MutHandlerFunc
}

pub fn (srv mut Server) use(handler fn (req mut ctx.Request, res mut ctx.Response)) {
    mut mw := Middleware{ handler: ctx.MutHandlerFunc(handler) }
    
    srv.middlewares << mw
}