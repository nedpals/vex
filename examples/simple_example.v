module main

import vex.server as vex

fn hello(req vex.Request, res mut vex.Response) {
	res.send('Hello world!', 200)
}

fn main() {
	mut s := vex.new()
	s.get('/', HandleFunc(hello))

	s.serve(8000)
}