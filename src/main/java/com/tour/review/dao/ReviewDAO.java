package com.tour.review.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.tour.review.model.AccomoReview;
import com.tour.review.model.TouristReview;

@Repository
public interface ReviewDAO {
	
	// 호텔 리뷰 작성
	public int insertReview(
			@Param("point") int point,
			@Param("reviewContent") String reviewContent,
			@Param("reviewTitle") String reviewTitle,
			@Param("accomoId") int accomoId,
			@Param("userId") int userId,
			@Param("userName") String userName,
			@Param("checkIn") String checkIn);
	
	// 호텔 리뷰 리스트 가져오기
	public List<AccomoReview> selectAccomoReviewList(int accomodationId);
	
	// 호텔 리뷰 평균 구하기
	public int selectAccomoAvgPoint(int accomodationId);
	
	// 호텔 리뷰 갯수 가져오기
	public int selectAccomoReviewRowCount(int accomodationId);
	
	// 관광지 리뷰 작성
	public int insertTouristReview(
			@Param("point") int point,
			@Param("reviewContent") String reviewContent,
			@Param("reviewTitle") String reviewTitle,
			@Param("visitDay") String visitDay,
			@Param("touristId") int touristId,
			@Param("userId") int userId,
			@Param("userName") String userName);
	
	// 관광지 리뷰 리스트 가져오기
	public List<TouristReview> selectTouristReviewList(int touristId);
	
	// 관광지 리뷰 평균 구하기
	public int selectTouristAvgPoint(int touristId);
		
	// 관광지 리뷰 갯수 가져오기
	public int selectTouristReviewRowCount(int touristId);
	
	// 관광지 리뷰 5점중 최신 리뷰 가져오기
	public TouristReview selectTouristReviewLatestById(int touristId);
}
