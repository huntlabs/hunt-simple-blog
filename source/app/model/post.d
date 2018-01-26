module app.model.post;

import app.entity.post;

import entity;
import hunt;

class PostModel
{
    Post[] getPosts()
    {
        CriteriaBuilder criteria = entityManager.createCriteriaBuilder!Post;
        criteria.createCriteriaQuery();
        return entityManager.getResultList!Post(criteria.toString);
    }
}
