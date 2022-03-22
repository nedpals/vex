module router

import ctx
import utils
import net.urllib
import context

const (
	form_methods = ['POST', 'PATCH', 'PUT']
)

pub type GroupCallbackFn = fn (mut group map[string]&Route)

enum Kind {
	wildcard
	param
	regular
}

pub struct Router {
pub mut:
	on_error ctx.HandlerFunc = ctx.error_route
mut:
	routes      map[string]&Route
	middlewares []ctx.MiddlewareFunc
	ctx         context.Context = context.todo() // TODO: remove in the near future
}

pub fn new() Router {
	return Router{}
}

pub fn (r Router) receive(method string, path string, raw_headers []string, body []byte) (int, []byte, []byte) {
	def_header := ('\r\n' + raw_headers.join('\r\n')).bytes()
	req_path := urllib.parse(path) or {
		internal_err_body := r.respond_error(500)
		return 500, def_header, internal_err_body
	}
	mut req := ctx.Req{
		method: method
		path: req_path.path
		raw_query: req_path.raw_query
		ctx: r.ctx
	}
	mut res := ctx.Resp{}
	req.parse_headers(raw_headers)
	if method in router.form_methods {
		req.body << body

		if 'Content-Type' in req.headers
			&& req.headers['Content-Type'][0].starts_with('multipart/form-data')
			&& req.headers['Content-Type'][0].all_after('; boundary=').len > 0 {
			req.boundary = '--' + req.headers['Content-Type'][0].all_after('; boundary=')
			req.headers['Content-Type'][0] = 'multipart/form-data'
		}
	}
	params, route_middlewares, handlers := r.routes.find(req.method.to_lower(), req.path) or {
		not_found_body := r.respond_error(404)
		return 404, def_header, not_found_body
	}

	req.params = params.clone()

	// Not good but would be cool to use
	// an iterator for this instead
	for app_middleware in r.middlewares {
		if res.stopped {
			break
		}

		app_middleware(mut req, mut res)
	}

	for route_middleware in route_middlewares {
		if res.stopped {
			break
		}

		route_middleware(mut req, mut res)
	}

	for route_handler in handlers {
		if res.stopped {
			break
		}

		route_handler(&req, mut res)
	}

	return res.status_code, res.headers_bytes(), res.body
}

pub fn (r Router) respond_error(code int) []byte {
	req := ctx.Req{
		ctx: context.with_value(context.todo(), ctx.err_code_ctx_key, code)
	}
	mut resp := ctx.Resp{}
	err_route := r.on_error
	err_route(&req, mut resp)
	return resp.body
}

const global_ctx_key = context.Key('__vex')

// get_ctx accesses the global context
pub fn get_ctx(r &ctx.Req) voidptr {
	if global_ctx := r.ctx.value(router.global_ctx_key) {
		if global_ctx is voidptr {
			return global_ctx
		}
	}
	return 0
}

[deprecated: 'use Router.inject_context() or Req.ctx instead to inject value. As for accessing value, use router.get_ctx() instead of accessing r.ctx directly.']
pub fn (mut r Router) inject(data voidptr) {
	r.inject_context(context.with_value(context.todo(), router.global_ctx_key, data))
}

// inject_context injects the context to the handler context.
// TODO: to be removed in the future. must be in a form of
// a middleware instead.
pub fn (mut r Router) inject_context(ctx context.Context) {
	r.ctx = ctx
}

// route is a shortcut method to `r.routes.route` method
pub fn (mut r Router) route(method Method, path string, handlers ...ctx.HandlerFunc) {
	r.routes.route(method, path, ...handlers)
}

// group is a shortcut method to `r.routes.group` method
pub fn (mut r Router) group(prefix string, callback GroupCallbackFn) {
	r.routes.group(prefix, callback)
}

// use registers handlers as app-wide middlewares
pub fn (mut r Router) use(handlers ...ctx.MiddlewareFunc) {
	r.middlewares << handlers
}

// List of supported HTTP methods.
pub enum Method {
	get
	post
	patch
	put
	delete
	options
}

[heap]
pub struct Route {
	name       string
	param_name string
	method     Method
	kind       Kind
mut:
	children    map[string]&Route
	methods     map[string][]ctx.HandlerFunc
	middlewares []ctx.MiddlewareFunc
}

// empty str to avoid cgen error
pub fn (r &Route) str() string {
	return 'Route{ name: $r.name, middlewares: $r.middlewares.len, routes: $r.children }'
}

