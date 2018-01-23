
import hunt;

import app.entity.post;

void main()
{
    registerEntity!(Post);

    auto app = Application.getInstance();
    app.run();
}
