module html

import strings

pub struct Tag {
mut:
	name     string
	attr     map[string]string
	children []Tag
	text     string
	empty    bool
}

pub struct BlockTagConfig {
	name     string
	attr     map[string]string
	children []Tag
}

// return the tag to encoded JSON
@[inline]
pub fn (tag Tag) str() string {
	return '{name: ${tag.name}, children: ${tag.children.len}}'
}

// html returns a Tag equivalent to `<!DOCTYPE html><html>...</html>`
@[inline]
pub fn html(children []Tag) Tag {
	return Tag{
		name: 'html'
		children: children
	}
}

// block is the same as `tag` but with Tag children
@[inline]
pub fn block(tag BlockTagConfig) Tag {
	return Tag{
		name: tag.name
		attr: tag.attr
		children: tag.children
	}
}

// meta returns a Tag equivalent to `<meta />`
@[inline]
pub fn meta(attr map[string]string) Tag {
	return Tag{
		name: 'meta'
		attr: attr
		empty: true
	}
}

// link returns a Tag equivalent to `<link />`
@[inline]
pub fn link(attr map[string]string) Tag {
	return Tag{
		name: 'link'
		attr: attr
		empty: true
	}
}

// style returns a Tag equivalent to `<style>...</style>`
@[inline]
pub fn style(style string) Tag {
	return Tag{
		name: 'style'
		text: style
	}
}

// tag returns itself for uniformity when using function-based DSL
@[inline]
pub fn tag(tag Tag) Tag {
	return tag
}

// br returns a Tag equivalent to `<br />`
@[inline]
pub fn br() Tag {
	return Tag{
		name: 'br'
		empty: true
	}
}

// is_text returns true if the tag name is empty and if the tag text is not empty.
pub fn (tag Tag) is_text() bool {
	return tag.name.len == 0 && tag.text.len > 0
}

// html returns the HTML output of the contents of the Tag struct.
pub fn (tag Tag) html() string {
	mut sb := strings.new_builder(10000)
	is_text := tag.is_text()
	if !is_text {
		if tag.name == 'html' {
			sb.write_string('<!DOCTYPE html>')
		}
		sb.write_string('<${tag.name}')
		for prop_name, prop in tag.attr {
			sb.write_string(' ${prop_name}="${prop}"')
		}
		if !tag.empty {
			sb.write_string('>')
		} else {
			sb.write_string('/>')
		}
	}
	sb.write_string(tag.text)
	if !tag.empty {
		for child in tag.children {
			sb.write_string(child.html())
		}
		if !is_text {
			sb.write_string('</${tag.name}>')
		}
	}
	return sb.str()
}
