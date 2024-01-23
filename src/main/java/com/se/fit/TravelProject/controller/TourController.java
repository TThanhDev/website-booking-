package com.se.fit.TravelProject.controller;

import java.time.LocalDate;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.se.fit.TravelProject.entities.Booking;
import com.se.fit.TravelProject.entities.CartItem;
import com.se.fit.TravelProject.entities.Combo;
import com.se.fit.TravelProject.entities.Departure;
import com.se.fit.TravelProject.entities.Destination;
import com.se.fit.TravelProject.entities.EInternationalType;
import com.se.fit.TravelProject.entities.Tour;
import com.se.fit.TravelProject.entities.TravelPackage;
import com.se.fit.TravelProject.entities.User;
import com.se.fit.TravelProject.service.BookingService;
import com.se.fit.TravelProject.service.DepartureService;
import com.se.fit.TravelProject.service.DestinationService;
import com.se.fit.TravelProject.service.SendMailService;
import com.se.fit.TravelProject.service.TravelPackageService;
import com.se.fit.TravelProject.service.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
@RequestMapping("/Tour")
public class TourController {

	private TravelPackageService packageService;
	private DepartureService departureService;
	private DestinationService destinationService;
	private BookingService bookingService;
	private UserService userService;
	private SendMailService mailService;

	@Autowired
	public TourController(TravelPackageService packageService, DepartureService departureService,
			DestinationService destinationService, BookingService bookingService, UserService userService,
			SendMailService mailService) {
		super();
		this.packageService = packageService;
		this.departureService = departureService;
		this.destinationService = destinationService;
		this.bookingService = bookingService;
		this.userService = userService;
		this.mailService = mailService;
	}

	@GetMapping("/showTour")
	public String showTour(@RequestParam("tourId") int tourId, Model model) {
		Tour tour = packageService.getTourById(tourId);
		model.addAttribute("TOUR", tour);
		return "TourDetail";
	}

	@GetMapping("/resultSearchTour")
	public String resultSearchTour(Model model) {
		List<Departure> departures = departureService.getAllDepartures();
		List<Destination> destinations = destinationService.getAllDestinations();
		List<Tour> tours = packageService.getToursActive(LocalDate.now());
		model.addAttribute("SUM", tours.size());
		model.addAttribute("LISTDEP", departures);
		model.addAttribute("LISTDES", destinations);
		model.addAttribute("TOURS", tours);
		return "ResultSearchTour";
	}

	@GetMapping("/searchByDesADep")
	public String searchByDesADep(@RequestParam("departureId") int departureId,
			@RequestParam("destinationId") int destinationId, Model model) {
		List<Tour> tours = null;
		List<Departure> departures = departureService.getAllDepartures();
		List<Destination> destinations = destinationService.getAllDestinations();
		if (departureId != 0 && destinationId != 0)
			tours = packageService.getToursByDesADep(departureId, destinationId, LocalDate.now());
		else if (departureId != 0 && destinationId == 0)
			tours = packageService.getToursByDep(departureId, LocalDate.now());
		else if (destinationId != 0 && departureId == 0)
			tours = packageService.getToursByDes(destinationId, LocalDate.now());
		else
			tours = packageService.getToursActive(LocalDate.now());
		model.addAttribute("SUM", tours.size());
		model.addAttribute("LISTDEP", departures);
		model.addAttribute("LISTDES", destinations);
		model.addAttribute("TOURS", tours);
		return "ResultSearchTour";
	}

	@GetMapping("/searchByInternationalType")
	public String searchByInternationalType(@RequestParam("type") String type, Model model) {
		List<Tour> tours = null;
		List<Departure> departures = departureService.getAllDepartures();
		List<Destination> destinations = destinationService.getAllDestinations();
		if ("Foreign".equals(type)) {
			tours = packageService.getToursByInternationalType(EInternationalType.F, LocalDate.now());
		} else if ("Domestic".equals(type)) {
			tours = packageService.getToursByInternationalType(EInternationalType.D, LocalDate.now());
		}
		model.addAttribute("TOURS", tours);
		model.addAttribute("SUM", tours.size());
		model.addAttribute("LISTDEP", departures);
		model.addAttribute("LISTDES", destinations);
		return "ResultSearchTour";
	}

	@GetMapping("/booking")
	public String bookingTour(@RequestParam("tourId") int tourId, Model model) {
		Tour tour = packageService.getTourById(tourId);
		model.addAttribute("TRAVELPACKAGE", tour);
		return "Booking";
	}

