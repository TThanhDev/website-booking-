package com.se.fit.TravelProject.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.se.fit.TravelProject.entities.Destination;
import com.se.fit.TravelProject.repository.DestinationRepository;

@Service
public class DestinationService {
	private final DestinationRepository destinationRepository;

	@Autowired
	public DestinationService(DestinationRepository destinationRepository) {
		super();
		this.destinationRepository = destinationRepository;
	}

	public List<Destination> getAllDestinations() {
		return destinationRepository.findAll();
	}

	public Destination getDestinationById(int id) {
		Optional<Destination> rs = destinationRepository.findById(id);
		Destination destination = null;
		if (rs.isPresent()) {
			destination = rs.get();
		} else {
			throw new RuntimeException("Not find");
		}
		return destination;
	}

	public void saveDestination(Destination destination) {
		destinationRepository.save(destination);
	}
	
	@Transactional
	public void deleteDestination(int id) {
		destinationRepository.deleteById(id);
	}
}
