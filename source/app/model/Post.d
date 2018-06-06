module app.model.Post;

import entity;

public import app.model.Users;

public import app.model.Comments;

@Table("hb_posts")
class Post : Entity
{
    mixin GetFunction;

    @AutoIncrement
    @PrimaryKey
    int id;

    // int post_author;
    @ManyToOne()
    @JoinColumn("post_author")
    Users user;

    //@Column("post_title")
    //string title;
    string post_title;

    string post_excerpt;

    string post_content;

    string post_date;

    string post_status;

    // post & page
    string post_type;

    @OneToMany("post")
    Comments[] comments;

}