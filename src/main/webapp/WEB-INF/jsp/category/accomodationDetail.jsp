<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="hotelDetailInfoBox" class="pt-3">
	<h2 class="hotel-name-font-margin">${accomodation.name}</h2>
	<h2 class="hotel-name-font-margin">${accomodation.englishName}</h2>
	<div>★★★★☆ 4,346건의 리뷰 (임시)</div>
	<img src="/static/image/map.png" width="16px" class="mr-1" alt="mapIcon"><span>${accomodation.address}</span>&nbsp; <span class="symbol">|</span> &nbsp;<span><img src="/static/image/phoneNumber.png" width="16px" alt="phoneIcon">${accomodation.phoneNumber}</span>&nbsp; <span class="symbol">|</span> &nbsp; <span><img src="/static/image/email.png" width="16px" alt="email"> ${accomodation.email}</span>
	<span class="hotel-detail-info-box"><img src="/static/image/review.png" class="mr-1" width="16px" alt="reviewIcon">리뷰</span>&nbsp;<span class="symbol">|</span>&nbsp;<span><img src="/static/image/heart.png" class="mr-1" width="16px" alt="saveIcon">저장</span>&nbsp; <span class="symbol">|</span> &nbsp;<span><img src="/static/image/share.png" class="mr-1" width="16px" alt="shareIcon">공유</span>
