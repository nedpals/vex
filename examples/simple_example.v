module main

import server
import ctx

fn hello(req ctx.Request, res mut ctx.Response) {
	res.send('Hello world!', 200)
}

fn main() {
	mut s := server.new()
	s.get('/', hello)
	s.serve(8080)
}
