module app.controller.UserController;

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

import app.form.RegisterForm;
import app.form.LoginForm;

import app.repository.PostRepository;
import app.repository.UsersRepository;
import app.repository.CommentRepository;

class UserController : Controller
{
    mixin MakeController;

    @Action Response login(LoginForm fl)
    {
        if (request.method() == "POST")
        {
            view.assign("LoginForm",fl);
            auto result = fl.valid();
            if (result.isValid())
            {
                auto find = (new UsersRepository).findByUserlogin(fl.name);
                if (find)
                {

                    auto md5 = new MD5Digest();
                    ubyte[] hash = md5.digest(fl.password);
                    if (find.user_pass == toLower(toHexString(hash)))
                    {
                        HttpSession session = request.session(true);
                        // logDebug("write User : ", cast(string) serialize!User(find));

                        session.set("USER", cast(string) serialize!User(find));
                        request.flush();
                        return new RedirectResponse(this.request, "/index");
                    }
                    else
                    {
                        view.assign("errorMessages", ["Password Error"]);
                    }
                }
                else
                    view.assign("errorMessages", ["The user does not exist"]);
            }
            else
                view.assign("errorMessages", result.messages());
        }

        response.setContent(view.render("login"));
        return response;
    }

    @Action Response logout()
    {
        auto session = request.session();
        if (session !is null)
        {
            if (request.session.has("USER"))
            {
                request.session.remove("USER");
            }
            request.flush();
        }
        return new RedirectResponse(this.request, "/login");
    }


    @Action Response register(RegisterForm fr)
    {
        if (request.method() == "POST")
        {
            view.assign("RegisterForm",fr);
            auto result = fr.valid();
            if (result.isValid())
            {
                auto find = (new UsersRepository).findByUserlogin(fr.name);
                if (find is null)
                {
                    auto md5 = new MD5Digest();
                    ubyte[] hash = md5.digest(fr.password);
                    User user = new User();
                    user.user_login = fr.name;
                    user.display_name = fr.name;
                    user.user_nicename = fr.name;
                    user.user_pass = toLower(toHexString(hash));
                    user.user_email = fr.email;
                    user.user_registered = Clock.currTime.toISOExtString();
                    (new UsersRepository).save(user);
                    return new RedirectResponse(this.request, "/login");
                }
                else
                {
                    view.assign("errorMessages", ["The user is registered"]);
                }
            }
            else
                view.assign("errorMessages", result.messages());
        }

        response.setContent(view.render("register"));
        return response;

    }

    @Action Response profile()
    {
        auto user = checkUser(request);
        if (user is null)
            return new RedirectResponse(this.request, "/login");

        view.assign("posts", (new PostRepository).getPostByUser(user.id));
        view.assign("comments", (new CommentRepository).getCommentsByUser(user.id));
        view.assign("user", user);

        response.setContent(view.render("profile"));
        return response;
    }

    static public User checkUser(Request request)
    {
        auto session = request.session();
        if (session is null)
        {
            return null;
        }
        auto str = session.get("USER");
        if (str is null)
            return null;
        return unserialize!User(cast(byte[]) str);
    }
}
