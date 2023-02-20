<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="qwe"></div>
	<div id="touristBGColor">
	<div id="touistPicList" class="mt-4 touristContentBGBox" >
		<%-- <span>사진</span>
		<img src="${tourist.thumbnailPic}">
		<span>사진</span> --%>
		
		<div class="swiper-container">
			<div class="swiper-wrapper">
				<c:forEach items="${touristPic}" var="touristPic">
					<div class="swiper-slide"><img src="${touristPic}"></div>
				</c:forEach>
			</div>
			<!-- 네비게이션 -->
			<div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
			<div class="swiper-button-prev"></div><!-- 이전 버튼 -->
		
			<!-- 페이징 -->
			<div class="swiper-pagination"></div>
		</div>
	</div>
	<div id="touristInfoList" class="px-4 pt-3 touristContentBGBox">
		<h4 class="font-weight-bold">${tourist.name}</h4>
		<h4 class="font-weight-bold">${tourist.englishName}</h4>
		<div>리뷰</div>
		<hr>
		<span><span class="font-weight-bold text-success">운영시간</span> : ${tourist.operatingTime}</span>&nbsp;&nbsp;&nbsp;<span><span class="font-weight-bold">추천 관광시간</span> : ${tourist.recommendTime}시간</span>
		<div class="mt-1"><span class="font-weight-bold">주소</span> : ${tourist.address}&nbsp;${tourist.zipCode}</div>
		<hr>
		<div>가장 최신 리뷰 가져오기</div>
	</div>

	<div id="touristPoint" class="touristContentBGBox mt-3 px-4">
		<h4 class="font-weight-bold pt-4">관광지 핵심 포인트</h4>
		<br>
		<div>${tourist.intro}</div>
		<br>
		<div>${tourist.intro2}</div>
		<br>
	</div>
	<div id="touristLocation" class="touristContentBGBox mt-3 px-4">
		<h4 class="font-weight-bold pt-4">위치</h4>
		<div class="d-flex">
			<div>
				<div id="touristGoogleMap" class="rounded mt-4 mb-4"></div>
				<div id="googleMapCoordinate" data-latitude-code="${tourist.latitude}" data-longitude-code="${tourist.longitude}"></div>
			</div>
			<div id="touristAccomoBox" class="border rounded">
				<div class="tourist-hotel-box ml-3">
					<div class="font-weight-bold">호텔 함께 알아보기</div>
					<c:forEach items="${accomodationList}" var="accomoList">
						<div class="border rounded mt-3 img-link tourist-accomo-img" onClick="location.href='/category/accomodation_detail_view?accomodationId=${accomoList.id}'">
							<div class="d-flex">
								<img src="${accomoList.thumbnailPic}" alt="호텔 사진" width="120px" height="100px" id="figureImg" class="p-2">
								<div class="tourist-accomo-font mt-2">
									<div class="font-weight-bold tourist-accomo-length">${accomoList.name}</div>
									<div class="tourist-accomo-length">위치 : ${accomoList.address}</div>
									<div class="tourist-accomo-price" class="text-primary"><span class="font-weight-bold text-primary">￦</span><span class="text-primary">${accomoList.price}</span></div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
	//구글맵
	
	function myMap(){
		
		// 위도
		var latitude = $('#googleMapCoordinate').data('latitude-code');
		// 경도
		var longitude = $('#googleMapCoordinate').data('longitude-code');
		
		var tourist = {lat: latitude, lng:  longitude};
	    // 2-2. 구글 맵의 옵션 
	    var mapOptions = { 
	          // 지도의 중앙 위치 : 지정한 호텔
	          center:tourist
	          // 줌 레벨 : 15
	           , zoom:15
	           , disableDefaultUI:true
	           , zoomControl: true
	    };
	    
	    // 2. 구글 지도 생성(만들기)
	    // var map = new google.maps.Map(맵캔버스, 맵옵션들 );
	    var map = new google.maps.Map( 
	           document.getElementById("touristGoogleMap") 
	          , mapOptions );
	    
	    var marker = new google.maps.Marker({position: tourist, map: map});
	 }
	
	$(document).ready(function() {
		new Swiper('.swiper-container', {

			slidesPerView : 1, // 동시에 보여줄 슬라이드 갯수
			spaceBetween : 30, // 슬라이드간 간격
			slidesPerGroup : 1, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음

			// 그룹수가 맞지 않을 경우 빈칸으로 메우기
			// 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듬
			loopFillGroupWithBlank : true,

			loop : true, // 무한 반복

			pagination : { // 페이징
				el : '.swiper-pagination',
				clickable : true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
			},
			navigation : { // 네비게이션
				nextEl : '.swiper-button-next', // 다음 버튼 클래스명
				prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
			},
		});
	}) ;
</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB89bEfB9sSe5k6PTr0cv0NhL1dj5rf2eU&callback=myMap"></script>