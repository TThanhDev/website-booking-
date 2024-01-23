package com.se.fit.TravelProject.entities;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.Set;

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import com.fasterxml.jackson.annotation.JsonProperty;

import jakarta.persistence.CascadeType;
import jakarta.persistence.CollectionTable;
import jakarta.persistence.Column;
import jakarta.persistence.DiscriminatorColumn;
import jakarta.persistence.DiscriminatorType;
import jakarta.persistence.ElementCollection;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Inheritance;
import jakarta.persistence.InheritanceType;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;

@Entity
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(name = "travelPackage_type", discriminatorType = DiscriminatorType.INTEGER)
@Table(name = "travel_package")
public abstract class TravelPackage implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5600196550063011878L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "travel_package_id")
	private int travelPackageId;
	@Column(columnDefinition = "nvarchar(255)", name = "package_name")
	@Pattern(regexp = "^[a-zA-z0-9].+$",message = "Tên không được để trống")
	private String packageName;
	@Column(columnDefinition = "datetime2(7)", name = "departure_date")
	@NotNull(message = "Ngày đi không được để trống")
	private LocalDate departureDate;
	@Column(columnDefinition = "datetime2(7)", name = "return_date")
	@NotNull(message = "Ngày về không được để trống")
	private LocalDate returnDate;
	@NotNull(message = "Giá không được để trống")
	private double price;
	@Column(columnDefinition = "nvarchar(255)")
	private String description;
	@Column(name = "available_seats")
	@NotNull(message = "Số chỗ không được để trống")
	private int availableSeats;
	@ElementCollection
	@CollectionTable(name = "Images", joinColumns = @JoinColumn(name = "travelPackageId"))
	@Column(name = "image", nullable = false)
	private Set<String> imagesList;
	@Enumerated(EnumType.ORDINAL)
	private EVehicle vehicle;
	@ManyToOne
	@JoinColumn(name = "departure_id",nullable = false)
	@JsonProperty("departure")
	@NotNull(message = "      Nơi khởi hành không được để trống")
	private Departure departure;
	@ManyToOne
	@JoinColumn(name = "destination_id",nullable = false)
	@JsonProperty("destination")
	@NotNull(message = "      Điểm đến không được để trống")
	private Destination destination;

	public TravelPackage() {
		// TODO Auto-generated constructor stub
	}

	public int getTravelPackageId() {
		return travelPackageId;
	}

	public void setTravelPackageId(int travelPackageId) {
		this.travelPackageId = travelPackageId;
	}

	public String getPackageName() {
		return packageName;
	}

	public void setPackageName(String packageName) {
		this.packageName = packageName;
	}

	public LocalDate getDepartureDate() {
		return departureDate;
	}

	public void setDepartureDate(LocalDate departureDate) {
		this.departureDate = departureDate;
	}

	public LocalDate getReturnDate() {
		return returnDate;
	}

	public void setReturnDate(LocalDate returnDate) {
		this.returnDate = returnDate;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getAvailableSeats() {
		return availableSeats;
	}

	public void setAvailableSeats(int availableSeats) {
		this.availableSeats = availableSeats;
	}

	public Set<String> getImagesList() {
		return imagesList;
	}

	public void setImagesList(Set<String> imagesList) {
		this.imagesList = imagesList;
	}

	public EVehicle getVehicle() {
		return vehicle;
	}

	public void setVehicle(EVehicle vehicle) {
		this.vehicle = vehicle;
	}

	public Departure getDeparture() {
		return departure;
	}

	public void setDeparture(Departure departure) {
		this.departure = departure;
	}

	public Destination getDestination() {
		return destination;
	}

	public void setDestination(Destination destination) {
		this.destination = destination;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "TravelPackage [travelPackageId=" + travelPackageId + ", packageName=" + packageName + ", departureDate="
				+ departureDate + ", returnDate=" + returnDate + ", price=" + price + ", description=" + description
				+ ", availableSeats=" + availableSeats + ", imagesList=" + imagesList + ", vehicle=" + vehicle
				+ ", departure=" + departure + ", destination=" + destination + "]";
	}

}
