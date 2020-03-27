module main

import server as vex
import ctx
import json

struct Person {
	name  string
	doing string
}

fn print_json(req ctx.Request, res mut ctx.Response) {
	res.send_json(json.encode(Person{
		name: req.query['name']
		doing: req.query['doing']
	}), 200)
}

fn hello_world(req ctx.Request, res mut ctx.Response) {
	res.send('Hello World!', 200)
}

fn log_server(req ctx.Request, res ctx.Response) {
	println('${req.method} ${req.path}')
}

fn main() {
	mut s := vex.new()
	s.use(log_server)
	s.get('/', print_json)
	s.get('/hello', hello_world)
	s.serve(8080)
}
