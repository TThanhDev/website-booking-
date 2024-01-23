package com.se.fit.TravelProject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class KhuyenMaiController {
	@Autowired
	@GetMapping("/KhuyenMai")
	public String khuyenMai() {
		return "KhuyenMai";
	}

}
