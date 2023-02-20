<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="d-flex justify-content-center">
	<div class="login-box">
		<legend class="mt-5">상품 추가란</legend>
		<%-- 키보드 Enter키로 로그인이 될 수 있도록 form 태그를 만들어준다.(submit 타입의 버튼이 동작됨) --%>
		<div class="sign-up">
			<div class="border rounded p-3 sign-up-shape">
				<form id="loginForm" action="/category/add_category_info" method="post">
					<%-- 카테고리 추가 --%>
					<span class="small ml-1">카테고리 추가 * &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span>
					<span class="small">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;속성 *</span>
					<div class="d-flex mb-2">
						<input type="text" class="form-control col-5" id="categoryName" name="categoryName">
						<input type="text" class="form-control col-5 ml-3" id="categoryAttr" name="categoryAttr">
						<button type="button" class="btn btn-sm btn-primary ml-2" id="addCategoryBtn">추가</button>
					</div>
					<%-- 카테고리 수정 --%>
					<div class="small mb-1 ml-1">카테고리 수정 *</div>
					<div class="d-flex">
						<select class="form-control col-5" id="updateCategoryByName" name="updateCategoryByName">
							<option value="none">--선택--</option>
							<c:forEach items="${categoryList}" var="list">
								<option value="${list.categoryAttr}">${list.categoryName}</option>
							</c:forEach>
						</select>
						<button type="button" id="updateCategoryBtn" data-backdrop="static" data-toggle="modal" data-target="#updateModalTarget" class="btn-modal btn btn-sm btn-danger ml-3">수정</button>
					</div>
					<%-- 카테고리 삭제 --%>
					<div class="small mb-1 ml-1 mt-2">카테고리 삭제 *</div>
					<div class="d-flex">
						<select class="form-control col-5" id="deleteCategoryByName" name="deleteCategoryByName">
							<option value="none">--선택--</option>
							<c:forEach items="${categoryList}" var="list">
								<option value="${list.categoryAttr}">${list.categoryName}</option>
							</c:forEach>
						</select>
						<button type="button" id="deleteCategoryBtn" data-backdrop="static" data-toggle="modal" data-target="#deleteModalTarget" class="btn btn-modal btn-sm btn-danger ml-3">삭제</button>
					</div>
					<br><hr>
					<legend id="postLegend">글 작성</legend>
					<%-- 카테고리 선택 시 input이 태그들이 바뀐다. --%>
					<div class="small mt-4 ml-1">카테고리 선택 *</div>
					<select class="form-control col-5 mt-1" id="selectCategory" name="selectCategory">
						<option value="none">--선택--</option>
						<c:forEach items="${categoryList}" var="list">
							<option value="${list.categoryAttr}">${list.categoryName}</option>
						</c:forEach>
					</select>
					<div class="d-flex d-none" id="accomoRadio">
						<label for="accomoInput" class="small m-1 d-none" id="accomoInputId">호텔/예약</label><input type="radio" name="accomoType" value="1" id="accomoInput" class="mr-1 d-none" checked>
						<label for="accomoRoom" class="small m-1 d-none" id="accomoRoomId">호텔 방</label><input type="radio" name="accomoType" value="2" id="accomoRoom" class="mr-1 d-none">
						<label for="accomoFacilities" class="small m-1 d-none" id="accomoFacilitiesId">편의시설</label><input type="radio" name="accomoType" value="3" id="accomoFacilities" class="d-none">
						<label for="roomFacilities" class="small m-1 d-none" id="roomFacilitiesId">객실특징</label><input type="radio" name="accomoType" value="4" id="roomFacilities" class="d-none">
					</div>
					<div class="small text-danger mt-1 ml-1" id="selectCategoryWarn">※&nbsp;카테고리를 선택해주세요.</div>
					
					<%-- 호텔 정보 입력란 --%>
					<div class="mt-3 d-none" id="accomoInputBox">
						<legend class="mb-4 d-none" id="accomoForm">호텔 정보 입력란</legend>
						<div class="small ml-1 mb-1">호텔 이름 * </div>
						<div class="d-flex align-items-center">
							<input type="text" id="accomoName" name="accomoName" class="form-control col-12" placeholder="name of accomodation"/>
						</div>
						<div class="small ml-1 mb-1 mt-3">호텔 영어 이름 * </div>
						<div class="d-flex align-items-center">
							<input type="text" id="accomoEnglishName" name="accomoEnglishName" class="form-control col-12" placeholder="name of accomodation"/>
						</div>
						<div class="small ml-1 mb-1 mt-3">호텔 메인주소(영어로 기재) * </div>
						<div class="d-flex align-items-center">
							<input type="text" id="accomoMainAddress" name="accomoMainAddress" class="form-control col-12 input-lg" placeholder="Main Street ex) 29th Avenue"/>
						</div>
						<div class="small ml-1 mb-1 mt-3">호텔 우편주소(영어로 기재) * </div>
						<div class="d-flex align-items-center">
							<input type="text" id="accomoZipCode" name="accomoZipCode" class="form-control col-12 input-lg" placeholder="Zip Code ex) V7R 4J1"/>
						</div>
						<div class="small ml-1 mb-1 mt-3">호텔 소개 (1) *</div>
						<div class="d-flex align-items-center">
							<textarea class="form-control" id="accomoIntro" name="accomoIntro" placeholder="정보" rows="5"></textarea>
						</div>
						<div class="small ml-1 mb-1 mt-3">호텔 소개 (2) *</div>
						<div class="d-flex align-items-center">
							<textarea class="form-control" id="accomoIntro2" name="accomoIntro2" placeholder="정보" rows="5"></textarea>
						</div>
						<div class="small ml-1 mb-1 mt-3">호텔 소개 (3) *</div>
						<div class="d-flex align-items-center">
							<textarea class="form-control" id="accomoIntro3" name="accomoIntro3" placeholder="정보" rows="5"></textarea>
						</div>
						<div class="small ml-1 mb-1 mt-3">인근 명소 (1) *</div>
						<div class="d-flex align-items-center">
							<input type="text" id="accomoPlace" name="accomoPlace" class="form-control col-10 input-lg" placeholder="Royal Alexandra Theatre - 도보 5분"/>
						</div>
						<div class="small ml-1 mb-1 mt-3">인근 명소 (2) *</div>
						<div class="d-flex align-items-center">
							<input type="text" id="accomoPlace2" name="accomoPlace2" class="form-control col-10 input-lg" placeholder="''"/>
						</div>
						<div class="small ml-1 mb-1 mt-3">인근 명소 (3) *</div>
						<div class="d-flex align-items-center">
							<input type="text" id="accomoPlace3" name="accomoPlace3" class="form-control col-10 input-lg" placeholder="''"/>
						</div>
						<div class="small ml-1 mb-1 mt-3">인근 명소 (4) *</div>
						<div class="d-flex align-items-center">
							<input type="text" id="accomoPlace4" name="accomoPlace4" class="form-control col-10 input-lg" placeholder="''"/>
						</div>
						<div class="small ml-1 mb-1 mt-3">위도(구글맵api) *</div>
						<div class="d-flex align-items-center">
							<input type="text" id="accomolatitude" name="accomolatitude" class="form-control col-10 input-lg" placeholder="43.64705552448648"/>
						</div>
						<div class="small ml-1 mb-1 mt-3">경도(구글맵api) *</div>
						<div class="d-flex align-items-center">
							<input type="text" id="accomolongitude" name="accomolongitude" class="form-control col-10 input-lg" placeholder="-79.39181461534038"/>
						</div>
						<div class="small ml-1 mb-1 mt-3">호텔 가격 *</div>
						<div class="d-flex align-items-center">
							<input type="text" id="accomoPrice" name="accomoPrice" class="form-control col-6 input-lg" placeholder="ex) ￦130,000"/>
						</div>
						<div class="small ml-1 mb-1 mt-3">호텔 연락처 *</div>
						<div class="d-flex align-items-center">
							<input type="text" id="accomoPhoneNumber" name="accomoPhoneNumber" class="form-control col-12 input-lg" placeholder="ex) 010-1234-4567"/>
						</div>
						<div class="small ml-1 mb-1 mt-3">호텔 이메일 *</div>
						<div class="d-flex align-items-center">
							<input type="text" id="accomoEmail" name="accomoEmail" class="form-control col-12 input-lg" placeholder="email"/>
						</div>
					</div>
					
					<%-- 관광지 정보 입력란 --%>
					<div class="d-none mt-3" id="touristInputForm">
						<legend class="mb-4 d-none" id="touristForm">관광지 정보 입력란</legend>
						<div class="small ml-1 mb-1 mt-3">관광지 이름 * </div>
						<div class="d-flex align-items-center">
							<input type="text" id="touristName" name="touristName" class="form-control col-12" placeholder="name of tourists(Korean)"/>
						</div>
						<div class="small ml-1 mb-1 mt-3">관광지 이름(영어로 기재) * </div>
						<div class="d-flex align-items-center">
							<input type="text" id="touristEnglishName" name="touristEnglishName" class="form-control col-12" placeholder="name of tourists"/>
						</div>
						<div class="small ml-1 mb-1 mt-3">관광지 메인주소(영어로 기재) * </div>
						<div class="d-flex align-items-center">
							<input type="text" id="touristMainAddress" name="touristMainAddress" class="form-control col-12 input-lg" placeholder="Main Street ex) 29th Avenue"/>
						</div>
						<div class="small ml-1 mb-1 mt-3">관광지 우편주소(영어로 기재) * </div>
						<div class="=d-flex align-items-center">
							<input type="text" id="touristZipCode" name="touristZipCode" class="form-control col-12 input-lg" placeholder="Zip Code ex) V7R 4J1"/>
						</div>
						<div class="small ml-1 mb-1 mt-3">관광지 정보 *</div>
						<div class="d-flex align-items-center">
							<textarea class="form-control" id="touristIntro" name="touristIntro" placeholder="정보" rows="7"></textarea>
						</div>
						<div class="small ml-1 mb-1 mt-3">관광지 정보 *</div>
						<div class="d-flex align-items-center">
							<textarea class="form-control" id="touristIntro2" name="touristIntro2" placeholder="정보" rows="7"></textarea>
						</div>
						<div class="small ml-1 mb-1 mt-3">관광지 웹사이트 *</div>
						<div class="d-flex align-items-center">
							<input type="text" id="touristWebsite" name="touristWebsite" class="form-control col-6 input-lg" placeholder="ex) http://..."/>
						</div>
						<div class="small ml-1 mb-1 mt-3">추천 관광시간 *</div>
						<div class="d-flex align-items-center">
							<input type="text" id="touristRecommendTime" name="touristRecommendTime" class="form-control col-6 input-lg" placeholder="ex) 1~2hour"/>
						</div>
						<div class="small ml-1 mb-1 mt-3">관광지 입장료 *</div>
						<div class="d-flex align-items-center">
							<input type="text" id="touristPrice" name="touristPrice" class="form-control col-6 input-lg" placeholder="ex) ￦130,000"/>
						</div>
						<div class="small ml-1 mb-1 mt-3">관광지 연락처 *</div>
						<div class="d-flex align-items-center">
							<input type="text" id="touristPhoneNumber" name="touristPhoneNumber" class="form-control col-12 input-lg" placeholder="ex) 010-1234-4567"/>
						</div>
						<div class="small ml-1 mb-1 mt-3">관광지 이메일 *</div>
						<div class="d-flex align-items-center">
							<input type="text" id="touristEmail" name="touristEmail" class="form-control col-12 input-lg" placeholder="email"/>
						</div>
						<div class="small ml-1 mb-1 mt-3">관광지 운영시간 *</div>
						<div class="d-flex align-items-center">
							<input type="text" id="touristOperatingTime" name="touristOperatingTime" class="form-control col-12 input-lg" placeholder="10am~9pm"/>
						</div>
						<div class="small ml-1 mb-1 mt-3">위도(구글맵api) *</div>
						<div class="d-flex align-items-center">
							<input type="text" id="touristlatitude" name="touristlatitude" class="form-control col-10 input-lg" placeholder="43.64705552448648"/>
						</div>
						<div class="small ml-1 mb-1 mt-3">경도(구글맵api) *</div>
						<div class="d-flex align-items-center">
							<input type="text" id="touristlongitude" name="touristlongitude" class="form-control col-10 input-lg" placeholder="-79.39181461534038"/>
						</div>
					</div>
					<%-- 식당 정보 입력란 --%>
					<div class="d-none mt-3" id="restaurantInputForm">
						<legend class="mb-4 d-none" id="restaurantForm">식당 정보 입력란</legend>
						<div class="small ml-1 mb-1 mt-3">식당 이름(영어로 기재) * </div>
						<div class="d-flex align-items-center">
							<input type="text" id="restaurantName" name="restaurantName" class="form-control col-12" placeholder="name of accomodation"/>
						</div>
						<div class="small ml-1 mb-1 mt-3">식당 메인주소(영어로 기재) * </div>
						<div class="d-flex align-items-center">
							<input type="text" id="restaurantMainAddress" name="restaurantMainAddress" class="form-control col-12 input-lg" placeholder="Main Street ex) 29th Avenue"/>
						</div>
						<div class="small ml-1 mb-1 mt-3">식당 우편주소(영어로 기재) * </div>
						<div class="d-flex align-items-center">
							<input type="text" id="restaurantZipCode" name="restaurantZipCode" class="form-control col-12 input-lg" placeholder="Zip Code ex) V7R 4J1"/>
						</div>
						<div class="small ml-1 mb-1 mt-3">식당 정보 *</div>
						<div class="d-flex align-items-center">
							<textarea class="form-control" id="restaurantIntro" name="restaurantIntro" placeholder="정보" rows="10"></textarea>
						</div>
						<div class="small ml-1 mb-1 mt-3">식사 제공 시간 *</div>
						<div class="d-flex align-items-center">
							<input type="text" id="restaurantAvailableToServe" name="restaurantAvailableToServe" class="form-control col-10 input-lg" placeholder="only lunch(1pm~3pm break time), dinner"/>
						</div>
						<div class="small ml-1 mb-1 mt-3">음식 유형 *</div>
						<div class="d-flex align-items-center">
							<input type="text" id="restaurantType" name="restaurantType" class="form-control col-10 input-lg" placeholder="meal type ex) 일식, 지중해 etc.."/>
						</div>
						<div class="small ml-1 mb-1 mt-3">음식 가격대 *</div>
						<div class="d-flex align-items-center">
							<input type="text" id="restaurantPrice" name="restaurantPrice" class="form-control col-6 input-lg" placeholder="30,000~50,000"/>
						</div>
						<div class="small ml-1 mb-1 mt-3">식당 연락처 *</div>
						<div class="d-flex align-items-center">
							<input type="text" id="restaurantPhoneNumber" name="restaurantPhoneNumber" class="form-control col-12 input-lg" placeholder="ex) 010-1234-4567"/>
						</div>
						<div class="small ml-1 mb-1 mt-3">식당 운영시간 *</div>
						<div class="d-flex align-items-center">
							<input type="text" id="restaurantOperatingTime" name="restaurantOperatingTime" class="form-control col-12 input-lg" placeholder="ex) 9am ~ 5pm"/>
						</div>
						<div class="small ml-1 mb-1 mt-3">식당 해피아워 여부 및 시간대 *</div>
						<div class="d-flex align-items-center">
							<input type="text" id="restaurantHappyHour" name="restaurantHappyHour" class="form-control col-12 input-lg" placeholder="ex) 1pm ~ 2:30pm"/>
						</div>
					</div>
					<%-- 여행 정보 입력란 --%>
					<div class="d-none mt-3" id="travleTipInputForm">
						<legend class="mb-4 d-none" id="travleTipForm">여행 TIP 정보 입력란</legend>
						<div class="small ml-1 mb-1 mt-3">필수품 *</div>
						<div class="d-flex align-items-center">
							<textarea id="travleTipVitalItem" name="travleTipVitalItem" class="form-control col-12" rows="10"/></textarea>
						</div>
						<div class="small ml-1 mb-1 mt-3">문화 *</div>
						<div class="d-flex align-items-center">
							<textarea id="travleTipCulture" name="travleTipCulture" class="form-control" rows="10"/></textarea>
						</div>
						<div class="small ml-1 mb-1 mt-3">알고가면 좋을 상식 *</div>
						<div class="d-flex align-items-center">
							<textarea id="travleTipCommonSense" name="travleTipCommonSense" class="form-control" rows="10"/></textarea>
						</div>
						<div class="small ml-1 mb-1 mt-3">먹어보면 좋은 음식 *</div>
						<div class="d-flex align-items-center">
							<textarea class="form-control" id="travleTipRecommended" name="travleTipRecommended" rows="10"></textarea>
						</div>
						<div class="small ml-1 mb-1 mt-3">주의사항 *</div>
						<div class="d-flex align-items-center">
							<textarea id="travleTipWarning" name="travleTipWarning" class="form-control" rows="10"/></textarea>
						</div>
					</div>
					<%-- 패키지 정보 입력란 --%>
					<div class="d-none mt-3" id="packageInputForm">
						<legend class="mb-4 d-none" id="packageForm">패키지 정보 입력란</legend>
						<div class="small ml-1 mb-1 mt-3">패키지 이름(영어로 기재) * </div>
						<div class="d-flex align-items-center">
							<input type="text" id="packageName" name="packageName" class="form-control col-12" placeholder="name of package"/>
						</div>
						<div class="small ml-1 mb-1 mt-3">패키지 메인주소(영어로 기재) * </div>
						<div class="d-flex align-items-center">
							<input type="text" id="packageMainAddress" name="packageMainAddress" class="form-control col-12 input-lg" placeholder="Main Street ex) 29th Avenue"/>
						</div>
						<div class="small ml-1 mb-1 mt-3">패키지 우편주소(영어로 기재) * </div>
						<div class="d-flex align-items-center">
							<input type="text" id="packageZipCode" name="packageZipCode" class="form-control col-12 input-lg" placeholder="Zip Code ex) V7R 4J1"/>
						</div>
						<div class="small ml-1 mb-1 mt-3">패키지 소개 *</div>
						<div class="d-flex align-items-center">
							<textarea class="form-control" id="packageIntro" name="packageIntro" placeholder="정보" rows="10"></textarea>
						</div>
						<div class="small ml-1 mb-1 mt-3">패키지 가격 *</div>
						<div class="d-flex align-items-center">
							<input type="text" id="packagePrice" name="packagePrice" class="form-control col-6 input-lg" placeholder="ex) 14,000"/>
						</div>
						<div class="small ml-1 mb-1 mt-3">패키지 소요시간 *</div>
						<div class="d-flex align-items-center">
							<input type="text" id="packageDurationTime" name="packageDurationTime" class="form-control col-12 input-lg" placeholder="ex) 25~30분"/>
						</div>
						<div class="small ml-1 mb-1 mt-3">패키지 유형 *</div>
						<div class="d-flex align-items-center">
							<input type="text" id="packageField" name="packageField" class="form-control col-12 input-lg" placeholder="패키지 유형 ex)액티비티, 관람, etc..."/>
						</div>
						<div class="small ml-1 mb-1 mt-3">패키지 운영시간 *</div>
						<div class="d-flex align-items-center">
							<input type="text" id="packageOperatingTime" name="packageOperatingTime" class="form-control col-12 input-lg" placeholder="9am ~ 5pm"/>
						</div>
					</div>
					<%-- 공용 썸네일 사진 --%>
					<div class="small ml-1 mt-3 d-none" id="thumbnailDivBox">썸네일 첨부 *</div>
					<div class="file-upload d-flex">
						<%-- file 태그는 숨겨두고 이미지를 클릭하면 file 태그를 클릭한 것처럼 이벤트를 줄 것이다. --%>
						<input type="file" id="file" name="file" class="d-none" accept=".gif, .jpg, .png, .jpeg">
						<%-- 이미지에 마우스 올리면 마우스커서가 링크 커서가 변하도록 a 태그 사용 --%>
						<a href="#" id="fileUploadBtn"><img width="30" src="/static/image/thumbnail.png" class="d-none mt-3" id="thumbnail"></a>
						<%-- 업로드 된 임시 파일 이름 저장될 곳 --%>
						<div id="fileName" class="ml-2 mt-4 d-none"></div>
					</div>
					<br>
					<button class="btn form-control btn-primary d-none" id="categoryFormBtn" type="submit">작성 완료</button>
				</form>
				
				<form  id="hotelForm" action="/category/add_hotel_info" method="post">
				<%-- 호텔 방 선택 selectBox --%>
				<div class="d-none mb-3" id="hotelSelectBox">
					<div class="small ml-1 mt-3">호텔 선택 *</div>
					<select class="form-control col-8" id="selectRoom" name="selectRoom">
						<option value="none">--선택--</option>
							<c:forEach items="${accomodationList}" var="list">
								<option value="${list.id}">${list.name}</option>
							</c:forEach>
					</select>
				</div>
				<%-- 호텔 방 정보 입력란 --%>
					<div class="d-none" id="accomoRoomBox">
						<legend class="mb-4 d-none" id="accomoRoomForm">호텔 방 정보 입력란</legend>
						<div class="small ml-1 mb-1">객실 설명 * </div>
						<div class="d-flex align-items-center">
							<textarea class="form-control" id="roomIntro" name="roomIntro" placeholder="객실에 대한 설명을 작성해주세요." rows="10"></textarea>
						</div>
						<div class="small ml-1 mb-1 mt-3">객실 타입 * </div>
						<div class="d-flex align-items-center">
							<input type="text" id="roomType" name="roomType" class="form-control col-12 input-lg" placeholder="ex) 스위트 룸"/>
						</div>
						<div class="small ml-1 mb-1 mt-3">침대 타입 * </div>
						<div class="d-flex align-items-center">
							<input type="text" id="bedType" name="bedType" class="form-control col-12 input-lg" placeholder="ex) 더블베드"/>
						</div>
						<div class="small ml-1 mb-1 mt-3">1박 요금 * </div>
						<div class="d-flex align-items-center">
							<input type="text" id="roomPrice" name="roomPrice" class="form-control col-12 input-lg" placeholder="ex) 175,000"/>
						</div>
						<div class="small ml-1 mb-1 mt-3">층 *</div>
						<div class="d-flex align-items-center">
							<input type="text" id="floor" name="floor" class="form-control col-12 input-lg" placeholder="ex) 17층"/>
						</div>
						<div class="small ml-1 mb-1 mt-3">뷰(전망) *</div>
						<div class="d-flex align-items-center">
							<input type="text" id="view" name="view" class="form-control col-6 input-lg" placeholder="ex) 리버뷰"/>
						</div>
						<div class="small ml-1 mb-1 mt-3">체크인 시간 *</div>
						<div class="d-flex align-items-center">
							<input type="text" id="checkIn" name="checkIn" class="form-control col-6 input-lg" placeholder="ex) 5PM"/>
						</div>
						<div class="small ml-1 mb-1 mt-3">체크아웃 시간 *</div>
						<div class="d-flex align-items-center">
							<input type="text" id="checkOut" name="checkOut" class="form-control col-12 input-lg" placeholder="ex) 11AM"/>
						</div>
						<div class="small ml-1 mb-1 mt-3">조식여부 *</div>
						<div class="d-flex align-items-center">
							<input type="text" id="breakfast" name="breakfast" class="form-control col-12 input-lg" placeholder="ex) 조식포함"/>
						</div>
						<div class="small ml-1 mb-1 mt-3">정원 *</div>
						<div class="d-flex align-items-center">
							<input type="text" id="headCount" name="headCount" class="form-control col-12 input-lg" placeholder="ex) 최대 3명"/>
						</div>
						<div class="small ml-1 mb-1 mt-3">흡연여부 *</div>
						<div class="d-flex align-items-center">
							<input type="text" id="smoke" name="smoke" class="form-control col-12 input-lg" placeholder="ex) 금연 혹은 흡연"/>
						</div>
						<%-- 호텔 방 썸네일 사진 --%>
						<div class="small ml-1 mt-3" id="hotelthumbnailDivBox">썸네일 첨부 *</div>
						<div class="file-upload d-flex">
							<%-- file 태그는 숨겨두고 이미지를 클릭하면 file 태그를 클릭한 것처럼 이벤트를 줄 것이다. --%>
							<input type="file" id="roomFile" name="roomFile" class="d-none" accept=".gif, .jpg, .png, .jpeg">
							<%-- 이미지에 마우스 올리면 마우스커서가 링크 커서가 변하도록 a 태그 사용 --%>
							<a href="#" id="roomFileUploadBtn"><img width="30" src="/static/image/thumbnail.png" class="mt-3" id="thumbnail"></a>
							<%-- 업로드 된 임시 파일 이름 저장될 곳 --%>
							<div id="roomFileName" class="ml-2 mt-4 d-none"></div>
						</div>
					</div>
					
					<%-- 편의시설 정보 입력란 --%>
					<div class="d-none" id="accomoFacilitiesBox">
						<legend class="mb-4 d-none" id="accomoFacilitiesForm">호텔 편의시설 유무 체크</legend>
						<div class="small ml-1 mb-1 mt-3">헬스장 * </div>
						<div class="d-flex align-items-center">
							<label for="fitnessY" class="small m-1">Yes</label>
							<input type="radio" name="fitnessRadio" value="Y" id="fitnessY" class="mr-1">
							<label for="fitnessN" class="small m-1">No</label>
							<input type="radio" name="fitnessRadio" value="N" id="fitnessN" class="mr-1" checked>
						</div>
						<div class="small ml-1 mb-1 mt-3">바/라운지 * </div>
						<div class="d-flex align-items-center">
							<label for="barLoungeY" class="small m-1">Yes</label>
							<input type="radio" name="barLoundeRadio" value="Y" id="barLoungeY" class="mr-1">
							<label for="barLoungeN" class="small m-1">No</label>
							<input type="radio" name="barLoundeRadio" value="N" id="barLoungeN" class="mr-1" checked>
						</div>
						<div class="small ml-1 mb-1 mt-3">수영장 * </div>
						<div class="d-flex align-items-center">
							<label for="poolY" class="small m-1">Yes</label>
							<input type="radio" name="poolRadio" value="Y" id="poolY" class="mr-1">
							<label for="poolN" class="small m-1">No</label>
							<input type="radio" name="poolRadio" value="N" id="poolN" class="mr-1" checked>
						</div>
						<div class="small ml-1 mb-1 mt-3">발렛주차 *</div>
						<div class="d-flex align-items-center">
							<label for="valetParkingY" class="small m-1">Yes</label>
							<input type="radio" name="valetParkingRadio" value="Y" id="valetParkingY" class="mr-1">
							<label for="valetParkingN" class="small m-1">No</label>
							<input type="radio" name="valetParkingRadio" value="N" id="valetParkingN" class="mr-1" checked>
						</div>
						<div class="small ml-1 mb-1 mt-3">전기자동차 충전소 *</div>
						<div class="d-flex align-items-center">
							<label for="EVCSY" class="small m-1">Yes</label>
							<input type="radio" name="EVCSRadio" value="Y" id="EVCSY" class="mr-1">
							<label for="EVCSN" class="small m-1">No</label>
							<input type="radio" name="EVCSRadio" value="N" id="EVCSN" class="mr-1" checked>
						</div>
						<div class="small ml-1 mb-1 mt-3">연회장 *</div>
						<div class="d-flex align-items-center">
							<label for="banquetHallY" class="small m-1">Yes</label>
							<input type="radio" name="banquetHallRadio" value="Y" id="banquetHallY" class="mr-1">
							<label for="banquetHallN" class="small m-1">No</label>
							<input type="radio" name="banquetHallRadio" value="N" id="banquetHallN" class="mr-1" checked>
						</div>
						<div class="small ml-1 mb-1 mt-3">반려동물 허용 *</div>
						<div class="d-flex align-items-center">
							<label for="petAllowedY" class="small m-1">Yes</label>
							<input type="radio" name="petAllowedRadio" value="Y" id="petAllowedY" class="mr-1">
							<label for="petAllowedN" class="small m-1">No</label>
							<input type="radio" name="petAllowedRadio" value="N" id="petAllowedN" class="mr-1" checked>
						</div>
						<div class="small ml-1 mb-1 mt-3">수하물 보관소 *</div>
						<div class="d-flex align-items-center">
							<label for="luggageStorageY" class="small m-1">Yes</label>
							<input type="radio" name="luggageStorageRadio" value="Y" id="luggageStorageY" class="mr-1">
							<label for="luggageStorageN" class="small m-1">No</label>
							<input type="radio" name="luggageStorageRadio" value="N" id="luggageStorageN" class="mr-1" checked>
						</div>
						<div class="small ml-1 mb-1 mt-3">무료 인터넷(와이파이) *</div>
						<div class="d-flex align-items-center">
							<label for="wifiY" class="small m-1">Yes</label>
							<input type="radio" name="wifiRadio" value="Y" id="wifiY" class="mr-1">
							<label for="wifiN" class="small m-1">No</label>
							<input type="radio" name="wifiRadio" value="N" id="wifiN" class="mr-1" checked>
						</div>
					</div>
					
					<%-- 객실 특징 정보 입력란 --%>
					<div class="d-none" id="accomoRoomFacilitiesBox">
						<legend class="mb-2" id="accomoFacilitiesForm">객실 특징 유무 체크</legend>
						<div class="small ml-1 mb-1 mt-4">암막커튼 * </div>
						<div class="d-flex align-items-center">
							<label for="curtainY" class="small m-1">Yes</label>
							<input type="radio" name="curtainRadio" value="Y" id="curtainY" class="mr-1">
							<label for="curtainN" class="small m-1">No</label>
							<input type="radio" name="curtainRadio" value="N" id="curtainN" class="mr-1" checked>
						</div>
						<div class="small ml-1 mb-1 mt-3">룸서비스 * </div>
						<div class="d-flex align-items-center">
							<label for="roomServiceY" class="small m-1">Yes</label>
							<input type="radio" name="roomServiceRadio" value="Y" id="roomServiceY" class="mr-1">
							<label for="roomServiceN" class="small m-1">No</label>
							<input type="radio" name="roomServiceRadio" value="N" id="roomServiceN" class="mr-1" checked>
						</div>
						<div class="small ml-1 mb-1 mt-3">모닝콜 서비스 * </div>
						<div class="d-flex align-items-center">
							<label for="morningCallY" class="small m-1">Yes</label>
							<input type="radio" name="morningCallRadio" value="Y" id="morningCallY" class="mr-1">
							<label for="morningCallN" class="small m-1">No</label>
							<input type="radio" name="morningCallRadio" value="N" id="morningCallN" class="mr-1" checked>
						</div>
						<div class="small ml-1 mb-1 mt-3">냉장고 *</div>
						<div class="d-flex align-items-center">
							<label for="refridgeY" class="small m-1">Yes</label>
							<input type="radio" name="refridgeRadio" value="Y" id="refridgeY" class="mr-1">
							<label for="refridgeN" class="small m-1">No</label>
							<input type="radio" name="refridgeRadio" value="N" id="refridgeN" class="mr-1" checked>
						</div>
						<div class="small ml-1 mb-1 mt-3">차 커피메이커 *</div>
						<div class="d-flex align-items-center">
							<label for="coffeeY" class="small m-1">Yes</label>
							<input type="radio" name="coffeeRadio" value="Y" id="coffeeY" class="mr-1">
							<label for="coffeeN" class="small m-1">No</label>
							<input type="radio" name="coffeeRadio" value="N" id="coffeeN" class="mr-1" checked>
						</div>
						<div class="small ml-1 mb-1 mt-3">TV *</div>
						<div class="d-flex align-items-center">
							<label for="TVY" class="small m-1">Yes</label>
							<input type="radio" name="TVRadio" value="Y" id="TVY" class="mr-1">
							<label for="TVN" class="small m-1">No</label>
							<input type="radio" name="TVRadio" value="N" id="TVN" class="mr-1" checked>
						</div>
						<div class="small ml-1 mb-1 mt-3">안전금고 *</div>
						<div class="d-flex align-items-center">
							<label for="safeY" class="small m-1">Yes</label>
							<input type="radio" name="safeRadio" value="Y" id="safeY" class="mr-1">
							<label for="safeN" class="small m-1">No</label>
							<input type="radio" name="safeRadio" value="N" id="safeN" class="mr-1" checked>
						</div>
						<div class="small ml-1 mb-1 mt-3">전화기 *</div>
						<div class="d-flex align-items-center">
							<label for="telephoneY" class="small m-1">Yes</label>
							<input type="radio" name="telephoneRadio" value="Y" id="telephoneY" class="mr-1">
							<label for="telephoneN" class="small m-1">No</label>
							<input type="radio" name="telephoneRadio" value="N" id="telephoneN" class="mr-1" checked>
						</div>
						<div class="small ml-1 mb-1 mt-3">에어컨 *</div>
						<div class="d-flex align-items-center">
							<label for="airConditionerY" class="small m-1">Yes</label>
							<input type="radio" name="airConditionerRadio" value="Y" id="airConditionerY" class="mr-1">
							<label for="airConditionerN" class="small m-1">No</label>
							<input type="radio" name="airConditionerRadio" value="N" id="airConditionerN" class="mr-1" checked>
						</div>
						<div class="small ml-1 mb-1 mt-3">간이주방 *</div>
						<div class="d-flex align-items-center">
							<label for="kitchenetteY" class="small m-1">Yes</label>
							<input type="radio" name="kitchenetteRadio" value="Y" id="kitchenetteY" class="mr-1">
							<label for="kitchenetteN" class="small m-1">No</label>
							<input type="radio" name="kitchenetteRadio" value="N" id="kitchenetteN" class="mr-1" checked>
						</div>
					</div>
					
					<button class="btn mt-4 form-control btn-success d-none" id="hotelFormBtn" type="submit">작성 완료</button>
				</form>
			</div>
		</div>
	</div>
