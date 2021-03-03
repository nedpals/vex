module main

import nedpals.vex.ctx
import nedpals.vex.plugin
import nedpals.vex.router
import nedpals.vex.server
import time

[heap]
// Sample Plugin that publish some greeting messages
// At least define same attributes and methods of server.Plugin
struct HelloPlugin {
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
	// println('DEBUG: typeof(app):${typeof(app).name} inside the plugin')
/*
	// TODO: with this enabled, I get: RUNTIME ERROR: invalid memory access, fix ... ok, now it works
	app.route(.get, '/hello-text', fn (req &ctx.Req, mut res ctx.Resp) {
		res.send('Hello world!', 200)
		res.headers['Content-Type'] = ['text/plain']
	})
 */
	// add some routes
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


/*
// retrieve_and_check_plugins get some plugins from the router, and do some check on them
fn retrieve_and_check_plugins(mut rou router.Router) {
	// TODO: remove mutable on Router if possible ...
	println('DEBUG: ' + @FN + ' ...')
	p_base := rou.get_plugin('empty-plugin') or {
		eprintln('Error: $err.msg')
		return
	}
	// assert p_base is plugin.Plugin
	assert p_base is server.Plugin
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
 */


fn main() {
	mut app := router.new()

	// as a sample, move all routes in dedicated plugin/s
	// note that generic routes could be bundled in its own modules/dependencies
	// and application-specific routes could be splitted easily in its own modules

	// add a sample empty plugin created directly
	server.register(mut app, mut &server.Plugin(&plugin.Plugin{
		name: 'empty-plugin'
		version: '1.0.0'
	}))
	// add a sample hello plugin returned from a factory function
	// but cast plugin instance in a server.Plugin, otherwise do in the factory function
	mut hello_plugin := new_hello_plugin()
	server.register(mut app, mut &server.Plugin(&hello_plugin))
	// try to add another time a plugin already added, should be skipped
	server.register(mut app, mut &server.Plugin(&hello_plugin))

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

	// other route/s // TODO: remove once moved in a plugin ... wip
	app.route(.get, '/hello-text-name-in-path/:name', fn (req &ctx.Req, mut res ctx.Resp) {
		name := req.params['name'] or { 'Noname' } // get from path arguments
		msg := greeting_fn(name)
		res.send(msg, 200)
		res.headers['Content-Type'] = ['text/plain']
	})
	app.route(.get, '/hello-text-name-in-query', fn (req &ctx.Req, mut res ctx.Resp) {
		queries := req.parse_query() or { map[string]string{} } // get from URL arguments
		name := queries['name'] or { 'Noname' }
		msg := greeting_fn(name)
		res.send(msg, 200)
		res.headers['Content-Type'] = ['text/plain']
	})

/*
	// sample usage of a plugin method
	call_plugin_method(hello_plugin)

	// sample to get some plugins and print some info, and execute specific methods on some plugins
	retrieve_and_check_plugins(mut app)
 */

	// start the server
	server.serve(app, 8080)
}
