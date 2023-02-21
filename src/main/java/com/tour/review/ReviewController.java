package com.tour.review;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tour.category.bo.CategoryBO;
import com.tour.category.model.Accomodation;
import com.tour.category.model.Tourist;

import jakarta.servlet.http.HttpSession;

@RequestMapping("/review")
@Controller
public class ReviewController {
	
	@Autowired
	private CategoryBO categoryBO;
	
	@GetMapping("/review_form_view")
	public String reviewView(
			@RequestParam("accomodationId") int accomodationId,
			Model model,
			HttpSession session) {
		
		Integer userId = (Integer)session.getAttribute("userId");
		if (userId == null) {
			return "redirect:/user/sign_in_view";
		}
		
		Accomodation accomodation = categoryBO.getAccomodationById(accomodationId);
		
		model.addAttribute("accomodation", accomodation);
		model.addAttribute("viewName", "review/writeReview");
		return "template/layout";
	}
	
	@GetMapping("/tourist_form_view")
	public String touristReview(
			@RequestParam("touristId") int touristId,
			Model model,
			HttpSession session) {
		Integer userId = (Integer)session.getAttribute("userId");
		if (userId == null) {
			return "redirect:/user/sign_in_view";
		}
		
		Tourist tourist = categoryBO.getTouristById(touristId);
		
		model.addAttribute("tourist", tourist);
		model.addAttribute("viewName", "review/touristReview");
		return "template/layout";
	}
}
