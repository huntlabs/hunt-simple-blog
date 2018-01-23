module app.repository.post;

import hunt.model;
import app.entity.post;

class PostModel
{
    Post[] getPosts()
    {
        CriteriaBuilder criteria = entityManager.createCriteriaBuilder!Post;
        criteria.where(criteria.eq(criteria.UserRoom.room_id, roomId));
        return entityManager.getResultList!Post(criteria.toString);
    }
}
