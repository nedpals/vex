module router

// TODO: check if/how to fully encapsulate plugin related stuff (if it makes sense here) ... 

[heap]
// pub struct Plugin {
pub struct PluginBase {
	name         string
	version      string // semver string
	dependencies []string = []
	cfg          voidptr
mut:
	app          &Router // TODO: check if keep app mutable ...
	status       PluginStatus
    info         map[string]string // TODO: check if useful ...
	metadata     map[string]string // TODO: check if useful ...
	// routes      map[string]&Route // TODO: check later if useful ...
	// middlewares []ctx.MiddlewareFunc // TODO: check later if useful ...
}

// init by default do nothing
pub fn (p &PluginBase) init() {
	// status: .initialized
}

// List of plugin statuses.
pub enum PluginStatus {
	unknown
	initialized
	error
	loaded
	unloaded
}

// TODO: interface Plugin ? ... wip
pub interface Plugin {
	name         string
	version      string // semver string
	// TODO: check if/how to embed here fields from PluginBase ...

	init()
	// load()
	// unload()
	// dependencies() []string
	// status() PluginStatus
}


// str default string info for a plugin
pub fn (p &Plugin) str() string {
	return 'Plugin{ name:$p.name, version:$p.version }'
}

// init by default do nothing
pub fn (p &Plugin) init() {}

// TODO: check for dynamic load/unload of a plugin, but later ...

// TODO: check how to expose public methods from a Plugin (to b e used by external code) ... wip
