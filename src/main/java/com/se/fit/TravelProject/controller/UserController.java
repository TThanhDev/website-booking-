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
import org.springframework.web.bind.annotation.RestController;

import com.oracle.wls.shaded.org.apache.regexp.recompile;
import com.se.fit.TravelProject.entities.Account;
import com.se.fit.TravelProject.entities.Combo;
import com.se.fit.TravelProject.entities.ERole;
import com.se.fit.TravelProject.entities.Tour;
import com.se.fit.TravelProject.entities.User;
import com.se.fit.TravelProject.entities.UserAccount;
import com.se.fit.TravelProject.service.AccountService;
import com.se.fit.TravelProject.service.SendMailService;
import com.se.fit.TravelProject.service.TravelPackageService;
import com.se.fit.TravelProject.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import jakarta.websocket.Session;

@Controller
@RequestMapping("/user")
public class UserController {
	private UserService userService;
	private AccountService accountService;
	private TravelPackageService packageService;
	private SendMailService sendMailService;

	@Autowired
	public UserController(UserService userService, AccountService accountService, TravelPackageService packageService,
			SendMailService sendMailService) {
		super();
		this.userService = userService;
		this.accountService = accountService;
		this.packageService = packageService;
		this.sendMailService = sendMailService;
	}

	@PostMapping("/saveUser")
	public String saveUser(@Valid @ModelAttribute("userAccount") UserAccount userAccount, BindingResult result,
			Model model) {
		if (result.hasErrors()) {
			return "AddUserForm";
		}
		try {
			User user = userAccount.getUser();
			Account account = userAccount.getAccount();
			account.setUser(user);
			userService.saveUser(user, account);
		} catch (Exception e) {
			// TODO: handle exception
			model.addAttribute("ERROR", "Tài khoản đã tồn tại");
			return "AddUserForm";
		}

		return "redirect:/user/showUsers";
	}

	@GetMapping("/searchUser")
	public String searchUser(@RequestParam("userId") int userId, Model model) {
		try {
			User user = userService.getUserById(userId);
			List<User> user2 = new ArrayList<User>();
			user2.add(user);
			model.addAttribute("user", user2);
		} catch (Exception e) {
			// TODO: handle exception
		}

		return "UserForm";

	}

	@GetMapping("/deleteUsers")
	public String deleteUsers(@RequestParam("userId") int id, Model theModel) {
		try {
			userService.deleteUser(id);
		} catch (Exception e) {
			// TODO: handle exception
			theModel.addAttribute("ERROR", "Không thể xóa dữ liệu này");
		}
		List<User> user = userService.getAllUsers();
		theModel.addAttribute("user", user);
		return "UserForm";

	}

	@GetMapping("/addUsers")
	public String addUsers(Model theModel) {
		UserAccount userAccount = new UserAccount();
		theModel.addAttribute("userAccount", userAccount);
		return "AddUserForm";

	}

	@GetMapping("/updateUsers")
	public String showFormForUpdateAdmin(@RequestParam("userId") int id, Model theModel) {
		User user = userService.getUserById(id);
		Account account = new Account();
		UserAccount userAccount = new UserAccount(user, account);
		System.out.println(userAccount);
		theModel.addAttribute("userAccount", userAccount);
		return "AddUserForm";
	}

	@PostMapping("/saveUserNotAdmin")
	public String saveUserNotAdmin(@Valid @ModelAttribute("user") User user, BindingResult result, Model model) {
		if (result.hasErrors()) {
			return "UpdateUserNotAdmin";
		}
		userService.saveUserUpdate(user);
		return "redirect:/";
	}

	@GetMapping("/updateUsersNotAdmin")
	public String showFormForUpdateUser(@RequestParam("userId") int id, Model theModel) {
		User user = userService.getUserById(id);
		theModel.addAttribute("user", user);
		return "UpdateUserNotAdmin";
	}

	@GetMapping("/showUsers")
	public String showUsers(Model theModel) {
		List<User> user = userService.getAllUsers();
		theModel.addAttribute("user", user);
		System.out.println(user);
		return "UserForm";
	}

	@PostMapping("/login")
	public String login(HttpSession session, @RequestParam("username") String username,
			@RequestParam("password") String password, Model model) {
		Account account = accountService.getAccountById(username);
		if (account != null) {
			if (account.getPassword().equals(password)) {
				User user = userService.getUserById(account.getUser().getUserId());
				int userId = user.getUserId();
				String userName = username;
				String role = account.getRole().toString();
				session.setAttribute("USERID", userId);
				session.setAttribute("ROLEUSER", role);
				session.setAttribute("User", user);
				session.setAttribute("USERNAME",userName);
				model.addAttribute("ROLE", account.getRole().toString());
				System.out.println(role);
				model.addAttribute("USER", user);
				System.out.println(userId);
				List<Tour> listTour = packageService.getToursActiveHome(LocalDate.now());
				List<Combo> listCombo = packageService.getCombosHome(LocalDate.now());
				model.addAttribute("tours", listTour);
				model.addAttribute("combos", listCombo);
				return "Home";
			} else {
				model.addAttribute("ERROR", "Sai password");
				return "dangnhap";
			}
		} else {
			model.addAttribute("ERROR", "Username không tồn tại");
			return "dangnhap";
		}
	}

	@GetMapping("/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if (session != null) {
			session.removeAttribute("USERID");
			session.removeAttribute("ROLEUSER");
			session.removeAttribute("User");
			session.invalidate();
		}
		return "dangnhap";
	}

	@PostMapping("/register")
	public String register(@Valid @ModelAttribute("userAccount") UserAccount userAccount, BindingResult result,
			Model model) {
		if (result.hasErrors()) {
			return "Register";
		}
		try {
			User user = userAccount.getUser();
			Account account = userAccount.getAccount();
			account.setUser(user);
			userService.saveUser(user, account);
			String mail = user.getEmail();
			String name = user.getFullName();
			String username = account.getUsername();
			String password = account.getPassword();
			sendMailService.sendRegisterSuccess(mail, name, username, password);
		} catch (Exception e) {
			// TODO: handle exception
			model.addAttribute("ERROR", "Tài khoản đã tồn tại");
			return "Register";

		}
		return "dangnhap";
	}

	@GetMapping("/showFormRegister")
	public String showFormRegister(Model model) {
		UserAccount userAccount = new UserAccount();
		model.addAttribute("userAccount", userAccount);
		return "Register";
	}

}
