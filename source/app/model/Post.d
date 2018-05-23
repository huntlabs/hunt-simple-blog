module app.model.Post;

import entity;

@Table("hb_posts")
class Post : Entity
{
    @AutoIncrement
    @PrimaryKey
    int id;

    int post_author;

    string post_tile;

    string post_content;

    string post_status;

    // post & page
    string post_type;
}
