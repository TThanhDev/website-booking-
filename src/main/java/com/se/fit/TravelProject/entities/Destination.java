package com.se.fit.TravelProject.entities;

import java.util.Objects;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "Destination")
public class Destination {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "destination_id")
	private int destinationId;
	@Column(columnDefinition = "nvarchar(255)")
	private String location;
	@Enumerated(EnumType.ORDINAL)
	private EInternationalType type;

	public Destination() {
		// TODO Auto-generated constructor stub
	}

	public Destination(int destinationId, String location, EInternationalType type) {
		super();
		this.destinationId = destinationId;
		this.location = location;
		this.type = type;
	}

	public int getDestinationId() {
		return destinationId;
	}

	public void setDestinationId(int destinationId) {
		this.destinationId = destinationId;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public EInternationalType getType() {
		return type;
	}

	public void setType(EInternationalType type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "Destination [destinationId=" + destinationId + ", location=" + location + ", type=" + type + "]";
	}

	@Override
	public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null || getClass() != o.getClass())
			return false;

		Destination that = (Destination) o;

		return Objects.equals(destinationId, that.destinationId);
	}

	@Override
	public int hashCode() {
		return Objects.hash(destinationId);
	}
}
