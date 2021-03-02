module main

import nedpals.vex.router
import nedpals.vex.plugin
// import nedpals.vex.router {Plugin, PluginBase, PluginStatus, Router}
import nedpals.vex.server
import nedpals.vex.ctx
import time

[heap]
struct HelloPlugin {
	// TODO: when possible, to simplify, use struct embedding here from PluginBase ... wip
	name         string
	version      string // semver string
	dependencies []string = []
mut:
	app          voidptr // reference to the app // TODO: check if instance of &router.Router ... wip
	// app          &server.Router = Router{} // reference to the app // TODO: check if instance of &router.Router ... wip
	status       plugin.PluginStatus
	info         map[string]string
}

// init initializes the plugin and add some routes as a sample
pub fn (mut p HelloPlugin) init() {
	// TODO: if already initialized, raise an error; check if use optional return type ...
	// add some routes, via the reference to enclosing app
	mut app := &router.Router(p.app) // cast to a router
	println('DEBUG: typeof(app):${typeof(app).name} inside the plugin')
	/*
	// TODO: with this enabled, I get: RUNTIME ERROR: invalid memory access, fix ... wip
	app.route(.get, '/hello-text', fn (req &ctx.Req, mut res ctx.Resp) {
		res.send('Hello world!', 200)
		res.headers['Content-Type'] = ['text/plain']
	})
	 */
	/*
	// TODO: check how to achieve this ... wip
	// add some routes
	p.app.route(.get, '/hello-text', fn (req &ctx.Req, mut res ctx.Resp) {
		msg := p.greeting('Noname') // TODO: get from arguments, or 'Noname'
		res.send(msg, 200)
		res.headers['Content-Type'] = ['text/plain']
	})
	println('${p.info()}: registered route for ' + '/hello-text')
	p.app.route(.get, '/hello-json', fn (req &ctx.Req, mut res ctx.Resp) {
		msg := p.greeting('Noname') // TODO: get from arguments, or 'Noname'
		res.send('{"msg":"$msg"}', 200)
		res.headers['Content-Type'] = ['application/json']
	})
	println('${p.info()}: registered route for ' + '/hello-json')
	 */

	// end of plugin initialization
	p.status = .initialized
}

// close closed the plugin (useful to close used resources, etc)
pub fn (mut p HelloPlugin) close() {
	// TODO: if not initialized, raise an error; check if use optional return type ...
	p.status = .closed
}

// info tell name and version of the plugin
pub fn (p HelloPlugin) info() map[string]string {
	return map{
		'name':    p.name
		'version': p.version
		'status':  p.status.str()
	}
}

// greeting return a greeting for the given name
pub fn (p HelloPlugin) greeting(name string) string {
	return 'Hello $name !'
}

// new_hello_plugin creates and return a new HelloPlugin that defines some routes
// At least define same attributes and methods of server.Plugin
fn new_hello_plugin() server.Plugin {
	plugin := &HelloPlugin{
		name:    'hello-plugin'
		version: '1.0.0'
	}
	// do other stuff on it ...
	// then return it
	return plugin
}

// retrieve_and_check_plugins get some plugins from the router, and do some check on them
fn retrieve_and_check_plugins(mut rou router.Router) {
	// TODO: remove mutable on Router if possible ...
	println('DEBUG: ' + @FN + ' ...')
	p_base := rou.get_plugin('empty-plugin') or {
		eprintln('Error: $err.msg')
		return
	}
	assert p_base is plugin.Plugin
	match p_base {
		plugin.Plugin { println("Plugin instance found for '${p_base.name}'") }
		else { eprintln('Other plugin found...') }
	}
	println('Plugin found: ${p_base.info()}')
	// the same even for HelloPlugin ... 
	p_wrong := rou.get_plugin('not-present') or { return }  // expected failure
	println('Plugin not found: expected for ${p_wrong.info()}') // never executed
}

fn 	call_plugin_method(p server.Plugin) {
	println('DEBUG: ' + @FN + ' ...')
	/*
	// TODO: enable and fix ...
	// msg := hello_plugin.greeting('Noname') // TODO: get from arguments, or 'Noname'
	hp := HelloPlugin(p)
	msg := hp.greeting('Noname') // TODO: get from arguments, or 'Noname'
	println('DEBUG: $msg')
	 */
}

fn main() {
	mut app := router.new()

	// as a sample, move all routes in dedicated plugin/s
	// note that generic routes could be bundled in its own modules/dependencies
	// and application-specific routes could be splitted easily in its own modules

	// add a sample empty plugin created directly
	server.register(mut app, mut plugin.Plugin{
		name: 'empty-plugin'
		version: '1.0.0'
	})
	// add a sample hello plugin returned from a factory function
	mut hello_plugin := new_hello_plugin()
	server.register(mut app, mut &hello_plugin)
	// try to add another time a plugin already added, should be skipped
	server.register(mut app, mut &hello_plugin)

	// TODO: move into an home page plugin ...
	app.route(.get, '/', fn (req &ctx.Req, mut res ctx.Resp) {
		res.send_file('./plugin_example.html', 200)
	})

	// TODO: move generic routes here in a dedicated UtilityPlugin ... wip
	app.route(.get, '/info', fn (req &ctx.Req, mut res ctx.Resp) {
		res.send('{"msg":"Info"}', 200)
		res.headers['Content-Type'] = ['application/json']
	})

	app.route(.get, '/time', fn (req &ctx.Req, mut res ctx.Resp) {
		now := time.now()
		res.send('{"timestamp":"$now.unix_time()", "time":"$now"}', 200)
		res.headers['Content-Type'] = ['application/json']
	})

	// TODO: add a generic health check route ... wip

	// TODO: add a route that always returns an error, both as text and as json ... wip

	// TODO: other route/s ? ... wip

	// sample usage of a plugin method
	call_plugin_method(hello_plugin)

	// sample to get some plugins and print some info, and execute specific methods on some plugins
	retrieve_and_check_plugins(mut app)

	// start the server
	server.serve(app, 8080)
}
