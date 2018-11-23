module app.model.User;

import hunt.entity;

import app.model.Post;

@Table("hb_users")
class User : Model
{
    mixin MakeModel;

    @AutoIncrement
    @PrimaryKey
    int id;

    string display_name;

    string user_nicename;

    string user_email;

    string user_url;

    string user_login;

    string user_pass;

    string user_registered;

    @OneToMany("user")
    Post[] posts;
}
