package com.tour.category.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.tour.category.model.Accomodation;
import com.tour.category.model.Category;
import com.tour.category.model.Facilities;
import com.tour.category.model.Room;
import com.tour.category.model.RoomFacilities;
import com.tour.category.model.Tourist;

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
			@Param("englishName") String englishName,
			@Param("address") String address,
			@Param("zipCode") String zipCode,
			@Param("recommendTime") String recommendTime,
			@Param("intro") String intro,
			@Param("intro2") String intro2,
			@Param("intro3") String intro3,
			@Param("intro4") String intro4,
			@Param("intro5") String intro5,
			@Param("accomoPlace") String accomoPlace,
			@Param("accomoPlace2") String accomoPlace2,
			@Param("accomoPlace3") String accomoPlace3,
			@Param("accomoPlace4") String accomoPlace4,
			@Param("latitude") String latitude,
			@Param("longitude") String longitude,
			@Param("website") String website,
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
			@Param("participation") String participation,
			@Param("transport") String transport,
			@Param("language") String language,
			@Param("pickUp") String pickUp,
			@Param("dropOff") String dropOff,
			@Param("thumbnailPic") String imagePath);
	
	// 호텔 리스트 가져오기
	public List<Accomodation> selectAccomodationList();
	
	// 호텔id로 객체 가져오기
	public Accomodation selectAccomodationById(int accomodationId);
	
	// 호텔 id로 해당 호텔 편의 시설 가져오기
	public Facilities selectFacilitiestById(int accomodationId);
	
	// 호텔 id로 해당 호텔 객실 특징 가져오기
	public RoomFacilities selectRoomFacilitiesById(int accomodationId);
	
	// 호텔 id로 해당 호텔 방들 가져오기
	public List<Room> selectRoomById(int accomodationId);
	
	// 호텔 정보 저장 구문
	public boolean insertHotelInfo(
			@Param("accomoId") int hotelId,
			@Param("accomoType") int accomoType,
			@Param("fitness") String fitness,
			@Param("barLounge") String barLounge,
			@Param("pool") String pool,
			@Param("valetParking") String valetParking,
			@Param("EVCS") String EVCS,
			@Param("banquetHall") String banquetHall,
			@Param("petAllowed") String petAllowed,
			@Param("luggageStorage") String luggageStorage,
			@Param("wifi") String wifi,
			@Param("roomIntro") String intro,
			@Param("roomType") String roomType,
			@Param("bedType") String bedType,
			@Param("floor") String floor,
			@Param("view") String view,
			@Param("checkIn") String checkIn,
			@Param("checkOut") String checkOut,
			@Param("breakfast") String breakfast,
			@Param("headcount") String headCount,
			@Param("smoke") String smoke,
			@Param("blackoutCurtain") String curtain,
			@Param("roomService") String roomService,
			@Param("morningCall") String morningCall,
			@Param("refridge") String refridge,
			@Param("coffeeMaker") String coffee,
			@Param("TV") String TV,
			@Param("safe") String safe,
			@Param("telephone") String telephone,
			@Param("airConditioner") String airConditioner,
			@Param("kitchenette") String kitchenette,
			@Param("thumbnailPic") String imagePath
			);
	
	// 관광지 리스트 가져오기
	public List<Tourist> selectTouristList();
	
	// 관광지 객체 가져오기
	public Tourist selectTouristById(int getTouristById);
	
	// 관광지 사진들 가져오기
	public List<Tourist> selectTouristPicById(int getTouristById);
	
	// 관광지 사진들 넣기
	public int insertTouristImages(
			@Param("touristId") int touristId,
			@Param("imagePath") String imagePath);
	
	// 패키지 리스트 가져오기
	public List<Package> selectPackageList();
	
	// 패키지 사진들 넣기
	public int insertPackageImages(
			@Param("packageId") int packageId,
			@Param("imagePath") String imagePath);
	
	// 패키지 코스 저장
	public int insertPackageCourse(
			@Param("packageId") int packageId,
			@Param("title") String title,
			@Param("content") String content,
			@Param("content2") String content2, 
			@Param("durationTime") String durationTime,
			@Param("imagePath") String imagePath);
}
