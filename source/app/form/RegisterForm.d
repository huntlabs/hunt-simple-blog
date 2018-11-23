module app.form.RegisterForm;

import hunt.framework;

class RegisterForm : Form
{
    mixin MakeForm;

    @Email
    string email;

    @Length(1,20)
    string name;

    @Length(6,20)
    string password;
}