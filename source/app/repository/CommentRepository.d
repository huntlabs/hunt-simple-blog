module app.repository.CommentRepository;

import app.model.Comment;

import hunt.entity;

class CommentRepository : EntityRepository!(Comment, int)
{
    private EntityManager _entityManager;

    this(EntityManager manager = null)
    {
        _entityManager = manager is null ? createEntityManager() : manager;
        super(_entityManager);
    }

    Comment[] findPostComments(int id)
    {
        auto query = _entityManager.createQuery!(Comment)("SELECT c FROM Comment c WHERE c.comment_post_id = :postId ;");
        query.setParameter("postId",id);

        return query.getResultList();
    }

    Comment[] getCommentsByUser(int user_id)
    {
        auto query = _entityManager.createQuery!(Comment)("SELECT c FROM Comment c WHERE c.user_id = :uid ;");
        query.setParameter("uid",user_id);

        return query.getResultList();
    }
}