</div>

<%-- 수정 Modal --%>
<div class="modal fade" id="updateModalTarget"> <!--  data-post-id="" -->
<form id="updateForm" action="/category/update_category" method="post">
	<%-- modal-sm : 작은 모달 창 --%>
	<%-- modal-dialog-centered : 수직으로 가운데 정렬 --%>
  	<div class="modal-dialog modal-sm modal-dialog-centered"> <!-- modal-dialog-centered 모달창을 가운데로 뜨게 하는 코드 -->
    	<div class="modal-content">
      		<div class="py-3 border-bottom">
      			<div class="d-flex">
      				<legend class="ml-4">카테고리 수정</legend>
	      			<a href="#"><img src="/static/image/xicon.png" width="30px" alt="cancleIcon" data-dismiss="modal" class="mr-4"></a>
      			</div>
	      		<div class="modal-body">
		      		<div class="small ml-2 mb-1">선택한 카테고리명 *</div>
	      			<input type="text" id="selected" name="selected" class="form-control col-11 ml-2" value="${selectedcategoryName}">
	      		</div>
      			<div class="small ml-4 mb-1">수정할 카테고리명 *</div>
      			<input type="text" id="changeCategoryName" name="changeCategoryName" class="form-control col-10 ml-4">
      			<div class="small ml-4 mb-1 mt-2">수정할 카테고리 속성 *</div>
      			<input type="text" id="changeCategoryAttr" name="changeCategoryName" class="form-control col-10 ml-4">
      			<div class="">
      				<button type="submit" id="updateCategoryNameAttrBtn" class="btn btn-primary form-control col-10 ml-4 mt-3">수정하기</button>
      			</div>
      		</div>
    	</div>
 	 </div>
