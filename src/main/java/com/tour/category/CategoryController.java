package com.tour.category;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tour.booking.bo.BookingBO;
import com.tour.category.bo.CategoryBO;
import com.tour.category.model.Accomodation;
import com.tour.category.model.Facilities;
import com.tour.category.model.Room;
import com.tour.category.model.RoomFacilities;
import com.tour.category.model.Tourist;
import com.tour.review.bo.ReviewBO;
import com.tour.review.model.AccomoReview;
import com.tour.thumbLike.bo.ThumbLikeBO;

import jakarta.servlet.http.HttpSession;

@RequestMapping("/category")
@Controller
public class CategoryController {
	
	@Autowired
	private CategoryBO categoryBO;
	
	@Autowired
	private BookingBO bookingBO;
	
	@Autowired
	private ReviewBO reviewBO;
	
	@Autowired
	private ThumbLikeBO thumbLikeBO;
	
	
	// 호텔/예약 페이지 호출
	@GetMapping("/accomodation_list_view")
	public String accomodationView(Model model) {
		
		List<Accomodation> accomodationList = categoryBO.getAccomodationList(); 
		model.addAttribute("accomodationList", accomodationList);
		model.addAttribute("viewName", "category/accomodationList");
		
		return "template/layout";
	}
	
	
	// 호텔 상세페이지 호출
	@GetMapping("/accomodation_detail_view")
	public String accomodationDetailView(
			@RequestParam(value="accomodationId", required=false) Integer accomodationId,
			@RequestParam(value="reviewId", required=false) Integer reviewId,
			Model model,
			HttpSession session) {
		
		// 클릭된 호텔 객체 가져오기
		if (accomodationId != null) {
			Accomodation accomodation = categoryBO.getAccomodationById(accomodationId);
			
			// 클릭된 호텔의 편의시설 가져오기
			Facilities facilities = categoryBO.getFacilitiestById(accomodationId);
			
			// 클릭된 호텔의 객실 특징 가져오기
			RoomFacilities roomFacilities = categoryBO.getRoomFacilitiesById(accomodationId);
			
			// 클릭된 호텔 방 가져오기
			List<Room> rooms = categoryBO.getRoomById(accomodationId);
			
			// 클릭된 호텔 리뷰 가져오기
			List<AccomoReview> accomoReview = reviewBO.getAccomoReviewList(accomodationId);
			
			// 클릭된 호텔 리뷰 점수 평점 가져오기
			int accomoReviewAVGPoint = reviewBO.getAccomoReviewAVGPoint(accomodationId);
			
			// 클릭된 호텔 리뷰 갯수 가져오기
			int accomoReviewRowCount = reviewBO.getAccomoReviewRowCount(accomodationId);
			
			model.addAttribute("accomoReviewRowCount", accomoReviewRowCount);
			model.addAttribute("accomoReviewAVGPoint", accomoReviewAVGPoint);
			model.addAttribute("accomodation", accomodation);
			model.addAttribute("facilities", facilities);
			model.addAttribute("roomFacilities", roomFacilities);
			model.addAttribute("rooms", rooms);
			model.addAttribute("accomoReview", accomoReview);
		}
		
		
		Integer userId = (Integer)session.getAttribute("userId");
		boolean thumbLike = false;
		if (reviewId != null) {
			thumbLike = thumbLikeBO.existThumbLikeByUserIdPostId(userId, reviewId);
		}
		if (thumbLike) {
			model.addAttribute("thumbLike", thumbLike);
		} else {
			model.addAttribute("thumbLike", thumbLike);
		}
		
		
		model.addAttribute("viewName", "category/accomodationDetail");
		
		return "template/layout";
	}
	
	// 관광지/추천 페이지 호출
	@GetMapping("/tourist_list_view")
	public String touristView(Model model) {
			
		List<Tourist> touristList = categoryBO.getTouristList();
		model.addAttribute("touristList", touristList);
		model.addAttribute("viewName", "category/touristList");
			
		return "template/layout";
	}
	
	// 관광지 상세 페이지 호출
	@GetMapping("/tourist_detail_view")
	public String touristDetailView(
			Model model,
			@RequestParam("touristId") int touristId) {

		// 관광지 객체 가져오기
		Tourist tourist = categoryBO.getTouristById(touristId);
		
		// 호텔 리스트 가져오기
		List<Accomodation> accomodationList = categoryBO.getAccomodationList(); 
		
		// 관광지 사진들 가져오기
		List<Tourist> touristPic = categoryBO.getTouristPicById(touristId);
		
		model.addAttribute("touristPic", touristPic);
		model.addAttribute("accomodationList", accomodationList);
		model.addAttribute("tourist", tourist);
		model.addAttribute("viewName", "category/touristDetail");
		
		return "template/layout";
	}
	
//	@GetMapping("/category/{reviewId}")
//	public Map<String, Object> thumbLike(
//			HttpSession session,
//			@PathVariable int reviewId,
//			Model model) {
//		
//		Map<String, Object> result = new HashMap<>();
//		Integer userId = (Integer)session.getAttribute("userId");
//		if (userId == null) {
//			result.put("code", 500);
//			result.put("error", "로그인이 필요합니다.");
//		}
//		
//		boolean thumbLike = thumbLikeBO.existThumbLikeByUserIdPostId(userId, reviewId);
//		
//		if (thumbLike) {
//			result.put("code", true);
//		} else {
//			result.put("code", false);
//		}
//		model.addAttribute("thumbLike", thumbLike);
//		return result;
//	}
	
	// 호텔/예약 페이지 호텔 노출
//		@GetMapping("/accomodation_test")
//		public String accomodationListView(
//				@RequestParam(value="checkIn", required=false) String checkIn,
//				@RequestParam(value="checkOut", required=false) String checkOut,
//				@RequestParam(value="headCount", required=false) Integer headCount,
//				Model model) {
//			Map<String, Object> result = new HashMap<>();
//			if(checkIn != null) {
//				//List<Accomodation> availableHotelList = categoryBO.searchAvailableHotel(checkIn, checkOut, headCount);
//				//model.addAttribute("availableRoomList", availableHotelList);
//				// 호텔 리스트
//				result.put("code", 200);
//			}
//			
//			
//			List<Accomodation> accomodationList = categoryBO.getAccomodationList(); 
//			model.addAttribute("accomodationList", accomodationList);
//			model.addAttribute("viewName", "category/accomodationList");
//			model.addAttribute("result", result);
//			return "template/layout";
//		}
}
