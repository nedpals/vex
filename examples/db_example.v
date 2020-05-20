module main

import server
import html
import ctx
import sqlite

fn layout(body []html.Tag) html.Tag {
    template := html.Tag{name: 'html', children: [
        html.Tag{name: 'head', children: [
            html.Tag{name: 'meta', props: { 'http-equiv': 'Content-Type', 'content': 'text/html;charset=UTF-8' }},
            html.Tag{name: 'meta', props: { 'name': 'referrer', 'content': 'origin-when-cross-origin'}},
            html.Tag{name: 'title', text: 'Vex SQLite Test'},
            html.Tag{name: 'style', text: '
                body {
                    width: 36rem;
                    margin: 0 auto;
                    font-size: 1.4rem;
                    font-family: Palatino, "Palatino Linotype", Georgia, "Lucida Bright",
                                    Cambria, Tahoma, Verdana, Arial, sans-serif;
                    color: #0C3C26;
                }
            '}
        ]},
        html.Tag{name: 'body', children: body}
    ]}

    return template
}

fn main() {
    db := sqlite.connect(':memory:')
    mut s := server.new()
    // db.exec('drop table if exists users;')
	db.exec('create table users (id integer primary key, name text default "");')
    
    s.get('/', fn (req ctx.Req, res mut ctx.Resp) {
        page := layout([
            html.Tag{name: 'h1', text: 'It works!'},
            html.Tag{name: 'p', children: [
                html.Tag{name: 'text', text: 'For online documentation please refer to '},
                html.Tag{name: 'a', props: { 'href': 'https://github.com/nedpals/vex' }, text: 'vex'},
                html.Tag{name: 'br'},
                html.Tag{name: 'em', text: 'It\'s a web framework based on ', children: [
                    html.Tag{name: 'a', props: { 'href': 'https://vlang.io' }, text: 'V.'}
                ]}
            ]},
        html.Tag{name: 'a', props: {'href': '/users'}, text: 'All users'},
        html.Tag{name: 'br'},
        html.Tag{name: 'a', props: {'href': '/users/add'}, text: 'Add a user'}
        ])

        res.send_html(page, 200)
    })
    
    s.get('/users', fn (req ctx.Req, res mut ctx.Resp) {
        users_from_db, _ := db.exec('select * from users;')
        mut users := []html.Tag   

        for row in users_from_db {
            tag := html.Tag{name: 'li', text: row.vals[1]}
            users << tag
        }

        page := layout([
            html.Tag{name: 'h1', text: 'Users'},
            html.Tag{name: 'ul', children: users},
        html.Tag{name: 'a', props: {'href': '/'}, text: 'Back to homepage'}
        ])

        res.send_html(page, 200)
    })
    
	s.get('/users/add', fn (req ctx.Req, res mut ctx.Resp) {
        page := layout([
            html.Tag{name: 'a', props: { 'href': '/users' }, text: 'All users'},
            html.Tag{name: 'h1', text: 'Add user'},
            html.Tag{name: 'form', props: { 'id': 'form', 'method': 'post', 'onsubmit': 'set_action(\'form\', \'name\')'}, children: [
                html.Tag{name: 'input', props: { 'id': 'name', 'name': 'name', 'value': ''}},
                html.Tag{name: 'button', props: { 'type': 'submit' }, text: 'Add'}
            ]},
            html.Tag{name: 'script', text: '
                function set_action(f, n) {
                    var form = document.getElementById(f);
                    var name = document.getElementById(n).value;
                    form.action = "/users/new/" + name;
                }
            '}
        ])

        res.send_html(page, 200)
    })

    s.post('/users/new/:name', fn (req ctx.Req, res mut ctx.Resp) {
        name := req.params['name']
        db.exec('insert into users (name) values ("${name}");')

        res.redirect('/users')
    })

    s.serve(8080)
}