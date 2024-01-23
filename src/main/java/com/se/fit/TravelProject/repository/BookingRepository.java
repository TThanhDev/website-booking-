package com.se.fit.TravelProject.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.se.fit.TravelProject.entities.Booking;

public interface BookingRepository extends JpaRepository<Booking, Integer>{

}
