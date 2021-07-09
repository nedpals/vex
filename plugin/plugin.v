module plugin

// Plugin empty plugin with some additions but almost empty methods.
// At least define same attributes and methods of server.Plugin.
pub struct Plugin {
	name         string [required]
	version      string [required] // semver string
	dependencies []string = []
mut:
	app          voidptr // reference to the app
	status       PluginStatus
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

// new factory function that returns a new Plugin instance using some default values.
// Force a cast to server.Plugin when called, to be aligned with the generic definition.
pub fn new() &Plugin {
	return &Plugin{
		name:    ''
		version: '0.0.0'
		status:  .unknown
	}
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
	return map{
		'name':    p.name
		'version': p.version
		'status':  p.status.str()
		'app':     if isnil(p.app) { 'not set'} else { 'set' }
	}
}
