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
@DiscriminatorValue("2")
public class Combo extends TravelPackage implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -4783031539248453067L;
	@Column(name = " checkin_time")
	@NotNull(message = "Giờ check in không được để trống")
	private int checkinTime;
	@Column(name = " checkout_time")
	@NotNull(message = "Giờ check out không được để trống")
	private int checkoutTime;
	@Column(columnDefinition = "nvarchar(255)", name = "vehicle_inf")
	@NotNull(message = "Thông tin phương tiện không được để trống")
	private String vehicleInf;
	@Column(columnDefinition = "nvarchar(255)", name = "combo_inf")
	@NotNull(message = "Thông tin combo không được để trống")
	private String comboInf;
	@Enumerated(EnumType.ORDINAL)
	@Column(name = "combo_type")
	private EComboType comboType;

	public Combo() {
		// TODO Auto-generated constructor stub
	}


	public int getCheckinTime() {
		return checkinTime;
	}

	public void setCheckinTime(int checkinTime) {
		this.checkinTime = checkinTime;
	}

	public int getCheckoutTime() {
		return checkoutTime;
	}

	public void setCheckoutTime(int checkoutTime) {
		this.checkoutTime = checkoutTime;
	}

	public String getVehicleInf() {
		return vehicleInf;
	}

	public void setVehicleInf(String vehicleInf) {
		this.vehicleInf = vehicleInf;
	}

	public String getComboInf() {
		return comboInf;
	}

	public void setComboInf(String comboInf) {
		this.comboInf = comboInf;
	}

	public EComboType getComboType() {
		return comboType;
	}

	public void setComboType(EComboType comboType) {
		this.comboType = comboType;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Combo [checkinTime=" + checkinTime + ", checkoutTime=" + checkoutTime + ", vehicleInf=" + vehicleInf
				+ ", comboInf=" + comboInf + ", comboType=" + comboType + "]";
	}

}
