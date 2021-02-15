module ctx

fn test_parse_body_urlencoded() {
	req := Req{
		body: 'foo=bar&lol=edgy'.bytes()
		headers: map{
			'Content-Type': ['application/x-www-form-urlencoded']
		}
	}
	body := req.parse_form() or {
		assert false
		return
	}
	assert body.len == 2
	assert body['foo'] == 'bar'
	assert body['lol'] == 'edgy'
}

fn test_parse_body_json() {
	req := Req{
		body: '{"bar":"baz"}'.bytes()
		headers: map{
			'Content-Type': ['application/json']
		}
	}
	body := req.parse_form() or {
		assert false
		return
	}
	assert body.len == 1
	assert body['bar'] == 'baz'
}

fn test_parse_body_content_type_not_present() {
	req := Req{
		body: '{"test":"123"}'.bytes()
	}
	_ := req.parse_form() or {
		assert err == '`Content-Type` header is not present.'
		return
	}
	assert false
}

fn test_parse_body_invalid() {
	req := Req{
		body: 'text content'.bytes()
		headers: map{
			'Content-Type': ['text/plain']
		}
	}
	_ := req.parse_form() or {
		assert err == 'No appropriate content type header for body found.'
		return
	}
	assert false
}

fn test_parse_body_empty() {
	req := Req{}
	_ := req.parse_form() or {
		assert err == 'Form body is empty.'
		return
	}
	assert false
}
