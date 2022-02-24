module plugins

import nedpals.vex.ctx
import nedpals.vex.plugin
import nedpals.vex.router

const (
	favicon_plugin_name    = @MOD + '.favicon-plugin'
	favicon_plugin_version = '1.0.0'
	favicon_default_path   = './modules/plugins'
	favicon_default_name   = 'favicon.ico'
)

[heap]
// Sample Plugin that publish favicon related routes and methods.
// At least define same attributes and methods of plugin.Plugin.
pub struct FaviconPlugin {
	plugin.Plugin
	FaviconPluginOptions
}

[heap]
// Plugin specific options.
pub struct FaviconPluginOptions {
	path    string = favicon_default_path
	favicon string = favicon_default_name
	// image   []byte // future use, maybe using $embed
}

// new_favicon_plugin creates and return a new Plugin.
pub fn new_favicon_plugin() &plugin.Plugin {
	return &plugin.Plugin{
		name:    favicon_plugin_name
		version: favicon_plugin_version
		impl:    favicon_implementation
	}
}

// new_favicon_plugin_with_options creates and return a new FaviconPlugin that defines some routes.
pub fn new_favicon_plugin_with_options(options FaviconPluginOptions) &FaviconPlugin {
	return &FaviconPlugin{
		name:    favicon_plugin_name
		version: favicon_plugin_version
		impl:    favicon_implementation
		path:    options.path
		favicon: options.favicon
	}
}

fn favicon_implementation(mut r router.Router, opts &FaviconPluginOptions) {
	println('$favicon_plugin_name: ' + @FN + ' start...')

	if isnil(opts) {
		println('$favicon_plugin_name: error: plugin config options needed, skip')
		return
	}
	// get overrides from the given plugin config options
	// println('set: $opts.path, $opts.favicon')

	// use opts in the handler function, with a closure
	r.route(.get, '/$opts.favicon', fn [opts] (req &ctx.Req, mut res ctx.Resp) {
		res.send_file('$opts.path/$opts.favicon', 200)
		// res.headers['Content-Type'] = ['image/x-icon'] // not needed with send_file
	})
	println('$favicon_plugin_name: registered route for /$opts.favicon')

	println('$favicon_plugin_name: ' + @FN + ' end.')
}

// info return some info about the plugin, like: name, version, status, and maybe others.
pub fn (p FaviconPlugin) info() map[string]string {
	return {
		'name':         p.name
		'version':      p.version
		'favicon_path': p.path
		'favicon_name': p.favicon
	}
}
