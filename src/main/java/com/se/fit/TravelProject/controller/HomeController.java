package com.se.fit.TravelProject.controller;

import java.util.List;
import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.se.fit.TravelProject.entities.Combo;
import com.se.fit.TravelProject.entities.Tour;
import com.se.fit.TravelProject.entities.User;
import com.se.fit.TravelProject.service.DepartureService;
import com.se.fit.TravelProject.service.DestinationService;
import com.se.fit.TravelProject.service.TravelPackageService;

@Controller
public class HomeController {
	private DepartureService departureService;
	private DestinationService destinationService;
	private TravelPackageService travelPackageService;
	
	
	
	@Autowired
	public HomeController(DepartureService departureService, DestinationService destinationService,
			TravelPackageService travelPackageService) {
		super();
		this.departureService = departureService;
		this.destinationService = destinationService;
		this.travelPackageService = travelPackageService;
	}




	@GetMapping("/")
	public String getTour(Model model) {
		List<Tour> listTour = travelPackageService.getToursActiveHome(LocalDate.now());
		List<Combo> listCombo = travelPackageService.getCombosHome(LocalDate.now());
		model.addAttribute("tours", listTour);
		model.addAttribute("combos", listCombo);
		System.out.println(listTour.get(1).getImagesList().iterator().toString());
		return "Home";
	}
	
	@GetMapping("/login")
	public String showLogin(Model model) {
		model.addAttribute("ERROR", "");
		return "dangnhap";
	}
	
}
