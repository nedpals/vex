module ctx

import json
import mysql
import time

// MysqlStore allows the user to store sessions in a MySQL database.
// Unlike SqliteStore, you can create addition columns in the MySQL
// table to add additional data about a session.
pub struct MysqlStore {
pub:
	// these shouldn't be changed after a MysqlStore is instantiated.
	mysql_session_id_col_name string = 'session_id'
	mysql_session_data_col_name string = 'session_data'
	mysql_session_created_on_col_name string = 'created_on'
	
	dbname string = 'session_db'
	table_name string = 'sessions'
	host string = 'localhost'
	port int = 3306
	username string
	password string
__global:
	// if session duplicates are created, then delete all session except the last one created
	delete_obsolete_sessions bool = true
	// if you have additional columns in the database that you want data to
	// be added to upon insert, then this is where you would put it.
	custom_col_data map[string]string
}

// read fetches a row from a MySQL database and. It expects that a
// mysql table exists with `session_id varchar`, `session_data varchar`,
// and `created_on bigint`. The column names may be changed; see `MysqlStore`.
pub fn (ms MysqlStore) read(id string) ?map[string]string {
	mut conn := new_connection(ms) ?
	conn.connect() ?
	defer { conn.close() }
	
	query := 'SELECT * FROM `$ms.table_name` WHERE `$ms.mysql_session_id_col_name` = \'$id\' ORDER BY `$ms.mysql_session_created_on_col_name` DESC;'
	res := (conn.query(query) ?).maps()
	
	if res.len == 0 {
		return error('No row with session id of "$id" exists.')
	}
	
	if res.len > 1 && ms.delete_obsolete_sessions {
		del_query := 'DELETE FROM `$ms.table_name` WHERE `$ms.mysql_session_id_col_name` = \'$id\' ORDER BY `$ms.mysql_session_created_on_col_name` ASC LIMIT ${res.len-1};'
        conn.query(del_query) ?
	}
	
	return json.decode(map[string]string, res[0][ms.mysql_session_data_col_name])
}

// delete drops all rows from the MySQL database that have IDs
// corresponding to the one provided.
pub fn (mut ms MysqlStore) delete(id string) ? {
	mut conn := new_connection(ms) ?
	conn.connect() ?
	defer { conn.close() }

	// checks if entry exists to be deleted
	ms.read(id) ?
	
	del_query := 'DELETE FROM `$ms.table_name` WHERE `$ms.mysql_session_id_col_name` = \'$id\';'
	conn.query(del_query) ?
	
	if !(conn.affected_rows() > 0) {
		return error('No session entry with id of "$id" exists. Skipping delete...')
	}
}

// write inserts session data into the MySQL database.
pub fn (mut ms MysqlStore) write(id string, data map[string]string) ? {
	mut conn := new_connection(ms) ?
	conn.connect() ?
	defer { conn.close() }
	
	enc_data := json.encode(data)
	tmp := ms.read(id) or { map[string]string{} }
	ditto := if tmp == data { true } else { false } // see end of fn for usage
	id_exists := if tmp.len > 0 { true } else { false }
	
	if id_exists {
		mut update_query := 'UPDATE `$ms.table_name` SET `$ms.mysql_session_data_col_name` = \'$enc_data\''
		for key in ms.custom_col_data.keys() {
			update_query += ', $key = '
			is_num := is_number(ms.custom_col_data[key])
			if !is_num {
				update_query += '\''
			}
			update_query += ms.custom_col_data[key]
			if !is_num {
				update_query += '\''
			}
		}
		update_query += ' WHERE $ms.mysql_session_id_col_name = \'$id\';'
		conn.query(update_query) ?
	} else {
		// TODO: uses maths to make this one loop and append column name/value simeltaneously.
		mut insert_query := 'INSERT INTO `$ms.table_name` ($ms.mysql_session_id_col_name, $ms.mysql_session_data_col_name, $ms.mysql_session_created_on_col_name'
		for key in ms.custom_col_data.keys() {
			insert_query += ', $key'
		}
		insert_query += ') VALUES (\'$id\', \'$enc_data\', ' + time.now().unix_time().str()
		for key in ms.custom_col_data.keys() {
			insert_query += ', '
			is_num := is_number(ms.custom_col_data[key])
			if !is_num {
				insert_query += '\''
			}
			insert_query += ms.custom_col_data[key]
			if !is_num {
				insert_query += '\''
			}
		}
		insert_query += ');'
		
		conn.query(insert_query) ?
	}
	
	// In MySQL if you use an update statement but the value provided is
	// the same as the values in the database, it'll say no rows were
	// effected after the database was queried.
	if conn.affected_rows() == 0 && !ditto {
		return error('Failed to write to the database.')
	}
}

// is_number checks whether or not a `string` is a number or not.
[inline]
fn is_number(x string) bool {
	// .int() on a string returns 0 if it isn't a number.
	return x.int() != 0 && x != '0'
}

// new_connection creates a `mysql.Connection` instance from the fields
// in `MysqlStore`.
[inline]
fn new_connection(ms MysqlStore) ?mysql.Connection {
	return mysql.Connection{
		dbname: ms.dbname
		host: ms.host
		port: u32(ms.port)
		username: ms.username
		password: ms.password
	}
}