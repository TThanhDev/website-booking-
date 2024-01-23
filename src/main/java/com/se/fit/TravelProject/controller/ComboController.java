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
import com.se.fit.TravelProject.entities.EComboType;
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
@RequestMapping("/Combo")
public class ComboController {
	private TravelPackageService travelPackageService;
	private DepartureService departureService;
	private DestinationService destinationService;
	private BookingService bookingService;
	private UserService userService;
	private SendMailService mailService;

	@Autowired
	public ComboController(TravelPackageService travelPackageService, DepartureService departureService,
			DestinationService destinationService, BookingService bookingService, UserService userService,
			SendMailService mailService) {
		super();
		this.travelPackageService = travelPackageService;
		this.departureService = departureService;
		this.destinationService = destinationService;
		this.bookingService = bookingService;
		this.userService = userService;
		this.mailService = mailService;
	}

	@GetMapping("/comBoTours")
	public String comBoTours(Model model) {
		List<Combo> listCombos = travelPackageService.getAllCombos();
		List<Destination> listDestinations = destinationService.getAllDestinations();
		List<Departure> listDepartures = departureService.getAllDepartures();
		model.addAttribute("listCombos", listCombos);
		model.addAttribute("listDepartures", listDepartures);
		model.addAttribute("listDestinations", listDestinations);
		model.addAttribute("sum", listCombos.size());
		return "ResultSearchCombo";
	}

	@GetMapping("/searchDesAndDep")
	public String searchDesAndDep(@RequestParam("departureId") int departureId,
			@RequestParam("destinationId") int destinationId, Model model) {
		List<Combo> listCombos = null;
		List<Departure> listDepartures = departureService.getAllDepartures();
		List<Destination> listDestinations = destinationService.getAllDestinations();
		if (departureId != 0 && destinationId != 0)
			listCombos = travelPackageService.getCombosByDesADep(departureId, destinationId, LocalDate.now());
		else if (departureId != 0 && destinationId == 0)
			listCombos = travelPackageService.getCombosByDep(departureId, LocalDate.now());
		else if (destinationId != 0 && departureId == 0)
			listCombos = travelPackageService.getCombosByDes(destinationId, LocalDate.now());
		else
			listCombos = travelPackageService.getCombos(LocalDate.now());
		model.addAttribute("listCombos", listCombos);
		model.addAttribute("listDestinations", listDestinations);
		model.addAttribute("listDepartures", listDepartures);
		model.addAttribute("sum", listCombos.size());
		System.out.println(listCombos);
		return "ResultSearchCombo";
	}

	@GetMapping("/searchByComboType")
	public String searchByComboType(@RequestParam("type") String type, Model model) {
		List<Combo> list = null;
		List<Departure> departures = departureService.getAllDepartures();
		List<Destination> destinations = destinationService.getAllDestinations();
		if ("CH".equals(type)) {
			list = travelPackageService.getComboByComboType(EComboType.CH, LocalDate.now());
		} else if ("AH".equals(type)) {
			list = travelPackageService.getComboByComboType(EComboType.AH, LocalDate.now());
		}
		model.addAttribute("listCombos", list);
		model.addAttribute("listDestinations", destinations);
		model.addAttribute("listDepartures", departures);
		model.addAttribute("sum", list.size());
		return "ResultSearchCombo";
	}

	@GetMapping("/showComboDetail")
	public String showComboDetail(@RequestParam("comboId") int comboId, Model model) {
		Combo combo = travelPackageService.getComboById(comboId);
		model.addAttribute("combo", combo);
		return "ComboDetail";
	}

	@GetMapping("/booking")
	public String bookingCombo(@RequestParam("comboId") int comboId, Model model) {
		Combo combo = travelPackageService.getComboById(comboId);
		model.addAttribute("TRAVELPACKAGE", combo);
		return "Booking";
	}

