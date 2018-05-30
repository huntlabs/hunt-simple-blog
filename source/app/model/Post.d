module app.model.Post;

import entity;

@Table("hb_posts")
class Post : Entity
{
    @AutoIncrement
    @PrimaryKey
    int id;

    int post_author;

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