	@GetMapping("/saveBooking")
	public String booking(@RequestParam("id") int id, @RequestParam("userId") int userId, Model model,
			HttpSession session) {
		User user = userService.getUserById(userId);
		Tour tour = packageService.getTourById(id);
		tour.setAvailableSeats(tour.getAvailableSeats() - 1);
		packageService.saveTour(tour);
		Booking booking = new Booking(user, tour, LocalDate.now());
		bookingService.saveBooking(booking);
		session.setAttribute("acc", user);
		String emailUser = user.getEmail();
		String nameUser = user.getFullName();
		mailService.sendBookingConfirmationEmail(emailUser, nameUser);
		return "PaySuccess";
	}

	@GetMapping("/showListTours")
	public String showListTours(Model model) {
		List<Tour> list = packageService.getAllTours();
		model.addAttribute("LISTTOURS", list);
		return "ListTours";
	}

	@PostMapping("/saveTour")
	public String saveTour(@Valid @ModelAttribute("TOUR") Tour tour, BindingResult result) {
		if (result.hasErrors()) {
			return "TourForm";
		}
		packageService.saveTour(tour);
		return "redirect:/Tour/showListTours";
	}

	@GetMapping("/addTour")
	public String showFormAdd(Model model) {
		Tour tour = new Tour();
		List<Departure> departures = departureService.getAllDepartures();
		List<Destination> destinations = destinationService.getAllDestinations();
		model.addAttribute("TOUR", tour);
		model.addAttribute("LISTDEP", departures);
		model.addAttribute("LISTDES", destinations);
		return "TourForm";
	}

	@GetMapping("/updateTour")
	public String showFormUpdate(@RequestParam("tourId") int tourId, Model model) {
		Tour tour = packageService.getTourById(tourId);
		List<Departure> departures = departureService.getAllDepartures();
		List<Destination> destinations = destinationService.getAllDestinations();
		model.addAttribute("TOUR", tour);
		model.addAttribute("LISTDEP", departures);
		model.addAttribute("LISTDES", destinations);
		return "TourForm";
	}

	@GetMapping("/searchTour")
	public String searchTour(@RequestParam("tourId") int tourId, Model model) {
		try {
			Tour tour = packageService.getTourById(tourId);
			List<Tour> tours = new ArrayList<Tour>();
			tours.add(tour);
			model.addAttribute("LISTTOURS", tours);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "ListTours";
	}

	@GetMapping("/deleteTour")
	public String deleteTour(@RequestParam("tourId") int tourId, Model model) {
		try {
			packageService.deleteTour(tourId);
		} catch (Exception e) {
			// TODO: handle exception
			model.addAttribute("ERROR", "Không thể xóa dữ liệu này");
		}
		List<Tour> list = packageService.getAllTours();
		model.addAttribute("LISTTOURS", list);
		return "ListTours";
	}

	@GetMapping("/addTourToCart")
	public String addTourToCart(@RequestParam("tourId") int tourId, HttpSession session, Model model,
			RedirectAttributes redirectAttributes) {
		Tour tour = packageService.getTourById(tourId);
		if (tour != null) {
			// Kiểm tra xem combo có chỗ trống và số lượng không vượt quá chỗ trống
			if (tour.getAvailableSeats() > 0) {
				List<CartItem> userCart = (List<CartItem>) session.getAttribute("userCart");
				if (userCart == null) {
					userCart = new ArrayList<>();
					session.setAttribute("userCart", userCart);
				}

				boolean comboExists = false;
				for (CartItem item : userCart) {
					if (item.getID() == tourId) {
						// Nếu combo đã tồn tại trong giỏ, kiểm tra số lượng không vượt quá chỗ trống
						if (item.getQuantity() < tour.getAvailableSeats()) {
							item.increaseQuantity();
						} else {
							// Xử lý trường hợp vượt quá chỗ trống, có thể hiển thị thông báo hoặc thực hiện
							// hành động khác
							redirectAttributes.addFlashAttribute("message", "Số lượng đã vượt quá chỗ trống.");
							return "redirect:/Cart/showCart";
						}
						comboExists = true;
						break;
					}
				}

				// Nếu combo chưa tồn tại trong giỏ, kiểm tra số lượng không vượt quá chỗ trống
				if (!comboExists) {
					CartItem cartItem = new CartItem(tour, 1);
					userCart.add(cartItem);
				}

				session.setAttribute("userCart", userCart);
			} else {
				redirectAttributes.addFlashAttribute("message", "Tour không còn chỗ trống.");
				return "redirect:/Cart/showCart";
			}
		} else {
			redirectAttributes.addFlashAttribute("message", "Tour không tồn tại.");
			return "redirect:/Cart/showCart";
		}
		return "redirect:/Cart/showCart";
	}

}
