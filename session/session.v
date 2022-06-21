module session

import crypto.sha1
import ctx
import net.urllib
import rand
import time
import utils

// the default session name :P
pub const default_session_name = 'VEXSESID'

// Session contains user data, the session Store, and cookie information
pub struct Session {
	ctx.Cookie
mut:
	data map[string]string
pub mut:
	name    string    = 'default_' + session.default_session_name
	id      string    = new_session_id()
	expires time.Time = time.now().add_days(1)
	store   Store     = LocalStore{}
	res     ctx.Resp
__global:
	auto_write bool = true
}

// set sets a value in the session data
pub fn (mut s Session) set(key string, val string) {
	s.data[key] = urllib.query_unescape(val) or {
		println(utils.yellow_log('Query unescape failed on "$val" setting to raw, escaped value.'))
		val
	}
	if s.auto_write {
		s.write()
	}
}

// set_many sets multiple keys and values in the session data
pub fn (mut s Session) set_many(keyval ...string) ? {
	if keyval.len % 2 != 0 {
		return error('Mismatched key-value pairs.')
	}
	for i := 0; i < keyval.len; i++ {
		key := keyval[i]
		i++
		val := keyval[i]
		s.set(key, val)
	}
}

// has checks if a value exists in the session data
[inline]
pub fn (mut s Session) has(key string) bool {
	return if s.get(key) == '' { false } else { true }
}

// pop reads a values from the session data to return, then deletes
// the key-value-pair from the data.
pub fn (mut s Session) pop(key string) ?string {
	val := s.must_get(key) ?
	s.remove(key)
	if s.auto_write {
		s.write()
	}
	return val
}

// get reads a value from the session data and returns it. Returns an
// empty string if no key is found matching the one provided.
pub fn (s Session) get(key string) string {
	if key in s.data.keys() {
		return s.data[key]
	}
	return ''
}

// must_get reads a value from the session data and return  it. If key
// provided does not match any, then `none` will be returned.
pub fn (s Session) must_get(key string) ?string {
	val := s.get(key)
	return if val == '' { none } else { val }
}

// remove deletes a key-value-pair from the session data.
pub fn (mut s Session) remove(key string) {
	s.data.delete(key)
	if s.auto_write {
		s.write()
	}
}

// is_empty returns whether or not the session has any data stored in it.
pub fn (s Session) is_empty() bool {
	return if s.data.len == 0 { true } else { false }
}

// regenereate replaces the ID of the session, but leaves the data
// and cookie info the same.
pub fn (mut s Session) regenerate() {
	// delete old session's `Set-Cookie` header
	s.remove_header()
	s.id = new_session_id()
	s.set_header()
}

// write saves the session data to the Store of the session
[inline]
pub fn (mut s Session) write() bool {
	s.store.write(s.id, s.data) or {
		println(utils.red_log('Failed to write session: $err.msg()'))
		return false
	}
	return true
}

// restore fetches the data from the Store of the session using the ID of the session
[inline]
pub fn (mut s Session) restore() ? {
	s.data = s.store.read(s.id) ?
}

// delete deletes the session data from Store.
[inline]
pub fn (mut s Session) delete() {
	s.store.delete(s.id) or {
		println(utils.yellow_log('Failed to delete session from store: $err.msg()'))
	}
}

// cookie returns the Session as a `ctx.Cookie` instance.
[inline]
pub fn (s Session) cookie() ctx.Cookie {
	return ctx.Cookie{
		name: s.name
		value: s.id
		expires: s.expires
		max_age: s.max_age
		domain: s.domain
		path: s.path
		http_only: s.http_only
		secure: s.secure
		same_site: s.same_site
	}
}

// set_header sets a `Set-Cookie` on Session.res that represents
// the current Session
[inline]
pub fn (mut s Session) set_header() {
	s.res.set_cookies({
		s.id: s.cookie()
	})
}

// remove_header removes the corresponding `Set-Cookie` header in
// `Session.res.headers`.
[inline]
pub fn (mut s Session) remove_header() {
	s.res.headers.delete(s.id)
}

// get_header is a passthrough for `Cookie.header_str`.
[inline]
pub fn (mut s Session) get_header() []string {
	return s.res.headers[s.id]
}

// new_session_id generates a new sesssion id.
[inline]
pub fn new_session_id() string {
	return sha1.hexhash(rand.uuid_v4())
}

// new_session_from_id genereates a new Session from the provided ID and storage medium.
pub fn new_session_from_id(id string, mut store Store) ?Session {
	mut s := Session{
		id: id
		store: store
	}
	s.restore() ?
	return s
}

// SessionOptions are used to customize the 'Set-Cookie' header that will be sent with
// the response to the user when starting a session. It also contains the Store of a
// session.
[params]
pub struct SessionOptions {
mut:
	name      string    = 'default_'
	expires   time.Time = time.now().add_days(1)
	max_age   int
	path      string = '/'
	http_only bool
	secure    bool
	same_site ctx.SameSite = .lax
	store     Store        = LocalStore{}
}

// start checks to see if existing session ID exists in cookies based off of
// of the `SessionOptions.name` field. Leaving this field empty will result in default
// session. It's highly suggested not to use the default for production builds. If
// no session ID exists, then an error will be printed to the console and a new
// session is instantiated and returned.
pub fn start(req &ctx.Req, mut res ctx.Resp, opts SessionOptions) Session {
	cookies := req.parse_cookies() or {
		map[string]ctx.Cookie{}
	}

	mut ses := Session{}
	// check if session exists
	if (opts.name + session.default_session_name) in cookies.keys() {
		sesid := cookies[opts.name + session.default_session_name].value
		ses = new_session_from_id(sesid, mut ses.store) or { Session{} }

		ses.store = opts.store
		ses.name = opts.name + session.default_session_name
		ses.expires = opts.expires
		ses.max_age = opts.max_age
		ses.path = opts.path
		ses.http_only = opts.http_only
		ses.secure = opts.secure
		ses.same_site = opts.same_site
		ses.res = res
	}

	ses.write()
	res.set_cookies({
		ses.id: ses.cookie()
	})

	return ses
}
