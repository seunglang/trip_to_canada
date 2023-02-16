<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div id="hotelDetailInfoBox" class="pt-3">
	<h2 class="hotel-name-font-margin">${accomodation.name}</h2>
	<h2 class="hotel-name-font-margin">${accomodation.englishName}</h2>
	<div>★★★★☆ 4,346건의 리뷰 (임시)</div>
	<img src="/static/image/map.png" width="16px" class="mr-1" alt="mapIcon"><span>${accomodation.address}</span>&nbsp; <span class="symbol">|</span> &nbsp;<span><img src="/static/image/phoneNumber.png" width="16px" alt="phoneIcon">${accomodation.phoneNumber}</span>&nbsp; <span class="symbol">|</span> &nbsp; <span><img src="/static/image/email.png" width="16px" alt="email"> ${accomodation.email}</span>
	<span class="hotel-detail-info-box"><a href="/review/review_form_view?accomodationId=${accomodation.id}" class="review-hover"><img src="/static/image/review.png" class="mr-1" width="16px" alt="reviewIcon">리뷰</a></span>&nbsp;<span class="symbol">|</span>&nbsp;<span><img src="/static/image/heart.png" class="mx-1" width="16px" alt="saveIcon">저장</span>&nbsp; <span class="symbol">|</span> &nbsp;<span><img src="/static/image/share.png" class="mr-1" width="16px" alt="shareIcon">공유</span>
