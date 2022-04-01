import nedpals.vex.ctx
import nedpals.vex.html
import nedpals.vex.server
import nedpals.vex.router

fn main() {
	// handles the login page
	login := fn (req &ctx.Req, mut res ctx.Resp) {
		mut session := res.start_session(req)
		
		// if there is already a session set, then redirect to the profile page
		if !session.is_empty() {
			res.redirect('/profile')
			return
		}
		
		/*
		 *  The following html.Tag is the same as follows:
		 *
		 *  <form action="/login" method="post">
		 *      <input type="email" name="email" placeholder="Email"><br><br>
		 *      <input type="password" name="password" placeholder="Password"><br><br>
		 *      <button type="submit">Login</button>
		 *  </form>
		 */
		doc := html.Tag{
			name: 'form'
			attr: {
				'action': '/login'
				'method': 'post'
			}
			children: [
				html.Tag{
					name: 'input'
					attr: {
						'name': 'email'
						'type': 'email'
						'placeholder': 'Email'
					}
				},
				html.br(),
				html.br(),
				html.Tag{
					name: 'input'
					attr: {
						'name': 'password'
						'type': 'password'
						'placeholder': 'Password'
					}
				},
				html.br(),
				html.br(),
				html.Tag{
					name: 'button'
					text: 'Login'
					attr: {
						'type': 'submit'
					}
				}
			]
		}
		
		res.send_html(doc.html(), 200)
	}
	
	// on login post
	login_post := fn (req &ctx.Req, mut res ctx.Resp) {
		post_data := req.parse_form() or {
			eprintln('Failed to parse form data.')
			return
		}
		
		mut session := res.start_session(req)
		session.set('email', post_data['email'])
		session.set('password', post_data['password'])
		
		res.redirect('/profile')
		return  // VEX redirects to /login if the return isn't here :/
	}
	
	profile := fn (req &ctx.Req, mut res ctx.Resp) {
		mut session := res.start_session(req)
		if session.is_empty() {
			res.redirect('/login')
			return
		}
		
		/*
		 *  The following html.Tag is the same as follows:
		 *
		 *  <body>
		 *      <h2>PROFILE</h2>
		 *      <b>Email: </b>
		 *      <span>email_from_session</span><br>
		 *      <b>Password: </b>
		 *      <span>password_from_sesion</span><br>
		 *      <form action="/logout" method="post">
		 *          <button type="submit">Logout</button>
		 *      </form>
		 *  </body>
		 */
		doc := html.Tag{
			name: 'body'
			children: [
				html.Tag{
					name: 'h2'
					text: 'PROFILE'
				},
				html.Tag{
					name: 'b'
					text: 'Email: '
				},
				html.Tag{
					name: 'span'
					text: session.get('email')
				},
				html.br(),
				html.Tag{
					name: 'b'
					text: 'Password: '
				},
				html.Tag{
					name: 'span'
					text: session.get('password')
				},
				html.br(),
				html.Tag{
					name: 'form'
					attr: {
						'method': 'post',
						'action': '/logout'
					}
					children: [
						html.Tag{
							name: 'button'
							text: 'Logout'
							attr: {
								'type': 'submit'
							}
						}
					]
				}
			]
		}
		res.send_html(doc.html(), 200)
	}
	
	logout_post := fn (req &ctx.Req, mut res ctx.Resp) {
		mut session := res.start_session(req)
		session.delete()
		res.redirect('/login')
		return
	}
	
	mut router := router.new()
	router.route(.get, '/profile', profile)
	router.route(.get, '/login', login)
	router.route(.post, '/login', login_post)
	router.route(.post, '/logout', logout_post)
	server.serve(router, 8080)
}