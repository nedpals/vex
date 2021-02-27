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
	app          voidptr // TODO: check if instance of &router.Router ... wip
	status       plugin.PluginStatus
	info         map[string]string
}

// init initializes the plugin and add some routes as a sample
pub fn (mut p HelloPlugin) init() {
	// println(@FN + ' ${p.info()} ...')
	/*
	// TODO: check how to achieve this ... wip
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
	 */

	// end of plugin initialization
	p.status = .initialized
}

// close closed the plugin (useful to close used resources, etc)
pub fn (mut p HelloPlugin) close() {
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

// add a custom method to HelloPlugin, as a sample (to call later)

// greeting return a greeting for the given name
pub fn (p HelloPlugin) greeting(name string) string {
	// return '${p.info()}: Hello $name !'
	return 'Hello $name !'
}

// new_hello_plugin creates and return a new HelloPlugin that defines some routes
fn new_hello_plugin() &plugin.Plugin {
	plugin := &HelloPlugin{
		name:    'hello-plugin'
		version: '1.0.0'
	}
	return plugin
}

// retrieve_and_check_plugins get some plugins from the router, and do some check on them
fn retrieve_and_check_plugins(mut rou router.Router) {
	// TODO: remove mutable on Router if possible ...
	/*
	// TODO: enable and fix ...
	p_base := rou.get_plugin('empty-plugin') or {
		eprintln('Error: $err')
		return
	}
	assert p_base is plugin.PluginBase
	match p_base {
		plugin.PluginBase { println('PluginBase instance found') }
		else { eprintln('Other plugin found...') }
	}
	println('Plugin found: ${p_base.info()}')
	// p_wrong := rou.get_plugin('not-present') or { return }  // expected failure

	// TODO: retrieve HelloPlugin and check it, then call its additional method/s ... wip 
	 */
}

fn main() {
	mut app := router.new()

	// as a sample, move all routes in dedicated plugin/s
	// note that generic routes could be bundled in its own modules/dependencies
	// and application-specific routes could be splitted easily in its own modules

	// a sample empty plugin
	app.register(&plugin.PluginBase{
		name: 'empty-plugin'
		version: '1.0.0'
	})
	// a sample hello plugin defined here
	mut hello_plugin := new_hello_plugin()
	app.register(mut hello_plugin)

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

	// sample to get some plugins and print some info, and execute specific methods on some plugins
	retrieve_and_check_plugins(mut app)

	// start the server
	server.serve(app, 8080)
}
