module session

import ctx
import rand
import time
import json

pub struct MemoryStore {
mut:
	entries map[string]map[string]string
}

pub fn (mut m MemoryStore) init() {}

pub fn (mut m MemoryStore) new(id string) ? {
	m.entries[id] = map[string]string{}
}

pub fn (mut m MemoryStore) has(id string) bool {
	return id in m.entries
}

pub fn (mut m MemoryStore) entries(id string) ?map[string]string {
	if !m.has(id) {
		return error('ID Not Found!')
	}
	return m.entries[id]
}

pub fn (mut m MemoryStore) save(id string, entries map[string]string) ? {
	new_entry_keys := entries.keys()
	entry_keys := m.entries[id].keys()
	for _, k in entry_keys {
		if k !in new_entry_keys {
			m.entries[id].delete(k)
			continue
		}
		m.entries[id][k] = entries[k]
	}
}

pub fn (mut m MemoryStore) destroy(id string) ? {
	m.entries.delete(id)
}

pub interface Store {
	init()
	new(id string) ?
	has(id string) bool
	entries(id string) ?map[string]string
	save(id string, entries map[string]string) ?
	destroy(id string) ?
}

// NOTE: Support uuid v4 for now
// See : https://en.wikipedia.org/wiki/Universally_unique_identifier#Version_4_(random)
pub struct Session {
mut:
	store		Store
	name  		string = 'SID'
}

pub fn (mut s Session) create(mut resp ctx.Resp) ? {
	id := rand.uuid_v4()
	s.store.new(id) ?
	mut session_cookie := map[string]ctx.Cookie{}
	session_cookie[s.name] = ctx.Cookie{
		name: s.name
		value: id
		expires: time.utc().add(24 * time.hour)
	}
	resp.set_cookies(session_cookie)
}

pub struct ReqSession {
pub:
	id			string
mut:
	session		&Session
pub mut:
	data		map[string]string
}

pub fn new(store Store) Session {
	mut ses := Session{
		store: store
	}
	ses.store.init()
	return ses
}

pub fn (s &Session) get(req &ctx.Req) ?ReqSession {
	cookies := req.parse_cookies() ?
	id := cookies[s.name].value
	if s.name !in cookies || !s.store.has(id) {
		return error('Session ID Not Found!')
	}
	values := s.store.entries(id) or { map[string]string{} }
	return ReqSession{id, s, values}
}

pub fn (rs &ReqSession) get(key string) string {
	val := rs.data[key] or { '' }
	return val
}

pub fn (mut rs ReqSession) set<T>(key string, val T) {
	$if T is string {
		rs.data[key] = val
	} $else {
		rs.data[key] = json.encode(val)
	}
}

pub fn (mut rs ReqSession) delete(key string) {
	rs.data.delete(key)
}

pub fn (mut rs ReqSession) destroy(id string) ?ctx.Cookie {
	rs.session.store.destroy(id) ?
	return ctx.Cookie{
		name:		 rs.session.name
		value: 		id
		expires: 	time.unix(90000) // for Jan 1, 1970
	}
} 

pub fn (mut rs ReqSession) save() ? {
	rs.session.store.save(rs.id, rs.data) ?
}