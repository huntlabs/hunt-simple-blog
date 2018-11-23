module app.form.FormComment;

import hunt.framework;

class FormComment : Form
{
    mixin MakeForm;

    @Min(0)
    int postId;

    @Length(1,200)
    string content;
}