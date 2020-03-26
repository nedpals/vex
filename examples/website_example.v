module main

import server // or nedpals.vex.server
import ctx // or nedpals.vex.ctx

fn show_root(req ctx.Request, res mut ctx.Response) {
    res.send_file('index.html', 200)
}

fn params_test(req ctx.Request, res mut ctx.Response) {
    res.send('path: ' + req.params['name'], 200)
}

fn complex_wildcard_test(req ctx.Request, res mut ctx.Response) {
    res.send('username: ' + req.params['name'] + '\npath: ' + req.params['path'], 200)
}

fn multipart_test(req ctx.Request, res mut ctx.Response) {
    res.send('multipart test', 200)
}

fn assets_test(req ctx.Request, res mut ctx.Response) {
    res.send_file('public/' + req.params['path'], 200)
}

fn log_server(req mut ctx.Request, res mut ctx.Response) {
    println('request: ${req.time.unix}')
    println('response: ${res.time.unix}')

    println('${req.path}')
}

fn main() {
    mut s := server.new()
    s.get('/test', show_root)
    s.get('/public/*path', assets_test)
    s.get('/path/:name', params_test)
    s.get('/complex/:name/*path', complex_wildcard_test)
    s.post('/multipart', multipart_test)
    
    s.use(log_server)
    s.serve(8000)
}

