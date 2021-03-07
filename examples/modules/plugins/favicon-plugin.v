module plugins

import nedpals.vex.ctx
import nedpals.vex.plugin
import nedpals.vex.router

const (
	favicon_default_path = './modules/plugins'
	favicon_default_name = 'favicon.ico'
)

[heap]
// Sample Plugin that publish favicon related routes and methods.
// At least define same attributes and methods of server.Plugin.
// As a sample, some methods here are simpler than in other plugins in the same module.
pub struct FaviconPlugin {
	// when available, use struct embedding here from server.Plugin or plugin.Plugin
	name         string
	version      string // semver string
	path         string = favicon_default_path
	favicon      string = favicon_default_name
mut:
	app          voidptr // reference to the app
	status       plugin.PluginStatus
	info         map[string]string
	// image        []byte // future use
}

// init initializes the plugin and add some routes as a sample.
pub fn (mut p FaviconPlugin) init() {
	// add some routes, via the reference to enclosing app
	mut app := &router.Router(p.app) // cast to a router
	// at the moment it seems not possible to call plugin methods and fields from route handlers,
	// so define as normal functions outside plugins

	// in future, cache file content or set plugin status in .error ... wip
	// p.image := read_image('$p.path/$.p.favicon')

	app.route(.get, '/$p.favicon', fn (req &ctx.Req, mut res ctx.Resp) {
		res.send_file('$favicon_default_path/$favicon_default_name', 200)
		// res.headers['Content-Type'] = ['image/x-icon'] // not needed with send_file
	})
	println('$p.name: registered route for /$p.favicon')

	// end of plugin initialization
	p.status = .initialized
}

// close closes the plugin (useful to close used resources, etc).
pub fn (mut p FaviconPlugin) close() {
	p.status = .closed
}

// info return some info about the plugin, like: name, version, status, and maybe others.
pub fn (p FaviconPlugin) info() map[string]string {
	return map{
		'name':         p.name
		'version':      p.version
		'status':       p.status.str()
		'favicon_path': p.path
		'favicon_name': p.favicon
	}
}
