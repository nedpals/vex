module ctx

import net.urllib

// Req
pub fn (req Req) parse_form_body() map[string]string {
    mut form_data_map := map[string]string

    if 'Content-Type' in req.headers && req.headers['Content-Type'] == 'application/x-www-form-urlencoded' {
        form_arr := req.body.split('&')
        for form_data in form_arr {
            form_data_arr := form_data.split('=')

            form_data_map[form_data_arr[0]] = form_data_arr[1]
        }
    }

    return form_data_map
}

pub fn (mut req Req) parse_cookies() {
    if 'Cookie' in req.headers {
		cookies_arr := req.headers['Cookie'].split('; ')
		
		for cookie_data in cookies_arr {
			ck := cookie_data.split('=')
			ck_val := urllib.query_unescape(ck[1]) or {
				return
			}
			req.cookies[ck[0]] = ck_val
		}
	}    
}

pub fn (mut req Req) parse_queries(parsed_path urllib.URL) {
    if parsed_path.raw_query.len != 0 {
		query_map := parsed_path.query().data
		for q in query_map.keys() {
			req.query[q] = query_map[q].data[0]
		}
	}
}