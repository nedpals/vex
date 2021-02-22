module main

import nedpals.vex.router {Plugin, PluginBase, PluginStatus, Router}
import nedpals.vex.server
import nedpals.vex.ctx

// new_base_plugin creates and return a new PluginBase without additions
fn new_base_plugin(mut rou router.Router) Plugin {
	plugin := &PluginBase{
		name: 'empty-plugin'
		version: '1.0.0'
		app: rou
	}
	// app.register(plugin, voidptr(0)) // but register outside here
	return plugin
}

[heap]
struct HelloPlugin {
	// PluginBase // TODO: check how to use struct embedding here ...
	name         string
	version      string // semver string
	dependencies []string = []
	cfg          voidptr
mut:
	app          &Router
	status       PluginStatus
	metadata     map[string]string // TODO: check if useful ...
}

// init initializes the plugin and add some routes as a sample
pub fn (mut p HelloPlugin) init(config voidptr) {
	println(@FN + ' ${p.info()} ...')
	// TODO: check if dedicate this method to only config stuff, or even load stuff (like currently) ...
	// add some routes
	p.app.route(.get, '/hello-text', fn (req &ctx.Req, mut res ctx.Resp) {
		res.send('Hello world!', 200)
		res.headers['Content-Type'] = ['text/plain']
	})
	println('${p.info()}: registered route for ' + '/hello-text')
	p.app.route(.get, '/hello-json', fn (req &ctx.Req, mut res ctx.Resp) {
		res.send('{"Hello":"World"}', 200)
		res.headers['Content-Type'] = ['application/json']
	})
	println('${p.info()}: registered route for ' + '/hello-json')
	// end of plugin initialization
	p.status = .initialized
}

// close closed the plugin (useful to close used resources, etc)
pub fn (mut p HelloPlugin) close() {
	p.status = .closed
}

// info tell name and version of the plugin
pub fn (p HelloPlugin) info() string {
	return '$p.name@$p.version'
}

// add a custom method to HelloPlugin, as a sample (to call later)

// greeting return a greeting for the given name
pub fn (p HelloPlugin) greeting(name string) string {
	// return '${p.info()}: Hello $name !'
	return 'Hello $name !'
}

// new_hello_plugin creates and return a new HelloPlugin that defines some routes
fn new_hello_plugin(mut rou router.Router) Plugin {
	plugin := &HelloPlugin{
		name:    'hello-plugin'
		version: '1.0.0'
		app:     rou
	}
	return plugin
}

// TODO: add an home page plugin ...

fn main() {
	mut app := router.new()

	// as a sample, move all routes in dedicated plugin/s
	// note that generic routes could be bundled in its own modules/dependencies
	// and application-specific routes could be splitted easily in its own modules

	// a sample empty plugin
	base_plugin := new_base_plugin(mut app)
	app.register(base_plugin, voidptr(0))
	// a sample hello plugin defined here
	mut hello_plugin := new_hello_plugin(mut app)
	app.register(hello_plugin, voidptr(0))
	// etc ...

	// TODO: add that page, with links to all published routes (defined statically for now) ... wip
	// TODO: move into an home page plugin ...
	app.route(.get, '/', fn (req &ctx.Req, mut res ctx.Resp) {
		res.send_file('plugin_example.html', 200)
	})

	// TODO: move routes etc in dedicated plugins ... wip

	app.route(.get, '/info', fn (req &ctx.Req, mut res ctx.Resp) {
		res.send('{"msg":"Info"}', 200)
		res.headers['Content-Type'] = ['application/json']
	})

	// TODO: return dynamic time ... wip
	app.route(.get, '/time', fn (req &ctx.Req, mut res ctx.Resp) {
		res.send('{"time":"time"}', 200)
		res.headers['Content-Type'] = ['application/json']
	})

	// TODO: add a generic health check route ... wip

	// TODO: add a route that always returns an error, both as text and as json ... wip

	// TODO: other route/s ? ... wip

	// TODO: in a dedicated function, get all plugins and print some info, and execute specific methods on some plugins ... wip

	server.serve(app, 8080)
}
