module html

import strings

pub struct Tag {
mut:
  name string
  attr map[string]string
  children []Tag
  text string
}

pub struct BlockTagConfig {
  name string
  attr map[string]string
}

pub fn (tag Tag) str() string {
  return '{name: $tag.name, children: $tag.children.len}'
}

[inline]
pub fn html(children []Tag) Tag {
  return Tag{name: 'html', children: children}
}

[inline]
pub fn block(tag BlockTagConfig, children []Tag) Tag {
  return Tag{
    name: tag.name
    attr: tag.attr
    children: children
  }
}

[inline]
pub fn meta(attr map[string]string) Tag {
  return Tag{name: 'meta', attr: attr}
}

[inline]
pub fn style(style string) Tag {
  return Tag{name: 'style', text: style}
}

[inline]
pub fn tag(tag Tag) Tag {
  return tag
}

[inline]
pub fn br() Tag{
  return Tag{name: 'br'}
}

pub fn (tag Tag) is_text() bool {
  return tag.name.len == 0 && tag.text.len > 0
}

pub fn (tag Tag) html() string {
  mut sb := strings.new_builder(10000)
  is_text := tag.is_text()

  if !is_text {
    if tag.name == 'html' {
      sb.write('<!DOCTYPE html>')
    }

    sb.write('<${tag.name}')
    for prop_name, prop in tag.attr {
      sb.write(' ${prop_name}="${prop}"')
    }
    sb.write('>')
  }
  
  sb.write(tag.text)
  for child in tag.children {
    sb.write(child.html())
  }

  if !is_text {
    sb.write('</${tag.name}>')
  }

  return sb.str()
}