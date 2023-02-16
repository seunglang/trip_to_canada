package com.tour.thumbLike.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface ThumbLikeDAO {
	
	// 도움 insert
	public int insertThumbLike(
			@Param("reviewId") int reviewId,
			@Param("userId") int userId);
	
	// 도움 존재 확인여부
	public int existThumbLikeByUserIdPostId(
			@Param("reviewId") int reviewId,
			@Param("userId") int userId);
	
	// 도움 delete
	public int deleteThumbLikeByUserIdPostId(
			@Param("reviewId") int reviewId,
			@Param("userId") int userId);
}
