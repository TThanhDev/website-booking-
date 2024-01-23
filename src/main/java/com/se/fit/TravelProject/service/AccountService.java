package com.se.fit.TravelProject.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Service;

import com.se.fit.TravelProject.entities.Account;
import com.se.fit.TravelProject.entities.User;
import com.se.fit.TravelProject.repository.AccountRepository;
import com.se.fit.TravelProject.repository.UserRepository;

@Service
public class AccountService {
	private final AccountRepository accountRepository;
	private final UserRepository userRepository;

	@Autowired
	public AccountService(AccountRepository accountRepository, UserRepository userRepository) {
		super();
		this.accountRepository = accountRepository;
		this.userRepository = userRepository;
	}

	public List<Account> getAllAccounts() {
		return accountRepository.findAll();
	}

	public Account getAccountById(String username) {
		Optional<Account> rs = accountRepository.findById(username);
		Account account = null;
		if (rs.isPresent()) {
			account = rs.get();
		}
		return account;
	}

	public void save(Account account) {
		if (!accountRepository.existsByUsername(account.getUsername())) {
			accountRepository.save(account);
		} else {
			// Xử lý khi tài khoản đã tồn tại
			throw new DuplicateKeyException("Tài khoản đã tồn tại");
		}
	}

	public void saveAccount(Account account) {
		accountRepository.save(account);
	}

	public void deleteAccount(String username) {
		accountRepository.deleteById(username);
	}

	public void saveUser(User user, Account account) {
		userRepository.save(user);
		accountRepository.save(account);
	}
}
