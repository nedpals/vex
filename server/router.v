module server

struct Route {
pub mut:
	method string
	name string
	children []Route
	ctx Context
	is_param bool
	is_wildcard bool
	handler fn (req Request, res mut Response)
}

// empty callback
fn empty_cb (req Request, res mut Response) {
	res.set_header('Content-Type', 'text/html')
	res.send('<h1>404 Not Found</h1>', 404)
}

fn (srv Server) find(method string, path string) (map[string]string, Route) {
	mut params_map := map[string]string
	path_arr := path.split('/')
	params_keys, route := match_route(method, path, srv.routes)

	for i, params_key in params_keys {
		if params_key.starts_with('/:') || params_key.starts_with('/*') {
			params_map[params_key.all_after('/:')] = path_arr[i]
		}
	}

	return params_map, route
}

fn match_route(method string, path string, routes []Route) ([]string, Route) {	
	mut params_arr := []string
	mut path_arr := path.split('/')

	if path_arr.len == 0 {
		path_arr << ''
	}

	route_name := '/' + path_arr[0]
	child_routes := if path_arr.len > 1 { path_arr.slice(1, path_arr.len) } else { []string } 

	for route in routes {
		if route.method == method {
			if route.name == route_name || route.is_param || route.is_wildcard {
				if child_routes.len >= 1 {
					child_params, child_route := match_route(method, child_routes.join('/'), route.children)

					params_arr << route.name
					params_arr << child_params

					return params_arr, child_route
				} else {
					params_arr << route.name
					return params_arr, route
				}
			}
		}
	}

	return params_arr, Route{}
}

fn (routes []Route) has_wildcard() bool {
	for route in routes {
		if route.is_wildcard {
			return true
		}
	}
	
	return false
}

fn (routes []Route) has_param() bool {
	for route in routes {
		if route.is_param {
			return true
		}
	}
	
	return false
}

fn (routes []Route) has_wildcard_or_param() bool {
	return routes.has_param() || routes.has_wildcard()
}

fn (routes []Route) index(method string, path string) int {
	for i, route in routes {
		if route.method == method && route.name == path {
			return i
		}
	}

	return -1
}

fn (srv mut Server) create_route(method string, r_path string, cb fn(req Request, res mut Response)) {
	mut route_paths := r_path.split('/')
	
	if route_paths.len == 0 {
		route_paths << ''
	}

	root_route_name := '/' + route_paths[0]
	route_children := if route_paths.len > 1 { route_paths.slice(1, route_paths.len) } else { []string }
	mut root_route_idx := srv.routes.index(method, root_route_name)
	
	if root_route_idx == -1 {
		if srv.routes.has_wildcard_or_param() {
			panic('Only one wildcard or param is allowed.')
		} else {
			srv.routes << Route{ 
				method: method, 
				name: root_route_name, 
				children: [], 
				ctx: Context{ req: Request{}, res: Response{} },
				is_param: if root_route_name.starts_with('/:') { true } else { false },
				is_wildcard: if root_route_name.starts_with('/*') { true } else { false }
			}
		}

		root_route_idx = srv.routes.index(method, root_route_name)
	}

	if route_children.len >= 1 {
		combined := route_children.join('/')
		srv.routes[root_route_idx].handler = empty_cb
		srv.routes[root_route_idx].add_child_route(method, combined, cb)
	} else {
		srv.routes[root_route_idx].handler = cb
	}
}

fn (rt mut Route) add_child_route(method string, path string, cb fn(req Request, res mut Response)) {
	path_arr := path.split('/')
	child_route_name := '/' + path_arr[0]
	route_children := if path_arr.len > 1 { path_arr.slice(1, path_arr.len) } else { []string }
	mut child_route_idx := rt.children.index(method, child_route_name)

	if child_route_idx == -1 {
		if rt.children.has_wildcard_or_param() {
			panic('Only one wildcard or param is allowed.')
		} else {
			rt.children << Route{ 
				method: method, 
				name: child_route_name, 
				children: [], 
				ctx: Context{ req: Request{}, res: Response{} },
				is_param: if child_route_name.starts_with('/:') { true } else { false },
				is_wildcard: if child_route_name.starts_with('/*') { true } else { false }
			}
		}

		child_route_idx = rt.children.index(method, child_route_name)
	}

	if route_children.len >= 1 {
		combined := route_children.join('/')
		rt.children[child_route_idx].add_child_route(method, combined, cb)
		rt.children[child_route_idx].handler = empty_cb
	} else {
		rt.children[child_route_idx].handler = cb
	}
}

pub fn (srv mut Server) get(r_path string, cb fn(req Request, res mut Response)) {
	srv.create_route('GET', r_path, cb)
}

pub fn (srv mut Server) post(r_path string, cb fn(req Request, res mut Response)) {
	srv.create_route('POST', r_path, cb)
}

pub fn (srv mut Server) patch(r_path string, cb fn(req Request, res mut Response)) {
	srv.create_route('PATCH', r_path, cb)
}

pub fn (srv mut Server) delete(r_path string, cb fn(req Request, res mut Response)) {
	srv.create_route('DELETE', r_path, cb)
}

pub fn (srv mut Server) put(r_path string, cb fn(req Request, res mut Response)) {
	srv.create_route('PUT', r_path, cb)
}