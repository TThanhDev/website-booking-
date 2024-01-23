package com.se.fit.TravelProject.entities;

import java.io.Serializable;

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;

@Entity
@Table(name = "Account")
public class Account implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 6758543535589076148L;
	@Id
	@Pattern(regexp = "^\\S+$" ,message = "Username không được để trống")
	private String username;
	@Column(nullable = false)
	@NotNull(message = "Password không được để trống")
	@Pattern(regexp = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d]{8,16}$",message = "Mật khẩu phải có chữ hoa, chữ thường, số và độ dài 8 - 16 ký tự")
	private String password;
	@Enumerated(EnumType.ORDINAL)
	private ERole role;
	@ManyToOne
	@JoinColumn(name = "user_id",nullable = false)
	@OnDelete(action = OnDeleteAction.CASCADE)
	private User user;

	public Account() {
		// TODO Auto-generated constructor stub
		this.role = ERole.C;
	}

	public Account(String username, String password, ERole role, User user) {
		super();
		this.username = username;
		this.password = password;
		this.role = role;
		this.user = user;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public ERole getRole() {
		return role;
	}

	public void setRole(ERole role) {
		this.role = role;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Account [username=" + username + ", password=" + password + ", role=" + role + ", user=" + user + "]";
	}

}
