package com.se.fit.TravelProject.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.se.fit.TravelProject.entities.Departure;
import com.se.fit.TravelProject.repository.DepartureRepository;

@Service
public class DepartureService {
	private final DepartureRepository departureRepository;

	@Autowired
	public DepartureService(DepartureRepository departureRepository) {
		super();
		this.departureRepository = departureRepository;
	}
	
	public List<Departure> getAllDepartures(){
		return departureRepository.findAll();
	}
	
	public Departure getDepartureById(int id) {
		Optional<Departure> rs = departureRepository.findById(id);
		Departure departure = null;
		if(rs.isPresent()) {
			departure = rs.get();
		}
		else {
			throw new RuntimeException("Not find");
		}
		return departure;
	}
	
	public void saveDeparture(Departure departure) {
		departureRepository.save(departure);
	}
	
	@Transactional
	public void deleteDeparture(int id) {
		departureRepository.deleteById(id);
	}
}
