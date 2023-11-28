module utils

import mime
import term

// HTTP Server Code Messages
// See: https://github.com/for-GET/know-your-http-well/blob/master/json/status-codes.json
pub const status_code_msgs = {
	100: 'Continue'
	101: 'Switching Protocols'
	103: 'Early Hints'
	200: 'OK'
	201: 'Created'
	202: 'Accepted'
	203: 'Non-Authoritive Information'
	204: 'No Content'
	205: 'Reset Content'
	206: 'Partial Content'
	300: 'Multiple Choices'
	301: 'Moved Permanently'
	302: 'Found'
	303: 'See Other'
	304: 'Not Modified'
	307: 'Temporary Redirect'
	308: 'Permanent Redirect'
	400: 'Bad Request'
	401: 'Unauthorized'
	403: 'Forbidden'
	404: 'Not Found'
	405: 'Method Not Allowed'
	406: 'Not Acceptable'
	407: 'Proxy Authentication Required'
	408: 'Request Timeout'
	409: 'Conflict'
	410: 'Gone'
	411: 'Length Required'
	412: 'Precondition Failed'
	413: 'Payload Too Large'
	414: 'URI Too Long'
	415: 'Unsupported Media Type'
	416: 'Range Not Satisfiable'
	417: 'Expectation Failed'
	418: "I'm a teapot"
	421: 'Misdirected Request'
	426: 'Upgrade Required'
	428: 'Precondition Required'
	429: 'Too Many Requests'
	431: 'Request Header Fields Too Large'
	451: 'Unavailable For Legal Reasons'
	500: 'Internal Server Error'
	501: 'Not Implemented'
	502: 'Bad Gateway'
	503: 'Service Unavailable'
	504: 'Gateway Timeout'
	505: 'HTTP Version Not Supported'
	506: 'Variant Also Negotiates'
	510: 'Not Extended'
	511: 'Network Authentication Required'
}
pub const log_name = '[VEX]'

pub fn green_log(msg string) string {
	return term.green(utils.log_name) + ' ' + msg
}

pub fn yellow_log(msg string) string {
	return term.yellow(utils.log_name) + ' ' + msg
}

pub fn red_log(msg string) string {
	return term.red(utils.log_name) + ' ' + msg
}

// status_code_msg returns the message of the given status code.
// returns "Internal Server Error" if status is unknown.
pub fn status_code_msg(code int) string {
	if code in utils.status_code_msgs {
		return utils.status_code_msgs[code]
	}
	return utils.status_code_msgs[500]
}

// identify_mime returns the MIME content type of a filename.
pub fn identify_mime(filename string) string {
	mt := mime.db.lookup(filename)
	return if mt.len > 0 { mt } else { 'application/octet-stream' }
}
