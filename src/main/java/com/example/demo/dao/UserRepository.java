package com.example.demo.dao;

import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.model.User;

@Repository
public interface UserRepository extends CrudRepository<User, Integer>{
	public Optional<User> findByUsername(String name);
	public User findUserById(int id);
	public User findByEmail(String email);
}
