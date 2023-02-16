package com.tour.booking.bo;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tour.booking.dao.BookingDAO;
import com.tour.booking.model.ReserveRoom;

@Service
public class BookingBO {

	@Autowired
	private BookingDAO bookingDAO;
	
//	// 사용자 id로 리뷰 작성을 위한 이용 확인하기
	public int searchReserveRoomByUserIdAccomoId(int userId, int accomoId) {
		
		//int experienced = bookingDAO.searchReserveRoomByUserIdAccomoId(userId, accomoId, now);
		// userid와 accomoId로 이용했던 내역 행을 가져와서 여기서 비교를 해주자
		ReserveRoom reserveRoom = getReserveRoomByUserIdAccomoId(userId, accomoId);
		if (reserveRoom == null) {
			return 0;
		}
		
		LocalDate parseCheckOut = LocalDate.parse(reserveRoom.getCheckOut());
		LocalDate now = LocalDate.now();
		int limitedDays = (int)ChronoUnit.DAYS.between(parseCheckOut, now);
		if (parseCheckOut.isBefore(now)) {
			if (limitedDays > 30) {
				return 1;
			}
			return 2;
		}
		return 0;
	}

	// 검색 버튼 클릭 시 예약 가능한 방 띄우기
	public int searchAvailableHotel(String checkIn, String checkOut, Integer headCount, int accomoId, int roomId) {
		
		// String to LocalData 파싱
		LocalDate checkInDate = LocalDate.parse(checkIn, DateTimeFormatter.ISO_LOCAL_DATE);
		// String to Local Data 파싱
		LocalDate checkOutDate = LocalDate.parse(checkOut, DateTimeFormatter.ISO_LOCAL_DATE);
		
		// 에약된 방 리스트
		List<ReserveRoom> roomReserve = getReserveRoomList();
		int count = 0;
		
		// List<ReserveRoom> avaliableToReserveRoom = null;
		
		
		for (int i = 0; i < roomReserve.size(); i++) {
			String startDate = roomReserve.get(i).getCheckIn();
			String endDate = roomReserve.get(i).getCheckOut();
			int ReservedroomId = roomReserve.get(i).getRoomId();
			LocalDate parseStartDate = LocalDate.parse(startDate, DateTimeFormatter.ISO_LOCAL_DATE);
			LocalDate parseEndDate = LocalDate.parse(endDate, DateTimeFormatter.ISO_LOCAL_DATE);
			// 데이터베이스로 기간 중복 쿼리 혹은 조건문으로 중복 되는 날짜를 걸러보자
			if (parseStartDate.isBefore(checkOutDate) && parseEndDate.isAfter(checkInDate) && ReservedroomId == roomId) { //(checkInDate.isAfter(parseDate) && checkInDate.isBefore(checkOutDate)) && checkOutDate.compareTo(parseDate) != 0
				count++;
				// 중복되는 날짜가 있으면 들어온다.
				//roomReserve.remove(i);
				//roomReserve.set(i, null);
//				count--;
//				i--;
			}
		}

		return count;
	}

	// 방 예약 테스트
	public int reserveRoom(String startDate, String endDate, int accomoId, int roomId, int userId, int headCount) {

		// checkIn - (checkOut -1) 순차적으로 계산을 하면 숙박 날짜만 테이블에 쌓이게 된다.
//		Calendar addDays = Calendar.getInstance();
//		
//		LocalDate StartDate = LocalDate.parse(startDate, DateTimeFormatter.ISO_LOCAL_DATE);
//		LocalDate EndDate = LocalDate.parse(endDate, DateTimeFormatter.ISO_LOCAL_DATE);
//		//Period testtest =  Period.between(StartDate, EndDate); - 사용x
//		int days = (int) ChronoUnit.DAYS.between(StartDate, EndDate);
//		//String a = "20230404";
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//		
////		Date checkInDate = sdf.parse(a); - 사용x
//		//String date = sdf.format(new Date(startDate)); - 사용x
//		// 2023 02 11 => 2023 03 12  - 사용x
//		addDays.add(Calendar.MONTH, -1);
//		addDays.add(Calendar.DATE, -1); // 선택한 체크인 날짜부터 카운트 시작 
//				
//		String test = null;
//		
//		//List<String> date = new ArrayList<>();
//		int count = 0;
//		for (int i = 0; i < days; i++) {
//			addDays.add(Calendar.DATE, 1);
//			test = sdf.format(addDays.getTime());
//			bookingDAO.reserveRoom(test, accomoId, roomId, userId, headCount);
//			count++;
//			//date.add(sdf.format(addDays.getTime())); - 사용x
//		}
		return bookingDAO.reserveRoom(startDate, endDate, accomoId, roomId, userId, headCount);
	}

	public List<ReserveRoom> getReserveRoomList() {
		return bookingDAO.selectReserveRoomList();
	}
	
	// 이용 내역 확인하기 위한 단일 행 가져오기
	public ReserveRoom getReserveRoomByUserIdAccomoId(int userId, int accomoId) {
		return bookingDAO.getReserveRoomByUserIdAccomoId(userId, accomoId);
	}
}
