module plugins

import nedpals.vex.ctx
import nedpals.vex.plugin
import nedpals.vex.router

[heap]
// Sample Plugin that publish some greeting messages.
// At least define same attributes and methods of server.Plugin.
pub struct HelloPlugin {
	// when available, use struct embedding here from server.Plugin or plugin.Plugin
	name         string
	version      string // semver string
	dependencies []string = []
mut:
	app          voidptr // reference to the app
	status       plugin.PluginStatus
	info         map[string]string
	routes       []string
}

// init initializes the plugin and add some routes as a sample.
pub fn (mut p HelloPlugin) init() {
	if p.status != .unknown {
		eprintln("Plugin '$p.name' already initialized or in wrong status: '$p.status'")
		return
	}
	// add some routes, via the reference to enclosing app
	mut app := &router.Router(p.app) // cast to a router
	// add as route handler a plugin function
	r11 := '/hello-text-plugin-function'
	app.route(.get, r11, handler_from_plugin_function)
	p.routes << r11
	println('$p.name: registered route for $r11')
	/*
	// add as route handler a plugin method
	// not possible now
	r12 := '/hello-text-plugin-method'
	app.route(.get, r12, p.handler_from_plugin_method)
	p.routes << r12
	println('$p.name: registered route for $r12')
	// otherwise
	 */
	// at the moment it seems not possible to call plugin methods from route handlers,
	// so define as normal functions outside plugins
	r21 := '/hello-text'
	app.route(.get, r21, fn (req &ctx.Req, mut res ctx.Resp) {
		// msg := p.greeting('Noname') // not possible now
		msg := greeting_fn('Noname')
		res.send(msg, 200)
		res.headers['Content-Type'] = ['text/plain']
	})
	p.routes << r21
	println('$p.name: registered route for $r21')
	r22 := '/hello-json'
	app.route(.get, r22, fn (req &ctx.Req, mut res ctx.Resp) {
		// msg := p.greeting('Noname') // not possible now
		msg := greeting_fn('Noname')
		res.send('{"msg":"$msg"}', 200)
		res.headers['Content-Type'] = ['application/json']
	})
	p.routes << r22
	println('$p.name: registered route for $r22')
	r31 := '/hello-text-name-in-path/:name'
	app.route(.get, r31, fn (req &ctx.Req, mut res ctx.Resp) {
		name := req.params['name'] or { 'Noname' } // get from path arguments
		msg := greeting_fn(name)
		res.send(msg, 200)
		res.headers['Content-Type'] = ['text/plain']
	})
	p.routes << r31
	println('$p.name: registered route for $r31, and path argument name')
	r32 := '/hello-text-name-in-query'
	app.route(.get, r32, fn (req &ctx.Req, mut res ctx.Resp) {
		queries := req.parse_query() or { map[string]string{} } // get from URL arguments
		name := queries['name'] or { 'Noname' }
		msg := greeting_fn(name)
		res.send(msg, 200)
		res.headers['Content-Type'] = ['text/plain']
	})
	p.routes << r32
	println('$p.name: registered route for $r32, and query argument name' )

	// end of plugin initialization
	p.status = .initialized
	println('$p.name: initialized')
}

// close closes the plugin (useful to close used resources, etc).
pub fn (mut p HelloPlugin) close() {
	if p.status != .initialized {
		eprintln("Plugin '$p.name' already closed or in unknown status: '$p.status'")
		return
	}
	p.status = .closed
	println('$p.name: closed')
}

// info return some info about the plugin, like: name, version, status, and maybe others.
pub fn (p HelloPlugin) info() map[string]string {
	return map{
		'name':    p.name
		'version': p.version
		'status':  p.status.str()
		'routes':  p.routes.str()  // sample, even if managed manually in the plugin
	}
}

// greeting return a greeting for the given name, as a plugin method.
pub fn (p HelloPlugin) greeting(name string) string {
	return 'Hello $name !'
}

// greeting_fn return a greeting for the given name, as a normal function.
pub fn greeting_fn(name string) string {
	return 'Hello $name !'
}

// handler function from a plugin function
fn handler_from_plugin_function(req &ctx.Req, mut res ctx.Resp) {
	msg := greeting_fn('from ' + @FN)
	res.send(msg, 200)
	res.headers['Content-Type'] = ['text/plain']
}

// handler function from a plugin method
fn (p HelloPlugin) handler_from_plugin_method(req &ctx.Req, mut res ctx.Resp) {
	msg := p.greeting('from ' + @FN)
	res.send(msg, 200)
	res.headers['Content-Type'] = ['text/plain']
}
