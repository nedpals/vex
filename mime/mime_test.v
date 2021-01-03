module mime
import os

fn test_lookup() {
	lookup_extension := db.lookup('json')
	assert lookup_extension == 'application/json'
}

fn test_lookup_ext_with_dot() {
	lookup_extension_with_dot := db.lookup('.md')
	assert lookup_extension_with_dot == 'text/markdown'
}

fn test_lookup_filename() {
	lookup_filename := db.lookup('file.html')
	assert lookup_filename == 'text/html'
}

fn test_lookup_filepath() {
	lookup_filepath := db.lookup('folder/file.js')
	assert lookup_filepath == 'application/javascript'
}

fn test_lookup_return_nothing() {
	lookup_return_nothing := db.lookup('folder/.htaccess')
	assert lookup_return_nothing == ''
}

fn test_extension() {
	extension_octet := db.extension('application/octet-stream')
	assert extension_octet == 'bin'
}

fn test_charset() {
	charset_js := db.charset('application/javascript')
	assert charset_js == 'UTF-8'
}

fn test_content_type() {
	ctype_name := db.content_type('markdown')
	assert ctype_name == 'text/markdown'
}

fn test_content_type_filename() {
	ctype_filename := db.content_type('file.json')
	assert ctype_filename == 'application/json; charset=utf-8'
}

fn test_content_type_same() {
	ctype_type := db.content_type('text/html')
	assert ctype_type == 'text/html'
}

fn test_content_type_with_charset() {
	ctype_withcharset := db.content_type('text/html; charset=iso-8859-1')
	assert ctype_withcharset == 'text/html; charset=iso-8859-1'
}

fn test_content_type_file() {
	ctype_ext := db.content_type(os.file_ext('/path/to/file.json'))
	assert ctype_ext == 'application/json; charset=utf-8'
}
