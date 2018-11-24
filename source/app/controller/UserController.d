module app.controller.UserController;

import std.json;
import std.datetime;
import std.digest.md;

import hunt.regFormamework;
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

import app.form.RegisterForm;
import app.form.LoginForm;

import app.repository.PostRepository;
import app.repository.UsersRepository;
import app.repository.CommentRepository;

import app.helper.UserHelper;

class UserController : Controller
{
    mixin MakeController;

    @Action Response login(LoginForm loginForm)
    {
        if (request.method() == "POST")
        {
            view.assign("LoginForm", loginForm);
            auto result = loginForm.valid();
            if (result.isValid())
            {
                auto find = (new UsersRepository).findByUsername(loginForm.name);
                if (find)
                {

                    auto md5 = new MD5Digest();
                    ubyte[] hash = md5.digest(loginForm.password);
                    if (find.user_pass == toLower(toHexString(hash)))
                    {
                        HttpSession session = request.session(true);
                        // logDebug("write User : ", cast(string) serialize!User(find));

                        session.set("USER", cast(string) serialize!User(find));
                        request.flush();

                        return new RedirectResponse("/index");
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

        return new RedirectResponse("/login");
    }


    @Action Response register(RegisterForm regForm)
    {
        if (request.method() == "POST")
        {
            view.assign("RegisterForm",regForm);
            auto result = regForm.valid();
            if (result.isValid())
            {
                auto find = (new UsersRepository).findByUserlogin(regForm.name);
                if (find is null)
                {
                    auto md5 = new MD5Digest();
                    ubyte[] hash = md5.digest(regForm.password);
                    User user = new User();
                    user.user_login = regForm.name;
                    user.display_name = regForm.name;
                    user.user_nicename = regForm.name;
                    user.user_pass = toLower(toHexString(hash));
                    user.user_email = regForm.email;
                    user.user_registered = Clock.currTime.toISOExtString();
                    (new UsersRepository).save(user);
                    return new RedirectResponse("/login");
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
        auto user = getLoginedUser();
        if (user is null)
            return new RedirectResponse("/login");

        view.assign("posts", (new PostRepository).getPostByUser(user.id));
        view.assign("comments", (new CommentRepository).getCommentsByUser(user.id));
        view.assign("user", user);

        response.setContent(view.render("profile"));
        return response;
    }
}
