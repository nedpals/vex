module main

import vex.server as vex
import json

struct Person {
    name string
    doing string
}

fn print_json(req vex.Request, res mut vex.Response) {
    res.send_json(json.encode(Person{ name: req.query['name'], doing: req.query['doing'] }), 200)
}

fn hello_world(req vex.Request, res mut vex.Response) {
	res.send('Hello World!', 200)
}

fn log_server(req vex.Request, res vex.Response) {
    println('${req.method} ${req.path}')
}

fn main() {
    mut s := vex.new()
	
    // putting '!' before the path excludes the server from running a middleware on that path.
    s.connect(log_server, ['/', '!/hello'])
    s.get('/', print_json)
	s.get('/hello', hello_world)

    s.serve(8000)
}
