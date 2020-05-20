module router

import ctx

enum RouteType {
	wildcard
	param
	regular
}

struct Route {
pub mut:
	method string
	name string
	children []Route
	typ RouteType
	handler ctx.HandlerFunc = ctx.send_404
}

fn (routes []Route) has_type(typ RouteType) bool {
	for route in routes {
		if route.typ == typ { return true }
	}

	return false
}

fn (routes []Route) has_wildcard_or_param() bool {
	return routes.has_type(.param) || routes.has_type(.wildcard)
}

fn (routes []Route) index(method string, path string) int {
	for i, r in routes {
		if r.method == method && r.name == path {
			return i
		}
	}

	return -1
}

fn identify_route_type(route_name string) RouteType {
	if route_name.len <= 1 { return .regular }
	prefix := route_name[..2]

	match prefix {
		'/:' { return .param }
		'/*' { return .wildcard }
		else { return .regular }
	}
}

fn (mut rt Route) add_child(method string, path string, cb ctx.HandlerFunc) {
	child_route_name, route_children := get_route_name_and_children(path)
	mut child_route_idx := rt.children.index(method, child_route_name)
	if child_route_idx == -1 {
		if rt.children.has_wildcard_or_param() {
			panic(exceeded_paramwildcard_route_err)
		}

		rt.children << Route{ 
			method: method, 
			name: child_route_name, 
			children: [],
			typ: identify_route_type(child_route_name)
		}

		child_route_idx = rt.children.index(method, child_route_name)
	}

	if route_children.len >= 1 {
		combined := route_children.join('/')
		rt.children[child_route_idx].add_child(method, combined, cb)
	} else {
		rt.children[child_route_idx].handler = cb
	}
}