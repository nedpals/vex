module main

import nedpals.vex.ctx
import nedpals.vex.plugin
import nedpals.vex.router
import nedpals.vex.server
import plugins

// as a sample, define some plugins inline here, and get others from other modules
// for simplicity defined in this project, but could be somewhere)

// new_hello_plugin creates and return a new HelloPlugin that defines some routes.
// At least define same attributes and methods of server.Plugin.
fn new_hello_plugin() server.Plugin {
	plugin := &plugins.HelloPlugin{
		name:    'hello-plugin'
		version: '1.0.0'
	}
	// do other stuff on it ...
	// then return it
	return plugin
}

// new_utility_plugin creates and return a new UtilityPlugin that defines some routes.
// At least define same attributes and methods of server.Plugin.
fn new_utility_plugin() server.Plugin {
	plugin := &plugins.UtilityPlugin{
		name:    'utility-plugin'
		version: '1.0.0'
	}
	return plugin
}

// new_favicon_plugin creates and return a new FaviconPlugin that defines some routes.
// At least define same attributes and methods of server.Plugin.
fn new_favicon_plugin() server.Plugin {
	plugin := &plugins.FaviconPlugin{
		name:    'favicon-plugin'
		version: '1.0.0'
		// favicon: 'plugin_example.ico' // override default value // future use
	}
	return plugin
}


// call_plugin_method call a public method of an already instanced plugin, casting it to its known type
fn 	call_plugin_method(p &server.Plugin) {
	hp := unsafe { &plugins.HelloPlugin(p) }
	msg := hp.greeting('Noname')
	println('Call a Plugin method for greetings: ' + msg)
}

// retrieve_and_check_plugins get some plugins from the router, and do some check on them
fn retrieve_and_check_plugins(rou router.Router) {
	println('Retrieve and check some plugins...')
	p_base_server := rou.get_plugin('empty-plugin') or {
		eprintln('Error: $err.msg')
		return
	}
	println("Plugin instance (generic) with type ${typeof(p_base_server).name}")
	println("Plugin instance (generic) info: ${p_base_server.info()}")
	// cast to the right plugin concrete type
	p_base := unsafe { &plugin.Plugin(p_base_server) }
	println("Plugin instance (cast to the right type) with type ${typeof(p_base).name}")
	println("Plugin instance (cast to the right type) info: ${p_base.info()}")
	// the same even for HelloPlugin ... 
	// ensure a not existing- plugin is not found and no error is raised
	_ := rou.get_plugin('not-present') or {
		println('Plugin not found: expected')
		return
	}  // expected failure
	println('Retrieve and check some plugins end.') // never executed
}


fn main() {
	mut app := router.new()

	// as a sample, move all routes in dedicated plugin/s
	// note that generic routes could be bundled in its own modules/dependencies
	// and application-specific routes could be splitted easily in its own modules

	// add a default empty plugin created directly
	server.register(mut app, mut plugin.new())
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
	// add a sample utility plugin returned from a factory function
	// but in this case, do the in the factory function
	mut utility_plugin := new_utility_plugin()
	server.register(mut app, mut &utility_plugin)

	// add route for the home page
	// could be moved into an home page plugin
	app.route(.get, '/', fn (req &ctx.Req, mut res ctx.Resp) {
		res.send_file('./plugin_example.html', 200)
	})

	// add a sample generic plugin for manage the favicon
	mut favicon_plugin := new_favicon_plugin()
	server.register(mut app, mut &favicon_plugin)

	// sample usage of a plugin method
	call_plugin_method(&hello_plugin)
	$if debug {
		// sample to get some plugins and print some info, and execute specific methods on some plugins
		retrieve_and_check_plugins(app)
	}

	// start the server
	server.serve(app, 8080)
}
