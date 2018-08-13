module app.repository.UsersRepository;

import app.model.Users;

import entity;

import entity.repository;

class UsersRepository : EntityRepository!(Users, int)
{
    private EntityManager _entityManager;

    this(EntityManager manager = null) {
        super(manager);
        _entityManager = manager is null ? createEntityManager() : manager;
    }

    struct Objects
    {
        CriteriaBuilder builder;
        CriteriaQuery!Users criteriaQuery;
        Root!Users root;
     }

    Objects newObjects()
    {
        Objects objects;

 	objects.builder = _entityManager.getCriteriaBuilder();

	objects.criteriaQuery = objects.builder.createQuery!Users;

	objects.root = objects.criteriaQuery.from();

	return objects;
     }

    Users findByUserlogin(string user_login)
    {
	 auto objects = this.newObjects();

	 auto p1 = objects.builder.equal(objects.root.Users.user_login, user_login);

	 auto typedQuery = _entityManager.createQuery(objects.criteriaQuery.select(objects.root).where( p1 ));
	
       	 Users[] users = typedQuery.getResultList();
         if(users.length > 0)
             return users[0];
         return null;	
    }
}
