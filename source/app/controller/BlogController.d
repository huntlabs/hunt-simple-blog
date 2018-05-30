module app.controller.BlogController;

import hunt;
import kiss.logger;
import app.repository.PostRepository;
import app.model.Post;
import std.json;
class BlogController : Controller
{
    mixin MakeController;

    @Action
    string list()
    {
        auto repository = new PostRepository;
        Post[] posts = repository.findAll();
        JSONValue s;
        s.array = [];
        foreach(post;posts){
            JSONValue t;
            t["post_title"] = post.post_title;
            t["post_date"] = post.post_date;
            t["post_content"] = post.post_content;
            s.array ~= t;
        }
        return view.render("index", s);
    }
}
