module app.repository.PostRepository;

import app.model.Post;
import app.model.User;

import hunt.entity;

class PostRepository : EntityRepository!(Post, int)
{
    private EntityManager _entityManager;

    this(EntityManager manager = null)
    {
        _entityManager = manager is null ? createEntityManager() : manager;
        super(_entityManager);
    }


    Post[] getPostByUser(int user_id)
    {
        auto query = _entityManager.createQuery!(Post)("SELECT p , u FROM Post p JOIN p.user u WHERE u.id = :uid ;");
        query.setParameter("uid",user_id);

        return query.getResultList();
    }
}
