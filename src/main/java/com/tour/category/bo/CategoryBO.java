package com.tour.category.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.tour.booking.bo.BookingBO;
import com.tour.category.dao.CategoryDAO;
import com.tour.category.model.Accomodation;
import com.tour.category.model.Category;
import com.tour.category.model.Facilities;
import com.tour.category.model.Room;
import com.tour.category.model.RoomFacilities;
import com.tour.category.model.Tourist;
import com.tour.common.FileManagerService;

@Service
public class CategoryBO {
	
	@Autowired
	private CategoryDAO categoryDAO;
	
	@Autowired
	private BookingBO bookingBO;
	
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
	public boolean addCategoryInfo(String categoryAttr, Integer categoryId, String loginId, String name, String englishName,
			String address, String zipCode, String recommendTime, String intro, String intro2, String intro3, String accomoPlace,
			String accomoPlace2, String accomoPlace3, String accomoPlace4, String latitude, String longitude, String website, String price, String phoneNumber, String email,
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
		
		return categoryDAO.insertCategoryInfo(categoryAttr, categoryId, name, englishName, address, zipCode, recommendTime, intro, intro2,
				intro3, accomoPlace, accomoPlace2, accomoPlace3, accomoPlace4, latitude, longitude, website, price, phoneNumber, email, operatingTime, availableToServe, type, happyHour, durationTime, field,
				vitalItem, culture, commonSense, recommended, warning, imagePath);
	}
	
	// 호텔 리스트 가져오기
	public List<Accomodation> getAccomodationList() {
		return categoryDAO.selectAccomodationList();
	}
	
	// 호텔 id로 객체 가져오기
	public Accomodation getAccomodationById(int accomodationId) {
		return categoryDAO.selectAccomodationById(accomodationId);
	}
	
	// 호텔 id로 편의시설 가져오기
	public Facilities getFacilitiestById(int accomodationId) {
		return categoryDAO.selectFacilitiestById(accomodationId);
	}
	
	// 호텔 id로 객실 특징 가져오기
	public RoomFacilities getRoomFacilitiesById(int accomodationId) {
		return categoryDAO.selectRoomFacilitiesById(accomodationId);
	}
	
	// 호텔 id로 호텔방들 가져오기
	public List<Room> getRoomById(int accomodationId) {
		return categoryDAO.selectRoomById(accomodationId);
	}
	
	// 호텔 정보 저장 구문
	public boolean addHotelInfo(int hotelId, String loginId, int accomoType, String fitness, String barLounge, String pool, String valetParking, String EVCS,
			String banquetHall, String petAllowed, String luggageStorage, String wifi, String intro, String roomType,
			String bedType, String floor, String view, String checkIn, String checkOut, String breakfast, String headCount,
			String smoke, String curtain, String roomService, String morningCall, String refridge, String coffee, String TV,
			String safe, String telephone, String airConditioner, String kitchenette, MultipartFile roomThumbnail) {
		
		String imagePath = null;
		if (roomThumbnail != null) { // 파일이 있으면 순차적으로 기능 수행됨 - 파일 있을때만 수행하고 이미지 경로를 얻어낸다.
			imagePath = fileManagerService.saveFile(loginId, roomThumbnail); 
		}
		
		return categoryDAO.insertHotelInfo(hotelId, accomoType, fitness, barLounge, pool, valetParking, EVCS, banquetHall, petAllowed,
				luggageStorage, wifi, intro, roomType, bedType, floor, view, checkIn, checkOut, breakfast, headCount, smoke,
				curtain, roomService, morningCall, refridge, coffee, TV, safe, telephone, airConditioner, kitchenette, imagePath);
	}
	
	// 관광지 리스트 가져오기
	public List<Tourist> getTouristList() {
		return categoryDAO.selectTouristList();
	}
	
	// 관광지 객체 가져오기
	public Tourist getTouristById(int getTouristById) {
		return categoryDAO.selectTouristById(getTouristById);
	}
	
	// 관광지 사진들 가져오기
	public List<Tourist> getTouristPicById(int getTouristById) {
		return categoryDAO.selectTouristPicById(getTouristById);
	}
	
	// 관광지 사진들 넣기
	public int addTouristImages(int touristId, List<MultipartFile> fileList, String loginId) {
		
		int count = 0;
		String imagePath = null;
		if (fileList != null) { // 파일이 있으면 순차적으로 기능 수행됨 - 파일 있을때만 수행하고 이미지 경로를 얻어낸다.
			for (int i = 0; i < fileList.size(); i++) {
				imagePath = fileManagerService.saveFile(loginId, fileList.get(i)); 
				categoryDAO.insertTouristImages(touristId, imagePath);
				count++;
			}
		}
		
		return count;
	}
}
