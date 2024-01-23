package com.se.fit.TravelProject.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.se.fit.TravelProject.entities.Account;
import com.se.fit.TravelProject.entities.User;
import com.se.fit.TravelProject.repository.AccountRepository;
import com.se.fit.TravelProject.repository.UserRepository;

@Service
public class UserService {
	private final UserRepository userRepository;
	private final AccountRepository accountRepository;

	@Autowired
	public UserService(UserRepository userRepository, AccountRepository accountRepository) {
		super();
		this.userRepository = userRepository;
		this.accountRepository = accountRepository;
	}
	
	public List<User> getAllUsers(){
		return userRepository.findAll();
	}
	
	public User getUserById(int id) {
		Optional<User> rs = userRepository.findById(id);
		User user = null;
		if(rs.isPresent()) {
			user = rs.get();
		}
		else {
			throw new RuntimeException("Not find");
		}
		return user;
	}
	
	@Transactional
	public void saveUser(User user,Account account) {
		if (!accountRepository.existsByUsername(account.getUsername())) {
			userRepository.save(user);
            accountRepository.save(account);
        } else {
            // Xử lý khi tài khoản đã tồn tại
            throw new DuplicateKeyException("Tài khoản đã tồn tại");
        }

	}
	
	public void saveUserUpdate(User user) {
		userRepository.save(user);
	}
	
	public void deleteUser(int id) {
		userRepository.deleteById(id);
	}
}
