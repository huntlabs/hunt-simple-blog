module app.model.Users;

import entity;

public import app.model.Post;

@Table("hb_users")
class Users : Entity
{
    mixin GetFunction;

    @AutoIncrement
    @PrimaryKey
    int id;

    string display_name;

    string user_email;

    string user_url;

    @OneToMany("user")
    Post[] posts;
}
