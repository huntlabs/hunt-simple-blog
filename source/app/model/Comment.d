module app.model.Comment;

import hunt.entity;

@Table("hb_comments")
class Comment : Model
{
    mixin MakeModel;

    @AutoIncrement
    @PrimaryKey
    int comment_id;

    int user_id;

    int comment_post_id;

    string comment_author;

    string comment_date;

    string comment_content;
}
