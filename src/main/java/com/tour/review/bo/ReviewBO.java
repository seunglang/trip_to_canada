package com.tour.review.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tour.review.dao.ReviewDAO;
import com.tour.review.model.AccomoReview;
import com.tour.review.model.TouristReview;

@Service
public class ReviewBO {
	
	
	@Autowired
	private ReviewDAO reviewDAO;

	// 호텔 리뷰 작성
	public int addReview(int star, String reviewContent, String reviewTitle, int accomoId, int userId, String userName, String checkIn) {
		return reviewDAO.insertReview(star, reviewContent, reviewTitle, accomoId, userId, userName, checkIn);
	}
	
	// 호텔 리뷰 가져오기
	public List<AccomoReview> getAccomoReviewList(int accomodationId) {
		return reviewDAO.selectAccomoReviewList(accomodationId);
	}
	
	// 호텔 리뷰 평균 점수 가져오기
	public int getAccomoReviewAVGPoint(int accomodationId) {
		return reviewDAO.selectAccomoAvgPoint(accomodationId);
	}
	
	// 호텔 리뷰 개수 가져오기
	public int getAccomoReviewRowCount(int accomodationId) {
		return reviewDAO.selectAccomoReviewRowCount(accomodationId);
	}
	
	// 관광지 리뷰 작성
	public int addTouristReview(int star, String reviewContent, String reviewTitle, String visitDay, int touristId, int userId, String userName) {
		return reviewDAO.insertTouristReview(star, reviewContent, reviewTitle, visitDay, touristId, userId, userName);
	}
	
	// 관광지 리뷰 가져오기
	public List<TouristReview> getTouristReviewList(int touristId) {
		return reviewDAO.selectTouristReviewList(touristId);
	}
	
	// 호텔 리뷰 평균 점수 가져오기
	public int getTouristReviewAvgPoint(int touristId) {
		return reviewDAO.selectTouristAvgPoint(touristId);
	}
		
	// 호텔 리뷰 개수 가져오기
	public int getTouristReviewRowCount(int touristId) {
		return reviewDAO.selectTouristReviewRowCount(touristId);
	}
	
	// 5점중 최신 리뷰 가져오기
	public TouristReview getTouristReviewLatestById(int touristId) {
		return reviewDAO.selectTouristReviewLatestById(touristId);
	}
}
