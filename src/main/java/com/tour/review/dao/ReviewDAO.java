package com.tour.review.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.tour.review.model.AccomoReview;

@Repository
public interface ReviewDAO {
	
	// 리뷰 작성
	public int insertReview(
			@Param("point") int point,
			@Param("reviewContent") String reviewContent,
			@Param("reviewTitle") String reviewTitle,
			@Param("accomoId") int accomoId,
			@Param("userId") int userId,
			@Param("userName") String userName,
			@Param("checkIn") String checkIn);
	
	// 리뷰 리스트 가져오기
	public List<AccomoReview> selectAccomoReviewList(int accomodationId);
	
	// 리뷰 평균 구하기
	public int selectAccomoAvgPoint(int accomodationId);
	
	// 리뷰 갯수 가져오기
	public int selectAccomoReviewRowCount(int accomodationId);
}
