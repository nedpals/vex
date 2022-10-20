module session

import json
import os

// LocalStore reads ands saves sessions on the local disk in a JSON-encoded format.
pub struct LocalStore {
pub mut:
	path          string = os.temp_dir() + '/vex_sessions.json'
	encode_pretty bool
}

// read_all reads all sessions from the local session data.
fn (ls LocalStore) read_all() ?map[string]map[string]string {
	file_check(ls.path)?
	contents := os.read_file(ls.path) or { return err }
	sessions := json.decode(map[string]map[string]string, contents) or {
		return error('Session data decode failed. This probably means your "$ls.path" file is malformatted.')
	}
	return sessions
}

// read reads an individual session from the local session data.
pub fn (ls LocalStore) read(id string) ?map[string]string {
	sessions := ls.read_all() or {
		return error('No entry in local session data with id of "$id".')
	}
	return sessions[id]
}

// delete removes an individual session from the local session data.
pub fn (mut ls LocalStore) delete(id string) ? {
	mut sessions := ls.read_all()?
	if id in sessions.keys() {
		sessions.delete(id)
		if ls.encode_pretty {
			os.write_file(ls.path, json.encode_pretty(sessions)) or { return err }
		} else {
			os.write_file(ls.path, json.encode(sessions)) or { return err }
		}
	} else {
		return error('Failed to delete session data. No entry with id of "$id" exists.')
	}
}

// write saves session data to the local storage.
pub fn (mut ls LocalStore) write(id string, data map[string]string) ? {
	mut sessions := ls.read_all()?
	sessions[id] = data.clone()
	if ls.encode_pretty {
		os.write_file(ls.path, json.encode_pretty(sessions)) or { return err }
	} else {
		os.write_file(ls.path, json.encode(sessions)) or { return err }
	}
}

// file_check checks whether or not `path` exists and creates an
// empty JSON file if it does not.
fn file_check(path string) ? {
	if !os.is_file(path) {
		$if windows {
			os.execute('type $path')
		} $else {
			os.execute('touch $path')
		}
		os.write_file(path, '{}') or { return err }
	}
}
