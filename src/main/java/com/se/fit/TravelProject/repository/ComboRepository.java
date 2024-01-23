package com.se.fit.TravelProject.repository;

import java.time.LocalDate;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.se.fit.TravelProject.entities.Combo;
import com.se.fit.TravelProject.entities.EComboType;

public interface ComboRepository extends JpaRepository<Combo, Integer>{
	@Query("SELECT c From Combo c WHERE c.departure.departureId =:departureId AND c.departureDate >:currentDate AND c.availableSeats > 0")
	public List<Combo> findByDepature(@Param("departureId") int departureId,
			@Param("currentDate") LocalDate currentDate);

	@Query("SELECT c From Combo c WHERE c.destination.destinationId =:destinationId AND c.departureDate >:currentDate AND c.availableSeats > 0")
	public List<Combo> findByDestination(@Param("destinationId") int destinationId,
			@Param("currentDate") LocalDate currentDate);

	@Query("SELECT c From Combo c WHERE c.destination.destinationId =:destinationId AND c.departure.departureId =:departureId AND c.departureDate >:currentDate AND c.availableSeats > 0")
	public List<Combo> findByDesADep(@Param("destinationId") int destinationId, @Param("departureId") int departureId,
			@Param("currentDate") LocalDate currentDate);

	@Query("SELECT c From Combo c WHERE c.departureDate >:currentDate AND c.availableSeats > 0")
	public List<Combo> findComboActive(@Param("currentDate") LocalDate currentDate);
	
	@Query("SELECT c From Combo c WhERE c.comboType =:type  AND c.departureDate >:currentDate AND c.availableSeats > 0")
	public List<Combo> findComboByComboType(@Param("type") EComboType type,
			@Param("currentDate") LocalDate currentDate);

}
