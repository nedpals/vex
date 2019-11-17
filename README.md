# Vex
Web framework written on V inspired by [Express](https://expressjs.com/) and [Sinatra](https://sinatrarb.com).

> Vex is still in its early stages and some of the parts were not implemented yet.

```v
module main

import vex.server as vex
import json
import os

struct Person {
    name string
    doing string
}

fn show_root(req server.Request, res mut server.Response) {
    res.send_file('index.html', 200)  
}

fn print_json(req server.Request, res mut server.Response) {
    res.send_json(json.encode(Person{ name: req.params['name'], doing: req.params['doing'] }), 200)
}

fn log_server(req server.Request, res server.Response) {
    println('${req.path}')
}

fn main() {
    mut s := vex.new()
    s.serve_static('public')
    s.get('/', show_root)
    s.get('/hey/:name/:doing', print_json)
    s.connect(log_server, ['*']) // middleware

    s.serve(6789)
}
```

## vex and `vweb`
Vex is committed to bring some of its features and optimizations to the vweb framework once it is stable. 

## Dependencies
Vex uses [v-mime](https://github.com/nedpals/v-mime) to identify MIME types when serving files.

## Roadmap
- [X] Support for `GET`, `POST`, `PUT`, `PATCH`, `DELETE`, and `OPTION` HTTP methods.
- [x] HTTP Router (wildcards not yet supported)
- [x] Static file server
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

<!-- ## License
[MIT](LICENSE) -->

## Contributors

- [Ned Palacios](https://github.com/nedpals) - creator and maintainer