</form>
</div>

<%-- 삭제 Modal --%>
<div class="modal fade" id="deleteModalTarget"> <!--  data-post-id="" -->
<form id="deleteForm" action="/category/delete_category" method="post">
	<%-- modal-sm : 작은 모달 창 --%>
	<%-- modal-dialog-centered : 수직으로 가운데 정렬 --%>
  	<div class="modal-dialog modal-sm modal-dialog-centered"> <!-- modal-dialog-centered 모달창을 가운데로 뜨게 하는 코드 -->
    	<div class="modal-content">
      		<div class="py-3 border-bottom">
      			<div class="d-flex">
      				<legend class="ml-4">카테고리 삭제</legend>
      			</div>
	      		<div class="modal-body">
		      		<!-- <div class="ml-2 mb-1" id="deletedCategoryName"></div> -->
		      		<div class="small ml-2 mb-1">선택한 카테고리명 *</div>
	      			<input type="text" id="deletedCategoryName" name="deletedCategoryName" class="form-control col-11 ml-2" value="${selectedcategoryName}">
	      			<div class="small text-danger ml-2 mb-1 mt-1">정말 삭제하시겠습니까?</div>
	      		</div>
      			<div class="">
      				<button type="submit" id="deleteCategoryNameAttrBtn" class="btn btn-danger form-control col-10 ml-4 mt-3">삭제하기</button>
      				<button type="button" id="calcleCategoryNameAttrBtn" data-dismiss="modal" class="btn btn-primary form-control col-10 ml-4 mt-3">취소하기</button>
      			</div>
      		</div>
    	</div>
 	 </div>
