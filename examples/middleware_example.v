module main

import server as vex
import ctx
import json

struct Person {
	name  string
	doing string
}

fn main() {
	mut s := vex.new()
	s.use(fn (req ctx.Req, res ctx.Resp) {
		println('${req.method} ${req.path}')
	})

	s.get('/', fn (req ctx.Req, res mut ctx.Resp) {
		res.send_json(json.encode(Person{
			name: req.query['name']
			doing: req.query['doing']
		}), 200)
	})
	
	s.get('/hello', fn (req ctx.Req, res mut ctx.Resp) {
		res.send('Hello World!', 200)
	})
	
	s.serve(8080)
}
