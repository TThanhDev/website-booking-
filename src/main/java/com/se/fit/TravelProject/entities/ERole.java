package com.se.fit.TravelProject.entities;

import java.io.Serializable;

public enum ERole implements Serializable{
	
	C("Customer"),
	A("Admin");
	private final String role;
	private ERole() {
		this.role="";
		// TODO Auto-generated constructor stub
	}
	private ERole(String role) {
		this.role = role;
	}
	public String getVaiTro() {
		return role;
	}
	
}