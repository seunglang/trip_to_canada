package com.tour.booking.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tour.booking.dao.BookingDAO;

@Service
public class BookingBO {
	
	@Autowired
	private BookingDAO bookingDAO;
	
	// 방 예약 테스트
	public int reserveRoom(String startDate, int accomoId, int roomId) {
		return bookingDAO.reserveRoom(startDate,accomoId, roomId);
	}
}
