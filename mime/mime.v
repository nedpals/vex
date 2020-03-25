module mime

import filepath


pub struct MimeType {
pub:
    source string
    extensions []string
    compressible bool [skip]
    charset string [skip]
}

struct Db {
pub:
    db map[string]MimeType
}

fn is_mime(text string) bool {
    _text := text.split('/')

    if _text.len != 2 { return false }

    return true
}

pub fn load() Db {
    return Db{load_data()}
}

pub fn (mdb Db) charset(text string) string {
    if !is_mime(text) && mdb.db[text.to_lower()].charset.len == 0 {
        return ''
    }

    return mdb.db[text.to_lower()].charset
}

pub fn (mdb Db) content_type(text string) string {
    mime := if !is_mime(text) { mdb.lookup(text) } else { text }

    if mdb.db[mime].charset.len != 0 {
        _charset := mdb.charset(mime)
        
        if _charset.len != 0 { 
            return mime + '; charset=${_charset.to_lower()}'
        }
    }

    return mime
}

pub fn (mdb Db) extension(text string) string {
    _type := mdb.db[text.to_lower()]

    if !is_mime(text) || _type.extensions.len == 0 { return '' }

    return _type.extensions[0]
}

pub fn (mdb Db) lookup(path string) string {
    path_ext := filepath.ext('x.${path}').to_lower()
    extension := path_ext[1..path_ext.len]

    if extension.len == 0 { return '' }

    for k, v in mdb.db {
        for x in v.extensions {
            if x == extension {
                return k
            }
        }
    }

    return ''
}