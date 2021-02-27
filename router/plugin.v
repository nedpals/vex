module router

// TODO: check if/how to fully encapsulate plugin related stuff (if it makes sense here) ... 

[heap]
pub struct PluginBase {
	name         string [required]
	version      string [required] // semver string
	dependencies []string = []
mut:
	app          &Router // TODO: check if keep app mutable ...
	cfg          voidptr
	status       PluginStatus
	// info         map[string]string // TODO: check if useful ...
	// metadata     map[string]string // TODO: check if useful ...
	// routes      map[string]&Route // TODO: check later if useful ...
	// middlewares []ctx.MiddlewareFunc // TODO: check later if useful ...
}

// init by default set only the flag
pub fn (mut p PluginBase) init(config voidptr) {
	// TODO: if already initialized, raise an error ...
	p.cfg    = config
	p.status = .initialized
}

// close by default set only the flag
pub fn (mut p PluginBase) close() {
	p.status = .closed
}

// str return a string representation (as summary) of the plugin
pub fn (p PluginBase) str() string {
	return 'Plugin{ name:$p.name, version:$p.version }'
}

// info tell main info (usually name and version) of the plugin
pub fn (p PluginBase) info() string {
	return '$p.name-$p.version'
}

// List of plugin statuses.
pub enum PluginStatus {
	unknown
	initialized
	error
	// enabled // future use
	// disabled // future use
	closed 
}

pub interface Plugin {
	name         string
	version      string // semver string
	// PluginBase // TODO: check if/how to embed here fields ...

	init(config voidptr)
	info() string
	close()
	// dependencies() []string
	// status() PluginStatus
}

// TODO: if enable, get runtime error, check with V guys ... wip
/*
// str default string info for a plugin
pub fn (p Plugin) str() string {
	return 'Plugin{ name:$p.name, version:$p.version }'
}

// init by default do nothing
pub fn (mut p Plugin) init(config voidptr) {}

// close by default do nothing
pub fn (mut p Plugin) close() {}
 */
