module router

import ctx

const (
	exceeded_paramwildcard_route_err = 'Only one wildcard or param is allowed.'
)

pub struct Router {
mut:	
	parent_path string = ''
	routes []Route
}

struct MatchedRoute {
	name string
	typ RouteType
	path string
}

// empty callback
fn empty_cb (req ctx.Request, res mut ctx.Response) {
	res.set_header('Content-Type', 'text/html')
	res.send('<h1>404 Not Found</h1>', 404)
}

pub fn new() Router {
	return Router{ routes: [] }
}

pub fn (rter Router) listen(req mut ctx.Request, res mut ctx.Response) {
	mut params_map := map[string]string
	matched_routes, route := match_route(req.method, req.path, rter.routes)

	for matched in matched_routes {
		match matched.typ {
			.param { params_map[matched.name.all_after('/:')] = matched.path }
			.wildcard {
				mut wildcard_name := matched.name.all_after('/*')
				if wildcard_name.len == 0 { wildcard_name = '*' }
				params_map[wildcard_name] = matched.path
			}
			else {}
		}
	}

	req.params = params_map
	route.handler(req, mut res)
} 

fn match_route(method string, path string, routes []Route) ([]&MatchedRoute, Route) {	
	mut matched_arr := []&MatchedRoute
	route_name, child_routes := get_route_name_and_children(path)
	mut selected_route := Route{}

	for route in routes {
		if route.method == method && (route.name == route_name || route.typ in [.param, .wildcard]) {
			if route.name == route_name || route.typ == .param {
				matched_arr << &MatchedRoute{
					name: route.name,
					typ: route.typ,
					path: route_name
				}

				if child_routes.len >= 1 {
					child_params, child_route := match_route(method, child_routes.join('/'), route.children)
					matched_arr << child_params
					selected_route = child_route
				}
			}

			if route.typ == .wildcard {
				matched_arr << &MatchedRoute{
					name: route.name,
					typ: route.typ,
					path: path
				}
				selected_route = route
			}

			return matched_arr, selected_route
		}
	}

	return matched_arr, Route{}
}

fn (rter mut Router) create_route(method string, r_path string, cb ctx.HandlerFunc) {
	if !r_path.starts_with('/') {
		panic('route paths must start with a forward slash (/)')
	}

	root_route_name, route_children := get_route_name_and_children(r_path)
	mut root_route_idx := rter.routes.index(method, root_route_name)
	
	if root_route_idx == -1 {
		if rter.routes.has_wildcard_or_param() {
			panic(exceeded_paramwildcard_route_err)
		}

		rter.routes << Route{ 
			method: method, 
			name: root_route_name, 
			children: [],
			typ: identify_route_type(root_route_name)
		}

		root_route_idx = rter.routes.index(method, root_route_name)
	}

	if route_children.len >= 1 {
		combined := route_children.join('/')
		rter.routes[root_route_idx].add_child(method, combined, cb)
	} else {
		rter.routes[root_route_idx].handler = cb
	}
}

pub fn (rter mut Router) get(r_path string, cb fn (req mut ctx.Request, res mut ctx.Response)) {
	rter.create_route('GET', r_path, ctx.HandlerFunc(cb))
}

pub fn (rter mut Router) post(r_path string, cb fn (req mut ctx.Request, res mut ctx.Response)) {
	rter.create_route('POST', r_path, ctx.HandlerFunc(cb))
}

pub fn (rter mut Router) patch(r_path string, cb fn (req mut ctx.Request, res mut ctx.Response)) {
	rter.create_route('PATCH', r_path, ctx.HandlerFunc(cb))
}

pub fn (rter mut Router) delete(r_path string, cb fn (req mut ctx.Request, res mut ctx.Response)) {
	rter.create_route('DELETE', r_path, ctx.HandlerFunc(cb))
}

pub fn (rter mut Router) put(r_path string, cb fn (req mut ctx.Request, res mut ctx.Response)) {
	rter.create_route('PUT', r_path, ctx.HandlerFunc(cb))
}

pub fn (rter mut Router) options(r_path string, cb fn (req mut ctx.Request, res mut ctx.Response)) {
	rter.create_route('OPTIONS', r_path, ctx.HandlerFunc(cb))
}
