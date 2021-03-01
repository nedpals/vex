module plugin

// import router
// import router { Router }

// TODO: check if/how to fully encapsulate plugin related stuff (if it makes sense here) ... 

pub struct Plugin {
	name         string [required]
	version      string [required] // semver string
	dependencies []string = []
mut:
	app          voidptr // TODO: check if instance of &router.Router ... wip
	status       PluginStatus
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

pub fn new() Plugin {
	return Plugin{
		name:    ''
		version: '0.0.0'
		status:  .unknown
	}
}

// init by default set only the flag
pub fn (mut p Plugin) init() {
	p.status = .initialized
}

// close by default set only the flag
pub fn (mut p Plugin) close() {
	p.status = .closed
}

// info tell main info (usually name and version) about the plugin
pub fn (p Plugin) info() map[string]string {
	return map{
		'name':    p.name
		'version': p.version
		'status':  p.status.str()
	}
}

// str return a string representation (as summary) of the plugin
pub fn (p Plugin) str() string {
	return 'Plugin{ name:$p.name, version:$p.version, status:$p.status.str() }'
}
