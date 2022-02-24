module plugin

import router

fn empty_implementation(mut router router.Router, options voidptr) {
	println('hello from ' + @FN + ' initialized')
	// other code (routes added, etc) omitted from here, see other examples ...
}

fn test_plugin() {
	mut app := router.new()

	// add a sample plugin using the generic factory function
	mut generic_plugin := plugin.new('generic-plugin', '0.0.0', empty_implementation)
	assert typeof(generic_plugin).name == '&plugin.Plugin'

	// test plugin properties
	assert generic_plugin.name() == 'generic-plugin'

	// test plugin info
	plugin_info_method := generic_plugin.info()
	assert plugin_info_method.str() == "{'name': 'generic-plugin', 'version': '0.0.0', 'impl': 'set'}"

	// test plugin info by calling its utility function
	plugin_info_fn := plugin.plugin_info(generic_plugin)
	assert plugin_info_fn.str() == plugin_info_method.str()

	// register the plugin
	// but don't call it (no need to start a server here)
	app.register(generic_plugin, voidptr(0))
	assert true
}
