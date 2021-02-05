module ctx

fn test_parse_cookies() {
	req := Req{
		headers: {
			'Cookie': ['foo=bar; randomstring=sdasd9as0d90a']
		}
	}
	cookies := req.parse_cookies() or {
		assert false
		return
	}
	assert cookies.len == 2
	assert cookies['foo'].value == 'bar'
	assert cookies['randomstring'].value == 'sdasd9as0d90a'
}

fn test_parse_cookies_empty() {
	req := Req{}
	_ := req.parse_cookies() or {
		assert err == 'cookies not found'
		return
	}
	assert false
}

fn test_cookie_header_str_simple() {
	ck := Cookie{
		name: 'test'
		value: 'hello'
	}
	assert ck.header_str() == 'test=hello'
}

fn test_cookie_header_str_with_attrs() {
	ck := Cookie{
		name: 'test'
		value: 'hello'
		same_site: .@none
		http_only: true
		path: '/'
	}
	assert ck.header_str() == 'test=hello; Path=/; HttpOnly; Secure; SameSite=None'
}