module session

// Store is the interface that Session accepts to store data.
// Using an interface allows the user to create their own Store
// structure if the method of storage they wish to use doesn't
// exist.
pub interface Store {
mut:
	read(string) ?map[string]string
	write(string, map[string]string) ?
	delete(string) ?
}
