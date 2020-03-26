module main

import server as vex
import ctx

fn hello(req ctx.Request, res mut ctx.Response) {
	res.send('Hello world!', 200)
}

fn main() {
	mut s := vex.new()
	s.get('/', hello)
	s.serve(8080)
}
