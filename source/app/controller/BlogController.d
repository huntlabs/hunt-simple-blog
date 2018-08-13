module app.controller.BlogController;

import hunt;
import hunt.http.RedirectResponse;
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
import std.digest.md;

class BlogController : Controller
{
    mixin MakeController;

    @Action string list()
    {
        auto tests = (new PostRepository).findAll();
        foreach(test; tests){
            logInfo(test);
        }
	    view.assign("user",checkuser());
        view.assign("posts", tests);
        return view.render("index");
    }

    @Action string post()
    {
        int id = request.get!int("id");
        view.assign("post", (new PostRepository).findById(id));
        view.assign("user",checkuser());
        view.assign("comments", (new CommentsRepository).findPostComments(id));
        return view.render("post");
    }

    @Action string postComment()
    {
        int postId = request.post!int("post_id");
        int commentAuthorId = request.post!int("author_id");
        string commentAuthor = request.post!string("author");
        string commentContent = request.post!string("content");

        Comments comments = new Comments();
        comments.comment_post_id = postId;
        comments.user_id = commentAuthorId;
        comments.comment_author = commentAuthor;
        comments.comment_content = commentContent;
        comments.comment_date = Clock.currTime.toISOExtString(); //Clock.currStdTime();
        (new CommentsRepository).save(comments);
        return "success";
    }

    @Action string loginpage()
    {
    	return view.render("login");
    }

    @Action string registerpage()
    {
        return view.render("register");
    }

    @Action Response login()
    {
	 if(request.method() == HttpMethod.Post){
         
	     string name = request.post("name","");
	     string password = request.post("password","");
	     auto find = (new UsersRepository).findByUserlogin(name);
	     if(find){
             auto md5 = new MD5Digest();
             ubyte[] hash = md5.digest(password);
            if(find.user_pass == toLower(toHexString(hash))){
                request.session.set("USER",cast(string) serialize!Users(find));
            return new RedirectResponse("/index");
            }else{
                return new RedirectResponse("/loginpage");
            }
         }
	 }
     return new RedirectResponse("/loginpage");
    }

    @Action Response logout()
    {
        if(request.session.has("USER")){
            request.session.remove("USER");
        }
        return new RedirectResponse("/index");
    }

    @Action Users checkuser()
    {
    	auto str = request.session.get("USER");
        if (str == null)
	    return null;
	    return unserialize!Users(cast(byte[]) str);
    }

    @Action Response register()
    {
        if(request.method() == HttpMethod.Post){
            string name = request.post("name","");
            string password = request.post("password","");
            string email = request.post("email","");
            auto find = (new UsersRepository).findByUserlogin(name);
            if(find){
                return new RedirectResponse("/registerpage");
            }
            else{
                auto md5 = new MD5Digest();
                ubyte[] hash = md5.digest(password);
                Users user = new Users();
                user.user_login = name;
                user.display_name = name;
                user.user_nicename = name;
                user.user_pass = toLower(toHexString(hash));
                user.user_email = email;
                user.user_registered = Clock.currTime.toISOExtString(); //Clock.currStdTime();
                (new UsersRepository).save(user);
                return new RedirectResponse("/loginpage");
            }
        }
        return new RedirectResponse("/registerpage");
    }

    @Action string profile()
    {
        auto user = checkuser();
        view.assign("posts", (new PostRepository).getPostByUser(user.id));
        view.assign("comments", (new CommentsRepository).getCommentsByUser(user.id));
        view.assign("user",user);
        return view.render("profile");
    }
}
