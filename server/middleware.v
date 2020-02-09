module server

// type server__HandlerFunc fn(req mut Request, res mut Response)

pub struct Middleware{
pub:
	handler fn(req mut Request, res mut Response)
mut:
	whitelist []string
	blacklist []string
}

pub fn (srv mut Server) connect(handler fn(req mut Request, res mut Response), paths []string) {
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
