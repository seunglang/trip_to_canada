package com.tour.category.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.tour.category.model.Category;

@Repository
public interface CategoryDAO {
	
	// 카테고리 insert
	public boolean insertCategory(
			@Param("categoryName") String categoryName,
			@Param("categoryAttr") String categoryAttr);
	
	// 카테고리 가져오기
	public List<Category> selectCategoryList();
	
	// 카테고리 추가시 중복되는 이름 방지
	public int selectCategoryByNameAttr(String categoryName);
	
	// 카테고리 삭제
	public boolean deleteCategoryByAttr(String categoryName);
	
	// 선택한 카테고리에 글 저장
	public boolean addCategoryInfo(@Param("categoryId")int categoryId,
			@Param("name") String accomoName,
			@Param("address") String accomoMainAddress,
			@Param("zipCode") String accomoZipCode,
			@Param("intro") String accomoInfo,
			@Param("price") String accomoPrice,
			@Param("phoneNumber") String accomoPhoneNumber,
			@Param("email") String accomoEmail,
			@Param("thumbnailPic") String imagePath);
}
