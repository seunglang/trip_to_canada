package com.tour.booking;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.tour.booking.bo.BookingBO;

@RequestMapping("/booking")
@RestController
public class BookingRestController {
	
	@Autowired
	private BookingBO bookingBO;

	// 방 예약
	@PostMapping("/room")
	public Map<String, Object> reserveRoom(@RequestParam("startDate") String startDate,
			@RequestParam("endDate") String endDate, @RequestParam("roomId") int roomId,
			@RequestParam("accomoId") int accomoId) {

		Map<String, Object> result = new HashMap<>();
		
		int test = bookingBO.reserveRoom(startDate, accomoId, roomId);
		
		if (test == 1) {
			result.put("code", 200);
		}

		return result;
	}
}
