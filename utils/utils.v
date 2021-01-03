module utils

import mime

pub const (
	// HTTP Server Code Messages
	// See: https://github.com/for-GET/know-your-http-well/blob/master/json/status-codes.json
	status_code_msgs = {
		100: 'Continue',
		101: 'Switching Protocols',
		200: 'OK',
		201: 'Created',
		202: 'Accepted',
		203: 'Non-Authoritive Information',
		204: 'No Content',
		205: 'Reset Content',
		206: 'Partial Content',
		300: 'Multiple Choices',
		301: 'Moved Permanently',
		400: 'Bad Request',
		401: 'Unauthorized',
		403: 'Forbidden',
		404: 'Not Found',
		405: 'Method Not Allowed',
		408: 'Request Timeout',
		500: 'Internal Server Error',
		501: 'Not Implemented',
		502: 'Bad Gateway',
	}
)

// status_code_msg returns the message of the given status code.
// returns "Internal Server Error" if status is unknown.
pub fn status_code_msg(code int) string {
	if code_str in status_code_msgs {
		return status_code_msgs[code]
	}

	return status_code_msgs[500]
}

// identify_mime returns the MIME content type of a filename.
pub fn identify_mime(filename string) string {
	mt := mime.db.lookup(filename)
	return if mt.len > 0 { 
		mt 
	} else { 
		'application/octet-stream' 
	}
}