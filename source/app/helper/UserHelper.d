module app.helper.UserHelper;

import app.model.User;

import hunt.framework;

import hunt.util.serialize;

User getLoginedUser()
{
    auto session = request().session();
    if (session is null)
    {
        return null;
    }

    auto str = session.get("USER");
    if (str is null)
        return null;

    return unserialize!User(cast(byte[]) str);
}
