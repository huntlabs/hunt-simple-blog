module app.repository.PostRepository;

import app.model.Post;

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
}
