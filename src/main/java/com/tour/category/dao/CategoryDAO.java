package com.tour.category.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

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
	
	// 카테고리 업데이트
	public boolean updateCategoryByNameAttr(
			@Param("checkName") String checkName,
			@Param("categoryName") String categoryName,
			@Param("categoryAttr") String categoryAttr);
	
	// 카테고리 번호 가져오기
	public int selectCategoryIdByAttr(String categoryAttr);
	
	// 선택한 카테고리에 글 저장
	public boolean insertCategoryInfo(
			@Param("categoryAttr") String categoryAttr,
			@Param("categoryId") int categoryId,
			@Param("name") String name,
			@Param("address") String address,
			@Param("zipCode") String zipCode,
			@Param("intro") String intro,
			@Param("price") String price,
			@Param("phoneNumber") String phoneNumber,
			@Param("email") String email,
			@Param("operatingTime") String operatingTime,
			@Param("availableToServe") String availableToServe,
			@Param("type") String type,
			@Param("happyHour") String happyHour,
			@Param("durationTime") String durationTime,
			@Param("field") String field,
			@Param("vitalItem") String vitalItem,
			@Param("culture") String culture,
			@Param("commonSense") String commonSense,
			@Param("recommended") String recommended,
			@Param("warning") String warning,
			@Param("thumbnailPic") String imagePath);
}
