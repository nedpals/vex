module main

import nedpals.vex.server as vex
import sqlite

const (
	db = sqlite.connect(':memory:')
)

fn fetch_homepage(req vex.Request, res mut vex.Response) {
	res.send_file('index.html', 200)  
}

fn get_users(req vex.Request, res mut vex.Response) {
	users_from_db := db.exec('select * from users;')
	mut users := []string	 

	for row in users_from_db {
		users << row.vals[1]
	}

	res.set_header('Content-Type', 'text/plain')
	res.send(users.str(), 200)
}

fn add_user(req vex.Request, res mut vex.Response) {
	name := req.params['name']
	db.exec('insert into users (name) values ("${name}");')

	get_users(req, mut res)
}

fn main() {
	mut s := vex.new()	
	// db.exec('drop table if exists users;')
	db.exec('create table users (id integer primary key, name text default "");')
	
	s.serve_static('public')
	s.get('/', HandlerFunc(fetch_homepage))

	s.post('/users/new/:name', HandlerFunc(add_user))
	s.get('/users', HandlerFunc(get_users))

	s.serve(8000)
}
