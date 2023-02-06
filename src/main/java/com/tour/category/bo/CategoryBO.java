package com.tour.category.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.tour.category.dao.CategoryDAO;
import com.tour.category.model.Category;
import com.tour.common.FileManagerService;

@Service
public class CategoryBO {
	
	@Autowired
	private CategoryDAO categoryDAO;
	
	@Autowired
	private FileManagerService fileManagerService;
	
	// 카테고리 추가
	public boolean addCategory(String categoryName, String categoryAttr) {
		int existCategory = getCategoryByNameAttr(categoryName);
		if (existCategory > 0) {
			return false;
		}
		return categoryDAO.insertCategory(categoryName, categoryAttr);
	}
	
	// 카테고리 가져오기
	public List<Category> getCategoryList() {
		return categoryDAO.selectCategoryList();
	};
	
	// 카테고리 추가시 중복되는 이름 방지
	public int getCategoryByNameAttr(String categoryName) {
		return categoryDAO.selectCategoryByNameAttr(categoryName);
	}
	
	// 카테고리 삭제
	public boolean deleteCategoryByAttr(String categoryName) {
		return categoryDAO.deleteCategoryByAttr(categoryName);
	}
	
	// 카테고리 수정
	public boolean updateCategoryByNameAttr(String checkName, String categoryName, String categoryAttr) {
		return categoryDAO.updateCategoryByNameAttr(checkName, categoryName, categoryAttr);
	}
	
	// 카테고리 번호 가져오기
	public int getCategoryIdByAttr(String categoryAttr) {
		return categoryDAO.selectCategoryIdByAttr(categoryAttr);
	}
	
	// 선택한 카테고리에 글 저장
	public boolean addCategoryInfo(String categoryAttr, Integer categoryId, String loginId, String name,
			String address, String zipCode, String intro, String price, String phoneNumber, String email,
			String operatingTime, String availableToServe, String type, String happyHour, String durationTime,
			String field, String vitalItem, String culture, String commonSense, String recommended, 
			String warning, MultipartFile thumbnail) {
		
		// 카테고리 분별 구문 추가 - 카테고리 id 가져오기
		if (categoryAttr.equals("accomodation")) {
			categoryId = getCategoryIdByAttr(categoryAttr);
		} else if (categoryAttr.equals("tourist")) {
			categoryId = getCategoryIdByAttr(categoryAttr);
		} else if (categoryAttr.equals("restaurant")) {
			categoryId = getCategoryIdByAttr(categoryAttr);
		} else if (categoryAttr.equals("travleTip")) {
			categoryId = getCategoryIdByAttr(categoryAttr);
		} else if (categoryAttr.equals("package")) {
			categoryId = getCategoryIdByAttr(categoryAttr);
		}
		
		String imagePath = null;
		if (thumbnail != null) { // 파일이 있으면 순차적으로 기능 수행됨 - 파일 있을때만 수행하고 이미지 경로를 얻어낸다.
			imagePath = fileManagerService.saveFile(loginId, thumbnail); 
		}
		
		return categoryDAO.insertCategoryInfo(categoryAttr, categoryId, name, address, zipCode, intro, price,
				phoneNumber, email, operatingTime, availableToServe, type, happyHour, durationTime, field,
				vitalItem, culture, commonSense, recommended, warning, imagePath);
	}
}
