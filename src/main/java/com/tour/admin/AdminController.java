package com.tour.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/admin")
@Controller
public class AdminController {
	@GetMapping("/create")
	public String create(Model model) {
		model.addAttribute("viewName", "admin/adminPost");
		
		return "template/layout";
	}
}
