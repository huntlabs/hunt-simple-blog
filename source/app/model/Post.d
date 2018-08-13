module app.model.Post;

import entity;
import app.model.Users;
@Table("hb_posts")
class Post
{
    mixin MakeEntity;

    @AutoIncrement
    @PrimaryKey
    int id;

    @ManyToOne()
    @JoinColumn("post_author")
    Users users;

    //@Column("post_title")
    //string title;
    string post_title;

    string post_excerpt;

    string post_content;

    string post_date;

    string post_status;

    //int post_author;

    // post & page
    string post_type;
}