module main

import router
import server
import html
import ctx
import sqlite

fn layout(title string, body []html.Tag) html.Tag {
	template := html.html([
		html.block({ name: 'head' }, [
			html.meta({
				'http-equiv': 'Content-Type'
				'content':    'text/html;charset=UTF-8'
			}),
			html.meta({
				'name':    'referrer'
				'content': 'origin-when-cross-origin'
			}),
			html.tag(name: 'title', text: '$title | Vex SQLite Test'),
			html.style('
                body {
                    width: 36rem;
                    margin: 0 auto;
                    font-size: 1.4rem;
                    font-family: Palatino, "Palatino Linotype", Georgia, "Lucida Bright",
                                    Cambria, Tahoma, Verdana, Arial, sans-serif;
                    color: #0C3C26;
                }
            '),
		]),
		html.block({ name: 'body' }, body),
	])
	return template
}

fn main() {
	mut app := router.new()
	db := sqlite.connect(':memory:') ?
	db.exec('drop table if exists users;')
	db.exec('create table users (id integer primary key, name text default "");')
	app.inject(db)
	app.route(.get, '/', fn (req &ctx.Req, mut res ctx.Resp) {
		page := layout([
			html.tag(name: 'h1', text: 'It works!'),
			html.block({ name: 'p' }, [
				html.tag(name: 'text', text: 'For online documentation please refer to '),
				html.tag(
					name: 'a'
					attr: {
						'href': 'https://github.com/nedpals/vex'
					}
					text: 'vex'
				),
				html.br(),
				html.block({ name: 'em', text: "It\'s a web framework based on " }, [
					html.Tag{
						name: 'a'
						attr: {
							'href': 'https://vlang.io'
						}
						text: 'V.'
					},
				]),
			]),
			html.tag(
				name: 'a'
				attr: {
					'href': '/users'
				}
				text: 'All users'
			),
			html.br(),
			html.tag(
				name: 'a'
				attr: {
					'href': '/users/add'
				}
				text: 'Add a user'
			),
		])
		res.send_html(page.html(), 200)
	})
	app.route(.get, '/users', fn (req &ctx.Req, mut res ctx.Resp) {
		db2 := &sqlite.DB(req.ctx)
		users_from_db, _ := db2.exec('select * from users;')
		mut users := []html.Tag{}
		for row in users_from_db {
			tag := html.Tag{
				name: 'li'
				text: row.vals[1]
			}
			users << tag
		}
		page := layout([
			html.tag(name: 'h1', text: 'Users'),
			html.block({ name: 'ul' }, users),
			html.tag(
				name: 'a'
				attr: {
					'href': '/'
				}
				text: 'Back to homepage'
			),
		])
		res.send_html(page.html(), 200)
	})
	app.route(.get, '/users/add', fn (req &ctx.Req, mut res ctx.Resp) {
		page := layout([
			html.tag(
				name: 'a'
				attr: {
					'href': '/users'
				}
				text: 'All users'
			),
			html.tag(name: 'h1', text: 'Add user'),
			html.block({
				name: 'form'
				attr: {
					'id':     'form'
					'method': 'post'
					'action': '/users/new'
				}
			}, [
				html.Tag{
					name: 'input'
					attr: {
						'id':    'name'
						'name':  'name'
						'value': ''
					}
				},
				html.Tag{
					name: 'button'
					attr: {
						'type': 'submit'
					}
					text: 'Add'
				},
			]),
		])
		res.send_html(page.html(), 200)
	})
	app.route(.post, '/users/new', fn (req &ctx.Req, mut res ctx.Resp) {
		db2 := &sqlite.DB(req.ctx)
		form_data := req.parse_body() or { map[string]string{} }
		name := form_data['name']
		db2.exec('insert into users (name) values ("$name");')
		res.permanent_redirect('/users')
	})
	server.serve(app, 8080)
}
