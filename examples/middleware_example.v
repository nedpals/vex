module main

import maps

import nedpals.vex.router
import nedpals.vex.server
import nedpals.vex.ctx

struct Person {
	name  string
	doing string
}

fn print_req_info(mut req ctx.Req, mut res ctx.Resp) {
	println('${req.method} ${req.path}')
}

fn do_stuff(mut req ctx.Req, mut res ctx.Resp) {
	println('incoming request!')
}

fn simple_cors(mut req ctx.Req, mut res ctx.Resp) {
	res.headers = maps.merge(res.headers, {"Access-Control-Allow-Origin": ["*"]})
	res.headers = maps.merge(res.headers, {"Access-Control-Allow-Headers": ["*"]})
	res.headers = maps.merge(res.headers, {"Access-Control-Allow-Methods": ["GET", "HEAD", "PUT", "PATCH", "POST", "DELETE"]})
	res.headers = maps.merge(res.headers, {"Access-Control-Allow-Credentials": ["true"]})
	res.headers = maps.merge(res.headers, {"Access-Control-Max-Age": ["86400"]})
}

fn main() {
	mut app := router.new()
	app.use(do_stuff, print_req_info, simple_cors)
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
	server.serve(app, 6789)
}
