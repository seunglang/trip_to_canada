package com.tour.review.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tour.review.dao.ReviewDAO;
import com.tour.review.model.AccomoReview;

@Service
public class ReviewBO {
	
	
	@Autowired
	private ReviewDAO reviewDAO;

	// 리뷰 작성
	public int addReview(int star, String reviewContent, String reviewTitle, int accomoId, int userId, String userName, String checkIn) {
		return reviewDAO.insertReview(star, reviewContent, reviewTitle, accomoId, userId, userName, checkIn);
	}
	
	public List<AccomoReview> getAccomoReviewList(int accomodationId) {
		return reviewDAO.selectAccomoReviewList(accomodationId);
	}
}
