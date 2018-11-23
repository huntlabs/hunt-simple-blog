module app.form.FormRegister;

import hunt.framework;

class FormRegister : Form
{
    mixin MakeForm;

    @Email
    string email;

    @Length(1,20)
    string name;

    @Length(6,20)
    string password;
}