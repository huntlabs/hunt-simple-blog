module app.repository.UsersRepository;

import app.model.User;

import hunt.entity;

class UsersRepository : EntityRepository!(User, int)
{
    private EntityManager _entityManager;

    this(EntityManager manager = null)
    {
        super(manager);
        _entityManager = manager is null ? createEntityManager() : manager;
    }

    User findByUserlogin(string user_login)
    {
        auto query = _entityManager.createQuery!(User)("select u from User u where u.user_login = :name ;");
        query.setParameter("name",user_login);

        return query.getSingleResult();
    }
}
