module server

import ctx

pub fn (srv mut Server) get(r_path string, cb fn (req mut ctx.Request, res mut ctx.Response)) {
	srv.router.get(r_path, cb)
}

pub fn (srv mut Server) post(r_path string, cb fn (req mut ctx.Request, res mut ctx.Response)) {
	srv.router.post(r_path, cb)
}

pub fn (srv mut Server) patch(r_path string, cb fn (req mut ctx.Request, res mut ctx.Response)) {
	srv.router.patch(r_path, cb)
}

pub fn (srv mut Server) delete(r_path string, cb fn (req mut ctx.Request, res mut ctx.Response)) {
	srv.router.delete(r_path, cb)
}

pub fn (srv mut Server) put(r_path string, cb fn (req mut ctx.Request, res mut ctx.Response)) {
	srv.router.put(r_path, cb)
}

pub fn (srv mut Server) options(r_path string, cb fn (req mut ctx.Request, res mut ctx.Response)) {
	srv.router.options(r_path, cb)
}
