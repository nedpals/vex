module session

fn test_session_manip() {
	mut session := Session{}
	session.set('test', 'value')
	assert session.data['test'] == 'value'
	assert session.has('test')
	assert session.get('test') == 'value'
	popped := session.pop('test') or { 'null' }
	assert popped in ['value', 'null']
	assert session.is_empty()
	session.set('test', 'value')
	must_get := session.must_get('test') or { 'null' }
	assert must_get in ['value', 'null']
	session.remove('test')
	assert session.has('test') == false

	session.set_many('one', 'oneval', 'two', 'twoval') or { assert false }
	assert session.get('one') == 'oneval'
	assert session.get('two') == 'twoval'
	session.set_many('mis', 'matched', 'values') or {
		// odd values should error, should be formatted as
		// set_many(key, val, key, val...)
		return
	}
	assert false
}

fn test_session_id_manip() {
	mut session := Session{
		id: 'test_id'
	}
	session.set_header()
	session.set('test', 'value')
	session.regenerate()
	assert session.id != 'test_id'
}

fn test_session_storage() {
	mut session := Session{
		id: 'test_id'
		auto_write: false
	}
	assert session.write()

	mut ls := LocalStore{}
	// new_session_from_id is basically a wrapper for session.restore().
	// And session.restore() is a wrapper for session.read(). So we don't
	// need to test either of those function indiviually.
	session = new_session_from_id('test_id', mut ls) or {
		// since we just used session.write()
		// this should never error
		assert false
		Session{}
	}

	session = Session{
		id: 'test_id'
	}
	session.set('test', 'value')
	session.delete()
	session = new_session_from_id('test_id', mut ls) or {
		// since we just deleted the session this should
		// produce an error
		return
	}
	if !session.is_empty() {
		assert false
	}
}
