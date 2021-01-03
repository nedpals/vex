module main

import nedpals.vex.server
import nedpals.vex.ctx
import json

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
	mut s := server.new()
	s.use(do_stuff, print_req_info)
	s.get('/', fn (req ctx.Req, mut res ctx.Resp) {
		res.send_json(Person{
			name: req.query['name']
			doing: req.query['doing']
		}, 200)
	})
	s.get('/hello', fn (req ctx.Req, mut res ctx.Resp) {
		res.send('Hello World!', 200)
	})
	s.serve(8080)
}
