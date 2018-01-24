module app.model.post;

import entity;

@Table("hb_posts")
class Post : Entity
{
    @AutoIncrement
    @PrimaryKey
    @Field("ID")
    int id;

    @Field("post_author")
    int uid;

    @Field("post_tile")
    string title;

    @Field("post_content")
    string content;

    @Field("post_status")
    string status;

    // post & page
    @Field("post_type")
    string type;
}