</div>
<div id="hotelDetailBackGroundColor">
	<%-- 달력과 호텔 사진들 --%>
	<div id="hotelDetailContentsBox">
		<div class="d-flex">
			<%-- justify-content-center 지우면 박스 생김 --%>
			<div id="hotelDetailCalendar d-flex justify-content-center" class="mt-3">
				<div>체크인 날짜</div>
				<input class="form-control col-8" id="startDate">
				<div>체크아웃 날짜</div>
				<input class="form-control col-8" id="endDate">
			</div>
			<div id="hotelDetailThumbnail" class="mt-3 ml-5">
				<img src="${accomodation.thumbnailPic}" width="815px" height="400px" alt="hotelPic">
			</div>
		</div>
		<div id="roomInfo"><a href="#moveToHotelRooms" class="move-to-hotel-rooms">객실을 살펴보고 싶다면 스크롤을 밑으로 내려보세요 ! 다양한 객실 유형이 준비되어있습니다.</a></div>
		<%-- 호텔시설 및 객실 특징 --%>	
		<div id="hotelDetailFacilitiesAndRoom" class="mt-4">
			<h2 class="pt-3 pl-4 intro-padding">소개</h2>
			<hr align="center" class="hr-width">
			<%-- 호텔 소개 --%>
			<div class="d-flex">
				<div id="hotelIntroduction">
					<img src="/static/image/map.png" width="30px" alt="mapIcon" class="ml-4"><h4 class="ml-1 d-inline">인근 명소</h4>
					<div class="ml-4 mt-2">Royal Alexandra Theatre - 도보 5분</div>
					<div class="ml-4 mt-2">Toronto Symphony Orchestra - 도보 15분</div>
					<div class="ml-4 mt-2">Princess of Wales Theatre - 도보 10분</div>
					<div class="ml-4 mt-2">The Second City Toronto - 도보 10분</div>
					<div class="mx-4 mt-4">${accomodation.intro}</div>
					<div class="mx-4 mt-4">${accomodation.intro2}</div>
					<div class="mx-4 mt-4">${accomodation.intro3}</div>
				</div>
				<%-- 편의 시설, 객실 특징 --%>
				<div id="hotelIntroduction" class="p-3">
					<%-- 호텔 편의 시설 --%>
					<div class="font-weight-bold ml-1">편의 시설</div>
					<div class="d-flex ml-1 mt-2">
						<div class="mt-3">
							<div class="d-flex">
								<c:if test="${facilities.EVCS eq 'Y'}">
									<img src="/static/image/evcs.png" width="16px" height="20px" alt="gym"><div class="ml-2">전기차 충전소</div>
								</c:if>
							</div>
							<div class="d-flex mt-4">
								<c:if test="${facilities.pool eq 'Y'}">
									<img src="/static/image/pool.png" width="16px" height="20px" alt="evcs" class=""><div class="ml-2">풀</div>
								</c:if>
							</div>
							<div class="d-flex mt-4">
								<c:if test="${facilities.barLounge eq 'Y'}">
									<img src="/static/image/lounge.png" width="16px" height="20px" alt="evcs" class=""><div class="ml-2">바/라운지</div>
								</c:if>
							</div>
							<div class="d-flex mt-4">
								<c:if test="${facilities.petAllowed eq 'Y'}">
									<img src="/static/image/pet.png" width="16px" height="20px" alt="evcs" class=""><div class="ml-2">반려동물 허용</div>
								</c:if>
							</div>
							<div class="d-flex mt-4">
								<c:if test="${facilities.fitness eq 'Y'}">
									<img src="/static/image/gym.png" width="16px" height="20px" alt="evcs" class=""><div class="ml-2">헬스장</div>
								</c:if>
							</div>
						</div>
						<div class="mt-3 ml-5">
							<div class="d-flex">
								<c:if test="${facilities.wifi eq 'Y'}">
									<img src="/static/image/internet.png" width="16px" height="20px" alt="gym"><div class="ml-2">무료 인터넷</div>
								</c:if>
							</div>
							<div class="d-flex mt-4">
								<c:if test="${facilities.luggageStorage eq 'Y'}">
									<img src="/static/image/luggage.png" width="16px" height="20px" alt="gym"><div class="ml-2">수화물 보관소</div>
								</c:if>
							</div>
							<div class="d-flex mt-4">
								<c:if test="${facilities.banquetHall eq 'Y'}">
									<img src="/static/image/ban.png" width="16px" height="20px" alt="evcs" class=""><div class="ml-2">연회장</div>
								</c:if>
							</div>
							<div class="d-flex mt-4">
								<c:if test="${facilities.valetParking eq 'Y'}">
									<img src="/static/image/valet.png" width="16px" height="20px" alt="evcs" class=""><div class="ml-2">발렛파킹</div>
								</c:if>
							</div>
						</div>
					</div>
					
					<%-- 객실 특징 --%>
					<div class="font-weight-bold ml-1 mt-5">객실 특징</div>
					<div class="d-flex ml-1 mt-2">
						<div class="mt-3">
							<div class="d-flex">
								<c:if test="${roomFacilities.blackoutCurtain eq 'Y'}">
									<img src="/static/image/curtain.png" width="16px" height="20px" alt="gym"><div class="ml-2">암막커튼</div>
								</c:if>
							</div>
							<div class="d-flex mt-4">
								<c:if test="${roomFacilities.roomService eq 'Y'}">
									<img src="/static/image/roomservice.png" width="16px" height="20px" alt="evcs" class=""><div class="ml-2">룸서비스</div>
								</c:if>
							</div>
							<div class="d-flex mt-4">
								<c:if test="${roomFacilities.refridge eq 'Y'}">
									<img src="/static/image/refridge.png" width="16px" height="20px" alt="evcs" class=""><div class="ml-2">냉장고</div>
								</c:if>
							</div>
							<div class="d-flex mt-4">
								<c:if test="${roomFacilities.coffeeMaker eq 'Y'}">
									<img src="/static/image/coffee.png" width="16px" height="20px" alt="evcs" class=""><div class="ml-2">커피/티 메이커</div>
								</c:if>
							</div>
							<div class="d-flex mt-4">
								<c:if test="${roomFacilities.safe eq 'Y'}">
									<img src="/static/image/safe.png" width="16px" height="20px" alt="evcs" class=""><div class="ml-2">안전금고</div>
								</c:if>
							</div>
						</div>
						<div class="mt-3 ml-5">
							<div class="d-flex">
								<c:if test="${roomFacilities.airConditioner eq 'Y'}">
									<img src="/static/image/aircon.png" width="16px" height="18px" alt="gym" class="mt-1"><div class="ml-2">에어컨</div>
								</c:if>
							</div>
							<div class="d-flex mt-4">
								<c:if test="${roomFacilities.kitchenette eq 'Y'}">
									<img src="/static/image/kitchen.png" width="16px" height="18px" alt="gym"><div class="ml-2">간이주방</div>
								</c:if>
							</div>
							<div class="d-flex mt-4">
								<c:if test="${roomFacilities.TV eq 'Y'}">
									<img src="/static/image/tv.png" width="16px" height="18px" alt="evcs" class=""><div class="ml-2">TV</div>
								</c:if>
							</div>
							<div class="d-flex mt-4">
								<c:if test="${roomFacilities.morningCall eq 'Y'}">
									<img src="/static/image/morningCall.png" width="16px" height="18px" alt="evcs" class=""><div class="ml-2">모닝콜</div>
								</c:if>
							</div>
							<div class="d-flex mt-4">
								<c:if test="${roomFacilities.telephone eq 'Y'}">
									<img src="/static/image/telephone.png" width="16px" height="18px" alt="evcs" class=""><div class="ml-2">전화기</div>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%-- room에 썸네일 추가해서 방 대표 사진 받아와야 한다. --%>
		<c:forEach items="${rooms}" var="room">
			<div id="hotelRoomInfoAndPic" class="mt-5 d-flex">
				<img src="${room.thumbnailPic}" alt="roomPic" width="270px" height="200px" class="">
				<div class="pl-3 test123" id="roomIntroBox">
					<div class="pt-2" id="moveToHotelRooms"><a href="#" class="roomType-hover">${room.roomType}</a></div>
					<div class="pt-2 icon-room-font"><img src="/static/image/bedIcon.png" width="20px" alt="roomIcon" class="mr-2">${room.bedType}</div>
					<div class="mt-2 room-intro-font">${room.roomIntro}</div>
					<div class="mt-3">
						<%-- 여기서도 조건문을 통해 어떤 전망인지에 따라서 아이콘을 나누고, 전망은 최대 5개로 제한해보자 --%>
						<%-- 조식 여부도 테이블 컬럼 수정을 해서 포함이 되지 않았을 때 조식 가격도 입력받아서 넣어주자 --%>
						<img src="/static/image/cityView.png" width="20px" alt="cityViewIcon"><span class="small ml-1 icon-room-font">${room.view}</span>
						<%-- 여기서 조건문을 통해 금연실 혹은 흡연실에 따라서 흡연 아이콘을 다르게 넣어주자 --%>
						<img src="/static/image/smoke.png" width="20px" alt="smokeIcon" class="ml-2"><span class="room-intro-font ml-1">${room.smoke}</span>
					</div>
					<div class="room-intro-font mt-3">${room.floor}</div>
				</div>
				<div class="mt-3 pl-3">
						<div class="room-intro-font">정원: ${room.headcount}명</div>
						<div class="room-intro-font mt-1 breakfast">${room.breakfast}</div>
						<div class="oneNightCost mt-5">1박 요금: ￦${room.roomPrice}</div>
						<button type="button" class="btn reserve-btn form-control mt-1" data-accomo-id="${accomodation.id}" data-room-id="${room.id}">예약하기</button>
				</div>
				<div>
					<%-- 여기에도 방 예약에 유용한 다른 내용들을 넣어주자 --%>
					<span class="ml-3"></span>
				</div>
			</div>
		</c:forEach>
	</div>
