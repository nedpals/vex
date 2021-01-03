module ctx

fn test_send_404() {
	req := Req{}
	mut res := Resp{}
	send_404(req, mut res)
	assert res.body == '<h1>404 Not Found</h1>'
	assert res.status_code == 404
}