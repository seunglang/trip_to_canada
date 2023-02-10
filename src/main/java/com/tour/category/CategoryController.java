package com.tour.category;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tour.category.bo.CategoryBO;
import com.tour.category.model.Accomodation;
import com.tour.category.model.Facilities;
import com.tour.category.model.Room;
import com.tour.category.model.RoomFacilities;

@RequestMapping("/category")
@Controller
public class CategoryController {
	
	@Autowired
	private CategoryBO categoryBO;
	
	// 호텔/예약 페이지 호출
	@GetMapping("/accomodation_list_view")
	public String accomodationView(Model model) {
		
		// 호텔 리스트
		List<Accomodation> accomodationList = categoryBO.getAccomodationList(); 
		model.addAttribute("accomodationList", accomodationList);
		model.addAttribute("viewName", "category/accomodationList");
		
		return "template/layout";
	}
	
	// 호텔 상세페이지 호출
	@GetMapping("/accomodation_detail_view")
	public String accomodationDetailView(
			@RequestParam("accomodationId") int accomodationId,
			Model model) {
		
		// 클릭된 호텔 객체 가져오기
		Accomodation accomodation = categoryBO.getAccomodationById(accomodationId);
		
		// 클릭된 호텔의 편의시설 가져오기
		Facilities facilities = categoryBO.getFacilitiestById(accomodationId);
		
		// 클릭된 호텔의 객실 특징 가져오기
		RoomFacilities roomFacilities = categoryBO.getRoomFacilitiesById(accomodationId);
		
		// 클릭된 호텔 방 가져오기
		List<Room> rooms = categoryBO.getRoomById(accomodationId);
		
		model.addAttribute("accomodation", accomodation);
		model.addAttribute("facilities", facilities);
		model.addAttribute("roomFacilities", roomFacilities);
		model.addAttribute("rooms", rooms);
		model.addAttribute("viewName", "category/accomodationDetail");
		
		return "template/layout";
	}
}
