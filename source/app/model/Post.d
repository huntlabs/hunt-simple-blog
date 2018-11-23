module app.model.Post;

import hunt.entity;
import app.model.User;

@Table("hb_posts")
class Post : Model
{
    mixin MakeModel;

    @AutoIncrement
    @PrimaryKey
    int id;

    string post_title;

    string post_excerpt;

    string post_content;

    string post_date;

    string post_status;


    string post_type;

    @ManyToOne()
    @JoinColumn("post_author","id")
    User user;

}