package com.tour.thumbLike.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tour.thumbLike.dao.ThumbLikeDAO;

@Service
public class ThumbLikeBO {
	
	@Autowired
	private ThumbLikeDAO thumbLikeDAO;
	
	// 도움 insert 구문
	public int insertThumbLike(int reviewId, int userId) {
		return thumbLikeDAO.insertThumbLike(reviewId, userId);
	}
	
	// 도움 존재 확인여부
	public boolean existThumbLikeByUserIdPostId(int reviewId, int userId) {
		int existThumbLikeRow = thumbLikeDAO.existThumbLikeByUserIdPostId(reviewId, userId);
		if (existThumbLikeRow == 0) {
			insertThumbLike(reviewId, userId);
			return true;
		} else {
			deleteThumbLikeByUserIdPostId(reviewId, userId);
		}
		return false;
	}
	
	public int deleteThumbLikeByUserIdPostId(int reviewId, int userId) {
		return thumbLikeDAO.deleteThumbLikeByUserIdPostId(reviewId, userId);
	}
}
