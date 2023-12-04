module mime

import os

pub struct MimeType {
pub:
	source       string
	extensions   []string
	compressible bool     @[skip]
	charset      string   @[skip]
}

fn is_mime(text string) bool {
	txt := text.split('/')
	if txt.len != 2 {
		return false
	}
	return true
}

// charset returns the character set of a specific content type.
pub fn (mdb map[string]MimeType) charset(text string) string {
	ext := text.to_lower()
	mext := mdb[ext]
	if !is_mime(text) && mext.charset.len == 0 {
		return ''
	}
	return mext.charset
}

// content_type returns full content-type header given a content-type or extension.
// When given an extension, `mime.db.lookup` is used to get the matching
// content-type, otherwise the given content-type is used. Then if the
// content-type does not already have a `charset` parameter, `mime.db.charset`
// is used to get the default charset and add to the returned content-type.
pub fn (mdb map[string]MimeType) content_type(text string) string {
	mime_ := if !is_mime(text) { mdb.lookup(text) } else { text }
	if mdb[mime_].charset.len != 0 {
		chrst := mdb.charset(mime_)
		if chrst.len != 0 {
			return '${mime_}; charset=${chrst.to_lower()}'
		}
	}
	return mime_
}

// extension returns the default extension of a specific content-type
pub fn (mdb map[string]MimeType) extension(text string) string {
	typ := mdb[text.to_lower()]
	if !is_mime(text) || typ.extensions.len == 0 {
		return ''
	}
	return typ.extensions[0]
}

// lookup searches and returns the content-type associated with the provided file path
pub fn (mdb map[string]MimeType) lookup(path string) string {
	path_ext := os.file_ext('x.${path}').to_lower()
	if path_ext.len == 0 {
		return ''
	}
	extension := path_ext[1..path_ext.len]
	if extension.len == 0 {
		return ''
	}
	for k, v in mdb {
		for x in v.extensions {
			if x != extension {
				continue
			}
			return k
		}
	}
	return ''
}
