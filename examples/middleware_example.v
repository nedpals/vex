module main

import nedpals.vex.router
import nedpals.vex.server
import nedpals.vex.ctx

struct Person {
	name  string
	doing string
}

fn print_req_info(mut req ctx.Req, mut res ctx.Resp) {
	println('$req.method $req.path')
}

fn do_stuff(mut req ctx.Req, mut res ctx.Resp) {
	println('incoming request!')
}

fn main() {
	mut app := router.new()
	app.use(do_stuff, print_req_info)
	app.route(.get, '/', fn (req &ctx.Req, mut res ctx.Resp) {
		q := req.parse_query() or {
			map[string]string{}
		}
		res.send_json(Person{
			name: q['name']
			doing: q['doing']
		}, 200)
	})
	app.route(.get, '/hello', fn (req &ctx.Req, mut res ctx.Resp) {
		res.send('Hello World!', 200)
	})
	server.serve(app, 8080)
}
