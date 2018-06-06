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
import entity.DefaultEntityManagerFactory;


class BlogController : Controller
{
    mixin MakeController;

    @Action
    string list()
    {
        view.assign("posts", (new PostRepository).findAll());
        return view.render("index");
    }

    @Action
    string post()
    {
        int id = request.get!int("id");
        auto em = defaultEntityManagerFactory().createEntityManager();
        auto post = em.find!(Post)(id);
        foreach(ref value; post.getComments()) {
            value.post = null;
        }
        view.assign("post", post);
        view.assign("comments", post.getComments());
        em.close();
        return view.render("post"); 
    }

    @Action
    string postComment()
    {
        int postId = request.post!int("post_id");
        string commentAuthor = request.post!string("author");
        string commentContent = request.post!string("content");


        auto em = defaultEntityManagerFactory().createEntityManager();
        em.getTransaction().begin();
        auto post = em.find!(Post)(postId);
        if (post is null)
            return "failed";
        Comments createData = new Comments();
        createData.post = post;
        createData.comment_author = commentAuthor;
        createData.comment_content = commentContent;
        createData.comment_date = Clock.currTime.toISOExtString(); //Clock.currStdTime();
        em.persist(createData);
        em.getTransaction().commit();
        em.close();

        return "success";
    }
}
