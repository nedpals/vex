module mime

import os

pub struct MimeType {
pub:
	source       string
	extensions   []string
	compressible bool     [skip]
	charset      string   [skip]
}

fn is_mime(text string) bool {
	txt := text.split('/')
	if txt.len != 2 {
		return false
	}
	return true
}

pub fn (mdb map[string]MimeType) charset(text string) string {
	ext := text.to_lower()
	mext := mdb[ext]
	if !is_mime(text) && mext.charset.len == 0 {
		return ''
	}
	return mext.charset
}

pub fn (mdb map[string]MimeType) content_type(text string) string {
	mime := if !is_mime(text) { mdb.lookup(text) } else { text }
	if mdb[mime].charset.len != 0 {
		chrst := mdb.charset(mime)
		if chrst.len != 0 {
			return '$mime; charset=$chrst.to_lower()'
		}
	}
	return mime
}

pub fn (mdb map[string]MimeType) extension(text string) string {
	typ := mdb[text.to_lower()]
	if !is_mime(text) || typ.extensions.len == 0 {
		return ''
	}
	return typ.extensions[0]
}

pub fn (mdb map[string]MimeType) lookup(path string) string {
	path_ext := os.file_ext('x.$path').to_lower()
	extension := path_ext[1..path_ext.len]
	if extension.len == 0 {
		return ''
	}
	for k, v in mdb {
		for x in v.extensions {
			if x != extension { continue }
			return k
		}
	}
	return ''
}
