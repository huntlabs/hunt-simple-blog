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

import app.form.FormRegister;
import app.form.FormLogin;

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
        Response response = new Response(this.request);
        cookie = new Cookie("Content-Language", "zh-cn");
        view.setLocale("zh-cn");

        response.setHeader(HttpHeader.CONTENT_TYPE, "text/html;charset=utf-8").withCookie(cookie);

        auto tests = (new PostRepository).findAll();
        foreach (test; tests)
        {
            logInfo(test);
        }
        view.assign("user", UserController.checkUser(request));
        view.assign("posts", tests);
        return response.setContent(view.render("index"));

    }

    @Action Response en()
    {
        Cookie cookie;
        Response response = new Response(this.request);
        cookie = new Cookie("Content-Language", "en-us");
        view.setLocale("en-us");

        response.setHeader(HttpHeader.CONTENT_TYPE, "text/html;charset=utf-8").withCookie(cookie);

        auto tests = (new PostRepository).findAll();
        foreach (test; tests)
        {
            logInfo(test);
        }
        view.assign("user", UserController.checkUser(request));
        view.assign("posts", tests);
        return response.setContent(view.render("index"));
    }

}
