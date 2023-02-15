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
			@Param("userName") String userName);
	
	// 리뷰 리스트 가져오기
	public List<AccomoReview> selectAccomoReviewList(int accomodationId);
}
