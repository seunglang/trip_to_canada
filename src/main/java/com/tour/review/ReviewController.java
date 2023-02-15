package com.tour.review;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tour.category.bo.CategoryBO;
import com.tour.category.model.Accomodation;

import jakarta.servlet.http.HttpSession;

@RequestMapping("/review")
@Controller
public class ReviewController {
	
	private CategoryBO categoryBO;
	
	@GetMapping("/review_form_view")
	public String reviewView(
			@RequestParam("accomodationId") int accomodationId,
			Model model,
			HttpSession session) {
		
		int userId = (int)session.getAttribute("userId");
		
//		Accomodation accomodation = categoryBO.getAccomodationById(accomodationId);
//		
//		model.addAttribute("accomodation", accomodation);
		model.addAttribute("viewName", "review/writeReview");
		return "template/layout";
	}
}