	@GetMapping("/saveBooking")
	public String booking(@RequestParam("id") int id, @RequestParam("userId") int userId, Model model,
			HttpSession session) {
		User user = userService.getUserById(userId);
		Combo combo = travelPackageService.getComboById(id);
		combo.setAvailableSeats(combo.getAvailableSeats() - 1);
		travelPackageService.saveCombo(combo);
		Booking booking = new Booking(user, combo, LocalDate.now());
		bookingService.saveBooking(booking);
		session.setAttribute("acc", user);
		String emailUser = user.getEmail();
		String nameUser = user.getFullName();
		mailService.sendBookingConfirmationEmail(emailUser, nameUser);
		return "PaySuccess";
	}

	@GetMapping("/showListCombos")
	public String showListCombos(Model model) {
		List<Combo> listCb = travelPackageService.getAllCombos();
		model.addAttribute("combos", listCb);
		return "ListCombos";
	}

	@PostMapping("/saveCombo")
	public String saveCombo(@Valid @ModelAttribute("combo") Combo combo, BindingResult result) {
		if (result.hasErrors()) {
			return "ComboForm";
		}
		travelPackageService.saveCombo(combo);
		return "redirect:/Combo/showListCombos";
	}

	@GetMapping("/addCombo")
	public String showFormAdd(Model model) {
		Combo combo = new Combo();
		List<Departure> departures = departureService.getAllDepartures();
		List<Destination> destinations = destinationService.getAllDestinations();
		model.addAttribute("combo", combo);
		model.addAttribute("departures", departures);
		model.addAttribute("destinations", destinations);
		return "ComboForm";
	}

	@GetMapping("/updateCombo")
	public String showFormUpdate(@RequestParam("comboId") int comboId, Model model) {
		Combo combo = travelPackageService.getComboById(comboId);
		List<Departure> departures = departureService.getAllDepartures();
		List<Destination> destinations = destinationService.getAllDestinations();
		model.addAttribute("combo", combo);
		model.addAttribute("departures", departures);
		model.addAttribute("destinations", destinations);
		return "ComboForm";
	}

	@GetMapping("/searchCombo")
	public String searchCombo(@RequestParam("comboId") int comboId, Model model) {
		try {
			Combo combo = travelPackageService.getComboById(comboId);
			List<Combo> combos = new ArrayList<Combo>();
			combos.add(combo);
			model.addAttribute("combo", combos);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "ListCombos";
	}

	@GetMapping("/deleteCombo")
	public String deleteCombo(@RequestParam("comboId") int comboId, Model model) {
		try {
			travelPackageService.deleteCombo(comboId);
		} catch (Exception e) {
			// TODO: handle exception
			model.addAttribute("ERROR", "Không thể xóa dữ liệu này");
		}
		List<Combo> listCb = travelPackageService.getAllCombos();
		model.addAttribute("combos", listCb);
		return "ListCombos";
	}

	@GetMapping("/addComboToCart")
	public String addComboToCart(@RequestParam("comboId") int comboId, HttpSession session, Model model,
			RedirectAttributes redirectAttributes) {
		Combo combo = travelPackageService.getComboById(comboId);
		if (combo != null) {
			// Kiểm tra xem combo có chỗ trống và số lượng không vượt quá chỗ trống
			if (combo.getAvailableSeats() > 0) {
				List<CartItem> userCart = (List<CartItem>) session.getAttribute("userCart");
				if (userCart == null) {
					userCart = new ArrayList<>();
					session.setAttribute("userCart", userCart);
				}

				boolean comboExists = false;
				for (CartItem item : userCart) {
					if (item.getID() == comboId) {
						// Nếu combo đã tồn tại trong giỏ, kiểm tra số lượng không vượt quá chỗ trống
						if (item.getQuantity() < combo.getAvailableSeats()) {
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
					CartItem cartItem = new CartItem(combo, 1);
					userCart.add(cartItem);
				}

				session.setAttribute("userCart", userCart);
			} else {
				redirectAttributes.addFlashAttribute("message", "Combo không còn chỗ trống.");
				return "redirect:/Cart/showCart";
			}
		} else {
			redirectAttributes.addFlashAttribute("message", "Combo không tồn tại.");
			return "redirect:/Cart/showCart";
		}
		return "redirect:/Cart/showCart";
	}

}
