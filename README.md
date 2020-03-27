# Vex
Easy-to-use, modular web framework for V.

> Vex is still in its early stages and some of the parts were not implemented yet.

```v
module main

import vex.server // or nedpals.vex.server
import vex.ctx // or nedpals.vex.ctx

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
    s.serve(6789)
}
```

## vex and `vweb`
Vex is committed to bring some of its features and optimizations to the vweb framework once it is stable. 

## Static File Server
Vex 0.2 removes the built-in static file server support (`serve_static` function) in favor of creating custom routes for serving static assets. You can use the code below to implement the similar functionality as the previous one.

```v

fn serve_assets(req ctx.Request, res mut ctx.Response) {
    res.send_file('public/' + req.params['path'], 200)
}

fn main() {
    // ...
    s.get('/public/*path', serve_assets)
    // ...
}
```

## Simplified Middleware API
Middlewares tend to be used for any security-related purposes as well as for logging requests. With that in mind, Vex 0.2 has removed certain features (include/exclude routes, triggering location) in favor of a more simple middleware system which is triggered right before passing it to the matched routing handlers.

```v
// old
fn log_server_old(req vex.Request, res vex.Response) {
    println('${req.path}')
}

// new
fn log_server(req mut ctx.Request, res mut ctx.Response) {
    println('request: ${req.time.unix}')
    println('response: ${res.time.unix}')

    println('${req.path}')
}

fn main() {
    // ...
    s.connect(log_server_old, ['*']) // old
    s.use(log_server) // new
    // ...
}
```

## Dependencies
~~Vex uses v-mime to identify MIME types when serving files.~~
Vex now stores a fork of [v-mime](https://github.com/nedpals/v-mime) to avoid errors when using it in subdirectories.

## Roadmap
- [X] Support for `GET`, `POST`, `PUT`, `PATCH`, `DELETE`, and `OPTION` HTTP methods.
- [x] HTTP Router (Wildcards are now supported)
- [x] ~~Static file server~~
- [x] Params and query parsing
- [x] Body parsing (supports raw text for now)
- [x] Middleware support
- [x] Cookie parsing (basic support)
- [ ] Form data parsing
  - [x] `application/x-www-form-urlencoded` support
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