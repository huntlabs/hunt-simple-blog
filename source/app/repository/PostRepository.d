module app.repository.PostRepository;

import app.model.Post;

import entity.repository;

class PostRepository : EntityRepository!(Post, int)
{
}
