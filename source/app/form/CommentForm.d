module app.form.CommentForm;

import hunt.framework;

class CommentForm : Form
{
    mixin MakeForm;

    @Min(0)
    int postId;

    @Length(1,200)
    string content;
}