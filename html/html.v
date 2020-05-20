module html

import strings

pub struct Tag {
mut:
  name string
  props map[string]string
  children []Tag
  text string = ''
}

pub fn (tag Tag) str() string {
  return '{name: $tag.name, children: $tag.children.len}'
}

pub fn (tag Tag) html() string {
  mut sb := strings.new_builder(10000)

  if tag.name == 'html' {
     sb.writeln('<!DOCTYPE html>')
  }

  if tag.name == 'text' {
    sb.write(tag.text)
  } else {
    sb.write('<${tag.name}')
    for prop_name in tag.props.keys() {
      prop := tag.props[prop_name]
      sb.write(' ${prop_name}="${prop}"')
    }

    if tag.children.len <= 1 {
      sb.write('>')
      sb.write(tag.text)
    } else {
      sb.writeln('>')
      sb.writeln(tag.text)
    }
  }

  for child in tag.children {
    if tag.children.len <= 1 || child.name == 'text' {
      sb.write(child.html())
    } else {
      sb.writeln(child.html())
    }
  }

  if tag.name != 'text' {
    sb.write('</${tag.name}>')
  }

  return sb.str()
}