package com.tour.booking;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.tour.booking.bo.BookingBO;
import com.tour.booking.model.ReserveRoom;

import jakarta.servlet.http.HttpSession;

@RequestMapping("/booking")
@RestController
public class BookingRestController {
	
	@Autowired
	private BookingBO bookingBO;

	// 방 예약
	@PostMapping("/room")
	public Map<String, Object> reserveRoom(
			@RequestParam("startDate") String startDate, 
			@RequestParam("endDate") String endDate,
			@RequestParam(value="roomId", required=false) Integer roomId,
			@RequestParam("accomoId") int accomoId,
			@RequestParam("roomHeadCount") int headCount, 
			HttpSession session,
			Model model) {
		
		Map<String, Object> result = new HashMap<>();
		
		// 비로그인 유저 예약 불가
		String userLoginId = (String)session.getAttribute("userLoginId");
		Integer userId = (Integer)session.getAttribute("userId");
		
		
		if (roomId != null) {
			int test = bookingBO.reserveRoom(startDate, endDate, accomoId, roomId, userId, headCount);
			
			if (test > 0) {
				result.put("code", 200);
			}
		} else if (roomId == null) {
			List<ReserveRoom> roomReserveList = bookingBO.searchAvailableHotel(startDate, endDate, headCount, accomoId);
			model.addAttribute("roomReserveList", roomReserveList);
			result.put("code", 200);
		}

		return result;
	}
}