</div>
<div id="hotelDetailBackGroundColor">
	<%-- 달력과 호텔 사진들 --%>
	<div id="hotelDetailContentsBox">
		<div class="d-flex">
			<%-- justify-content-center 지우면 박스 생김 --%>
			<div id="hotelDetailCalendar" class="mt-3">
				<div>체크인 날짜</div>
				<input class="form-control col-8" id="">
				<div>체크아웃 날짜</div>
				<input class="form-control col-8" id="">
				<button type="button" class="btn btn-primary form-control col-8 mt-2">검색</button>
				
			</div>
			<div id="hotelDetailThumbnail" class="mt-3 ml-5">
				<img src="${accomodation.thumbnailPic}" width="815px" height="400px" alt="hotelPic">
			</div>
		</div>
		<div id="roomInfo"><a href="#moveToHotelRooms" class="move-to-hotel-rooms">객실을 살펴보고 싶다면 스크롤을 밑으로 내려보세요 ! 다양한 객실 유형이 준비되어있습니다.</a></div>
		
		<%-- 호텔시설 및 객실 특징 --%>	
		<div id="hotelDetailFacilitiesAndRoom" class="mt-4 border rounded">	
			<h2 class="pt-3 pl-4 intro-padding">소개</h2>
			<hr align="center" class="hr-width">
			<%-- 호텔 소개 --%>
			<div class="d-flex">
				<div id="hotelIntroduction">
					<img src="/static/image/map.png" width="30px" alt="mapIcon" class="ml-4 mb-2"><h4 class="d-inline ml-2">${accomodation.englishName}</h4>
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
		<%-- 구글맵 지도 --%>
		<div id="googleMapBox" class="mt-4 border rounded">
			<h2 class="pt-3 pl-4 intro-padding">위치</h2>
			<hr align="center" class="hr-width">
			<div class="d-flex">
				<div>
					<div id="googleMap" class="ml-4 rounded"></div>
				</div>
				<div>
					<div class="ml-4"><img src="/static/image/map.png" width="20px" alt="mapIcon" class="mr-2">주변 관광명소</div>
					<div id="googleMapCoordinate" class="ml-3" data-latitude-code="${accomodation.latitude}" data-longitude-code="${accomodation.longitude}">
						<div class="ml-4 mt-2">${accomodation.accomoPlace}<img src="/static/image/walk.png" width="20px" class="mb-1"></div>
						<div class="ml-4 mt-2">${accomodation.accomoPlace2}<img src="/static/image/walk.png" width="20px" class="mb-1"></div>
						<div class="ml-4 mt-2">${accomodation.accomoPlace3}<img src="/static/image/walk.png" width="20px" class="mb-1"></div>
						<div class="ml-4 mt-2">${accomodation.accomoPlace4}<img src="/static/image/walk.png" width="20px" class="mb-1"></div>	
						<div class="ml-4 mt-5 small text-secondary smallText" id="btn2">*&nbsp;숙소 인근 식당과 명소에 대해 더 자세히 알아보세요 !</div>
					</div>
				</div>
			</div>
		</div>
		<%-- 체크인 데이트피커 --%>
		<h3 class="mt-3">객실을 선택하세요</h3>
		<div class="mt-4 d-flex align-items-center" id="datepickerBox">
			<input class="form-control col-2" id="startDate" placeholder="체크인">
			<input class="form-control col-2 ml-2" id="endDate" placeholder="체크아웃">
			<input type="number" class="form-control col-2 ml-2" id="roomHeadCount" placeholder="인원 수" min="2" max="4">
			<%-- <button type="button" class="btn btn-secondary form-control col-1 ml-2" id="searchAvailableRoom" data-accomo-id="${accomodation.id}" data-room-id="${room.id}">검색</button> --%>
		</div>
		<%-- room에 썸네일 추가해서 방 대표 사진 받아와야 한다. --%>
		<c:forEach items="${rooms}" var="room">
			<div id="hotelRoomInfoAndPic" class="mt-3 d-flex border rounded">
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
						<%-- <c:forEach items="${roomReserveList}" var="avaliableRoom">
							<button type="button">테스트</button>
							<div>테스트</div>
						</c:forEach> --%>
						<button type="button" class="btn reserve-btn form-control mt-1" data-headcount="${room.headcount}" data-accomo-id="${accomodation.id}" data-room-id="${room.id}">예약하기</button>
						<div class="small text-danger warningText">예약하실 날짜를 선택해주세요 !</div>
				</div>
				<div>
					<%-- 여기에도 방 예약에 유용한 다른 내용들을 넣어주자 --%>
					<span class="ml-3"></span>
				</div>
			</div>
		</c:forEach>
		<div id="reviewBox" class="mt-4">
			<h3 class="mb-3">${accomodation.englishName} 실제 투숙객 작성 후기</h3>
			<c:forEach items="${accomoReview}" var="review">
			<c:set var="customerName" value="${review.userName}" />
				<div class="reviewDetailBox border rounded">
					<div class="name-margin-custom"><span class="name-custom ml-2"><span class="font-weight-bold">${fn:substring(customerName, 0, 2)}*</span>님이 이 리뷰를 작성하셨습니다.</span><span class="ml-2"><fmt:formatDate value="${review.createdAt}" pattern="yyyy년 MM월"/></span></div>
					<div class="ml-3">
						<c:choose>
							<c:when test="${review.point == 5}">
								⭐⭐⭐⭐⭐<span class="small ml-1">매우만족</span>
							</c:when>
							<c:when test="${review.point == 4}">
								⭐⭐⭐⭐<span class="small ml-1">만족</span>
							</c:when>
							<c:when test="${review.point == 3}">
								⭐⭐⭐<span class="small ml-1">보통</span>
							</c:when>
							<c:when test="${review.point == 2}">
								⭐⭐<span class="small ml-1">불만</span>
							</c:when>
							<c:when test="${review.point == 1}">
								⭐<span class="small ml-1">매우불만</span>
							</c:when>
						</c:choose>
					</div>
					<div class="title-custom font-weight-bold mx-5 mt-4">“${review.reviewTitle}”</div>
					<div class="mx-5 mt-2 content-custom">${review.reviewContent}</div>
					<c:set var="checkIn" value="${review.checkIn}" />
					<div class="mx-5 stay-custom"><span class="font-weight-bold">숙박날짜:</span> ${fn:substring(checkIn, 0, 4)}년&nbsp;${fn:substring(checkIn, 5, 7)}월</div>
					<hr class="mx-5">
					<div class="mt-3 mb-3 mx-5 small text-secondary"><i>이 리뷰는 트립투캐나다 LLC의 의견이 아닌 트립투캐나다 회원의 주관적인 의견입니다. 트립투캐나다에서는 리뷰를 확인합니다.</i></div>
					<div>
						<a href="" class="help-thumb" onclick="return false" data-review-id="${review.id}" data-user-id="${userId}">
							<img src="/static/image/thumbUpWhite.png" width="17px" id="unfilledThumbLike" height="17px" alt="helped" class="unfilledThumbLike ml-5 mb-2 mr-1">
							<span class="helped-custom small font-weight-bold text-dark">도움이 됨</span>
							
							<%-- <c:choose>
								<c:when test="${thumbLike eq true}">
									<img src="/static/image/thumbUp.png" id="filledThumbLike" width="18" height="18" alt="filledThumbLike">
								</c:when>
								<c:when test="${thumbLike == false}">
									<img src="/static/image/thumbUpWhite.png" id="unfilledThumbLike" width="18" height="18" alt="unfilledThumbLike">
								</c:when>
							</c:choose> --%>
						</a>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>

