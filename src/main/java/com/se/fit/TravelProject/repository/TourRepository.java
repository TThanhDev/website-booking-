package com.se.fit.TravelProject.repository;

import java.time.LocalDate;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.se.fit.TravelProject.entities.EInternationalType;
import com.se.fit.TravelProject.entities.Tour;

public interface TourRepository extends JpaRepository<Tour, Integer> {

	@Query("SELECT t From Tour t WHERE t.departure.departureId =:departureId AND t.departureDate >:currentDate AND t.availableSeats > 0")
	public List<Tour> findByDepature(@Param("departureId") int departureId,
			@Param("currentDate") LocalDate currentDate);

	@Query("SELECT t From Tour t WHERE t.destination.destinationId =:destinationId AND t.departureDate >:currentDate AND t.availableSeats > 0")
	public List<Tour> findByDestination(@Param("destinationId") int destinationId,
			@Param("currentDate") LocalDate currentDate);

	@Query("SELECT t From Tour t WHERE t.destination.destinationId =:destinationId AND t.departure.departureId =:departureId AND t.departureDate >:currentDate AND t.availableSeats > 0")
	public List<Tour> findByDesADep(@Param("destinationId") int destinationId, @Param("departureId") int departureId,
			@Param("currentDate") LocalDate currentDate);

	@Query("SELECT t From Tour t WHERE t.departureDate >:currentDate AND t.availableSeats > 0")
	public List<Tour> findToursActive(@Param("currentDate") LocalDate currentDate);

	@Query("SELECT t From Tour t WHERE t.internationalType =:type AND t.departureDate >:currentDate AND t.availableSeats > 0")
	public List<Tour> findToursByInternationalType(@Param("type") EInternationalType type,
			@Param("currentDate") LocalDate currentDate);
}
