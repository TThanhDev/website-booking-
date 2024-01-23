package com.se.fit.TravelProject.entities;

import java.io.Serializable;

public enum EComboType implements Serializable {

	CH("Car_Hotel"), AH("Airplane_Hotel");

	private final String type;

	private EComboType() {
		this.type = "";
		// TODO Auto-generated constructor stub
	}

	private EComboType(String type) {
		this.type = type;
	}

	public String getType() {
		return type;
	}

}
