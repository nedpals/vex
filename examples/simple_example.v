module main

import nedpals.vex.router
import nedpals.vex.server
import nedpals.vex.ctx

fn main() {
	mut app := router.new()
	app.route(.get, '/', fn (req &ctx.Req, mut res ctx.Resp) {
		res.send('Hello world!', 200)
	})
	server.serve(app, 8080)
}
