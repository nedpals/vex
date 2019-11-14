module server

pub struct Middleware{
pub mut:
	func fn(req Request, res mut Response)
	paths []string
}

pub fn (srv mut Server) connect(handler fn(req Request, res mut Response), paths []string) {
	srv.middlewares << Middleware{ func: handler, paths: paths }
}