</div>

<script>
	$(document).ready(function() {
		
		
		$('.reserve-btn').on('click', function() {
			let startDate = $('#startDate').val();
			let endDate = $('#endDate').val();
			//alert(startDate);
			//alert(endDate);
			if (startDate == "") {
				alert("체크인 날짜를 선택해주세요.");
				return
			}
			if (endDate == "") {
				alert("체크아웃 날짜를 선택해주세요.");
				return
			}
			let roomId = $(this).data('room-id');
			let accomoId = $(this).data('accomo-id');
			//alert(accomoId);
			
			$.ajax({
				// request
				type:"POST"
				, url:"/booking/room"
				, data:{"startDate":startDate, "endDate":endDate, "roomId":roomId, "accomoId":accomoId}
			
				// response
				, success:function(data) {
					if (data.code == 200) {
						alert("예약에 성공하셨습니다.");
					}
				}
				, error:function(e) {
					alert("제이쿼리 코드를 다시 한번 확인해보세요.");
				}
			});
			
		});
			 
			$.datepicker.setDefaults({
                dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'] // 요일을 한글로 변경
                , dateFormat: 'yy-mm-dd'
            });

            // 오늘 날짜로 이동하는 함수
            $.datepicker._gotoToday = function(id) {
                $(id).datepicker('setDate', new Date()).datepicker('hide').blur();
            };


            

            $('#endDate').datepicker({
                minDate:0 
            });
			$('#startDate').datepicker({
                showButtonPanel: true // 오늘 버튼 노출
                , minDate:0 // 오늘과 그 이후만 선택 가능

                // 시작일이 선택되는 순간 종료일의 minDate 변경
                , onSelect:function(dateText) {
                    $('#endDate').datepicker('option', 'minDate', dateText);
                }
            });
            var hdpkr = new HotelDatepicker(document.getElementById("input-id"), options);
            
	});
</script>
