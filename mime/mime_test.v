import mime
import os

type MimeType mime.MimeType

fn test_mime() {
    mdb := mime.load()

    // lookup
    lookup_extension := mdb.lookup('json')
    lookup_extension_with_dot := mdb.lookup('.md')
    lookup_filename := mdb.lookup('file.html')
    lookup_filepath := mdb.lookup('folder/file.js')
    lookup_return_nothing := mdb.lookup('folder/.htaccess')

    assert lookup_extension == 'application/json'
    assert lookup_extension_with_dot == 'text/markdown'
    assert lookup_filename == 'text/html'
    assert lookup_filepath == 'application/javascript'
    assert lookup_return_nothing == ''

    // extension
    extension_octet := mdb.extension('application/octet-stream')

    assert extension_octet == 'bin'

    // charset
    charset_js := mdb.charset('application/javascript')

    assert charset_js == 'UTF-8'

    // content type
    ctype_name := mdb.content_type('markdown')
    ctype_filename := mdb.content_type('file.json')
    ctype_type := mdb.content_type('text/html')
    ctype_withcharset := mdb.content_type('text/html; charset=iso-8859-1')
    ctype_ext := mdb.content_type(os.ext('/path/to/file.json'))

    assert ctype_name == 'text/markdown'
    assert ctype_filename == 'application/json; charset=utf-8'
    assert ctype_type == 'text/html'
    assert ctype_withcharset == 'text/html; charset=iso-8859-1'
    assert ctype_ext == 'application/json; charset=utf-8'
}