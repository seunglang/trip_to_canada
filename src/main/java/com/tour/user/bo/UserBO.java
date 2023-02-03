package com.tour.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tour.user.dao.UserDAO;
import com.tour.user.model.User;

@Service
public class UserBO {
	
	@Autowired
	private UserDAO userDAO;
	
	// 아이디 중복 확인
	public int existLoginId(String loginId) {
		return userDAO.existLoginId(loginId);
	}
	
	// 회원가입 정보 기입
	public int insertUser(String loginId, String password, String name, String email) {
		return userDAO.insertUser(loginId, password, name, email);
	}
	
	// 로그인
	public User getUserByLoginIdPassword(String loginId, String password) {
		return userDAO.selectUserByLoginIdPassword(loginId, password);
	}
}
