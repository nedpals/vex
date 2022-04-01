module ctx

import json
import os
import sqlite

// SqliteStore is an extension of the Store interface.
pub struct SqliteStore {
pub mut:
	db_path string = os.temp_dir() + '/vex_sessions.sqlite'
}

// read opens the database file found at `SqliteStore.db_path` and finds
// an entry with an ID corresponding to the one provided and returns the data
pub fn (ss SqliteStore) read(id string) ?map[string]string {
	mut db := db_check(ss.db_path) ?
	
	session_row, _ := db.exec('SELECT * FROM Sessions WHERE id = \'$id\';')
	
	if session_row.len > 1 {
		return error('Error reading SQLite. Should have received 1 row; got $session_row.len instead.')
	}
	if session_row.len == 0 {
		return error('No session entry with id of "$id" exists.')
	}
	
	db.close() ?
	return json.decode(map[string]string, session_row[0].vals[1])
}

// delete opens the database file found at `SqliteStore.db_path` and
// removes an entry from the database. If it deletes successfully, then
// it returns `true`. If there is no entry with specified ID, then it
// returns `false`.
pub fn (mut ss SqliteStore) delete(id string) ? {
	mut db := db_check(ss.db_path) ?
	
	ss.read(id) ?
	
	_ := db.exec_none('DELETE FROM Sessions WHERE id = \'$id\';')
	
	db.close() ?
}

// write opens the database file found at `SqliteStore.db_path` and
// inserts the session data as a JSON encoded string.
pub fn (mut ss SqliteStore) write(id string, data map[string]string) ? {
	mut db := db_check(ss.db_path) ?
	
	has_session_row, _ := db.exec('SELECT * FROM Sessions WHERE id = \'$id\';')
	
	json_data := json.encode(data)
	if has_session_row.len == 0 {
		_ = db.exec_none('INSERT INTO Sessions VALUES (\'$id\', \'$json_data\');')
	} else {
		_ = db.exec_none('UPDATE Sessions SET data = \'$json_data\' WHERE id = \'$id\';')
	}
	
	db.close() ?
}

// db_check checks whether or not a sqlite file exists with the specified
// path and creates and sets up a table one if it doesn't exist. It will
// then return an opened `sqlite.DB` instance (be sure to close the connection).
fn db_check(path string) ?sqlite.DB {
	if !path.ends_with('.sqlite') && !path.ends_with('.db') {
		return error('Provided path "$path" must be an SQLite database.')
	}

	// create file if it doesn't exist
	if !os.is_file(path) {
		mut res := os.Result{}
		$if windows {
			res = os.execute('type "$path"')
		} $else {
			res = os.execute('touch "$path"')
		}
		if res.exit_code != 0 {
			return error('Failed to create "$path".')
		}
	}
	
	mut db := sqlite.connect(path) ?
	db.create_table('Sessions', [
		'id string'
		'data string'
	])
	return db
}