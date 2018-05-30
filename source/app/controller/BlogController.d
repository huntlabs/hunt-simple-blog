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

    @Action
    string list()
    {
        auto repository = new PostRepository;
        auto repositoryUsers = new UsersRepository;
        Post[] posts = repository.findAll();
        JSONValue s;
        JSONValue res;
        s.array = [];
        foreach(post;posts){
            JSONValue t;
            t["id"] = post.id;
            Users user = repositoryUsers.findById(post.post_author);
            if(user !is null){
                t["post_author"] = user.display_name;
            }else{
                t["post_author"] = "匿名";
            }
            t["post_title"] = post.post_title;
            t["post_excerpt"] = post.post_excerpt;
            t["post_date"] = post.post_date;
            t["post_content"] = post.post_content;
            s.array ~= t;
        }
        res["posts"] = s;
        return view.render("index", res);
    }

    @Action
    string post()
    {
        int id = request.get!int("id");
        auto repository = new PostRepository;
        auto repositoryUsers = new UsersRepository;
        auto repositoryComments = new CommentsRepository;
        Post post = repository.findById(id);
        JSONValue resData;
        JSONValue t;

        t["id"] = post.id;
        Users user = repositoryUsers.findById(post.post_author);
        if(user !is null){
            t["post_author"] = user.display_name;
        }else{
            t["post_author"] = "匿名";
        }
        t["post_title"] = post.post_title;
        t["post_excerpt"] = post.post_excerpt;
        t["post_date"] = post.post_date;
        t["post_content"] = post.post_content;
        resData["post"] = t;
        class MySpecification: Specification!Comments
		{
			Predicate toPredicate(Root!Comments root, CriteriaQuery!Comments criteriaQuery ,
				CriteriaBuilder criteriaBuilder)
			{
				Predicate _name = criteriaBuilder.equal(root.Comments.comment_post_id, id);
				return criteriaBuilder.and(_name);
			}
		}
        Comments[] comments= repositoryComments.findAll(new MySpecification(), new Sort("comment_date", OrderBy.DESC));

        JSONValue commentsArr;
        commentsArr.array = [];
        foreach(comment;comments){
            JSONValue tmpObj;
            tmpObj["comment_id"] = comment.comment_id;
            tmpObj["comment_post_id"] = comment.comment_post_id;
            tmpObj["comment_author"] = comment.comment_author;
            tmpObj["comment_date"] = comment.comment_date;
            tmpObj["comment_content"] = comment.comment_content;
            commentsArr.array ~= tmpObj;
        }
        resData["comments"] = commentsArr;
        return view.render("post", resData);
    }

    @Action
    string postComment()
    {
        int postId = request.post!int("post_id");
        string commentAuthor = request.post!string("author");
        string commentContent = request.post!string("content");
        auto repositoryComments = new CommentsRepository;
        Comments createData = new Comments();
        createData.comment_post_id = postId;
        createData.comment_author = commentAuthor;
        createData.comment_content = commentContent;
        createData.comment_date = Clock.currTime.toISOExtString(); //Clock.currStdTime();
        repositoryComments.save(createData);
        return "success";
    }
}
