module plugin

// Plugin empty plugin with some additions but almost empty methods
// At least define same attributes and methods of server.Plugin
pub struct Plugin {
	name         string [required]
	version      string [required] // semver string
	dependencies []string = []
mut:
	app          voidptr // TODO: check if instance of &router.Router ... wip
	status       PluginStatus
}

// PluginStatus list of plugin statuses
pub enum PluginStatus {
	unknown
	initialized
	error
	// enabled // future use
	// disabled // future use
	closed 
}

// new factory function that returns a new Plugin instance using some default values
pub fn new() Plugin {
	return Plugin{
		name:    ''
		version: '0.0.0'
		status:  .unknown
	}
}

// init plugin initialization, by default set only its status flag
pub fn (mut p Plugin) init() {
	p.status = .initialized
}

// close plugin shutdown, by default set only its status flag
pub fn (mut p Plugin) close() {
	p.status = .closed
}

// info tell main info (usually name, version, current status) about the plugin
pub fn (p Plugin) info() map[string]string {
	return map{
		'name':    p.name
		'version': p.version
		'status':  p.status.str()
		'app':     if isnil(p.app) { 'not set'} else { 'set' }
	}
}

// str return a string representation (as summary) of the plugin
pub fn (p Plugin) str() string {
	return 'Plugin{ name:$p.name, version:$p.version, status:$p.status.str() }'
}
