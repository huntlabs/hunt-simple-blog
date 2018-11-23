module app.repository.PostRepository;

import app.model.Post;
import app.model.User;

import hunt.entity;

class PostRepository : EntityRepository!(Post, int)
{
    private EntityManager _entityManager;

    this(EntityManager manager = null)
    {
        super(manager);
        _entityManager = manager is null ? createEntityManager() : manager;
    }


    Post[] getPostByUser(int user_id)
    {
        auto query = _entityManager.createQuery!(Post)("select p , u from Post p join p.user u where u.id = :uid ;");
        query.setParameter("uid",user_id);

        return query.getResultList();
    }
}
