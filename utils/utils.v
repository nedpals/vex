module utils

import mime

const (
	mime_db = mime.load()
)

// https://github.com/for-GET/know-your-http-well/blob/master/json/status-codes.json
pub fn status_code_msg(code int) string {
	// partial
	status := match code {
		100 { 'Continue' }
		101 { 'Switching Protocols' }
		200 { 'OK' }
		201 { 'Created' }
		202 { 'Accepted' }
		203 { 'Non-Authoritive Information' }
		204 { 'No Content' }
		205 { 'Reset Content' }
		206 { 'Partial Content' }
		300 { 'Multiple Choices' }
		301 { 'Moved Permanently' }
		400 { 'Bad Request' }
		401 { 'Unauthorized' }
		403 { 'Forbidden' }
		404 { 'Not Found' }
		405 { 'Method Not Allowed' }
		408 { 'Request Timeout' }
		500 { 'Internal Server Error' }
		501 { 'Not Implemented' }
		502 { 'Bad Gateway' }
		else { 'Internal Server Error' }
	}

	return status
}

pub fn identify_mime(filename string) string {
	mut mt := mime_db.lookup(filename)

	if mt.len == 0 {
		mt = 'application/octet-stream'
	}

	return mt
}