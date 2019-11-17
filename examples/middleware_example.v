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
    decoded_cookie := req.cookies['em_cdn_uid']
}

fn main() {
    mut s := vex.new()
    s.connect(log_server, ['/', '!/hello'])

    s.serve_static('public')
    s.get('/', print_json)
	s.get('/hello', hello_world)

    s.serve(8000)
}