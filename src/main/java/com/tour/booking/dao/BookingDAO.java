package com.tour.booking.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.tour.booking.model.ReserveRoom;

@Repository
public interface BookingDAO {
	
	
	// 이용 내역 확인하기 위한 단일 행 가져오기
	public ReserveRoom getReserveRoomByUserIdAccomoId(
			@Param("userId") int userId,
			@Param("accomoId") int accomoId);
	
	// 방 예약
	public int reserveRoom(
			@Param("checkIn") String checkIn,
			@Param("checkOut") String checkOut,
			@Param("accomoId") int accomoId,
			@Param("roomId") int roomId,
			@Param("userId") int userId,
			@Param("headCount") int headCount);
	
	// 예약된 방 리스트 가져오기
	public List<ReserveRoom> selectReserveRoomList();
}
