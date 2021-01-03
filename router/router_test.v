module router

import ctx

fn test_identify_kind_regular() {
	kind := identify_kind('test')
	assert kind == .regular
}

fn test_identify_kind_params() {
	kind := identify_kind(':name')
	assert kind == .param
}

fn test_identify_kind_wildcard() {
	kind := identify_kind('*path')
	assert kind == .wildcard
}

fn test_identify_kind_empty() {
	kind := identify_kind('')
	assert kind == .regular
}

fn test_extract_route_path_simple() {
	path := '/hello'
	name, param, children := extract_route_path(path) or {
		assert false
		return
	}
	assert name == 'hello'
	assert param.len == 0
	assert children.len == 0
}

fn test_extract_route_path_root() {
	path := '/'
	name, param, children := extract_route_path(path) or {
		assert false
		return
	}
	assert name.len == 0
	assert param.len == 0
	assert children.len == 0
}

fn test_extract_route_path_with_children() {
	path := '/world/hello/foo'
	name, param, children := extract_route_path(path) or {
		assert false
		return
	}
	assert name == 'world'
	assert param.len == 0
	assert children == '/hello/foo'
}

fn test_extract_route_path_with_param_simple() {
	path := '/:username'
	name, param, children := extract_route_path(path) or {
		assert false
		return
	}
	assert name == ':'
	assert param == 'username'
	assert children.len == 0
}

fn test_extract_route_path_with_param_as_child() {
	path := '/user/:username'
	root_name, root_param, root_children := extract_route_path(path) or {
		assert false
		return
	}
	assert root_name == 'user'
	assert root_param.len == 0
	assert root_children == '/:username'
	name, param, children := extract_route_path(root_children) or {
		assert false
		return
	}
	assert name == ':'
	assert param == 'username'
	assert children.len == 0
}

fn test_extract_route_path_with_wildcard_simple() {
	path := '/*anypath'
	name, param, children := extract_route_path(path) or {
		assert false
		return
	}
	assert name == '*'
	assert param == 'anypath'
	assert children.len == 0
}

fn test_extract_route_path_with_wildcard_as_child() {
	path := '/page/*number'
	root_name, root_param, root_children := extract_route_path(path) or {
		assert false
		return
	}
	assert root_name == 'page'
	assert root_param.len == 0
	assert root_children == '/*number'
	name, param, children := extract_route_path(root_children) or {
		assert false
		return
	}
	assert name == '*'
	assert param == 'number'
	assert children.len == 0
}

fn test_extract_route_path_with_wildcard_no_name() {
	path := '/page/*'
	root_name, root_param, root_children := extract_route_path(path) or {
		assert false
		return
	}
	assert root_name == 'page'
	assert root_param.len == 0
	assert root_children == '/*'
	name, param, children := extract_route_path(root_children) or {
		assert false
		return
	}
	assert name == '*'
	assert param == '*'
	assert children.len == 0
}

fn test_extract_route_path_with_wildcard_invalid() {
	path := '/blog/*slug/comments'
	root_name, root_param, root_children := extract_route_path(path) or {
		assert false
		return
	}
	assert root_name == 'blog'
	assert root_param.len == 0
	assert root_children == '/*slug/comments'
	_, _, _ := extract_route_path(root_children) or {
		assert err == 'wildcard routes should not have children routes'
		return
	}
	assert false
}

// TODO: possible but the route matching function does not support it yet
fn test_extract_route_path_mixed() {
	path := '/user/:username/*slug'
	root_name, root_param, root_children := extract_route_path(path) or {
		assert false
		return
	}
	assert root_name == 'user'
	assert root_param.len == 0
	assert root_children == '/:username/*slug'
	name, param, children := extract_route_path(root_children) or {
		assert false
		return
	}
	assert name == ':'
	assert param == 'username'
	assert children == '/*slug'
	name2, param2, children2 := extract_route_path(children) or {
		assert false
		return
	}
	assert name2 == '*'
	assert param2 == 'slug'
	assert children2.len == 0
}

fn dummy_handler(req &ctx.Req, mut res ctx.Resp) {}

fn dummy_handler2(req &ctx.Req, mut res ctx.Resp) {}

fn dummy_handler3(req &ctx.Req, mut res ctx.Resp) {}

fn test_routes_add_simple() {
	mut routes := map[string]&Route{}
	routes.add(.get, '/hello', dummy_handler)
	assert 'hello' in routes
	route := routes['hello']
	assert route.kind == .regular
	assert route.children.len == 0
	assert route.methods.len == 1
	assert 'get' in route.methods
	assert route.methods['get'].len == 1
}

fn test_routes_add_with_multiple_handlers() {
	mut routes := map[string]&Route{}
	routes.add(.get, '/multi', dummy_handler, dummy_handler2, dummy_handler3) or {
		assert false
		return
	}
	assert 'multi' in routes
	route := routes['multi']
	assert route.kind == .regular
	assert route.children.len == 0
	assert route.methods.len == 1
	assert 'get' in route.methods
	assert route.methods['get'].len == 3
}

