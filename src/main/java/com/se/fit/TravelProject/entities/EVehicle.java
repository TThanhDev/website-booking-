package com.se.fit.TravelProject.entities;

import java.io.Serializable;

public enum EVehicle implements Serializable {

	C("Car"), A("Airplane");

	private final String vehicle;

	private EVehicle() {
		this.vehicle = "";
	}

	private EVehicle(String vehicle) {
		this.vehicle = vehicle;
	}

	public String getVehicle() {
		return vehicle;
	}

}
