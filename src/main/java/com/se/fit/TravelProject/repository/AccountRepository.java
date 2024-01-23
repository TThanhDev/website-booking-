package com.se.fit.TravelProject.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.se.fit.TravelProject.entities.Account;

public interface AccountRepository extends JpaRepository<Account, String> {
	boolean existsByUsername(String username);
	
	
}
