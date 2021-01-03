module main

import server
import ctx

fn main() {
	mut s := server.new()
	s.route(.get, '/', fn (req &ctx.Req, mut res ctx.Resp) {
		res.send('Hello world!', 200)
	})
	s.serve(8080)
}
