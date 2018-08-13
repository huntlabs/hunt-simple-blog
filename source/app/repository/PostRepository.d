module app.repository.PostRepository;

import app.model.Post;
import app.model.Users;

import entity;
import entity.domain;
import entity.repository;

class PostRepository : EntityRepository!(Post, int)
{
    private EntityManager _entityManager;

    this(EntityManager manager = null) {
        super(manager);
        _entityManager = manager is null ? createEntityManager() : manager;
    }

    struct Objects
    {
        CriteriaBuilder builder;
        CriteriaQuery!Post criteriaQuery;
        Root!Post root;
    }

    Objects newObjects()
    {
        Objects objects;

        objects.builder = _entityManager.getCriteriaBuilder();

        objects.criteriaQuery = objects.builder.createQuery!Post;

        objects.root = objects.criteriaQuery.from();

        return objects;
    }

    Post[] getPostByUser(int user_id)
    {

          auto objects = this.newObjects();

          Users user = new Users();
          user.id = user_id;

        auto p1 = objects.builder.equal(objects.root.Post.users, user);

        auto typedQuery = _entityManager.createQuery(objects.criteriaQuery.select(objects.root).where( p1 ));

        Post[] posts = typedQuery.getResultList();
        if(posts.length > 0)
            return posts;
        return null;
    }
}
