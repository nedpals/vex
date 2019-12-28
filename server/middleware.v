module server

type HandlerFunc fn(req mut Request, res mut Response)

pub struct Middleware{
pub:
	handler HandlerFunc
mut:
	whitelist []string
	blacklist []string
}

pub fn (srv mut Server) connect(handler HandlerFunc, paths []string) {
	mut mw_strct := Middleware{ handler: handler, whitelist: [], blacklist: [] }

	for path in paths {
		if path.starts_with('!') || path != '*' {
			mw_strct.blacklist << path.all_after('!')
		} else {
			mw_strct.whitelist << path
		}
	}

	srv.middlewares << mw_strct
}