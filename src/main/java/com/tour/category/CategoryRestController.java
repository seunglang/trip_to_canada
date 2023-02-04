package com.tour.category;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.tour.category.bo.CategoryBO;

import jakarta.servlet.http.HttpSession;

@RequestMapping("/category")
@RestController
public class CategoryRestController {
	
	@Autowired
	private CategoryBO categoryBO;
	
	// 카테고리 추가
	@PostMapping("/add_category")
	public Map<String, Object> addCategory(
			@RequestParam("categoryName") String categoryName,
			@RequestParam("categoryAttr") String categoryAttr,
			Model model,
			HttpSession session) {
		
		Map<String, Object> result = new HashMap<>();
		
		// 관리자 식별 아이디 없으면 진입 불가
		int adminId = (int)session.getAttribute("adminId");
		
		boolean addCategory = categoryBO.addCategory(categoryName, categoryAttr);
		if (addCategory) {
			result.put("code", 200);
		} else {
			result.put("code", 500);
			result.put("errorMessage", "카테고리 입력 실패 - 중복되는 카테고리가 존재합니다.");
		}
		
		
		return result;
	}
	
	
	// 카테고리 삭제
	@PostMapping("/delete_category")
	public Map<String, Object> deleteCategory(
			@RequestParam("categoryName") String categoryName,
			HttpSession session) {
		
		Map<String, Object> result = new HashMap<>();
		
		boolean deleteCategory = categoryBO.deleteCategoryByAttr(categoryName);
		if (deleteCategory) {
			result.put("code", 200);
			result.put("result", "선택한 카테고리가 삭제되었습니다.");
		} else {
			result.put("errorMessage", "카테고리 삭제에 실패했습니다.");
		}
		
		return result;
	}
	
	// 선택한 카테고리의 내용물 insert
	@PostMapping("/add_category_info")
	public Map<String, Object> addCategoryInfo(
			//@RequestParam Map<String ,Object> map,
			@RequestParam("accomoName") String accomoName, 
			@RequestParam("accomoMainAddress") String accomoMainAddress, 
			@RequestParam("accomoZipCode") String accomoZipCode, 
			@RequestParam("accomoPrice") String accomoPrice, 
			@RequestParam("accomoInfo") String accomoInfo, 
			@RequestParam("accomoPhoneNumber") String accomoPhoneNumber, 
			@RequestParam("accomoEmail") String accomoEmail, 
			@RequestParam("file") MultipartFile file,
			HttpSession session) {
		
		int adminId = (int)session.getAttribute("adminId");
		String loginId = (String)session.getAttribute("userLoginId");
		
		Map<String, Object> result = new HashMap<>();
		
		int categoryId = 1;
		boolean test = categoryBO.addCategoryInfo(categoryId, loginId, accomoName, accomoMainAddress, accomoZipCode, accomoPrice, accomoInfo, accomoPhoneNumber, accomoEmail, file);
		if (test) {
			result.put("code", 200);
		} else {
			result.put("errorMessage", "게시물 저장 실패.");
		}
		
		
		
		
		//String selectCategory = (String)map.get("selectCategory");
//		if (selectCategory.equals("accomodation")) {
//			int categoryId = 1;
//			String name = (String)map.get("accomoName");
//			String address = (String)map.get("accomoMainAddress");
//			String zipCode = (String)map.get("accomoZipCode");
//			String price = (String)map.get("accomoPrice");
//			String info = (String)map.get("accomoInfo");
//			String number = (String)map.get("accomoPhoneNumber");
//			String email = (String)map.get("accomoEmail");
//			MultipartFile pic = (MultipartFile)map.get("file");
//			
//			boolean test = categoryBO.addCategoryInfo(loginId, categoryId, name, address, zipCode, price, info, number, email, pic);
//			if (test) {
//				result.put("code", 200);
//			}
//		}
		
		return result;
	}
}
