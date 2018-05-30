module app.repository.CommentsRepository;

import app.model.Comments;

import entity.repository;

class CommentsRepository : EntityRepository!(Comments, int)
{
}
