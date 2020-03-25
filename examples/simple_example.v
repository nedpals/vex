module main

import server as vex
import ctx as c

fn hello(req c.Request, res mut c.Response) {
	res.send('Hello world!', 200)
}

fn main() {
	mut s := vex.new()
	s.get('/', hello)

	s.serve(8000)
}