<script>
	
	// 구글맵
	
	function myMap(){
		
		// 위도
		var latitude = $('#googleMapCoordinate').data('latitude-code');
		// 경도
		var longitude = $('#googleMapCoordinate').data('longitude-code');
		
		var hotel = {lat: latitude, lng:  longitude};
	    // 2-2. 구글 맵의 옵션 
	    var mapOptions = { 
	          // 지도의 중앙 위치 : 지정한 호텔
	          center:hotel
	          // 줌 레벨 : 15
	           , zoom:15
	           , disableDefaultUI:true
	           , zoomControl: true
	    };
	    
	    // 2. 구글 지도 생성(만들기)
	    // var map = new google.maps.Map(맵캔버스, 맵옵션들 );
	    var map = new google.maps.Map( 
	           document.getElementById("googleMap") 
	          , mapOptions );
	    
	    var marker = new google.maps.Marker({position: hotel, map: map});
	 }
 
	$(document).ready(function() {
		
		// 도움이 된 버튼 클릭
		$('.help-thumb').on('click', function(e) {
			//e.preventDefault();
			let reviewId = $(this).data('review-id');
			let userId = $(this).data('user-id');
			//alert(userId);
			if (userId == null) {
				alert("로그인이 필요한 서비스입니다.");
				return;
			}
			var imgTag = "<img src='/static/image/thumbUp.png'>";
			$.ajax({
				 url:"/thumbLike/" + reviewId
				
				, success:function(data) {
					if (data.code) {
						$('#unfilledThumbLike').attr("src", "/static/image/thumbUp.png");
						//document.location.reload();
					} else {
						$('#unfilledThumbLike').attr("src", "/static/image/thumbUpWhite.png");
						//document.location.reload();
					}
				}
				, error:function(e) {
					alert("오류");
				}
			});
		});
		
		// 체크인 체크아웃 인원수 선택 후 검색 버튼 눌렀을 때
		$('#searchAvailableRoom').on('click', function() {
			let startDate = $('#startDate').val();
			let endDate = $('#endDate').val();
			let roomHeadCount = $('#roomHeadCount').val();
			
			if (startDate == "") {
				alert("체크인 날짜를 선택해주세요.");
				return
			}
			if (endDate == "") {
				alert("체크아웃 날짜를 선택해주세요.");
				return
			}
			if (roomHeadCount == "") {
				alert("인원수를 선택해주세요");
				return;
			}
			
			let accomoId = $(this).data('accomo-id');
			//alert(roomId);
			
			$.ajax({
				// request
				type:"GET"
				, url:"/category/accomodation_detail_view"
				, data:{"accomodationId":accomoId, "startDate":startDate, "endDate":endDate, "accomoId":accomoId, "roomHeadCount":roomHeadCount}
			
				// response
				, success:function(data) {
					if (data.code == 200) {
						alert("검색 성공");
						//$(".reserve-btn").attr("disabled", false);
						//$('.warningText').addClass('d-none');
						document.location.reload();
					}
				}
				, error:function(e) {
					alert("제이쿼리 코드를 다시 한번 확인해보세요.");
				}
			});
		});
		
		
		// 체크아웃 날짜 선택되면 경고문 제거
		$('#endDate').on('change', function() {
			$('.warningText').addClass('d-none');
		});
		// disabled된 버튼을 스케줄을 선택했을 때 클릭 가능하게 
		$('.reserve-btn').on('click', function() {
			let startDate = $('#startDate').val();
			let endDate = $('#endDate').val();
			let roomHeadCount = $('#roomHeadCount').val();
			let headcount = $(this).data('headcount');
			//alert(roomHeadCount);
			//alert(headcount);
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
			if (roomHeadCount == "") {
				alert("인원수를 선택해주세요");
				return;
			}
			// 방 정원수와 선택한 인원수 validation
			if(headcount < roomHeadCount) {
				alert("인원수 초과입니다. 다른 방을 선택해주세요.");
				return;
			}
			if (roomHeadCount <= 1) {
				alert("숙박 인원은 최소 2명입니다.");
				return;
			}
			
			let roomId = $(this).data('room-id');
			let accomoId = $(this).data('accomo-id');
			//alert(accomoId);
			
			$.ajax({
				// request
				type:"POST"
				, url:"/booking/room"
				, data:{"startDate":startDate, "endDate":endDate, "roomId":roomId, "accomoId":accomoId, "roomHeadCount":roomHeadCount}
			
				// response
				, success:function(data) {
					if (data.code == 200) {
						alert("예약에 성공하셨습니다.");
						location.reload();
					} else {
						alert(data.errorMessage);
						location.reload();
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
            
	});
</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB89bEfB9sSe5k6PTr0cv0NhL1dj5rf2eU&callback=myMap"></script>
