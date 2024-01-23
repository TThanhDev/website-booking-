package com.se.fit.TravelProject.entities;

import java.io.Serializable;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;

@Entity
@Table(name = "Userr")
public class User implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -8280303498779999034L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="user_id")
	private int userId;
	@Column(nullable = false, columnDefinition = "nvarchar(100)",name = "full_name")
	@Pattern(regexp = "^[a-zA-z0-9].+$" ,message = "Tên không được để trống")
	private String fullName;
	@Column(nullable = false, length = 50,name = "email")
	@NotNull(message = "Email không được để trống")
	@Pattern(regexp = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$",message = "Email không đúng")
	private String email;
	@Column(nullable = false, length = 10,name = "phone")
	@NotNull(message = "Số điện thoại không được để trống")
	@Pattern(regexp = "^[0-9]{10}$",message = "Số điện thoại gồm 10 số")
	private String phone;
	@Column(nullable = false, length = 200,name = "address")
	private String address;
	
	public User() {
		// TODO Auto-generated constructor stub
		
	}

	public User(int userId, String fullName, String email, String phone, String address) {
		super();
		this.userId = userId;
		this.fullName = fullName;
		this.email = email;
		this.phone = phone;
		this.address = address;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", fullName=" + fullName + ", email=" + email + ", phone=" + phone
				+ ", address=" + address + "]";
	}
	
}