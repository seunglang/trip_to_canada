package com.tour.review;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.tour.booking.bo.BookingBO;
import com.tour.review.bo.ReviewBO;

import jakarta.servlet.http.HttpSession;

@RequestMapping("/review")
@RestController
public class ReviewRestController {
	
	@Autowired
	private ReviewBO reviewBO;
	
	@Autowired
	private BookingBO bookingBO;
	
	@PostMapping("/add_review")
	public Map<String, Object> addReview(
			@RequestParam("star") int star,
			@RequestParam("reviewContent") String reviewContent,
			@RequestParam("reviewTitle") String reviewTitle,
			@RequestParam("accomoId") int accomoId,
			HttpSession session,
			Model model) {
		
		Map<String, Object> result = new HashMap<>();
		int userId = (int)session.getAttribute("userId");
		String userName = (String)session.getAttribute("userName");
		
		int experienced = bookingBO.searchReserveRoomByUserIdAccomoId(userId, accomoId);
		if (experienced > 0) {
			int count = reviewBO.addReview(star, reviewContent, reviewTitle, accomoId, userId, userName);
			if (count > 0) {
				result.put("code", 200);
			} else {
				result.put("errorMessage", "해당 호텔을 이용했던 고객님만 리뷰 작성이 가능합니다.");
			}
		}
		
		return result;
	}
}
