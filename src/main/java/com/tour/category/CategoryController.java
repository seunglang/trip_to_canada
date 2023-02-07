package com.tour.category;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tour.category.bo.CategoryBO;
import com.tour.category.model.Accomodation;

@RequestMapping("/category")
@Controller
public class CategoryController {
	
	@Autowired
	private CategoryBO categoryBO;
	
	// 숙소/예약 페이지 호출
	@GetMapping("/accomodation_list_view")
	public String accomodationView(Model model) {
		
		// 숙소 리스트
		List<Accomodation> accomodationList = categoryBO.getAccomodationList(); 
		model.addAttribute("accomodationList", accomodationList);
		model.addAttribute("viewName", "category/accomodationList");
		
		return "template/layout";
	}
	
	// 숙소 상세페이지 호출
	@GetMapping("/accomodation_detail_view")
	public String accomodationDetailView(
			@RequestParam("accomodationId") int accomodationId,
			Model model) {
		
		
		Accomodation accomodation = categoryBO.getAccomodationById(accomodationId);
		
		model.addAttribute("accomodation", accomodation);
		model.addAttribute("viewName", "category/accomodationDetail");
		
		return "template/layout";
	}
}
