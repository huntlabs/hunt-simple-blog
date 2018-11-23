module app.controller.BlogController;

import std.json;
import std.datetime;
import std.digest.md;

import hunt.framework;
import hunt.entity;
import hunt.logging;
import hunt.util.serialize;
import hunt.http.codec.http.model.Cookie;
import hunt.http.codec.http.model.HttpMethod;
import hunt.http.codec.http.model.HttpHeader;
import hunt.util.MimeType;

import app.model.User;
import app.model.Comment;
import app.model.Post;

import app.form.CommentForm;

import app.repository.PostRepository;
import app.repository.UsersRepository;
import app.repository.CommentRepository;

import app.controller.UserController;

class BlogController : Controller
{
    mixin MakeController;

    @Action string list()
    {
        auto posts = (new PostRepository).findAll();
        view.assign("user", UserController.checkUser(request));
        view.assign("posts", posts);
        return view.render("index");
    }

    @Action string post()
    {
        int id = request.get!int("id");
        view.assign("post", (new PostRepository).findById(id));
        view.assign("user", UserController.checkUser(request));
        view.assign("comments", (new CommentRepository).findPostComments(id));
        return view.render("post");
    }

    @Action Response comment(CommentForm cmt)
    {
        auto result = cmt.valid();
        if (result.isValid())
        {
            auto user = UserController.checkUser(request);

            Comment comment = new Comment();
            comment.comment_post_id = cmt.postId;
            comment.comment_content = cmt.content;
            comment.comment_date = Clock.currTime.toISOExtString();
            if (user !is null)
            {
                comment.user_id = user.id;
                comment.comment_author = user.display_name;
            }
            else
            {
                comment.comment_author = "匿名";
            }
            (new CommentRepository).save(comment);
            return new RedirectResponse(this.request, "/post?id=" ~ cmt.postId.to!string);
        }
        else
        {
            return new RedirectResponse(this.request, "/post?id=" ~ cmt.postId.to!string);
        }
    }

}
