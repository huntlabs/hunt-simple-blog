module app.model.Users;

import entity;

public import app.model.Post;

@Table("hb_users")
class Users
{
    mixin MakeEntity;

    @AutoIncrement
    @PrimaryKey
    int id;
    @OneToMany("users")
    //@JoinColumn("id")
    Post[] posts;
    string display_name;

    string user_nicename;

    string user_email;

    string user_url;

    string user_login;

    string user_pass;

    string user_registered;

}
