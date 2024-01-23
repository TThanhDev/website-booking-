package com.se.fit.TravelProject.entities;

import java.io.Serializable;

public enum EInternationalType implements Serializable{
	D("Domestic"),
	F("Foreign");
	private final String type;
	private EInternationalType() {
		this.type="";
		// TODO Auto-generated constructor stub
	}
	private EInternationalType(String type) {
		this.type = type;
	}
	public String getType() {
		return type;
	}
	

}
