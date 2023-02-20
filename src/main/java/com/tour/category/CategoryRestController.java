package com.tour.category;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.tour.category.bo.CategoryBO;
import com.tour.thumbLike.bo.ThumbLikeBO;

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
	@DeleteMapping("/delete_category")
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
	
	// 카테고리 업데이트
	@PutMapping("/update_category")
	public Map<String, Object> updateCategory(
			@RequestParam("categoryName") String categoryName,
			@RequestParam("categoryAttr") String categoryAttr,
			@RequestParam("checkName") String checkName) {
		
		Map<String, Object> result = new HashMap<>();
		
		boolean deleteCategory = categoryBO.updateCategoryByNameAttr(checkName, categoryName, categoryAttr);
		
		
		if (deleteCategory) {
			result.put("code", 200);
			result.put("result", "선택한 카테고리가 수정되었습니다.");
		} else {
			result.put("errorMessage", "카테고리 수정에 실패했습니다.");
		}
		
		return result;
	}
	
	// 카테고리 번호 가져오기
	
	// 선택한 카테고리의 내용물 insert
	@PostMapping("/add_category_info")
	public Map<String, Object> addCategoryInfo(
			@RequestParam(value="categoryAttr", required=false) String categoryAttr,
			@RequestParam(value="name", required=false) String name,
			@RequestParam(value="englishName", required=false) String englishName,
			@RequestParam(value="address", required = false) String address, 
			@RequestParam(value="zipCode", required=false) String zipCode, 
			@RequestParam(value="recommendTime", required=false) String recommendTime, 
			@RequestParam(value="price", required=false) String price, 
			@RequestParam(value="intro", required=false) String intro, 
			@RequestParam(value="intro2", required=false) String intro2, 
			@RequestParam(value="intro3", required=false) String intro3,
			@RequestParam(value="accomoPlace", required=false) String accomoPlace,
			@RequestParam(value="accomoPlace2", required=false) String accomoPlace2,
			@RequestParam(value="accomoPlace3", required=false) String accomoPlace3,
			@RequestParam(value="accomoPlace4", required=false) String accomoPlace4,
			@RequestParam(value="latitude", required=false) String latitude,
			@RequestParam(value="longitude", required=false) String longitude,
			@RequestParam(value="website", required=false) String website,
			@RequestParam(value="phoneNumber", required=false) String phoneNumber, 
			@RequestParam(value="email", required=false) String email, 
			@RequestParam(value="operatingTime", required=false) String operatingTime,
			@RequestParam(value="availableToServe", required=false) String availableToServe,
			@RequestParam(value="type", required=false) String type,
			@RequestParam(value="happyHour", required=false) String happyHour,
			@RequestParam(value="durationTime", required=false) String durationTime,
			@RequestParam(value="field", required=false) String field,
			@RequestParam(value="vitalItem", required=false) String vitalItem,
			@RequestParam(value="culture", required=false) String culture,
			@RequestParam(value="commonSense", required=false) String commonSense,
			@RequestParam(value="recommended", required=false) String recommended,
			@RequestParam(value="warning", required=false) String warning,
			@RequestParam("file") MultipartFile file,
			HttpSession session) {
		
		// 세션 만료 혹은 관리자 이외 유저 접근 차단
		int adminId = (int)session.getAttribute("adminId");
		
		// 관리자 로그인 아이디
		String loginId = (String)session.getAttribute("userLoginId");
		
		Map<String, Object> result = new HashMap<>();
		
		// 카테고리 id
		Integer categoryId = null;
		
		// 카테고리 insert 성공 여부
		boolean insertCategoryInfo = false;
		
		
		insertCategoryInfo = categoryBO.addCategoryInfo(categoryAttr, categoryId, loginId, name, englishName, address, zipCode,
		recommendTime, intro, intro2, intro3, accomoPlace, accomoPlace2, accomoPlace3, accomoPlace4, latitude, longitude, website,
		price, phoneNumber, email, operatingTime, availableToServe, type, happyHour, durationTime, field,
		vitalItem, culture, commonSense, recommended, warning, file);
		
		
		if (insertCategoryInfo) {
			result.put("code", 200);
		} else {
			result.put("errorMessage", "게시물 저장 실패.");
		}
		
		return result;
	}
	
	@PostMapping("/add_hotel_info")
	public Map<String, Object> addHotelInfo(
			@RequestParam("hotelId") int hotelId,
			@RequestParam("accomoType") int accomoType,
			@RequestParam(value="fitness", required=false) String fitness,
			@RequestParam(value="barLounge", required=false) String barLounge,
			@RequestParam(value="pool", required=false) String pool,
			@RequestParam(value="valetParking", required=false) String valetParking,
			@RequestParam(value="EVCS",required=false ) String EVCS,
			@RequestParam(value="banquetHall", required=false) String banquetHall,
			@RequestParam(value="petAllowed", required=false) String petAllowed,
			@RequestParam(value="luggageStorage", required=false) String luggageStorage,
			@RequestParam(value="wifi", required=false) String wifi,
			@RequestParam(value="intro", required=false) String intro,
			@RequestParam(value="roomType", required=false) String roomType,
			@RequestParam(value="bedType", required=false) String bedType,
			@RequestParam(value="floor", required=false) String floor,
			@RequestParam(value="view", required=false) String view,
			@RequestParam(value="checkIn", required=false) String checkIn,
			@RequestParam(value="checkOut", required=false) String checkOut,
			@RequestParam(value="breakfast", required=false) String breakfast,
			@RequestParam(value="headCount", required=false) String headCount,
			@RequestParam(value="smoke", required=false) String smoke,
			@RequestParam(value="curtain", required=false) String curtain,
			@RequestParam(value="roomService", required=false) String roomService,
			@RequestParam(value="morningCall", required=false) String morningCall,
			@RequestParam(value="refridge", required=false) String refridge,
			@RequestParam(value="coffee", required=false) String coffee,
			@RequestParam(value="TV", required=false) String TV,
			@RequestParam(value="safe", required=false) String safe,
			@RequestParam(value="telephone", required=false) String telephone,
			@RequestParam(value="airConditioner", required=false) String airConditioner,
			@RequestParam(value="kitchenette", required=false) String kitchenette,
			@RequestParam(value="file", required=false) MultipartFile file,
			HttpSession session
			) {
		
		// 세션 만료 혹은 관리자 이외 유저 접근 차단
		int adminId = (int)session.getAttribute("adminId");
		// 관리자 로그인 아이디
		String loginId = (String)session.getAttribute("userLoginId");
		
		Map<String, Object> result = new HashMap<>();
		
		boolean insertHotelInfo = false;
		
		insertHotelInfo = categoryBO.addHotelInfo(hotelId, loginId, accomoType, fitness, barLounge, pool, valetParking,EVCS, banquetHall, petAllowed,
				luggageStorage, wifi, intro, roomType, bedType, floor, view, checkIn, checkOut, breakfast, headCount, smoke,
				curtain, roomService, morningCall, refridge, coffee, TV, safe, telephone, airConditioner, kitchenette, file);
		
		if (insertHotelInfo) {
			result.put("code", 200);
		} else {
			result.put("errorMessage", "호텔 정보 저장에 실패했습니다.");
		}
		
		return result;
		
	}
	
}
