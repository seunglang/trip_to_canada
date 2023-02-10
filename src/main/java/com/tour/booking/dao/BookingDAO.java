package com.tour.booking.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface BookingDAO {
	
	// 방 예약 테스트
	public int reserveRoom(
			@Param("startDate") String startDate,
			@Param("accomoId") int accomoId,
			@Param("roomId") int roomId);
}
