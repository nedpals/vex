module router

fn get_route_name_and_children(path string) (string, []string) {
    mut paths := path.split('/')
    
    if paths[0].len == 0 { paths = paths[1..] }
	name := '/' + paths[0]
	children := if paths.len > 1 { paths[1..] } else { []string{} }

    return name, children
}