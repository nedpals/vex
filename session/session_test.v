module session

fn test_session_manip() {
	mut s := Session{}
	s.set('test', 'value')
	assert s.data['test'] == 'value'
	assert s.has('test')
	assert s.get('test') == 'value'
	popped := s.pop('test') or { 'null' }
	assert popped in ['value', 'null']
	assert s.is_empty()
	s.set('test', 'value')
	must_get := s.must_get('test') or { 'null' }
	assert must_get in ['value', 'null']
	s.remove('test')
	assert s.has('test') == false

	s.set_many('one', 'oneval', 'two', 'twoval') or { assert false }
	assert s.get('one') == 'oneval'
	assert s.get('two') == 'twoval'
	s.set_many('mis', 'matched', 'values') or {
		// odd values should error, should be formatted as
		// set_many(key, val, key, val...)
		return
	}
	assert false
}

fn test_session_id_manip() {
	mut s := Session{
		id: 'test_id'
	}
	s.set_header()
	s.set('test', 'value')
	s.regenerate()
	assert s.id != 'test_id'
}

fn test_session_storage() {
	mut s := Session{
		id: 'test_id'
		auto_write: false
	}
	assert s.write()

	mut ls := LocalStore{}
	// new_session_from_id is basically a wrapper for s.restore().
	// And s.restore() is a wrapper for s.read(). So we don't
	// need to test either of those function indiviually.
	s = new_session_from_id('test_id', mut ls) or {
		// since we just used s.write()
		// this should never error
		assert false
		Session{}
	}

	s = Session{
		id: 'test_id'
	}
	s.set('test', 'value')
	s.delete()
	s = new_session_from_id('test_id', mut ls) or {
		// since we just deleted the s this should
		// produce an error
		return
	}
	if !s.is_empty() {
		assert false
	}
}
