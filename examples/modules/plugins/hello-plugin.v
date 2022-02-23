module plugins

import nedpals.vex.ctx
import nedpals.vex.plugin
import nedpals.vex.router

// sample plugin without a specific struct

const hello_plugin_name    = @MOD + '.hello-plugin'
const hello_plugin_version = '1.0.0'

// new_hello_plugin creates and return a new HelloPlugin that defines some routes.
pub fn new_hello_plugin() &plugin.Plugin {
	return &plugin.Plugin{
		name:    hello_plugin_name
		version: hello_plugin_version
		impl:    hello_implementation
	}
}

fn hello_implementation(mut r router.Router, opts voidptr) {
	println('$hello_plugin_name: ' + @FN + ' start...')

	// at the moment it seems not possible to call plugin methods from route handlers,
	// so define as normal functions inside or outside plugins or as inline functions
	// retry check later with closures ...

	// add as route handler a plugin function
	r11 := '/hello-text-plugin-function'
	r.route(.get, r11, handler_from_plugin_function)
	println('$hello_plugin_name: registered route for $r11')
	// add as route handler as inline function
	r21 := '/hello-text'
	r.route(.get, r21, fn (req &ctx.Req, mut res ctx.Resp) {
		// msg := p.greeting('Noname') // future
		msg := greeting_fn('Noname')
		res.send(msg, 200)
		res.headers['Content-Type'] = ['text/plain']
	})
	println('$hello_plugin_name: registered route for $r21')
	r22 := '/hello-json'
	r.route(.get, r22, fn (req &ctx.Req, mut res ctx.Resp) {
		// msg := p.greeting('Noname') // future
		msg := greeting_fn('Noname')
		res.send('{"msg":"$msg"}', 200)
		res.headers['Content-Type'] = ['application/json']
	})
	println('$hello_plugin_name: registered route for $r22')
	r31 := '/hello-text-name-in-path/:name'
	r.route(.get, r31, fn (req &ctx.Req, mut res ctx.Resp) {
		name := req.params['name'] or { 'Noname' } // get from path arguments
		msg := greeting_fn(name)
		res.send(msg, 200)
		res.headers['Content-Type'] = ['text/plain']
	})
	println('$hello_plugin_name: registered route for $r31, and path argument name')
	r32 := '/hello-text-name-in-query'
	r.route(.get, r32, fn (req &ctx.Req, mut res ctx.Resp) {
		queries := req.parse_query() or { map[string]string{} } // get from URL arguments
		name := queries['name'] or { 'Noname' }
		msg := greeting_fn(name)
		res.send(msg, 200)
		res.headers['Content-Type'] = ['text/plain']
	})
	println('$hello_plugin_name: registered route for $r32, and query argument name' )

	println('$hello_plugin_name: ' + @FN + ' end.')
}

// greeting_fn return a greeting for the given name, as a normal function.
pub fn greeting_fn(name string) string {
	return 'Hello $name !'
}

// handler function from a plugin function
fn handler_from_plugin_function(req &ctx.Req, mut res ctx.Resp) {
	msg := greeting_fn('from ' + @FN)
	res.send(msg, 200)
	res.headers['Content-Type'] = ['text/plain']
}
