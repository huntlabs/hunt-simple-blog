
import hunt;

import app.entity.post;

import entity;

void main()
{
    registerEntity!(Post);

    auto app = Application.getInstance();
    app.run();
}