</form>
</div>

<script>
	$(document).ready(function() {
		
		// 카테고리 추가 버튼
		$('#addCategoryBtn').on('click', function() {
			let categoryName = $('#categoryName').val().trim();
			let categoryAttr = $('#categoryAttr').val().trim();
			//alert(categoryName);
			
			
			if (categoryName == "") {
				alert("추가할 카테고리 이름을 입력해주세요.");
				return;
			}
			
			if (categoryAttr == "") {
				alert("추가할 카테고리의 속성을 입력해주세요.");
				return;
			}
			
			$.ajax({
				// request
				type:"POST"
				, url:"/category/add_category"
				, data: {"categoryName":categoryName, "categoryAttr":categoryAttr}
				
				// response
				, success:function(data) {
					if (data.code == 200) {
						alert("카테고리 추가 성공");
						location.reload();
					} else {
						alert(data.errorMessage);
						location.reload();
					}
				}
				, error:function(e) {
					alert("에러 - 코드를 다시 한번 확인해보세요.");
					location.reload();
				}
			});
		});
		
		
		// 수정 모달창 input value 넘기기
		$('#updateCategoryByName').on('change', function() {
			var categoryName = $('#updateCategoryByName option:selected').text();
			//alert(data);
			
			$(document).on("click", ".btn-modal", function () {
				$(".modal-body #selected").val( categoryName );
			})
		});
		
		
		// 카테고리 수정 버튼
		$('#updateForm').submit(function(e) {
			e.preventDefault();
				
			let changeCategoryName = $('#changeCategoryName').val().trim();
			let changeCategoryAttr = $('#changeCategoryAttr').val().trim();
				
			let categoryName = $('#updateCategoryByName option:selected').text();
				
			//alert(categoryName);
				
			if (changeCategoryName == "") {
				alert("수정할 카테고리 이름을 입력해주세요.");
				return;
			}
			if (changeCategoryAttr == "") {
				alert("수정할 카테고리 속성을 입력해주세요.");
				return;
			}
			
			$.ajax({
				// request
				type:"PUT"
				, url:"/category/update_category"
				, data: {"categoryName":changeCategoryName, "categoryAttr":changeCategoryAttr, "checkName":categoryName}
					
				// response
				, success:function(data) {
					if (data.code == 200) {
						alert("카테고리 수정 성공!!");
						location.reload();
					} else {
						alert(data.errorMessage);
						location.reload();
					}
				}
				, error:function(e) {
					alert("에러 - 코드를 다시 한번 확인해보세요.");
					location.reload();
				}
			});
		});
		
		// 삭제 모달창 input value 넘기기
		$('#deleteCategoryByName').on('change', function() {
			var categoryName = $('#deleteCategoryByName option:selected').text();
			//alert(data);
			
			$(document).on("click", ".btn-modal", function () {
				/* $('#deletedCategoryName').text( categoryName + " 카테고리를 삭제하시겠습니까?"); */
				$(".modal-body #deletedCategoryName").val( categoryName );
			})
		});
		
		// 카테고리 삭제 버튼
		$('#deleteForm').submit(function(e) {
			e.preventDefault();
			
			let categoryName = $('#deleteCategoryByName option:selected').text();
			let categoryAttr = $('#deleteCategoryByName option:selected').val();
			
			
			
			$.ajax({
				// request
				type:"DELETE"
				, url:"/category/delete_category"
				, data:{"categoryName":categoryName}
				
				// response
				, success:function(data) {
					if (data.code == 200) {
						alert(data.result);
						location.reload();
					} else {
						alert(data.errorMessage)
					}
				}
				, error:function(e) {
					alert("삭제 실패. ajax 코드 확인 요망");
				}
			});
		});
		
		var count = 0;
		// 카테고리 선택 - onchange
		$('#selectCategory').on('change', function() {
			let selectCategoryAttr = $(this).val(); // 카테고리 선택 attr 
			
			// 카테고리 선택 경고 및 기타 구문
			$('#selectCategoryWarn').addClass('d-none');
			$('#thumbnail').addClass('d-none');
			$('#fileName').addClass('d-none');
			$('#postLegend').addClass('d-none');
			$('#thumbnailDivBox').addClass('d-none');
			$('#accomoRadio').addClass('d-none');
			$('#accomoInput').addClass('d-none');
			$('#accomoRoom').addClass('d-none');
			$('#accomoFacilities').addClass('d-none');
			$('#roomFacilities').addClass('d-none');
			$('#accomoInputId').addClass('d-none');
			$('#accomoRoomId').addClass('d-none');
			$('#accomoFacilitiesId').addClass('d-none');
			$('#roomFacilitiesId').addClass('d-none');
			$('#categoryFormBtn').addClass('d-none');		
			$('#accomoInputBox').addClass('d-none');
			$('#accomoForm').addClass('d-none');
			$('#hotelFormBtn').addClass('d-none');
			// 호텔 선택 셀렉트 박스 d-none
			$('#hotelSelectBox').addClass('d-none');
			
			// 호텔 호텔 룸 remove d-none or d-none
			$('#accomoRoomBox').addClass('d-none');
			
			// 호텔 편의시설 remove d-none or d-none
			$('#accomoFacilitiesBox').addClass('d-none');
			
			// 객실 특징 remove d-none or d-none
			$('#accomoRoomFacilitiesBox').addClass('d-none');
			
			// 관광지 클래스 remove d-none or d-none
			$('#touristInputForm').addClass('d-none');
			
			// 식당 클래스 remove d-none or d-none
			$('#restaurantInputForm').addClass('d-none');
			
			// 패키지 클래스 remove d-none or d-none
			$('#packageInputForm').addClass('d-none');
			
			// 여행 팁 클래스 remove d-none or d-none
			$('#travleTipInputForm').addClass('d-none');
			
			
			// 다른 속성의 셀렉트 값을 선택했을 때 내용물 비우기
			count++;
			if (count > 0) {
				$('#fileName').text("");
				count = 0;
			}
			
			
			// 파일업로드 이미지 클릭 => 숨겨져있는 file을 동작시킴
			$('#fileUploadBtn').on('click', function(e) {
				e.preventDefault(); // a 태그의 올라가는 현상 방지
				$('#file').click(); // input file을 클릭한 것과 같은 효과
			});
			
			// 사용자가 이미지를 선택했을 때 유효성 확인 및 업로드 된 파일 이름 노출
			$('#file').on('change', function(e) {
				//alert("파일 선택");
				let fileName = e.target.files[0].name; // 07_30_01.png
				//alert(fileName);
				
				// 확장자 유효성 확인
				let ext = fileName.split(".").pop().toLowerCase();
				if (ext != 'jpg' && ext != 'jpeg' && ext != 'gif' && ext != 'png') {
					alert("이미지 파일만 업로드 할 수 있습니다.");
					$('#file').val(''); // 파일 태그에 실제 파일 제거
					$("#fileName").text(''); // 파일 이름 비우기
					return;
				}
				
				// 유효성 통과한 이미지는 상자에 업로드 된 파일 이름 노출
				$('#fileName').text(fileName);
				
			});
			
			if (selectCategoryAttr == "accomodation") {
				// radio 버튼 show
				$('#accomoRadio').removeClass('d-none');
				$('#accomoInput').removeClass('d-none');
				$('#accomoRoom').removeClass('d-none');
				$('#accomoFacilities').removeClass('d-none');
				$('#accomoInputId').removeClass('d-none');
				$('#accomoRoomId').removeClass('d-none');
				$('#accomoFacilitiesId').removeClass('d-none');
				$('#roomFacilities').removeClass('d-none');
				$('#roomFacilitiesId').removeClass('d-none');
				
				// 호텔/예약 카테고리를 선택했을 때 디폴트 값으로 호텔 입력란에 대한 input 값들이 보여야한다.
				$('#accomoInputBox').removeClass('d-none');
				$('#accomoForm').removeClass('d-none');
				$('#thumbnail').removeClass('d-none');
				$('#fileName').removeClass('d-none');
				$('#thumbnailDivBox').removeClass('d-none');
				$('#categoryFormBtn').removeClass('d-none');
				
				 
				var fileCount = 0;				
				
				// radio 버튼 change 동적 이벤트 
				$('input[name="accomoType"]').on('change', function() {
					// 호텔 정보 입력란 d-none
					$('#accomoInputBox').addClass('d-none');
					$('#accomoForm').addClass('d-none');
					$('#thumbnail').addClass('d-none');
					$('#fileName').addClass('d-none');
					$('#thumbnailDivBox').addClass('d-none');
					$('#categoryFormBtn').addClass('d-none');
					
					// 호텔 방 입력란 d-none
					$('#accomoRoomBox').addClass('d-none');
					$('#accomoRoomForm').addClass('d-none');
					
					// 호텔 편의시설 체크란 d-none
					$('#accomoFacilitiesBox').addClass('d-none');
					$('#accomoFacilitiesForm').addClass('d-none');
					
					// 객실특징 체크란 d-none, 호텔 셀렉트박스
					$('#accomoRoomFacilitiesBox').addClass('d-none');
					
					// 호텔 폼 버튼 d-none
					$('#hotelFormBtn').addClass('d-none');
					
					// 호텔 선택 셀렉트박스 d-none
					$('#hotelSelectBox').addClass('d-none');
					
					
					// 다른 속성의 라디오 값을 선택했을 때 내용물 비우기
					fileCount++;
					//alert(fileCount);
					if (fileCount > 0) {
						$('#roomFileName').text("");
						fileCount = 0;
					}
					
					// 파일업로드 이미지 클릭 => 숨겨져있는 file을 동작시킴
					$('#roomFileUploadBtn').on('click', function(e) {
						e.preventDefault(); // a 태그의 올라가는 현상 방지
						$('#roomFile').click(); // input file을 클릭한 것과 같은 효과
					});
					
					// 사용자가 이미지를 선택했을 때 유효성 확인 및 업로드 된 파일 이름 노출
					$('#roomFile').on('change', function(e) {
						//alert("파일 선택");
						let fileName = e.target.files[0].name; // 07_30_01.png
						//alert(fileName);
						
						// 확장자 유효성 확인
						let ext = fileName.split(".").pop().toLowerCase();
						if (ext != 'jpg' && ext != 'jpeg' && ext != 'gif' && ext != 'png') {
							alert("이미지 파일만 업로드 할 수 있습니다.");
							$('#roomFile').val(''); // 파일 태그에 실제 파일 제거
							$("#roomFileName").text(''); // 파일 이름 비우기
							return;
						}
						
						// 유효성 통과한 이미지는 상자에 업로드 된 파일 이름 노출
						$('#roomFileName').text(fileName);
						
					});
					
					
					let accomoType = $(this).val();
					if (accomoType == '1') {
						$('#accomoInputBox').removeClass('d-none');
						$('#accomoForm').removeClass('d-none');
						$('#categoryFormBtn').removeClass('d-none');
						$('#thumbnail').removeClass('d-none');
						$('#fileName').removeClass('d-none');
						$('#thumbnailDivBox').removeClass('d-none');
					} else if (accomoType == 2) {
						$('#accomoRoomBox').removeClass('d-none');
						$('#accomoRoomForm').removeClass('d-none');
						// 카테고리 폼 버튼 d-none
						$('#categoryFormBtn').addClass('d-none');
						// 호텔 폼 버튼 remove d-none
						$('#hotelFormBtn').removeClass('d-none');
						// 호텔 셀렉트 박스 remove d-none
						$('#hotelSelectBox').removeClass('d-none');
						// file 이름 박스 d-none
						$('#roomFileName').removeClass('d-none');
					} else if (accomoType == 3) {
						$('#accomoFacilitiesBox').removeClass('d-none');
						$('#accomoFacilitiesForm').removeClass('d-none');
						// 카테고리 폼 버튼 d-none
						$('#categoryFormBtn').addClass('d-none');
						// 호텔 폼 버튼 remove d-none
						$('#hotelFormBtn').removeClass('d-none');
						// 호텔 셀렉트 박스 remove d-none
						$('#hotelSelectBox').removeClass('d-none');
					} else if (accomoType == 4) {
						$('#accomoRoomFacilitiesBox').removeClass('d-none');
						// 카테고리 폼 버튼 d-none
						$('#categoryFormBtn').addClass('d-none');
						// 호텔 폼 버튼 remove d-none
						$('#hotelFormBtn').removeClass('d-none');
						// 호텔 셀렉트 박스 remove d-none
						$('#hotelSelectBox').removeClass('d-none');
					}
				});
			}
			
			if (selectCategoryAttr == "none") {
				$('#selectCategoryWarn').removeClass('d-none');
				$('#postLegend').removeClass('d-none');
			}  else if (selectCategoryAttr == "tourist") {
				$('#touristInputForm').removeClass('d-none');
				$('#touristForm').removeClass('d-none');
				$('#thumbnail').removeClass('d-none');
				$('#fileName').removeClass('d-none');
				$('#thumbnailDivBox').removeClass('d-none');
				$('#categoryFormBtn').removeClass('d-none');
			} else if (selectCategoryAttr == "restaurant") {
				$('#restaurantInputForm').removeClass('d-none');
				$('#restaurantForm').removeClass('d-none');
				$('#thumbnail').removeClass('d-none');
				$('#fileName').removeClass('d-none');
				$('#thumbnailDivBox').removeClass('d-none');
				$('#categoryFormBtn').removeClass('d-none');
			} else if (selectCategoryAttr == "travleTip") {
				$('#travleTipInputForm').removeClass('d-none');
				$('#travleTipForm').removeClass('d-none');
				$('#thumbnail').removeClass('d-none');
				$('#fileName').removeClass('d-none');
				$('#thumbnailDivBox').removeClass('d-none');
				$('#categoryFormBtn').removeClass('d-none');
			} else if (selectCategoryAttr == "publicTransport") {
				
			} else if (selectCategoryAttr == "package") {
				$('#packageInputForm').removeClass('d-none');
				$('#packageForm').removeClass('d-none');
				$('#thumbnail').removeClass('d-none');
				$('#fileName').removeClass('d-none');
				$('#thumbnailDivBox').removeClass('d-none');
				$('#categoryFormBtn').removeClass('d-none');
			}
		});
		
		// 카테고리별 정보 저장
		$('#loginForm').submit(function(e) {
			e.preventDefault();
			
			// 선택한 카테고리의 속성 가져오기 - controller에서 사용할 예정
			let categoryAttr = $('#selectCategory option:selected').val();
			
			// 썸네일 데이터
			let file = $('#file').val();
			
			// 호텔 input 값들
			let accomoName = $('#accomoName').val();
			let accomoEnglishName = $('#accomoEnglishName').val();
			let accomoMainAddress = $('#accomoMainAddress').val();
			let accomoZipCode = $('#accomoZipCode').val();
			let accomoPrice = $('#accomoPrice').val();
			let accomoIntro = $('#accomoIntro').val();
			let accomoIntro2 = $('#accomoIntro2').val();
			let accomoIntro3 = $('#accomoIntro3').val();
			let accomoPlace = $('#accomoPlace').val();
			let accomoPlace2 = $('#accomoPlace2').val();
			let accomoPlace3 = $('#accomoPlace3').val();
			let accomoPlace4 = $('#accomoPlace4').val();
			let accomolatitude = $('#accomolatitude').val();
			let accomolongitude = $('#accomolongitude').val();
			let accomoPhoneNumber = $('#accomoPhoneNumber').val();
			let accomoEmail = $('#accomoEmail').val();
			let accomoType = $('#accomoType').val();
			let accomoBed = $('#accomoBed').val();
			
			// 관광지 input 값들
			let touristName = $('#touristName').val();
			let touristEnglishName = $('#touristEnglishName').val();
			let touristMainAddress = $('#touristMainAddress').val();
			let touristZipCode= $('#touristZipCode').val();
			let touristPrice = $('#touristPrice').val();
			let touristIntro = $('#touristIntro').val();
			let touristIntro2 = $('#touristIntro2').val();
			let touristWebsite = $('#touristWebsite').val();
			let touristRecommendTime = $('#touristRecommendTime').val();
			let touristPhoneNumber = $('#touristPhoneNumber').val();
			let touristEmail = $('#touristEmail').val();
			let touristOperatingTime = $('#touristOperatingTime').val();
			let touristlatitude = $('#touristlatitude').val();
			let touristlongitude = $('#touristlongitude').val();
			let touristThumbnail = $('#touristThumbnail').val();
			
			// 식당 input 값들
			let restaurantInputForm = $('#restaurantInputForm').val();
			let restaurantForm = $('#restaurantForm').val();
			let restaurantName = $('#restaurantName').val();
			let restaurantMainAddress = $('#restaurantMainAddress').val();
			let restaurantZipCode = $('#restaurantZipCode').val();
			let restaurantIntro = $('#restaurantIntro').val();
			let restaurantAvailableToServe = $('#restaurantAvailableToServe').val();
			let restaurantType = $('#restaurantType').val();
			let restaurantPrice = $('#restaurantPrice').val();
			let restaurantPhoneNumber = $('#restaurantPhoneNumber').val();
			let restaurantOperatingTime = $('#restaurantOperatingTime').val();
			let restaurantHappyHour = $('#restaurantHappyHour').val();
			
			// 패키지 input 값들
			let packageInputForm = $('#packageInputForm').val();
			let packageForm = $('#packageForm').val();
			let packageName = $('#packageName').val();
			let packageMainAddress = $('#packageMainAddress').val();
			let packageZipCode = $('#packageZipCode').val();
			let packageIntro = $('#packageIntro').val();
			let packagePrice = $('#packagePrice').val();
			let packageDurationTime = $('#packageDurationTime').val();
			let packageField = $('#packageField').val();
			let packageOperatingTime = $('#packageOperatingTime').val();
			
			// 여행 TIP input 값들
			let travleTipInputForm = $('#travleTipInputForm').val();
			let travleTipForm = $('#travleTipForm').val();
			let travleTipVitalItem = $('#travleTipVitalItem').val();
			let travleTipCulture = $('#travleTipCulture').val();
			let travleTipCommonSense = $('#travleTipCommonSense').val();
			let travleTipRecommended = $('#travleTipRecommended').val();
			let travleTipWarning = $('#travleTipWarning').val();
			
			// 호텔 validation 구문
			if (categoryAttr == "accomodation") {
				if (accomoName == "") {
					alert("호텔 이름을 입력하세요.");
					return;
				}
				if (accomoEnglishName == "") {
					alert("호텔 영어 이름을 입력하세요.");
					return;
				}
				if (accomoMainAddress == "") {
					alert("호텔 메인 주소를 입력하세요.");
					return;
				}
				if (accomoZipCode == "") {
					alert("호텔 우편 주소를 입력하세요.");
					return;
				}
				if (accomoPrice == "") {
					alert("호텔 가격을 입력하세요.");
					return;
				}
				if (accomoIntro == "") {
					alert("호텔 정보를 입력하세요.");
					return;
				}
				if (accomoIntro2 == "") {
					alert("호텔 정보를 입력하세요.");
					return;
				}
				if (accomoIntro3 == "") {
					alert("호텔 정보를 입력하세요.");
					return;
				}
				if (accomoPlace == "") {
					alert("인근 명소를 입력하세요.");
					return;
				}
				if (accomoPlace2 == "") {
					alert("인근 명소를 입력하세요.");
					return;
				}
				if (accomoPlace3 == "") {
					alert("인근 명소를 입력하세요.");
					return;
				}
				if (accomoPlace4 == "") {
					alert("인근 명소를 입력하세요.");
				}
				if (accomolatitude == "") {
					alert("위도를 입력하세요.");
					return;
				}
				if (accomolongitude == "") {
					alert("경도를 입력하세요.");
					return;
				}
				if (accomoPhoneNumber == "") {
					alert("호텔 연락처를 입력하세요.");
					return;
				}
				if (accomoEmail == "") {
					alert("호텔 이메일을 입력하세요.");
					return;
				}
				if (accomoType == "") {
					alert("객실 타입을 입력하세요.");
					return;
				}
				if (accomoBed == "") {
					alert("침대 타입을 입력하세요.");
					return;
				}
				if (file == "") {
					alert("사진을 추가하세요");
					return;
				}
			}
			
			// 관광지 validation 구문
			if (categoryAttr == "tourist") {
				if (touristName == "") {
					alert("관광지 이름을 입력하세요.");
					return;
				}
				if (touristEnglishName == "") {
					alert("관광지 영어 이름을 입력하세요.");
					return;
				}
				if (touristMainAddress == "") {
					alert("관광지 메인 주소를 입력하세요.");
					return;
				}
				if (touristZipCode == "") {
					alert("관광지 우편 주소를 입력하세요.");
					return;
				}
				if (touristIntro == "") {
					alert("관광지 정보를 입력하세요.");
					return;
				}
				if (touristIntro2 == "") {
					alert("관광지 정보를 입력하세요.");
					return;
				}
				if (touristWebsite == "") {
					alert("관광지 주소를 입력하세요.");
					return;
				}
				if (touristRecommendTime == "") {
					alert("추천 관광시간을 입력하세요.");
					return;
				}
				if (touristPrice == "") {
					alert("관광지 가격을 입력하세요.");
					return;
				}
				if (touristPhoneNumber == "") {
					alert("관광지 연락처를 입력하세요.");
					return;
				}
				if (touristEmail == "") {
					alert("관광지 이메일을 입력하세요.");
					return;
				}
				if (touristOperatingTime == "") {
					alert("관광지 운영시간을 입력하세요.");
					return;
				}
				if (touristlatitude == "") {
					alert("관광지 위도를 입력하세요.");
					return;
				}
				if (touristlongitude == "") {
					alert("관광지 경도를 입력하세요.");
					return;
				}
				if (file == "") {
					alert("사진을 추가하세요");
					return;
				}
			}
			
			// 식당 validation 구문
			if (categoryAttr == "restaurant") {
				if (restaurantName == "") {
					alert("식당 이름을 입력하세요.");
					return;
				}
				if (restaurantMainAddress == "") {
					alert("식당 메인 주소를 입력하세요.");
					return;
				}
				if (restaurantPrice == "") {
					alert("식당 우편 주소를 입력하세요.");
					return;
				}
				if (restaurantIntro == "") {
					alert("식당 정보를 입력하세요.");
					return;
				}
				if (restaurantAvailableToServe == "") {
					alert("식사 제공 타임을 입력하세요.");
					return;
				}
				if (restaurantType == "") {
					alert("음식 타입을 입력하세요.");
					return;
				}
				if (restaurantPrice == "") {
					alert("음식 가격대를 입력하세요.");
					return;
				}
				if (restaurantPhoneNumber == "") {
					alert("식당 연락처를 입력하세요.");
					return;
				}
				if (restaurantOperatingTime == "") {
					alert("식당 운영시간을 입력하세요.");
					return;
				}
				if (restaurantHappyHour == "") {
					alert("식당 해피아워 시간을 입력하세요.");
					return;
				}
				if (file == "") {
					alert("사진을 추가하세요");
					return;
				}
			}
			
			// 패키지 validation 구문
			if (categoryAttr == "package") {
				if (packageName == "") {
					alert("패키지 이름을 입력하세요.");
					return;
				}
				if (packageMainAddress == "") {
					alert("패키지 메인 주소를 입력하세요.");
					return;
				}
				if (packageZipCode == "") {
					alert("패키지 우편 주소를 입력하세요.");
					return;
				}
				if (packageIntro == "") {
					alert("패키지 정보를 입력하세요.");
					return;
				}
				if (packagePrice == "") {
					alert("패키지 가격을 입력하세요.");
					return;
				}
				if (packageDurationTime == "") {
					alert("패키지 소요시간을 입력하세요.");
					return;
				}
				if (packageField == "") {
					alert("패키지 유형을 입력하세요.");
					return;
				}
				if (packageOperatingTime == "") {
					alert("패키지 운영시간을 입력하세요.");
					return;
				}
				if (file == "") {
					alert("사진을 추가하세요");
					return;
				}
			}
			
			let formData = new FormData();
			//formData.append("categoryAttr", categoryAttr);
			
			if (categoryAttr == "accomodation") {
				formData.append("categoryAttr", categoryAttr);
				formData.append("name", accomoName);
				formData.append("englishName", accomoEnglishName);
				formData.append("address", accomoMainAddress);
				formData.append("zipCode", accomoZipCode);
				formData.append("price", accomoPrice);
				formData.append("intro", accomoIntro);
				formData.append("intro2", accomoIntro2);
				formData.append("intro3", accomoIntro3);
				formData.append("accomoPlace", accomoPlace);
				formData.append("accomoPlace2", accomoPlace2);
				formData.append("accomoPlace3", accomoPlace3);
				formData.append("accomoPlace4", accomoPlace4);
				formData.append("latitude", accomolatitude);
				formData.append("longitude", accomolongitude);
				formData.append("phoneNumber", accomoPhoneNumber);
				formData.append("email", accomoEmail);
				formData.append("type", accomoType);
				formData.append("bed", accomoBed);
				formData.append("file", $('#file')[0].files[0]);
			} else if (categoryAttr == "tourist") {
				formData.append("categoryAttr", categoryAttr);
				formData.append("name", touristName);
				formData.append("englishName", touristEnglishName);
				formData.append("address", touristMainAddress);
				formData.append("zipCode", touristZipCode);
				formData.append("price", touristPrice);
				formData.append("intro", touristIntro);
				formData.append("intro2", touristIntro2);
				formData.append("website", touristWebsite);
				formData.append("recommendTime", touristRecommendTime);
				formData.append("phoneNumber", touristPhoneNumber);
				formData.append("email", touristEmail);
				formData.append("operatingTime", touristOperatingTime);
				formData.append("latitude", touristlatitude);
				formData.append("longitude", touristlongitude);
				formData.append("file", $('#file')[0].files[0]);
			} else if (categoryAttr == "restaurant") {
				formData.append("categoryAttr", categoryAttr);
				formData.append("name", restaurantName);
				formData.append("address", restaurantMainAddress);
				formData.append("zipCode", restaurantZipCode);
				formData.append("intro", restaurantIntro);
				formData.append("availableToServe", restaurantAvailableToServe); 
				formData.append("type", restaurantType); 
				formData.append("price", restaurantPrice);
				formData.append("phoneNumber", restaurantPhoneNumber);
				formData.append("operatingTime", restaurantOperatingTime);
				formData.append("happyHour", restaurantHappyHour);
				formData.append("file", $('#file')[0].files[0]);
			} else if (categoryAttr == "package") {
				formData.append("categoryAttr", categoryAttr);
				formData.append("name", packageName);
				formData.append("address", packageMainAddress);
				formData.append("zipCode", packageZipCode);
				formData.append("intro", packageIntro);
				formData.append("price", packagePrice);
				formData.append("durationTime", packageDurationTime);
				formData.append("field", packageField);
				formData.append("operatingTime", packageOperatingTime);
				formData.append("file", $('#file')[0].files[0]);
			} else if (categoryAttr == 'travleTip') {
				formData.append("categoryAttr", categoryAttr);
				formData.append("vitalItem", travleTipVitalItem);
				formData.append("culture", travleTipCulture);
				formData.append("commonSense", travleTipCommonSense);
				formData.append("recommended", travleTipRecommended);
				formData.append("warning", travleTipWarning);
				formData.append("file", $('#file')[0].files[0]);
			}
			
			// ajax 통신으로 formData에 있는 데이터 전송
			$.ajax({
				// request
				type:"POST"
				, url:"/category/add_category_info"
				, data:formData  // 폼객체를 통째로
				, enctype:"multipart/form-data" // 파일 업로드를 위한 필수 설정
				, processData:false  // 파일 업로드를 위한 필수 설정
				, contentType:false  // 파일 업로드를 위한 필수 설정
				
				// response
				, success:function(data) {
					if (data.code == 200) {
						// 성공
						alert("메모가 저장되었습니다.");
						location.href = "/admin/create";
					} else {
						// 실패
						alert(data.errorMessage);
					}
				}
				, error:function(e) {
					alert("메모 저장에 실패했습니다.");
				}
			});
			
			
			// 실패한 첫번째 시도 - post방식이 아닌 ajax로 보내는 방식으로 옵션 하나(트랜잭션)를 추가하면 파일도 같이 보낼 수 있게 되지만
			// 위 방식이 어떤 파라미터들을 보내는지 정확히 알 수 있다.
			// AJAX로 서브밋
			//let url = $(this).attr('action');
			//let params = $(this).serialize(); // form의 name속성으로 data를 구성
			//let file = $('input[name=file]').val().trim();
			//alert(file);
			
			/* $.post(url, params)
			.done(function(data) {
				if (data.code == 200) {
					location.href="/mainpage/mainpageView"
				} else {
					alert("글 작성 실패. 코드 확인 요망");
				}
			}); */
		});
		
		// 호텔 폼 정보 저장
		$('#hotelForm').submit(function(e) {
			e.preventDefault();
			
			// 셀렉트 박스로 선택한 호텔 id
			let hotelId = $('#selectRoom option:selected').val();
			
			// radio 
			let accomoType = $('input[type=radio][name=accomoType]:checked').val();
			
			// 호텔 방 썸네일
			let file = $('#roomFile').val();
			
			// 편의시설 Y or N value
			let fitness = $("input[type=radio][name=fitnessRadio]:checked").val();
			let barLounge = $("input[type=radio][name=barLoundeRadio]:checked").val();
			let pool = $("input[type=radio][name=poolRadio]:checked").val();
			let valetParking = $("input[type=radio][name=valetParkingRadio]:checked").val();
			let EVCS = $("input[type=radio][name=EVCSRadio]:checked").val();
			let banquetHall = $("input[type=radio][name=banquetHallRadio]:checked").val();
			let petAllowed = $("input[type=radio][name=petAllowedRadio]:checked").val();
			let luggageStorage = $("input[type=radio][name=luggageStorageRadio]:checked").val();
			let wifi = $("input[type=radio][name=wifiRadio]:checked").val();
		
			// 객실 특징 Y or N value
			let curtain = $("input[type=radio][name=curtainRadio]:checked").val();
			let roomService = $("input[type=radio][name=roomServiceRadio]:checked").val();
			let morningCall = $("input[type=radio][name=morningCallRadio]:checked").val();
			let refridge = $("input[type=radio][name=refridgeRadio]:checked").val();
			let coffee = $("input[type=radio][name=coffeeRadio]:checked").val();
			let TV = $("input[type=radio][name=TVRadio]:checked").val();
			let safe = $("input[type=radio][name=safeRadio]:checked").val();
			let telephone = $("input[type=radio][name=telephoneRadio]:checked").val();
			let airConditioner = $("input[type=radio][name=airConditionerRadio]:checked").val();
			let kitchenette = $("input[type=radio][name=kitchenetteRadio]:checked").val();
			
			// 호텔 방 value - input box들로 채워주자
			let intro = $('#roomIntro').val();
			let roomType = $('#roomType').val();
			let bedType = $('#bedType').val();
			let roomPrice = $('#roomPrice').val();
			let floor = $('#floor').val();
			let view = $('#view').val();
			let checkIn = $('#checkIn').val();
			let checkOut = $('#checkOut').val();
			let breakfast = $('#breakfast').val();
			let headCount = $('#headCount').val();
			let smoke = $('#smoke').val();
			
			// 호텔 방 validation 구문
			if (accomoType == 2) {
				if (intro == "") {
					alert("방 소개를 입력하세요.");
					return;
				}
				if (roomType == "") {
					alert("방 타입을 입력하세요.");
					return;
				}
				if (bedType == "") {
					alert("침대 타입을 입력하세요.");
					return;
				}
				if (roomPrice == "") {
					alert("1박 요금을 입력하세요.");
					return;
				}
				if (floor == "") {
					alert("층을 입력하세요.");
					return;
				}
				if (view == "") {
					alert("뷰/전망을 입력하세요.");
					return;
				}
				if (checkIn == "") {
					alert("체크인 시간을 입력하세요.");
					return;
				}
				if (checkOut == "") {
					alert("체크아웃 시간을 입력하세요.");
					return;
				}
				if (breakfast == "") {
					alert("조식여부를 입력하세요.");
					return;
				}
				if (headCount == "") {
					alert("정원을 입력하세요.");
					return;
				}
				if (smoke == "") {
					alert("흡연여부를 입력하세요.");
					return;
				}
				if (file == "") {
					alert("사진을 선택해주세요");
					return;
				}
			}
			
			if (hotelId == "none") {
				alert("호텔을 선택해주세요");
				return;
			}
			
			let formData = new FormData();
			if (accomoType == 2) {
				formData.append("accomoType", accomoType);
				formData.append("hotelId", hotelId);
				formData.append("intro", intro);
				formData.append("roomType", roomType);
				formData.append("bedType", bedType);
				formData.append("floor", floor);
				formData.append("view", view);
				formData.append("checkIn", checkIn);
				formData.append("checkOut", checkOut);
				formData.append("breakfast", breakfast);
				formData.append("headCount", headCount);
				formData.append("smoke", smoke);
				formData.append("file", $('#roomFile')[0].files[0])
			} else if (accomoType == 3) {
				formData.append("accomoType", accomoType);
				formData.append("hotelId", hotelId);
				formData.append("fitness", fitness);
				formData.append("barLounge", barLounge);
				formData.append("pool", pool);
				formData.append("valetParking", valetParking);
				formData.append("EVCS", EVCS);
				formData.append("banquetHall", banquetHall);
				formData.append("petAllowed", petAllowed);
				formData.append("luggageStorage", luggageStorage);
				formData.append("wifi", wifi);
			} else if (accomoType == 4) {
				formData.append("accomoType", accomoType);
				formData.append("hotelId", hotelId);
				formData.append("curtain", curtain);
				formData.append("roomService", roomService);
				formData.append("morningCall", morningCall);
				formData.append("refridge", refridge);
				formData.append("coffee", coffee);
				formData.append("TV", TV);
				formData.append("safe", safe);
				formData.append("telephone", telephone);
				formData.append("airConditioner", airConditioner);
				formData.append("kitchenette", kitchenette);
			}
			
			// ajax 통신으로 formData에 있는 데이터 전송
			$.ajax({
				// request
				type:"POST"
				, url:"/category/add_hotel_info"
				, data:formData  // 폼객체를 통째로
				//, contentType: false
		       // , processData: false
				, enctype:"multipart/form-data" // 파일 업로드를 위한 필수 설정
				, processData:false  // 파일 업로드를 위한 필수 설정
				, contentType:false  // 파일 업로드를 위한 필수 설정
				
				// response
				, success:function(data) {
					if (data.code == 200) {
						// 성공
						alert("메모가 저장되었습니다.");
						location.href = "/admin/create";
					} else {
						// 실패
						alert(data.errorMessage);
					}
				}
				, error:function(e) {
					alert("ajax쪽 코드를 다시 확인하세요.");
					//document.location.reload();
				}
			});
		});
	});
</script>