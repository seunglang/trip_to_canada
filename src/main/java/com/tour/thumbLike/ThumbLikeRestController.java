package com.tour.thumbLike;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.tour.thumbLike.bo.ThumbLikeBO;

import jakarta.servlet.http.HttpSession;


@RestController
public class ThumbLikeRestController {
	
	@Autowired
	private ThumbLikeBO thumbLikeBO;
	
	@GetMapping("/thumbLike/{reviewId}")
	public Map<String, Object> thumbLike(
			HttpSession session,
			@PathVariable int reviewId,
			Model model) {
		
		Map<String, Object> result = new HashMap<>();
		Integer userId = (Integer)session.getAttribute("userId");
		if (userId == null) {
			result.put("code", 500);
			result.put("error", "로그인이 필요합니다.");
		}
		
		boolean thumbLike = thumbLikeBO.existThumbLikeByUserIdPostId(userId, reviewId);
		
		if (thumbLike) {
			result.put("code", true);
		} else {
			result.put("code", false);
		}
		model.addAttribute("thumbLike", thumbLike);
		return result;
	}
}
