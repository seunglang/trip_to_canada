package com.tour.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.tour.common.EncryptUtils;
import com.tour.user.bo.UserBO;
import com.tour.user.model.User;

import jakarta.servlet.http.HttpSession;

@RequestMapping("/user")
@RestController
public class UserRestController {
	
	@Autowired
	private UserBO userBO;
	
	// 중복 확인 구문
	@RequestMapping("/is_duplicated_id")
	public Map<String, Object> isDuplicatedId(@RequestParam("loginId") String loginId) {

		Map<String, Object> result = new HashMap<>();
		int existRowCount = userBO.existLoginId(loginId);
		if (existRowCount > 0) { // 이미 id가 존재하면 true
			result.put("result", true);
		} else {
			result.put("result", false);
		}

		return result;
	}
	
	// 회원가입
	@PostMapping("/sign_up")
	public Map<String, Object> signUp(@RequestParam("loginId") String loginId,
			@RequestParam("password") String password, @RequestParam("name") String name,
			@RequestParam("email") String email) {

		String encryptPassword = EncryptUtils.md5(password);
		int row = userBO.insertUser(loginId, encryptPassword, name, email);

		Map<String, Object> result = new HashMap<>();
		if (row == 1) {
			result.put("result", "success");
		} else {
			result.put("errorMessage", "입력 실패");
		}
		return result;
	}
	
	@PostMapping("/sign_in")
	public Map<String, Object> signIn(
			@RequestParam("loginId") String loginId,
			@RequestParam("password") String password,
			HttpSession session) {
		
		// 비밀번호 해싱 작업
		String hashedPassword = EncryptUtils.md5(password);
		
		// db select
		User user = userBO.getUserByLoginIdPassword(loginId, hashedPassword);
		
		// 행이 있으면 로그인
		Map<String, Object> result = new HashMap<>();
		if (user != null) {
			result.put("code", 1);
			result.put("result", "성공");
			
			// 세션에 유저 정보를 담는다
			//session.setAttribute("userId", user.getId());
			session.setAttribute("userName", user.getName());
			session.setAttribute("adminId", user.getAdminId());
			session.setAttribute("userLoginId", user.getLoginId());
		} else {
			result.put("code", 500);
			result.put("errorMessage", "존재하지 않는 사용자입니다.");
		} // 행이 없으면 로그인 실패
		
		
		// return 맵
		return result;
	}
}
