module app.controller.BlogController;

import std.datetime;

import hunt.framework;
import hunt.entity;
import hunt.logging;

import hunt.http.codec.http.model.Cookie;
import hunt.http.codec.http.model.HttpMethod;
import hunt.http.codec.http.model.HttpHeader;

import hunt.util.MimeType;
import hunt.util.serialize;

import app.model.User;
import app.model.Comment;
import app.model.Post;

import app.form.CommentForm;

import app.repository.PostRepository;
import app.repository.UsersRepository;
import app.repository.CommentRepository;

import app.helper.UserHelper;

class BlogController : Controller
{
    mixin MakeController;

    @Action string list()
    {
        auto posts = (new PostRepository).findAll();
        view.assign("user", getLoginedUser());
        view.assign("posts", posts);

        return view.render("index");
    }

    @Action string post(int id)
    {
        view.assign("post", (new PostRepository).findById(id));
        view.assign("user", getLoginedUser());
        view.assign("comments", (new CommentRepository).findPostComments(id));

        return view.render("post");
    }

    @Action Response comment(CommentForm commentForm)
    {
        auto result = commentForm.valid();
        if (result.isValid())
        {
            auto user = getLoginedUser();

            Comment comment = new Comment();
            comment.comment_post_id = commentForm.postId;
            comment.comment_content = commentForm.content;
            comment.comment_date = Clock.currTime.toISOExtString();
            if (user !is null)
            {
                comment.user_id = user.id;
                comment.comment_author = user.display_name;
            }
            else
            {
                comment.user_id = 0;
                comment.comment_author = "Guest";
            }

            (new CommentRepository).save(comment);

            return new RedirectResponse("/post?id=" ~ commentForm.postId.to!string);
        }
        else
        {
            return new RedirectResponse("/post?id=" ~ commentForm.postId.to!string);
        }
    }

}
