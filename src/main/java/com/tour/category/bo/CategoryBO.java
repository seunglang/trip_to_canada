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
	
	// 선택한 카테고리에 글 저장
	public boolean addCategoryInfo(int categoryId, String loginId, String accomoName, String accomoMainAddress, String accomoZipCode, String accomoInfo
			, String accomoPrice, String accomoEmail, String accomoPhoneNumber, MultipartFile accomoThumbnail) {
		
		String imagePath = null;
		if (accomoThumbnail != null) { // 파일이 있으면 순차적으로 기능 수행됨 - 파일 있을때만 수행하고 이미지 경로를 얻어낸다.
			imagePath = fileManagerService.saveFile(loginId, accomoThumbnail); 
		}
		
		return categoryDAO.addCategoryInfo(categoryId, accomoName, accomoMainAddress, accomoZipCode, accomoInfo, accomoPrice, accomoPhoneNumber, accomoEmail, imagePath);
	}
}
