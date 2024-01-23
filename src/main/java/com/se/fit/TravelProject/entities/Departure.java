package com.se.fit.TravelProject.entities;

import java.io.Serializable;
import java.util.Objects;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "Departure")
public class Departure implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 4769855374077338041L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "departure_id")
	private int departureId;
	@Column(columnDefinition = "nvarchar(255)")
	private String location;

	public Departure() {
		// TODO Auto-generated constructor stub
	}

	public Departure(int departureId, String location) {
		super();
		this.departureId = departureId;
		this.location = location;
	}

	public int getDepartureId() {
		return departureId;
	}

	public void setDepartureId(int departureId) {
		this.departureId = departureId;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Departure{" + "departureId=" + departureId+ ", location='" + location + '\'' + '}';
	}

	@Override
	public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null || getClass() != o.getClass())
			return false;
		Departure departure = (Departure) o;
		return departureId == departure.departureId && Objects.equals(location, departure.location);
	}

	@Override
	public int hashCode() {
		return Objects.hash(departureId, location);
	}

}
