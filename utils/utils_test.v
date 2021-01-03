module utils

fn test_status_code_msg() {
	msg := status_code_msg(204)
	assert msg == 'No Content'
}

fn test_status_code_msg_unknown() {
	msg := status_code_msg(600)
	assert msg == 'Internal Server Error'
}

fn test_identify_mime() {
	mimetype := identify_mime('test.txt')
	assert mimetype == 'text/plain'
}

fn test_identify_mime_unknown() {
	mimetype := identify_mime('unknown.txt2')
	assert mimetype == 'application/octet-stream'
}