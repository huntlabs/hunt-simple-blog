module app.controller.blog;

import hunt;

import app.entity.post;
import app.model.post;

class IndexController : Controller
{
    mixin MakeController;

    @Action
    void list()
    {
        auto postModel = new PostModel;
        Post[] posts = postModel.getPosts();
        foreach(post; posts)
        {
            tracef("post id:  %d", post.id);
        }

        response.html("Hello.");
    }
}
