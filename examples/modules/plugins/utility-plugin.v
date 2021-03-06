module plugins

import nedpals.vex.ctx
import nedpals.vex.plugin
import nedpals.vex.router
import time

[heap]
// Sample Plugin that publish some utility routes.
// At least define same attributes and methods of server.Plugin.
// As a sample, some methods here are simpler than in other plugins in the same module.
pub struct UtilityPlugin {
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
pub fn (mut p UtilityPlugin) init() {
	// add some routes, via the reference to enclosing app
	mut app := &router.Router(p.app) // cast to a router
	// at the moment it seems not possible to call plugin methods from route handlers,
	// so define as normal functions outside plugins

	app.route(.get, '/info', fn (req &ctx.Req, mut res ctx.Resp) {
		res.send('{"msg":"Info"}', 200)
		res.headers['Content-Type'] = ['application/json']
	})
	println('$p.name: registered route for /info')

	app.route(.get, '/time', fn (req &ctx.Req, mut res ctx.Resp) {
		now := time.now()
		res.send('{"timestamp":"$now.unix_time()", "time":"$now"}', 200)
		res.headers['Content-Type'] = ['application/json']
	})
	println('$p.name: registered route for /time')

	app.route(.get, '/health', fn (req &ctx.Req, mut res ctx.Resp) {
		res.send('{"status":"ok", "statusCode":200}', 200)
		res.headers['Content-Type'] = ['application/json']
	})
	println('$p.name: registered route for /health')

	app.route(.get, '/later', fn (req &ctx.Req, mut res ctx.Resp) {
		res.send('{"error":"Service Unavailable", "message":"Service Unavailable, retry later", "statusCode":503}', 503)
		res.headers['Content-Type'] = ['application/json']
	})
	println('$p.name: registered route for /later')

	// end of plugin initialization
	p.status = .initialized
	println('$p.name: initialized')
}

// close closes the plugin (useful to close used resources, etc).
pub fn (mut p UtilityPlugin) close() {
	p.status = .closed
	println('$p.name: closed')
}

// info return some info about the plugin, like: name, version, status, and maybe others.
pub fn (p UtilityPlugin) info() map[string]string {
	// call plugin.Plugin.info() with its generic/minimal implementation
	return unsafe { plugin.plugin_info(&plugin.Plugin(&p)) }
}
