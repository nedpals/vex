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
}

// init initializes the plugin and add some routes as a sample.
pub fn (mut p HelloPlugin) init() {
	if p.status != .unknown {
		eprintln("Plugin '$p.name' already initialized or in wrong status: '$p.status'")
		return
	}
	// add some routes, via the reference to enclosing app
	mut app := &router.Router(p.app) // cast to a router
	// at the moment it seems not possible to call plugin methods from route handlers,
	// so define as normal functions outside plugins
	app.route(.get, '/hello-text', fn (req &ctx.Req, mut res ctx.Resp) {
		// msg := p.greeting('Noname') // not possible now
		msg := greeting_fn('Noname')
		res.send(msg, 200)
		res.headers['Content-Type'] = ['text/plain']
	})
	println('$p.name: registered route for /hello-text')
	app.route(.get, '/hello-json', fn (req &ctx.Req, mut res ctx.Resp) {
		// msg := p.greeting('Noname') // not possible now
		msg := greeting_fn('Noname')
		res.send('{"msg":"$msg"}', 200)
		res.headers['Content-Type'] = ['application/json']
	})
	println('$p.name: registered route for /hello-json')
	app.route(.get, '/hello-text-name-in-path/:name', fn (req &ctx.Req, mut res ctx.Resp) {
		name := req.params['name'] or { 'Noname' } // get from path arguments
		msg := greeting_fn(name)
		res.send(msg, 200)
		res.headers['Content-Type'] = ['text/plain']
	})
	println('$p.name: registered route for /hello-text-name-in-path/:name, and path argument name')
	app.route(.get, '/hello-text-name-in-query', fn (req &ctx.Req, mut res ctx.Resp) {
		queries := req.parse_query() or { map[string]string{} } // get from URL arguments
		name := queries['name'] or { 'Noname' }
		msg := greeting_fn(name)
		res.send(msg, 200)
		res.headers['Content-Type'] = ['text/plain']
	})
	println('$p.name: registered route for /hello-text-name-in-query, and query argument name' )

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
