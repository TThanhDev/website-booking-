package com.se.fit.TravelProject.controller;

import java.time.LocalDate;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.se.fit.TravelProject.entities.User;
import com.se.fit.TravelProject.entities.Booking;
import com.se.fit.TravelProject.entities.CartItem;
import com.se.fit.TravelProject.entities.Combo;
import com.se.fit.TravelProject.entities.Tour;
import com.se.fit.TravelProject.entities.TravelPackage;
import com.se.fit.TravelProject.service.AccountService;
import com.se.fit.TravelProject.service.BookingService;
import com.se.fit.TravelProject.service.DepartureService;
import com.se.fit.TravelProject.service.DestinationService;
import com.se.fit.TravelProject.service.SendMailService;
import com.se.fit.TravelProject.service.TravelPackageService;
import com.se.fit.TravelProject.service.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/Cart")
public class CartController {
	private TravelPackageService travelPackageService;
	private DepartureService departureService;
	private DestinationService destinationService;
	private AccountService accountService;
	private UserService userService;
	private BookingService bookingService;
	private SendMailService mailService;

	@Autowired
	public CartController(TravelPackageService travelPackageService, DepartureService departureService,
			DestinationService destinationService, AccountService accountService, UserService userService,
			BookingService bookingService, SendMailService mailService) {
		super();
		this.travelPackageService = travelPackageService;
		this.departureService = departureService;
		this.destinationService = destinationService;
		this.accountService = accountService;
		this.userService = userService;
		this.bookingService = bookingService;
		this.mailService = mailService;
	}

	@GetMapping("/showCart")
	public String showCart() {
		return "GioHang";
	}


	@GetMapping("/decreaseQuantity")
	public String decreaseQuantity(@RequestParam("itemId") int itemId, HttpSession session) {
		List<CartItem> userCart = (List<CartItem>) session.getAttribute("userCart");

		if (userCart != null) {
			Iterator<CartItem> iterator = userCart.iterator();
			while (iterator.hasNext()) {
				CartItem item = iterator.next();
				if (item.getID() == itemId) {
					item.decreaseQuantity();

					// Nếu số lượng giảm về 0, xóa phần tử khỏi danh sách
					if (item.getQuantity() == 0) {
						iterator.remove();
					}

					break;
				}
			}
			session.setAttribute("userCart", userCart);
		}
		return "GioHang";
	}

	@GetMapping("/bookAll")
	public String bookAll(Model model, HttpSession session,RedirectAttributes redirectAttributes) {
		int userId = (int) session.getAttribute("USERID");

		User user = userService.getUserById(userId);

		// Get the list of cart items from the session (userCart)
		List<CartItem> cartItems = (List<CartItem>) session.getAttribute("userCart");
		System.out.println(cartItems);
		if(cartItems==null) {
			redirectAttributes.addFlashAttribute("message", "Giỏ hàng trống");
			return "redirect:/Cart/showCart";
		}

		// Iterate through each item in the cart
		for (CartItem cartItem : cartItems) {
			int id = cartItem.getID();

			if (cartItem.isComboTour()) {
				Combo combo = travelPackageService.getComboById(id);

				if (combo.getAvailableSeats() > 0) {
					combo.setAvailableSeats(combo.getAvailableSeats() - 1);
					travelPackageService.saveCombo(combo);
					Booking booking = new Booking(user, combo, LocalDate.now());
					bookingService.saveBooking(booking);
				} else {
					redirectAttributes.addFlashAttribute("message", "Xin lỗi Tour này hết chỗ");
					return "redirect:/Cart/showCart";
				}
			} else {

				Tour tour = travelPackageService.getTourById(id);

				if (tour.getAvailableSeats() > 0) {
					tour.setAvailableSeats(tour.getAvailableSeats() - 1);
					travelPackageService.saveTour(tour);
					Booking booking = new Booking(user, tour, LocalDate.now());
					bookingService.saveBooking(booking);
				} else {
					redirectAttributes.addFlashAttribute("message", "Xin lỗi Tour này hết chỗ");
					return "redirect:/Cart/showCart";
				}
			}
		}
		session.removeAttribute("userCart");

		session.setAttribute("bill", cartItems);

		session.setAttribute("acc", user);
		String emailUser = user.getEmail();
		
		String nameUser = user.getFullName();
		mailService.sendBookingConfirmationEmail(emailUser,nameUser);
		return "PaySuccess";
	}
}
