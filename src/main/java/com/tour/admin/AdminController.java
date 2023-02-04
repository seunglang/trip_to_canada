package com.tour.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tour.category.bo.CategoryBO;
import com.tour.category.model.Category;

@RequestMapping("/admin")
@Controller
public class AdminController {
	
	@Autowired
	private CategoryBO categoryBO;
	
	@GetMapping("/create")
	public String create(Model model) {
		
		List<Category> categoryList = categoryBO.getCategoryList();
		
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("viewName", "admin/adminPost");
		//model.addAttribute("viewName", "admin/adminPost");
		
		return "template/layout";
	}
}
