module app.controller.BlogController;

import hunt;
import kiss.logger;
import app.repository.PostRepository;
import app.model.Post;
import std.json;
import hunt.http.request;
import app.repository.UsersRepository;
import app.model.Users;
import app.repository.CommentsRepository;
import app.model.Comments;
import entity.domain;
import std.datetime;

class BlogController : Controller
{
    mixin MakeController;

    @Action string list()
    {
        auto tests = (new PostRepository).findAll();
        foreach(test; tests){
            logInfo(test);
        }
        view.assign("posts", tests);
        return view.render("index");
    }

    @Action string post()
    {
        int id = request.get!int("id");
        view.assign("post", (new PostRepository).findById(id));
        view.assign("comments", (new CommentsRepository).findPostComments(id));
        return view.render("post");
    }

    @Action string postComment()
    {
        int postId = request.post!int("post_id");
        string commentAuthor = request.post!string("author");
        string commentContent = request.post!string("content");

        Comments comments = new Comments();
        comments.comment_post_id = postId;
        comments.comment_author = commentAuthor;
        comments.comment_content = commentContent;
        comments.comment_date = Clock.currTime.toISOExtString(); //Clock.currStdTime();
        (new CommentsRepository).save(comments);
        return "success";
    }
}
