module main

import server
import ctx

fn main() {
	mut s := server.new()
	s.get('/', fn (req ctx.Req, res mut ctx.Resp) {
		res.send('Hello world!', 200)
	})
	
	s.serve(8080)
}
