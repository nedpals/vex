module main

import server
import ctx
import sqlite

const (
    db = sqlite.connect(':memory:')
)

fn fetch_homepage(req ctx.Request, res mut ctx.Response) {
    res.send_file('public/index.html', 200)  
}

fn get_users(req ctx.Request, res mut ctx.Response) {
    users_from_db := db.exec('select * from users;')
    mut users := []string    

    for row in users_from_db {
        users << row.vals[1]
    }

    res.set_header('Content-Type', 'text/plain')
    res.send(users.str(), 200)
}

fn add_user(req ctx.Request, res mut ctx.Response) {
    name := req.params['name']
	db.exec('insert into users (name) values ("${name}");')

    get_users(req, mut res)
}

fn serve_static(req ctx.Request, res mut ctx.Response) {
    res.send_file('public/' + req.params['path'], 200)
}

fn main() {
    mut s := ctx.new()  
    // db.exec('drop table if exists users;')
	db.exec('create table users (id integer primary key, name text default "");')
    
    s.get('/', fetch_homepage)

    s.post('/users/new/:name', add_user)
    s.get('/users', get_users)

    s.serve(8000)
}