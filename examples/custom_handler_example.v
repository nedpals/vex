module main

import server
import ctx

fn main() {
    mut s := server.new()
    s.handler = fn (srv mut server.Server, req mut ctx.Req, res mut ctx.Resp) {
        if req.path == '/test' {
            res.send('Test', 200)
        } else {
            ctx.send_404(req, mut res)
        }
    }
    
    s.serve(8000)
}