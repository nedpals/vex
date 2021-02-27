module plugin

// import router
// import router { Router }

// TODO: check if/how to fully encapsulate plugin related stuff (if it makes sense here) ... 

[heap]
pub struct PluginBase {
	name         string [required]
	version      string [required] // semver string
	dependencies []string = []
mut:
	app          voidptr // TODO: check if instance of &router.Router ... wip
	status       PluginStatus
}

// init by default set only the flag
pub fn (mut p PluginBase) init() {
	// TODO: if already initialized, raise an error ...
	p.status = .initialized
}

// close by default set only the flag
pub fn (mut p PluginBase) close() {
	// TODO: if already closed, raise an error ...
	p.status = .closed
}

// str return a string representation (as summary) of the plugin
pub fn (p PluginBase) str() string {
	return 'Plugin{ name:$p.name, version:$p.version, status:$p.status.str() }'
}

// info tell main info (usually name and version) about the plugin
pub fn (p PluginBase) info() map[string]string {
	return map{
		'name':    p.name
		'version': p.version
		'status':  p.status.str()
	}
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
	// PluginBase // TODO: check if/how to embed here fields ...
	name         string
	version      string // semver string
mut:
	app          voidptr // TODO: check if instance of &router.Router ... wip

	init()
	info() map[string]string
	close()
	// dependencies() []string // dependency on other plugins (by name)
	// status() PluginStatus
}