// identify route kind ( parameter, wildcard or regular )
fn identify_kind(route_name string) Kind {
	if route_name.len == 0 {
		return .regular
	}
	match route_name[0] {
		`:` { return .param }
		`*` { return .wildcard }
		else { return .regular }
	}
}

// extract_route_path returns the name, the parameter name (if present),
// and the remaining children route paths
pub fn extract_route_path(path string) ?(string, string, string) {
	if !path.starts_with('/') {
		return error('Route path must start with a slash (/)')
	}
	mut paths := path[1..].split('/')
	mut param_name := ''
	mut children := ''
	mut name := paths[0]
	mut has_wildcard := false
	if name.len >= 1 && name[0] in [`:`, `*`] {
		has_wildcard = name[0] == `*`
		param_name = if has_wildcard && name.len == 1 { '*' } else { name[1..] }
		name = name[0].ascii_str()
	}
	if paths.len > 1 {
		if has_wildcard {
			return error('Wildcard routes must not contain children routes.')
		}
		children = '/' + paths[1..].join('/')
	}
	$if debug {
		println('name: $name | param_name: $param_name | children: $children')
	}
	return name, param_name, children
}

// add creates a new route based on the given method, path, and the handlers.
// See `router.Method` for the list of available methods.
fn (mut routes map[string]&Route) add(method Method, path string, handlers ...ctx.HandlerFunc) ? {
	if '*' in routes || ':' in routes {
		return error('Only one wildcard OR param route in a route list is allowed.')
	}
	name, param_name, children := extract_route_path(path) ?
	if name !in routes {
		routes[name] = &Route{
			method: method
			param_name: param_name
			name: name
			kind: identify_kind(name)
		}
	}
	if children.len > 0 {
		routes[name].children.add(method, children, ...handlers) ?
		return
	} else if handlers.len == 0 {
		return error('Provided route handlers are empty.')
	}
	method_str := method.str()
	routes[name].methods[method_str] = handlers
}

// find searches the matching route and returns the injected params data and the route handlers.
pub fn (routes map[string]&Route) find(method string, path string) ?(map[string]string, []ctx.MiddlewareFunc, []ctx.HandlerFunc) {
	mut r_name, mut param_name, children := extract_route_path(path) ?
	mut params := map[string]string{}
	param_value := r_name
	if r_name !in routes {
		if ':' in routes || '*' in routes {
			r_name = if '*' in routes { '*' } else { ':' }
			param_name = routes[r_name].param_name
		} else {
			return error('Route not foun.')
		}
	}
	match r_name {
		':' { params[param_name] = param_value }
		'*' { params[param_name] = param_value + children }
		else {}
	}
	route := routes[r_name]
	if r_name != '*' && children.len > 0 {
		child_params, child_route_middlewares, handlers := route.children.find(method,
			children) ?
		for name, value in child_params {
			params[name] = value
		}
		unsafe { child_params.free() }
		return params, child_route_middlewares, handlers
	} else if method !in route.methods {
		return error('Method not found.')
	}
	return params, route.middlewares, route.methods[method]
}

// route creates a new route based on the given method, path, and the handlers.
// See `router.Method` for the list of available methods.
pub fn (mut routes map[string]&Route) route(method Method, path string, handlers ...ctx.HandlerFunc) {
	routes.add(method, path, ...handlers) or {
		panic(utils.red_log('Failed to add route `$path`. Reason: $err'))
	}
}

// group adds a series of routes into the desired prefix
pub fn (mut routes map[string]&Route) group(path string, callback GroupCallbackFn) {
	routes.route(.get, path, ctx.error_route)
	mut children := path
	mut name := ''
	mut cur_routes := unsafe { routes }
	mut prev_routes := unsafe { routes }

	for children.len > 0 {
		new_name, _, new_children := extract_route_path(children) or { panic(err.msg) }
		children = new_children
		name = new_name
		prev_routes = unsafe { cur_routes }
		cur_routes = unsafe { &cur_routes[name].children }
	}
	callback(mut cur_routes)
	if '' in cur_routes {
		unsafe {
			prev_routes[name].middlewares << cur_routes[''].middlewares
			for method_name, method_handlers in cur_routes[''].methods {
				prev_routes[name].methods[method_name] = method_handlers
			}
		}
		cur_routes.delete('')
	}
}

pub fn (mut routes map[string]&Route) use(middlewares ...ctx.MiddlewareFunc) {
	if routes.len == 0 {
		panic(utils.red_log('Endpoint/route middlewares can only be added after creating a route.'))
	}
	for name, _ in routes {
		routes[name].middlewares << middlewares
	}
}
