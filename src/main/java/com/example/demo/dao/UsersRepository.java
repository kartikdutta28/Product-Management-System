package com.example.demo.dao;

import java.util.Optional;

import com.example.demo.model.Users;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.model.Users;

@Repository
public interface UsersRepository extends CrudRepository<Users, Integer>{
	public Optional<Users> findByUsername(String name);
	public Users findUserById(int id);
	public Users findByEmail(String email);
}