fn test_routes_add_with_child() {
	mut routes := map[string]&Route{}
	routes.add(.get, '/hello/world', dummy_handler) or {
		assert false
		return
	}
	assert 'hello' in routes
	route := routes['hello']
	assert route.children.len == 1
	assert route.methods.len == 0
	assert 'world' in route.children
	child_route := route.children['world']
	assert child_route.kind == .regular
	assert child_route.children.len == 0
	assert child_route.methods.len == 1
	assert 'get' in child_route.methods
	assert child_route.methods['get'].len == 1
}

fn test_routes_add_with_param() {
	mut routes := map[string]&Route{}
	routes.add(.get, '/id/:id_number', dummy_handler2) or {
		assert false
		return
	}
	assert 'id' in routes
	route := routes['id']
	assert route.children.len == 1
	assert route.methods.len == 0
	assert ':' in route.children
	child_route := route.children[':']
	assert child_route.kind == .param
	assert child_route.param_name == 'id_number'
	assert child_route.children.len == 0
	assert child_route.methods.len == 1
	assert 'get' in child_route.methods
	assert child_route.methods['get'].len == 1
}

fn test_routes_add_with_wildcard() {
	mut routes := map[string]&Route{}
	routes.add(.get, '/book/*path', dummy_handler2) or {
		assert false
		return
	}
	assert 'book' in routes
	route := routes['book']
	assert route.children.len == 1
	assert route.methods.len == 0
	assert '*' in route.children
	child_route := route.children['*']
	assert child_route.kind == .wildcard
	assert child_route.param_name == 'path'
	assert child_route.children.len == 0
	assert child_route.methods.len == 1
	assert 'get' in child_route.methods
	assert child_route.methods['get'].len == 1
}

fn test_routes_add_invalid() {
	mut routes := map[string]&Route{}
	routes.add(.get, 'without_slash_at_first', dummy_handler2) or {
		assert err == 'route path must start with a slash (/)'
		return
	}
	assert false
}

fn test_routes_add_error() {
	mut routes := map[string]&Route{}
	routes.add(.get, '/book/*path', dummy_handler2) or {
		assert false
		return
	}
	routes.add(.get, '/book/what', dummy_handler2) or {
		assert err == 'only one wildcard or param route in an endpoint group is allowed.'
		return
	}
	assert false
}

fn test_routes_add_empty_handler_error() {
	mut routes := map[string]&Route{}
	routes.add(.get, '/no_handler') or {
		assert err == 'provided route handlers are empty'
		return
	}
	assert false
}

fn test_routes_find_simple() {
	mut routes := map[string]&Route{}
	routes.add(.get, '/', dummy_handler2) or {
		assert false
		return
	}
	params, middlewares, handlers := routes.find('get', '/') or {
		assert false
		return
	}
	assert params.len == 0
	assert middlewares.len == 0
	assert handlers.len == 1
}

fn test_routes_find_with_params() {
	mut routes := map[string]&Route{}
	routes.add(.get, '/user/:username', dummy_handler3) or {
		assert false
		return
	}
	params, middlewares, handlers := routes.find('get', '/user/bob') or {
		assert false
		return
	}
	assert params.len == 1
	assert middlewares.len == 0
	assert 'username' in params
	assert params['username'] == 'bob'
	assert handlers.len == 1
}

fn test_routes_find_with_wildcard() {
	mut routes := map[string]&Route{}
	routes.add(.get, '/dest/*path', dummy_handler3) or {
		assert false
		return
	}
	params, middlewares, handlers := routes.find('get', '/dest/foo/bar/baz/boo') or {
		assert false
		return
	}
	assert params.len == 1
	assert middlewares.len == 0
	assert 'path' in params
	assert params['path'] == 'foo/bar/baz/boo'
	assert handlers.len == 1
}

fn test_routes_group_simple() {
	mut routes := map[string]&Route{}

	routes.group('/foo', fn (mut rt map[string]&Route) {
		rt.route(.get, '/bar', dummy_handler, dummy_handler2)
		rt.route(.post, '/bar', dummy_handler)
	})

	assert routes.len == 1
	assert 'foo' in routes
	assert routes['foo'].children.len == 1
	assert 'bar' in routes['foo'].children
	assert routes['foo'].children['bar'].methods.len == 2
	assert 'get' in routes['foo'].children['bar'].methods
	assert routes['foo'].children['bar'].methods['get'].len == 2
	assert 'post' in routes['foo'].children['bar'].methods
	assert routes['foo'].children['bar'].methods['post'].len == 1
}

fn dummy_middleware(mut req ctx.Req, mut res ctx.Resp) {}

fn test_routes_group_simple_with_middleware() {
	mut routes := map[string]&Route{}
	routes.group('/foo', fn (mut rt map[string]&Route) {
		rt.route(.get, '/', dummy_handler)
	}, dummy_middleware)
	assert routes['foo'].middlewares.len == 1
}

fn test_router_use_simple() {
	mut router := Router{}
	router.use(dummy_middleware, dummy_middleware)
	assert router.middlewares.len == 2
}