module plugins

import nedpals.vex.ctx
import nedpals.vex.plugin
import nedpals.vex.router

[heap]
// Sample Plugin that publish some greeting messages
// At least define same attributes and methods of server.Plugin
pub struct HelloPlugin {
	// TODO: when available, use struct embedding here from server.Plugin or plugin.Plugin ... wip
	name         string
	version      string // semver string
	dependencies []string = []
mut:
	app          voidptr // reference to the app
	status       plugin.PluginStatus
	info         map[string]string
}

// init initializes the plugin and add some routes as a sample
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
		// msg := p.greeting('Noname') // if not possible now, enable the following line:
		msg := greeting_fn('Noname')
		res.send(msg, 200)
		res.headers['Content-Type'] = ['text/plain']
	})
	println('$p.name: registered route for ' + '/hello-text')
	app.route(.get, '/hello-json', fn (req &ctx.Req, mut res ctx.Resp) {
		// msg := p.greeting('Noname') // if not possible now, enable the following line:
		msg := greeting_fn('Noname')
		res.send('{"msg":"$msg"}', 200)
		res.headers['Content-Type'] = ['application/json']
	})
	println('$p.name: registered route for ' + '/hello-json')
	// TODO: to be able to call plugin methods from route handlers, try to define even route handlers in plugin, or as functions with the plugin as argument; then add an example for both ... wip

	// end of plugin initialization
	p.status = .initialized
	println('$p.name: initialized')
}

// close closed the plugin (useful to close used resources, etc)
pub fn (mut p HelloPlugin) close() {
	if p.status != .initialized {
		eprintln("Plugin '$p.name' already closed or in unknown status: '$p.status'")
		return
	}
	p.status = .closed
	println('$p.name: closed')
}

// info return some info about the plugin, like: name, version, status, and maybe others
pub fn (p HelloPlugin) info() map[string]string {
	return map{
		'name':    p.name
		'version': p.version
		'status':  p.status.str()
	}
}

// greeting return a greeting for the given name, as a plugin method
pub fn (p HelloPlugin) greeting(name string) string {
	return 'Hello $name !'
}

// greeting_fn return a greeting for the given name, as a normal function
pub fn greeting_fn(name string) string {
	return 'Hello $name !'
}
