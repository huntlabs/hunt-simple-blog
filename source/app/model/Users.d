module app.model.Users;

import entity;

@Table("hb_users")
class Users : Entity
{
    @AutoIncrement
    @PrimaryKey
    int id;

    string display_name;

    string user_email;

    string user_url;
}
