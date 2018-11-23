module app.controller.LangController;

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

import app.controller.UserController;

class LangController : Controller
{
    mixin MakeController;

    @Action Response zh()
    {
        Cookie cookie;
        cookie = new Cookie("Content-Language", "zh-cn");
        view.setLocale("zh-cn");

        auto posts = (new PostRepository).findAll();
       
        view.assign("user", UserController.checkUser(request));
        view.assign("posts", posts);
        return response.setContent(view.render("index")).withCookie(cookie);

    }

    @Action Response en()
    {
        Cookie cookie;
        cookie = new Cookie("Content-Language", "en-us");
        view.setLocale("en-us");


        auto posts = (new PostRepository).findAll();

        view.assign("user", UserController.checkUser(request));
        view.assign("posts", posts);
        return response.setContent(view.render("index")).withCookie(cookie);
    }

}
