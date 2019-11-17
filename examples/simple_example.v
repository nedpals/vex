module main

import vex.server as vex

fn hello(req vex.Request, res mut vex.Response) {
	res.send('Hello world!', 200)
}

fn main() {
	s := vex.new()
	s.get('/', hello)

	s.serve(8000)
}