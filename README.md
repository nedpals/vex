# Vex
Easy-to-use, modular web framework for V.
![Example written on Vex](examples/example.png)

```v
module main

import nedpals.vex.server
import nedpals.vex.ctx

fn main() {
    mut s := server.new()
    s.route(.get, '/', fn (req &ctx.Req, mut res ctx.Resp) {
        res.send_file('index.html', 200)
    })
    
    s.route(.get, '/public/*path', fn (req &ctx.Req, mut res ctx.Resp) {
        res.send_file('public/' + req.params['path'], 200)
    })

    s.route(.get, '/path/:name', fn (req &ctx.Req, mut res ctx.Resp) {
        println('path is ${req.params["name"]}')
    }, fn (req &ctx.Req, mut res ctx.Resp) {
        res.send('path: ' + req.params['name'], 200)
    })

    s.route(.get, '/complex/:name/*path', fn (req &ctx.Req, mut res ctx.Resp) {
        res.send('username: ' + req.params['name'] + '\npath: ' + req.params['path'], 200)
    })

    s.serve(6789)
}
```

## Installation & Getting Started
Learn how to setup and use Vex by reading the [Wiki](https://github.com/nedpals/vex/wiki/Installation).

## Roadmap
- [X] Support for `GET`, `POST`, `PUT`, `PATCH`, `DELETE`, and `OPTION` HTTP methods.
- [x] HTTP Router (Wildcards are now supported)
- [x] ~~Static file server~~
- [x] Params and query parsing
- [ ] Middleware support (removed for now)
- [x] Cookie parsing (basic support)
- [ ] Websocket Server
- [ ] Body parsing
  - [x] `application/x-www-form-urlencoded` support
  - [x] `application/json` support
  - [ ] `multipart/form-data` support

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