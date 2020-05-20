module server

import ctx

pub fn (mut srv Server) get(r_path string, cb ctx.HandlerFunc) {
	srv.router.get(r_path, cb)
}

pub fn (mut srv Server) post(r_path string, cb ctx.HandlerFunc) {
	srv.router.post(r_path, cb)
}

pub fn (mut srv Server) patch(r_path string, cb ctx.HandlerFunc) {
	srv.router.patch(r_path, cb)
}

pub fn (mut srv Server) delete(r_path string, cb ctx.HandlerFunc) {
	srv.router.delete(r_path, cb)
}

pub fn (mut srv Server) put(r_path string, cb ctx.HandlerFunc) {
	srv.router.put(r_path, cb)
}

pub fn (mut srv Server) options(r_path string, cb ctx.HandlerFunc) {
	srv.router.options(r_path, cb)
}
