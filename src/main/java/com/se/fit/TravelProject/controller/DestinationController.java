package com.se.fit.TravelProject.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.se.fit.TravelProject.entities.Departure;
import com.se.fit.TravelProject.entities.Destination;
import com.se.fit.TravelProject.service.DestinationService;

import jakarta.validation.Valid;

@Controller
@RequestMapping("/Destination")
public class DestinationController {
	private DestinationService destinationService;

	@Autowired
	public DestinationController(DestinationService destinationService) {
		super();
		this.destinationService = destinationService;
	}
	
	@PostMapping("/saveDestination")
	public String saveDepartute(@Valid @ModelAttribute("destination") Destination destination,BindingResult result,Model model) {
		
		if(result.hasErrors()) {
			return "DestinationList";
		}
		
		destinationService.saveDestination(destination);
		
		return "redirect:/Destination/showDestination";
	}
	
	@GetMapping("/showDestination")
	public String showDestination(Model model) {
		List<Destination> destinations = destinationService.getAllDestinations();
		model.addAttribute("destination", destinations);
		
		return "DestinationList";
	}
	@GetMapping("/searchDestination")
	public String searchDestination(@RequestParam("destinationId") int destinationId, Model model) {
		
		try {
			List<Destination> destinations = new ArrayList<Destination>();
			destinations.add(destinationService.getDestinationById(destinationId));
			model.addAttribute("destination", destinations);
		}catch (Exception e) {
			// TODO: handle exception
		}
		
		return "DestinationList";

	}
	@GetMapping("/addDestination")
	public String  addDestination(Model theModel) {
		Destination destination= new Destination();
		theModel.addAttribute("destination", destination);
		return "AddDestinationForm";
	
	}
	@GetMapping("/updateDestination")
	public String updateDestination(@RequestParam("destinationId") int id, Model theModel) {
		Destination destination = destinationService.getDestinationById(id);
		
		theModel.addAttribute("destination", destination);
		return "AddDestinationForm";
	}
	
	@GetMapping("/deleteDestination")
	public String deleteDeparture(@RequestParam("destinationId") int id, Model model) {
		try {
			destinationService.deleteDestination(id);
		} catch (Exception e) {
			// TODO: handle exception
			model.addAttribute("ERROR", "Không thể xóa dữ liệu này");
		}

		List<Destination> destinations = destinationService.getAllDestinations();
		model.addAttribute("destination", destinations);
		
		return "DestinationList";
	}

	
}
