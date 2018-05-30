module app.repository.UsersRepository;

import app.model.Users;

import entity.repository;

class UsersRepository : EntityRepository!(Users, int)
{
}
