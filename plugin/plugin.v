module plugin

import router

pub type PluginImplementationFn = fn (mut router router.Router, options voidptr)

// Plugin empty plugin with some additions but almost empty methods.
// At least define same attributes and methods of server.Plugin.
[heap]
pub struct Plugin {
	name         string [required]
	version      string [required] // semver string
	dependencies []string = []
	impl         fn (mut router router.Router, options voidptr) // PluginImplementationFn
mut:
	// app          voidptr // reference to the app
	status       PluginStatus // TODO: check if remove (and re-introduce later if/when needed) ...
}

// PluginStatus list of plugin statuses.
pub enum PluginStatus {
	unknown
	initialized
	error
	// enabled // future use
	// disabled // future use
	closed 
}

// new factory function that returns a new Plugin instance 
// using given arguments for mandatory parameters and some default values fot others.
pub fn new(name string, version string, implementation PluginImplementationFn) &Plugin {
	return &Plugin{
		name:    name
		version: version
		impl:    implementation
		status:  .unknown
	}
}

// name return plugin name.
pub fn (p Plugin) name() string {
	return p.name
}

// init plugin initialization, by default set only its status flag.
pub fn (mut p Plugin) init() {
	p.status = .initialized
}

// close plugin shutdown, by default set only its status flag.
pub fn (mut p Plugin) close() {
	p.status = .closed
}

// info tell main info (usually name, version, current status) about the plugin.
pub fn (p Plugin) info() map[string]string {
	return plugin_info(p)
}

// plugin_info return main info (usually name, version, current status) on the given plugin.
// Useful to be called by other plugins if no other info need to be shown.
pub fn plugin_info(p Plugin) map[string]string {
	return {
		'name':    p.name
		'version': p.version
		'status':  p.status.str()
		'impl':    if isnil(p.impl) { 'not set'} else { 'set' }
		// 'app':     if isnil(p.app) { 'not set'} else { 'set' }
	}
}
