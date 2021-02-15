module ctx

// import strings
import time
import net.urllib

enum SameSite {
	@none
	strict
	lax
}

pub struct Cookie {
pub:
	name      string
	value     string
	expires   time.Time
	max_age   int
	domain    string
	path      string
	http_only bool
	secure    bool
	same_site SameSite = .lax
}

fn (c Cookie) header_str() string {
	mut val := c.name + '=' + c.value
	if c.expires.year != 0 {
		val += '; Expires=' + c.expires.utc_string()
	}
	if c.max_age > 0 {
		val += '; Max-Age=' + c.max_age.str()
	}
	if c.domain.len > 0 {
		val += '; Domain=' + c.domain
	}
	if c.path.len > 0 {
		val += '; Path=' + c.path
	}
	if c.http_only {
		val += '; HttpOnly'
	}
	if c.secure || c.same_site == .@none {
		val += '; Secure'
	}
	if c.same_site != .lax {
		val += '; SameSite=' + c.same_site.str().capitalize()
	}
	return val
}

// parse_cookies parses the Cookie header content and returns the
// content. Returns an error if the header is not present.
pub fn (req &Req) parse_cookies() ?map[string]Cookie {
	if 'Cookie' !in req.headers {
		return error('Cookies not found.')
	}
	mut cookies := map[string]Cookie{}
	for cookie in req.headers['Cookie'] {
		cookies_arr := cookie.split('; ')
		for cookie_data in cookies_arr {
			ck := cookie_data.split('=')
			ck_val := urllib.query_unescape(ck[1]) ?
			cookies[ck[0]] = Cookie{
				name: ck[0]
				value: ck_val
			}
		}
	}
	return cookies
}

pub fn (mut resp Resp) set_cookies(cookies map[string]Cookie) {
	resp.headers['Set-Cookie'] = []string{}

	for _, cooval in cookies {
		resp.headers['Set-Cookie'] << cooval.header_str()
	}
}
