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

    @OneToOne()
    @JoinColumn("post_author")
    Users users;

    //@Column("post_title")
    //string title;
    string post_title;

    string post_excerpt;

    string post_content;

    string post_date;

    string post_status;

    // post & page
    string post_type;
}