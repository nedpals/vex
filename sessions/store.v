module sessions

import ctx

// based on gorilla/sessions go package
interface Storer {
    get(req &ctx.Request, name string) ?&Session
    new(req &ctx.Request, name string) ?&Session
    save(req &ctx.Request, res ctx.Response, ses &Session) ?int
}

// fn new_cookie_store()