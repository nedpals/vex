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
	handler ctx.HandlerFunc = ctx.HandlerFunc(empty_cb)
}

fn (routes []Route) has_wildcard() bool {
	for route in routes {
		if route.typ == .wildcard {
			return true
		}
	}
	
	return false
}

fn (routes []Route) has_param() bool {
	for route in routes {
		if route.typ == .param {
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

fn identify_route_type(route_name string) RouteType {
	if (route_name.len <= 1) {
		return .regular
	}

	prefix := route_name[..2]

	match prefix {
		'/:' { return .param }
		'/*' { return .wildcard }
		else { return .regular }
	}
}

fn (rt mut Route) add_child_route(method string, path string, cb ctx.HandlerFunc) {
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
		rt.children[child_route_idx].add_child_route(method, combined, cb)
	} else {
		rt.children[child_route_idx].handler = cb
	}
}