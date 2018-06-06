module app.model.Comments;

import entity;

public import app.model.Post;

@Table("hb_comments")
class Comments : Entity
{
    mixin GetFunction;

    @AutoIncrement
    @PrimaryKey
    int comment_id;

    // int comment_post_id;
    @ManyToOne()
    @JoinColumn("comment_post_id")
    Post post;


    string comment_author;

    string comment_date;

    string comment_content;
}
