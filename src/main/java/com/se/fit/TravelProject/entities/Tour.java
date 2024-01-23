package com.se.fit.TravelProject.entities;

import java.io.Serializable;

import jakarta.persistence.Column;
import jakarta.persistence.DiscriminatorValue;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;

@Entity
@DiscriminatorValue("1")
public class Tour extends TravelPackage implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4994622033259334777L;
	@Column(name = "number_days")
	@NotNull(message = "Số ngày không được để trống")
	private int numberDays;
	@Column(columnDefinition = "nvarchar(255)", name = "tourist_attraction")
	private String touristAttraction;
	@Column(columnDefinition = "nvarchar(255)")
	private String cuisine;
	@Column(columnDefinition = "nvarchar(255)")
	private String hotel;
	@Column(columnDefinition = "nvarchar(255)", name = "ideal_time")
	private String idealTime;
	@Column(columnDefinition = "nvarchar(255)")
	private String object;
	@Enumerated(EnumType.ORDINAL)
	@Column(name = "international_type")
	@NotNull(message = "Loại tour không được để trống")
	private EInternationalType internationalType;

	public Tour() {
		// TODO Auto-generated constructor stub
	}


	public int getNumberDays() {
		return numberDays;
	}

	public void setNumberDays(int numberDays) {
		this.numberDays = numberDays;
	}

	public String getTouristAttraction() {
		return touristAttraction;
	}

	public void setTouristAttraction(String touristAttraction) {
		this.touristAttraction = touristAttraction;
	}

	public String getCuisine() {
		return cuisine;
	}

	public void setCuisine(String cuisine) {
		this.cuisine = cuisine;
	}

	public String getHotel() {
		return hotel;
	}

	public void setHotel(String hotel) {
		this.hotel = hotel;
	}

	public String getIdealTime() {
		return idealTime;
	}

	public void setIdealTime(String idealTime) {
		this.idealTime = idealTime;
	}

	public String getObject() {
		return object;
	}

	public void setObject(String object) {
		this.object = object;
	}

	public EInternationalType getInternationalType() {
		return internationalType;
	}

	public void setInternationalType(EInternationalType internationalType) {
		this.internationalType = internationalType;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Tour [numberDays=" + numberDays + ", touristAttraction=" + touristAttraction + ", cuisine=" + cuisine
				+ ", hotel=" + hotel + ", idealTime=" + idealTime + ", object=" + object + ", internationalType="
				+ internationalType + "]";
	}

}
