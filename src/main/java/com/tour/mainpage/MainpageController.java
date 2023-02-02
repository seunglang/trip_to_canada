package com.tour.mainpage;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainpageController {
	
	@GetMapping("/mainpage/mainpageView")
	public String mainpageView(Model model) {
		
		model.addAttribute("viewName", "mainpage/mainView");
		return "template/layout";
	}
}
