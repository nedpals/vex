module main

import nedpals.vex.ctx
import nedpals.vex.plugin
import nedpals.vex.router
import nedpals.vex.server
import plugins // example plugins

// as a sample, define some plugins inline here, and get others from other modules
// for simplicity defined in this project, but could be somewhere.
// compile with debug options for a more verbose output.

fn main() {
	mut app := router.new()

	// as a sample, move all routes in dedicated plugin/s
	// note that generic routes could be bundled in its own modules/dependencies
	// and application-specific routes could be splitted easily in its own modules

	// add route for the home page
	// could be moved into an home page plugin with some config options
	app.route(.get, '/', fn (req &ctx.Req, mut res ctx.Resp) {
		res.send_file('./plugin_example.html', 200)
	})

	// add a sample plugin created directly, with no plugin options (voidptr set as 0)
	app.register(plugin.new('inline plugin', '0.0.0', fn (mut router router.Router, options voidptr) {
		println('hello from ' + @FN + ' initialized')
		// other code (routes added, etc) omitted from here, see other examples ...
	}), voidptr(0))

	// add a sample hello plugin returned from a factory function
	mut hello_plugin := plugins.new_hello_plugin()
	app.register(hello_plugin, voidptr(0))
	// try to add another time a plugin already added, should be skipped
	app.register(hello_plugin, voidptr(0))

	// add a plugin for manage the favicon
	// common:
	// define specific stuff, with some defaults
	favicon_options := &plugins.FaviconPluginOptions{
		// favicon: 'favicon.svg' // example override
	}
	// uncomment only one of the following options
	// option 1: add as a generic plugin
	// mut favicon_plugin_generic := plugins.new_favicon_plugin()
	// app.register(favicon_plugin_generic, favicon_options)
	// option 2: add as a specific plugin
	mut favicon_plugin_specific := plugins.new_favicon_plugin_with_options(favicon_options)
	// app.register(favicon_plugin_specific, voidptr(0)) // sample, to show error for the missing config
	app.register(favicon_plugin_specific, favicon_options)
	$if debug {
		// get some more info by running a plugin method
		println(favicon_plugin_specific.info())
	}

	/*
	// TODO: ...
	// add a plugin for some generic but useful routes
	mut utility_plugin := plugins.new_utility_plugin()
	app.register(utility_plugin, voidptr(0))
	*/

	// start the server
	server.serve(app, 8080)
}
