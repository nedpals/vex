module plugins

import nedpals.vex.ctx
import nedpals.vex.plugin
import nedpals.vex.router
import time

const utility_plugin_name    = @MOD + '.utility-plugin'

// Sample Plugin that publish some utility routes.
// new_utility_plugin creates and return a new Plugin.
pub fn new_utility_plugin() &plugin.Plugin {
	return &plugin.Plugin{
		name:    utility_plugin_name
		version: '1.0.0'
		impl:    utility_implementation
	}
}

fn utility_implementation(mut r router.Router, opts voidptr) {
	println('$utility_plugin_name: ' + @FN + ' start...')

	r.route(.get, '/info', fn (req &ctx.Req, mut res ctx.Resp) {
		info := 'UtilityPlugin info...'
		res.send('{"info":"$info"}', 200)
		res.headers['Content-Type'] = ['application/json']
	})
	println('$utility_plugin_name: registered route for /info')

	r.route(.get, '/time', fn (req &ctx.Req, mut res ctx.Resp) {
		now := time.now()
		res.send('{"timestamp":"$now.unix_time()", "time":"$now"}', 200)
		res.headers['Content-Type'] = ['application/json']
	})
	println('$utility_plugin_name: registered route for /time')

	r.route(.get, '/health', fn (req &ctx.Req, mut res ctx.Resp) {
		res.send('{"status":"ok", "statusCode":200}', 200)
		res.headers['Content-Type'] = ['application/json']
	})
	println('$utility_plugin_name: registered route for /health')

	r.route(.get, '/later', fn (req &ctx.Req, mut res ctx.Resp) {
		res.send('{"error":"Service Unavailable", "message":"Service Unavailable, retry later", "statusCode":503}', 503)
		res.headers['Content-Type'] = ['application/json']
	})
	println('$utility_plugin_name: registered route for /later')

	println('$utility_plugin_name: ' + @FN + ' end.')
}
