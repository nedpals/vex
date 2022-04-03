module session

import json
import os

pub struct LocalStore {
pub mut:
	path string = os.temp_dir() + '/vex_sessions.json'
	encode_pretty bool
}

fn (ls LocalStore) read_all() ?map[string]map[string]string {
	file_check(ls.path) ?
	contents := os.read_file(ls.path) ?
	println(contents)
	sessions := json.decode(map[string]map[string]string, contents) or {return error('decode failed')}
	return sessions
}

pub fn (ls LocalStore) read(id string) ?map[string]string {
	sessions := ls.read_all() or {
		return error('No entry in local session data with id of "$id".')
	}
	return sessions[id]
}

pub fn (mut ls LocalStore) delete(id string) ? {
	mut sessions := ls.read_all() ?
	if id in sessions.keys() {
		sessions.delete(id)
		if ls.encode_pretty {
			os.write_file(ls.path, json.encode_pretty(sessions)) ?
		} else {
			os.write_file(ls.path, json.encode(sessions)) ?
		}
	} else {
		return error('Failed to delete session data. No entry with id of "$id" exists.')
	}
}

pub fn (mut ls LocalStore) write(id string, data map[string]string) ? {
	mut sessions := ls.read_all() ?
	sessions[id] = data.clone()
	if ls.encode_pretty {
		os.write_file(ls.path, json.encode_pretty(sessions)) ?
	} else {
		os.write_file(ls.path, json.encode(sessions)) ?
	}
}

fn file_check(path string) ? {
	if !os.is_file(path) {
		$if windows {
			os.execute('type $path')
		} $else {
			os.execute('touch $path')
		}
		os.write_file(path, '{}') ?
	}
}