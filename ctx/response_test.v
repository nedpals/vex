module ctx

fn test_send() {
	mut res := Resp{}
	res.send('test', 200)
	assert res.body == 'test'.bytes()
	assert res.status_code == 200
}

// fn test_send_file() {}
fn test_send_json() {
	mut res := Resp{}
	res.send_json(map{
		'hello': 'world'
	}, 201)
	assert res.body == '{"hello":"world"}'.bytes()
	assert res.status_code == 201
	assert res.headers['Content-Type'][0] == 'application/json'
}

fn test_send_status() {
	mut res := Resp{}
	res.send_status(400)
	assert res.body == '<h1>400 Bad Request</h1>'.bytes()
	assert res.status_code == 400
	assert res.headers['Content-Type'][0] == 'text/html'
}

fn test_redirect() {
	mut res := Resp{}
	res.redirect('/foo')
	assert res.status_code == 302
	assert res.headers['Location'][0] == '/foo'
}

fn test_permanent_redirect() {
	mut res := Resp{}
	res.permanent_redirect('/foo')
	assert res.status_code == 301
	assert res.headers['Location'][0] == '/foo'
}

fn test_send_html() {
	mut res := Resp{}
	res.send_html('<p>Test</p>', 200)
	assert res.body == '<p>Test</p>'.bytes()
	assert res.status_code == 200
	assert res.headers['Content-Type'][0] == 'text/html'
}
