module app.repository.UsersRepository;

import app.model.User;

import hunt.entity;

class UsersRepository : EntityRepository!(User, int)
{
    private EntityManager _entityManager;

    this(EntityManager manager = null)
    {
        _entityManager = manager is null ? createEntityManager() : manager;
        super(_entityManager);
    }

    User findByUsername(string username)
    {
        auto query = _entityManager.createQuery!(User)("SELECT u FROM User u WHERE u.user_login = :name");
        query.setParameter("name", username);

        return query.getSingleResult();
    }
}
