module app.repository.CommentsRepository;

import app.model.Comments;

import entity.repository;
import entity;
class CommentsRepository : EntityRepository!(Comments, int)
{
    private EntityManager _entityManager;

    this(EntityManager manager = null) {
        super(manager);
        _entityManager = manager is null ? createEntityManager() : manager;
    }

    struct Objects
    {
        CriteriaBuilder builder;
        CriteriaQuery!Comments criteriaQuery;
        Root!Comments root;
    }

    Objects newObjects()
    {
        Objects objects;

        objects.builder = _entityManager.getCriteriaBuilder();
        objects.criteriaQuery = objects.builder.createQuery!Comments;
        objects.root = objects.criteriaQuery.from();

        return objects;
    }

    Comments[] findPostComments(int id)
    {
        Comments[] comments;
        auto objects = this.newObjects();
        auto p1 = objects.builder.equal(objects.root.Comments.comment_post_id, id);
        auto typedQuery = _entityManager.createQuery(objects.criteriaQuery.select(objects.root).where( p1 ));
        comments = typedQuery.getResultList();
        return comments;
    }
}
