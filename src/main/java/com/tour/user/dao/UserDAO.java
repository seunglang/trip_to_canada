package com.tour.user.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.tour.user.model.User;

@Repository
public interface UserDAO {
	
	// 로그인 아이디 중복 확인
	public int existLoginId(String loginId);
	
	// 유저 정보 insert
	public int insertUser(
			@Param("loginId") String loginId,
			@Param("password") String password,
			@Param("name") String name,
			@Param("email") String email);
	
	// 로그인하기
	public User selectUserByLoginIdPassword(@Param("loginId") String loginId, @Param("password") String password);
}
