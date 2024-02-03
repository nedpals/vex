module main

import nedpals.vex.router
import nedpals.vex.server
import nedpals.vex.html
import nedpals.vex.ctx
import db.sqlite
import context

fn layout(title string, body []html.Tag) html.Tag {
	template := html.html([
		html.block(
			name: 'head'
			children: [
				html.meta({
					'http-equiv': 'Content-Type'
					'content':    'text/html;charset=UTF-8'
				}),
				html.meta({
					'name':    'referrer'
					'content': 'origin-when-cross-origin'
				}),
				html.tag(name: 'title', text: '${title} | Vex SQLite Test'),
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
			]
		),
		html.block(
			name: 'body'
			children: body
		),
	])
	return template
}

const db_ctx_key = 'db'

fn get_db(req &ctx.Req) ?&sqlite.DB {
	raw_db := req.ctx.value(db_ctx_key)?
	if raw_db is sqlite.DB {
		return raw_db
	}
	return none
}

fn main() {
	mut app := router.new()
	db := sqlite.connect(':memory:')!
	db.exec('drop table if exists users;')!
	db.exec('create table users (id integer primary key, name text default "");')!
	app_ctx := context.with_value(context.todo(), db_ctx_key, db)
	app.inject_context(app_ctx)
	app.route(.get, '/', fn (req &ctx.Req, mut res ctx.Resp) {
		page := layout('', [
			html.tag(name: 'h1', text: 'It works!'),
			html.block(
				name: 'p'
				children: [
					html.tag(name: 'text', text: 'For online documentation please refer to '),
					html.tag(
						name: 'a'
						attr: {
							'href': 'https://github.com/nedpals/vex'
						}
						text: 'vex'
					),
					html.br(),
					html.block(
						name: 'em'
						children: [
							html.tag(name: 'text', text: "It's a web framework based on "),
							html.tag(
								name: 'a'
								attr: {
									'href': 'https://vlang.io'
								}
								text: 'V.'
							),
						]
					),
				]
			),
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
		db2 := get_db(req) or {
			res.send_status(500)
			return
		}
		users_from_db := db2.exec('select * from users;') or { panic(err) }
		mut users := []html.Tag{}
		for row in users_from_db {
			tag := html.Tag{
				name: 'li'
				text: row.vals[1]
			}
			users << tag
		}
		page := layout('Users', [
			html.tag(name: 'h1', text: 'Users'),
			html.block(
				name: 'ul'
				children: users
			),
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
		page := layout('Add new User', [
			html.tag(
				name: 'a'
				attr: {
					'href': '/users'
				}
				text: 'All users'
			),
			html.tag(name: 'h1', text: 'Add user'),
			html.block(
				name: 'form'
				attr: {
					'id':     'form'
					'method': 'post'
					'action': '/users/new'
				}
				children: [
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
				]
			),
		])
		res.send_html(page.html(), 200)
	})
	app.route(.post, '/users/new', fn (req &ctx.Req, mut res ctx.Resp) {
		db2 := get_db(req) or {
			eprintln(res)
			res.send_status(500)
			return
		}
		form_data := req.parse_form() or {
			map[string]string{}
		}
		name := form_data['name']
		db2.exec('insert into users (name) values ("${name}");') or { panic(err) }
		res.permanent_redirect('/users')
	})
	server.serve(app, 6789)
}
