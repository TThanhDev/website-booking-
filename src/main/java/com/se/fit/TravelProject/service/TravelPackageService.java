package com.se.fit.TravelProject.service;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.se.fit.TravelProject.entities.Combo;
import com.se.fit.TravelProject.entities.EComboType;
import com.se.fit.TravelProject.entities.EInternationalType;
import com.se.fit.TravelProject.entities.Tour;
import com.se.fit.TravelProject.repository.ComboRepository;
import com.se.fit.TravelProject.repository.TourRepository;

@Service
public class TravelPackageService {
	private final TourRepository tourRepository;
	private final ComboRepository comboRepository;

	@Autowired
	public TravelPackageService(TourRepository tourRepository, ComboRepository comboRepository) {
		super();
		this.tourRepository = tourRepository;
		this.comboRepository = comboRepository;
	}

	public List<Tour> getAllTours() {
		return tourRepository.findAll();
	}

	public List<Combo> getAllCombos() {
		return comboRepository.findAll();
	}

	public Tour getTourById(int id) {
		Optional<Tour> rs = tourRepository.findById(id);
		Tour tour = null;
		if (rs.isPresent()) {
			tour = rs.get();
		} else {
			throw new RuntimeException("Not find");
		}
		return tour;
	}

	public Combo getComboById(int id) {
		Optional<Combo> rs = comboRepository.findById(id);
		Combo combo = null;
		if (rs.isPresent()) {
			combo = rs.get();
		} else {
			throw new RuntimeException("Not find");
		}
		return combo;
	}

	public void saveTour(Tour tour) {
		tourRepository.save(tour);
	}

	public void saveCombo(Combo combo) {
		comboRepository.save(combo);
	}

	public void deleteTour(int id) {
		tourRepository.deleteById(id);
	}

	public void deleteCombo(int id) {
		comboRepository.deleteById(id);
	}

	public List<Tour> getToursActive(LocalDate currentDate) {
		return tourRepository.findToursActive(currentDate);
	}

	//
	public List<Tour> getToursActiveHome(LocalDate currentDate) {
		List<Tour> tourHome =  tourRepository.findToursActive(currentDate);
		if(tourHome.size()>6)
			return  tourRepository.findToursActive(currentDate).subList(0, 6);
		return  tourRepository.findToursActive(currentDate);
	}

	public List<Tour> getToursByDesADep(int departureId, int destinationId, LocalDate currentDate) {
		return tourRepository.findByDesADep(destinationId, departureId, currentDate);
	}

	public List<Tour> getToursByDep(int departureId, LocalDate currentDate) {
		return tourRepository.findByDepature(departureId, currentDate);
	}

	public List<Tour> getToursByDes(int destinationId, LocalDate currentDate) {
		return tourRepository.findByDestination(destinationId, currentDate);
	}

	public List<Tour> getToursByInternationalType(EInternationalType type, LocalDate currentDate) {
		return tourRepository.findToursByInternationalType(type, currentDate);
	}

	public List<Combo> getCombos(LocalDate currDate) {
		return comboRepository.findComboActive(currDate);
	}

	//
	public List<Combo> getCombosHome(LocalDate currDate){
		List<Combo> cbHome = comboRepository.findComboActive(currDate);
		if(cbHome.size()>4) {
			return comboRepository.findComboActive(currDate).subList(0, 4);
		}
		return comboRepository.findComboActive(currDate);
	}

	public List<Combo> getCombosByDep(int departureId, LocalDate currDate) {
		return comboRepository.findByDepature(departureId, currDate);
	}

	public List<Combo> getCombosByDes(int destinationId, LocalDate currDate) {
		return comboRepository.findByDestination(destinationId, currDate);
	}

	public List<Combo> getCombosByDesADep(int departureId, int destinationId, LocalDate currDate) {
		return comboRepository.findByDesADep(destinationId, departureId, currDate);
	}

	public List<Combo> getComboByComboType(EComboType type,LocalDate currentDate){
		return comboRepository.findComboByComboType(type, currentDate);
	}
}
