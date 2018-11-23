module app.form.LoginForm;

import hunt.framework;

class LoginForm : Form
{
    mixin MakeForm;

    @Length(1,20)
    string name;

    @Length(6,20)
    string password;
}