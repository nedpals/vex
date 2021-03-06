module main

import nedpals.vex.ctx
import nedpals.vex.plugin
import nedpals.vex.router
import nedpals.vex.server
import plugins

// as a sample, define some plugins inline here, and get others from other modules
// for simplicity defined in this project, but could be somewhere)

// new_hello_plugin creates and return a new HelloPlugin that defines some routes
// At least define same attributes and methods of server.Plugin
fn new_hello_plugin() server.Plugin {
	plugin := &plugins.HelloPlugin{
		name:    'hello-plugin'
		version: '1.0.0'
	}
	// do other stuff on it ...
	// then return it
	return plugin
}

// new_utility_plugin creates and return a new UtilityPlugin that defines some routes
// At least define same attributes and methods of server.Plugin
fn new_utility_plugin() server.Plugin {
	plugin := &plugins.UtilityPlugin{
		name:    'utility-plugin'
		version: '1.0.0'
	}
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
	// add a sample utility plugin returned from a factory function
	// but in this case, do the in the factory function
	mut utility_plugin := new_utility_plugin()
	server.register(mut app, mut &utility_plugin)

	// TODO: move into an home page plugin ...
	app.route(.get, '/', fn (req &ctx.Req, mut res ctx.Resp) {
		res.send_file('./plugin_example.html', 200)
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
