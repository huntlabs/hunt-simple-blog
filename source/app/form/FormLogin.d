module app.form.FormLogin;

import hunt.framework;

class FormLogin : Form
{
    mixin MakeForm;

    @Length(1,20)
    string name;

    @Length(6,20)
    string password;
}