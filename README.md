![Logo](https://github.com/nedpals/vex/raw/master/vex.svg)

### Easy-to-use, modular web framework for [V](https://vlang.io).

![CI](https://github.com/nedpals/vex/workflows/CI/badge.svg)

![Example written on VEX](https://github.com/nedpals/vex/raw/master/examples/example.png)

```v
module main

import maps

import nedpals.vex.router
import nedpals.vex.server
import nedpals.vex.ctx

fn print_req_info(mut req ctx.Req, mut res ctx.Resp) {
	println('${req.method} ${req.path}')
}

fn do_stuff(mut req ctx.Req, mut res ctx.Resp) {
	println('incoming request!')
}

fn simple_cors(mut req ctx.Req, mut res ctx.Resp) {
	res.headers = maps.merge(res.headers, {"Access-Control-Allow-Origin": ["*"]})
	res.headers = maps.merge(res.headers, {"Access-Control-Allow-Methods": ["GET", "PUT", "PATCH", "POST", "DELETE"]})
	res.headers = maps.merge(res.headers, {"Access-Control-Allow-Headers": ["Host", "Origin", "Content-Length", "Content-Type", "Authorization", "User-Agent", "X-Forwarded-For", "Accept-Encoding", "Connection"]})
	res.headers = maps.merge(res.headers, {"Access-Control-Allow-Credentials": ["true"]})
	res.headers = maps.merge(res.headers, {"Access-Control-Max-Age": ["86400"]})
}

fn main() {
    mut app := router.new()
    app.use(do_stuff, print_req_info, simple_cors)

    app.route(.get, '/', fn (req &ctx.Req, mut res ctx.Resp) {
        res.send_file('index.html', 200)
    })

    app.route(.get, '/public/*path', fn (req &ctx.Req, mut res ctx.Resp) {
        res.send_file('public/' + req.params['path'], 200)
    })

    app.route(.get, '/path/:name', fn (req &ctx.Req, mut res ctx.Resp) {
        println('path is ${req.params["name"]}')
    }, fn (req &ctx.Req, mut res ctx.Resp) {
        res.send('path: ' + req.params['name'], 200)
    })

    app.route(.get, '/complex/:name/*path', fn (req &ctx.Req, mut res ctx.Resp) {
        res.send('username: ' + req.params['name'] + '\npath: ' + req.params['path'], 200)
    })

    server.serve(app, 6789)
}
```

## Installation & Getting Started
Learn how to setup and use VEX by reading the [wiki](https://github.com/nedpals/vex/wiki/Installation).

## Roadmap
- [X] Support for `GET`, `POST`, `PUT`, `PATCH`, `DELETE`, and `OPTION` HTTP methods.
- [x] HTTP Router (Wildcards are now supported)
- [x] Route groups (non-reusable for now)
- [x] ~~Static file server~~
- [x] Params and query parsing
- [x] Middleware support
- [x] Cookie parsing (basic support)
- [x] Cookie manipulation / Session support
- [ ] Websocket Server
- [x] Body parsing
  - [x] `application/x-www-form-urlencoded` support
  - [x] `application/json` support
  - [x] `multipart/form-data` support

## Contributing
1. Fork it (<https://github.com/nedpals/vex/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Examples
Examples can be found at the [`/examples`](/examples) directory.

## License
[MIT](LICENSE)

## Contributors

- [Ned Palacios](https://github.com/nedpals) - creator and maintainer
