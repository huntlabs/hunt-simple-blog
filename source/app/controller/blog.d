module app.controller.blog;

import hunt;

import app.repository.PostRepository;
import app.model.Post;

class BlogController : Controller
{
    mixin MakeController;

    @Action
    Response list()
    {
        auto repository = new PostRepository;
        Post[] posts = repository.findAll();
        foreach(post; posts)
        {
            tracef("post id:  %d", post.id);
        }

	return "Hello.";
    }
}
