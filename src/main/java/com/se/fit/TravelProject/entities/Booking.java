package com.se.fit.TravelProject.entities;

import java.io.Serializable;
import java.time.LocalDate;

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "Booking")
public class Booking implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7775585632931296740L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "booking_id")
	private int bookingId;
	@ManyToOne
	@JoinColumn(name = "user_id",nullable = false)
	private User user;
	@ManyToOne
	@JoinColumn(name = "travel_package_id",nullable = false)
	private TravelPackage travelPackage;
	@Column(columnDefinition = "datetime2(7)",name="creation_date")
	private LocalDate creationDate;
	public Booking() {
		// TODO Auto-generated constructor stub
	}

	public Booking(int bookingId, User user, TravelPackage travelPackage, LocalDate creationDate) {
		super();
		this.bookingId = bookingId;
		this.user = user;
		this.travelPackage = travelPackage;
		this.creationDate = creationDate;
	}

	public Booking(User user, TravelPackage travelPackage, LocalDate creationDate) {
		super();
		this.user = user;
		this.travelPackage = travelPackage;
		this.creationDate = creationDate;
	}


	public int getBookingId() {
		return bookingId;
	}

	public void setBookingId(int bookingId) {
		this.bookingId = bookingId;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public TravelPackage getTravelPackage() {
		return travelPackage;
	}

	public void setTravelPackage(TravelPackage travelPackage) {
		this.travelPackage = travelPackage;
	}

	public LocalDate getCreationDate() {
		return creationDate;
	}

	public void setCreationDate(LocalDate creationDate) {
		this.creationDate = creationDate;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Booking [bookingId=" + bookingId + ", user=" + user + ", travelPackage=" + travelPackage
				+ ", creationDate=" + creationDate + "]";
	}

}
