package com.se.fit.TravelProject.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.se.fit.TravelProject.entities.User;

public interface UserRepository extends JpaRepository<User, Integer>{

}
