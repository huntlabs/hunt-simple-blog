module app.model.Comments;

import entity;

@Table("hb_comments")
class Comments : Entity
{
    @AutoIncrement
    @PrimaryKey
    int comment_id;

    int comment_post_id;

    string comment_author;

    string comment_date;

    string comment_content;
}
