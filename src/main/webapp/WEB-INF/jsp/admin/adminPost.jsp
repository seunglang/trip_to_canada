<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="d-flex justify-content-center">
	<div class="login-box">
		<legend class="mt-5">상품 추가란</legend>
		<%-- 키보드 Enter키로 로그인이 될 수 있도록 form 태그를 만들어준다.(submit 타입의 버튼이 동작됨) --%>
		<form id="loginForm" action="/category/add_category_info" method="post">
			<div class="sign-up">
				<div class="border rounded p-3 sign-up-shape">
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
					<legend>글 작성</legend>
					<%-- 카테고리 선택 시 input이 태그들이 바뀐다. --%>
					<div class="small mt-4 ml-1">카테고리 선택 *</div>
					<select class="form-control col-5 mt-1" id="selectCategory" name="selectCategory">
						<option value="none">--선택--</option>
						<c:forEach items="${categoryList}" var="list">
							<option value="${list.categoryAttr}">${list.categoryName}</option>
						</c:forEach>
					</select>
					<div class="small text-danger mt-1 ml-1" id="selectCategoryWarn">※&nbsp;카테고리를 선택해주세요.</div>
					<%-- 숙소 정보 입력란 --%>
					<div class="mt-3 d-none" id="accomoInputForm">
						<div class="small ml-1 mb-1 d-none" id="accomoForm">숙소 정보 입력란 *</div>
						<div class="d-flex align-items-center">
							<input type="text" id="accomoName" name="accomoName" class="form-control col-12 d-none" placeholder="name of accomodation"/>
						</div>
						<div class="mt-4 d-flex align-items-center">
							<input type="text" id="accomoMainAddress" name="accomoMainAddress" class="form-control col-12 input-lg d-none" placeholder="Main Street ex) 29th Avenue"/>
						</div>
						<div class="mt-4 d-flex align-items-center">
							<input type="text" id="accomoZipCode" name="accomoZipCode" class="form-control col-12 input-lg d-none" placeholder="Zip Code ex) V7R 4J1"/>
						</div>
						<div class="mt-4 d-flex align-items-center">
							<textarea class="form-control d-none" id="accomoIntro" name="accomoIntro" placeholder="Information" rows="10"></textarea>
						</div>
						<div class="mt-4 d-flex align-items-center">
							<input type="text" id="accomoPrice" name="accomoPrice" class="form-control col-6 input-lg d-none" placeholder="ex) ￦130,000"/>
						</div>
						<div class="mt-4 d-flex align-items-center">
							<input type="text" id="accomoPhoneNumber" name="accomoPhoneNumber" class="form-control col-12 input-lg d-none" placeholder="ex) 010-1234-4567"/>
						</div>
						<div class="mt-4 d-flex align-items-center">
							<input type="text" id="accomoEmail" name="accomoEmail" class="form-control col-12 input-lg d-none" placeholder="email"/>
						</div>
					</div>
					<%-- 관광지 정보 입력란 --%>
					<div class="d-none mt-3" id="touristInputForm">
						<div class="small ml-1 mb-1 d-none" id="touristForm">관광지 정보 입력란 *</div>
						<div class="d-flex align-items-center">
							<input type="text" id="touristName" name="touristName" class="form-control col-12 d-none" placeholder="관광지 이름"/>
						</div>
						<div class="mt-4 d-flex align-items-center">
							<input type="text" id="touristMainAddress" name="touristMainAddress" class="form-control col-12 input-lg d-none" placeholder="관광지 주소"/>
						</div>
						<div class="mt-4 d-flex align-items-center">
							<input type="text" id="touristZipCode" name="touristZipCode" class="form-control col-12 input-lg d-none" placeholder="관광지 우편주소"/>
						</div>
						<div class="mt-4 d-flex align-items-center">
							<textarea class="form-control d-none" id="touristIntro" name="touristIntro" placeholder="관광지 정보" rows="10"></textarea>
						</div>
						<div class="mt-4 d-flex align-items-center">
							<input type="text" id="touristPrice" name="touristPrice" class="form-control col-6 input-lg d-none" placeholder="관광지 가격"/>
						</div>
						<div class="mt-4 d-flex align-items-center">
							<input type="text" id="touristPhoneNumber" name="touristPhoneNumber" class="form-control col-12 input-lg d-none" placeholder="ex) 010-1234-4567"/>
						</div>
						<div class="mt-4 d-flex align-items-center">
							<input type="text" id="touristEmail" name="touristEmail" class="form-control col-12 input-lg d-none" placeholder="이메일"/>
						</div>
						<div class="mt-4 d-flex align-items-center">
							<input type="text" id="touristOperatingTime" name="touristOperatingTime" class="form-control col-12 input-lg d-none" placeholder="운영 시간"/>
						</div>
					</div>
					<%-- 식당 정보 입력란 --%>
					<div class="d-none mt-3" id="restaurantInputForm">
						<div class="small ml-1 mb-1 d-none" id="restaurantForm">식당 정보 입력란 *</div>
						<div class="d-flex align-items-center">
							<input type="text" id="restaurantName" name="restaurantName" class="form-control col-12 d-none" placeholder="식당 이름"/>
						</div>
						<div class="mt-4 d-flex align-items-center">
							<input type="text" id="restaurantMainAddress" name="restaurantMainAddress" class="form-control col-12 input-lg d-none" placeholder="식당 주소"/>
						</div>
						<div class="mt-4 d-flex align-items-center">
							<input type="text" id="restaurantZipCode" name="restaurantZipCode" class="form-control col-12 input-lg d-none" placeholder="식당 우편주소"/>
						</div>
						<div class="mt-4 d-flex align-items-center">
							<textarea class="form-control d-none" id="restaurantIntro" name="restaurantIntro" placeholder="식당 설명" rows="10"></textarea>
						</div>
						<div class="mt-4 d-flex align-items-center">
							<input type="text" id="restaurantAvailableToServe" name="restaurantAvailableToServe" class="form-control col-6 input-lg d-none" placeholder="식사 시간"/>
						</div>
						<div class="mt-4 d-flex align-items-center">
							<input type="text" id="restaurantType" name="restaurantType" class="form-control col-6 input-lg d-none" placeholder="음식 종류) 일식, 양식, 지중해"/>
						</div>
						<div class="mt-4 d-flex align-items-center">
							<input type="text" id="restaurantPrice" name="restaurantPrice" class="form-control col-6 input-lg d-none" placeholder="식당 가격"/>
						</div>
						<div class="mt-4 d-flex align-items-center">
							<input type="text" id="restaurantPhoneNumber" name="restaurantPhoneNumber" class="form-control col-12 input-lg d-none" placeholder="ex) 010-1234-4567"/>
						</div>
						<div class="mt-4 d-flex align-items-center">
							<input type="text" id="restaurantOperatingTime" name="restaurantOperatingTime" class="form-control col-12 input-lg d-none" placeholder="식당 운영시간"/>
						</div>
						<div class="mt-4 d-flex align-items-center">
							<input type="text" id="restaurantHappyHour" name="restaurantHappyHour" class="form-control col-12 input-lg d-none" placeholder="식당 해피아워 시간대"/>
						</div>
					</div>
					<%-- 여행 정보 입력란 --%>
					<div class="d-none mt-3" id="travleTipInputForm">
						<div class="small ml-1 mb-1 d-none" id="travleTipForm">여행 TIP 정보 입력란 *</div>
						<div class="d-flex align-items-center">
							<textarea id="travleTipVitalItem" name="travleTipVitalItem" class="form-control col-12 d-none" placeholder="필수품" rows="10"/></textarea>
						</div>
						<div class="mt-4 d-flex align-items-center">
							<textarea id="travleTipCulture" name="travleTipCulture" class="form-control d-none" placeholder="문화" rows="10"/></textarea>
						</div>
						<div class="mt-4 d-flex align-items-center">
							<textarea id="travleTipCommonSense" name="travleTipCommonSense" class="form-control d-none" placeholder="알고가면 좋은 상식" rows="10"/></textarea>
						</div>
						<div class="mt-4 d-flex align-items-center">
							<textarea class="form-control d-none" id="travleTipRecommended" name="travleTipRecommended" placeholder="먹어봐야 할 음식" rows="10"></textarea>
						</div>
						<div class="mt-4 d-flex align-items-center">
							<textarea id="travleTipWarning" name="travleTipWarning" class="form-control d-none" placeholder="주의사항" rows="10"/></textarea>
						</div>
					</div>
					<%-- 패키지 정보 입력란 --%>
					<div class="d-none mt-3" id="packageInputForm">
						<div class="small ml-1 mb-1 d-none" id="packageForm">패키지 정보 입력란 *</div>
						<div class="d-flex align-items-center">
							<input type="text" id="packageName" name="packageName" class="form-control col-12 d-none" placeholder="패키지 이름"/>
						</div>
						<div class="mt-4 d-flex align-items-center">
							<input type="text" id="packageMainAddress" name="packageMainAddress" class="form-control col-12 input-lg d-none" placeholder="패키지 주소"/>
						</div>
						<div class="mt-4 d-flex align-items-center">
							<input type="text" id="packageZipCode" name="packageZipCode" class="form-control col-12 input-lg d-none" placeholder="패키지 우편주소"/>
						</div>
						<div class="mt-4 d-flex align-items-center">
							<textarea class="form-control d-none" id="packageIntro" name="packageIntro" placeholder="패키지 정보" rows="10"></textarea>
						</div>
						<div class="mt-4 d-flex align-items-center">
							<input type="text" id="packagePrice" name="packagePrice" class="form-control col-6 input-lg d-none" placeholder="패키지 가격"/>
						</div>
						<div class="mt-4 d-flex align-items-center">
							<input type="text" id="packageDurationTime" name="packageDurationTime" class="form-control col-12 input-lg d-none" placeholder="패키지 소요시간"/>
						</div>
						<div class="mt-4 d-flex align-items-center">
							<input type="text" id="packageField" name="packageField" class="form-control col-12 input-lg d-none" placeholder="패키지 유형 ex)액티비티, 관람, etc..."/>
						</div>
						<div class="mt-4 d-flex align-items-center">
							<input type="text" id="packageOperatingTime" name="packageOperatingTime" class="form-control col-12 input-lg d-none" placeholder="패키지 운영시간"/>
						</div>
					</div>
					<%-- 공용 썸네일 사진 --%>
					<div class="file-upload d-flex">
						<%-- file 태그는 숨겨두고 이미지를 클릭하면 file 태그를 클릭한 것처럼 이벤트를 줄 것이다. --%>
						<input type="file" id="file" name="file" class="d-none" accept=".gif, .jpg, .png, .jpeg">
						<%-- 이미지에 마우스 올리면 마우스커서가 링크 커서가 변하도록 a 태그 사용 --%>
						<a href="#" id="fileUploadBtn"><img width="30" src="/static/image/thumbnail.png" class="d-none mt-3" id="thumbnail"></a>
						<%-- 업로드 된 임시 파일 이름 저장될 곳 --%>
						<div id="fileName" class="ml-2 mt-4 d-none"></div>
					</div>
					<br>
					<button class="btn form-control btn-primary" id="categoryFormBtn" type="submit">작성 완료</button>
				</div>
			</div>
		</form>
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
				type:"POST"
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
				type:"POST"
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
			
			// 카테고리 선택 경고 구문
			$('#selectCategoryWarn').addClass('d-none');
			$('#thumbnail').addClass('d-none');
			$('#fileName').addClass('d-none');
			
			// 숙소 클래스 remove d-none or d-none
			$('#accomoInputForm').addClass('d-none');
			$('#accomoForm').addClass('d-none');
			$('#accomoName').addClass('d-none');
			$('#accomoMainAddress').addClass('d-none');
			$('#accomoZipCode').addClass('d-none');
			$('#accomoPrice').addClass('d-none');
			$('#accomoIntro').addClass('d-none');
			$('#accomoPhoneNumber').addClass('d-none');
			$('#accomoEmail').addClass('d-none');
			
			// 관광지 클래스 remove d-none or d-none
			$('#touristInputForm').addClass('d-none');
			$('#touristForm').addClass('d-none');
			$('#touristName').addClass('d-none');
			$('#touristMainAddress').addClass('d-none');
			$('#touristZipCode').addClass('d-none');
			$('#touristPrice').addClass('d-none');
			$('#touristIntro').addClass('d-none');
			$('#touristPhoneNumber').addClass('d-none');
			$('#touristEmail').addClass('d-none');
			$('#touristOperatingTime').addClass('d-none');
			
			// 식당 클래스 remove d-none or d-none
			$('#restaurantInputForm').addClass('d-none');
			$('#restaurantForm').addClass('d-none');
			$('#restaurantName').addClass('d-none');
			$('#restaurantMainAddress').addClass('d-none');
			$('#restaurantZipCode').addClass('d-none');
			$('#restaurantIntro').addClass('d-none');
			$('#restaurantAvailableToServe').addClass('d-none');
			$('#restaurantType').addClass('d-none');
			$('#restaurantPrice').addClass('d-none');
			$('#restaurantPhoneNumber').addClass('d-none');
			$('#restaurantOperatingTime').addClass('d-none');
			$('#restaurantHappyHour').addClass('d-none');
			
			// 패키지 클래스 remove d-none or d-none
			$('#packageInputForm').addClass('d-none');
			$('#packageForm').addClass('d-none');
			$('#packageName').addClass('d-none');
			$('#packageMainAddress').addClass('d-none');
			$('#packageZipCode').addClass('d-none');
			$('#packageIntro').addClass('d-none');
			$('#packagePrice').addClass('d-none');
			$('#packageDurationTime').addClass('d-none');
			$('#packageField').addClass('d-none');
			$('#packageOperatingTime').addClass('d-none');
			
			// 여행 팁 클래스 remove d-none or d-none
			$('#travleTipInputForm').addClass('d-none');
			$('#travleTipForm').addClass('d-none');
			$('#travleTipVitalItem').addClass('d-none');
			$('#travleTipCulture').addClass('d-none');
			$('#travleTipCommonSense').addClass('d-none');
			$('#travleTipRecommended').addClass('d-none');
			$('#travleTipWarning').addClass('d-none');
			
			
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
			
			if (selectCategoryAttr == "none") {
				$('#selectCategoryWarn').removeClass('d-none');
			}
			else if (selectCategoryAttr == "accomodation") {
				$('#accomoInputForm').removeClass('d-none');
				$('#accomoForm').removeClass('d-none');
				$('#accomoName').removeClass('d-none');
				$('#accomoMainAddress').removeClass('d-none');
				$('#accomoZipCode').removeClass('d-none');
				$('#accomoPrice').removeClass('d-none');
				$('#accomoIntro').removeClass('d-none');
				$('#accomoPhoneNumber').removeClass('d-none');
				$('#accomoEmail').removeClass('d-none');
				$('#accomoThumbnail').removeClass('d-none');
				$('#thumbnail').removeClass('d-none');
				$('#fileName').removeClass('d-none');
			} else if (selectCategoryAttr == "tourist") {
				$('#touristInputForm').removeClass('d-none');
				$('#touristForm').removeClass('d-none');
				$('#touristName').removeClass('d-none');
				$('#touristMainAddress').removeClass('d-none');
				$('#touristZipCode').removeClass('d-none');
				$('#touristPrice').removeClass('d-none');
				$('#touristIntro').removeClass('d-none');
				$('#touristPhoneNumber').removeClass('d-none');
				$('#touristEmail').removeClass('d-none');
				$('#touristOperatingTime').removeClass('d-none');
				$('#touristThumbnail').removeClass('d-none');
				$('#thumbnail').removeClass('d-none');
				$('#fileName').removeClass('d-none');
			} else if (selectCategoryAttr == "restaurant") {
				$('#restaurantInputForm').removeClass('d-none');
				$('#restaurantForm').removeClass('d-none');
				$('#restaurantName').removeClass('d-none');
				$('#restaurantMainAddress').removeClass('d-none');
				$('#restaurantZipCode').removeClass('d-none');
				$('#restaurantIntro').removeClass('d-none');
				$('#restaurantAvailableToServe').removeClass('d-none');
				$('#restaurantType').removeClass('d-none');
				$('#restaurantPrice').removeClass('d-none');
				$('#restaurantPhoneNumber').removeClass('d-none');
				$('#restaurantOperatingTime').removeClass('d-none');
				$('#restaurantHappyHour').removeClass('d-none');
				$('#restaurantThumbnail').removeClass('d-none');
				$('#thumbnail').removeClass('d-none');
				$('#fileName').removeClass('d-none');
			} else if (selectCategoryAttr == "travleTip") {
				$('#travleTipInputForm').removeClass('d-none');
				$('#travleTipForm').removeClass('d-none');
				$('#travleTipVitalItem').removeClass('d-none');
				$('#travleTipCulture').removeClass('d-none');
				$('#travleTipCommonSense').removeClass('d-none');
				$('#travleTipRecommended').removeClass('d-none');
				$('#travleTipWarning').removeClass('d-none');
				$('#travleTipThumbnail').removeClass('d-none');
				$('#thumbnail').removeClass('d-none');
				$('#fileName').removeClass('d-none');
			} else if (selectCategoryAttr == "publicTransport") {
				
			} else if (selectCategoryAttr == "package") {
				$('#packageInputForm').removeClass('d-none');
				$('#packageForm').removeClass('d-none');
				$('#packageName').removeClass('d-none');
				$('#packageMainAddress').removeClass('d-none');
				$('#packageZipCode').removeClass('d-none');
				$('#packageIntro').removeClass('d-none');
				$('#packagePrice').removeClass('d-none');
				$('#packageDurationTime').removeClass('d-none');
				$('#packageField').removeClass('d-none');
				$('#packageOperatingTime').removeClass('d-none');
				$('#packageThumbnail').removeClass('d-none');
				$('#thumbnail').removeClass('d-none');
				$('#fileName').removeClass('d-none');
			}
		});
		
		// 카테고리별 정보 저장
		$('#loginForm').submit(function(e) {
			e.preventDefault();
			
			// 선택한 카테고리의 속성 가져오기 - controller에서 사용할 예정
			let categoryAttr = $('#selectCategory option:selected').val();
			
			// 썸네일 데이터
			let file = $('#file').val();
			
			// 숙소 input 값들
			let accomoName = $('#accomoName').val();
			let accomoMainAddress = $('#accomoMainAddress').val();
			let accomoZipCode = $('#accomoZipCode').val();
			let accomoPrice = $('#accomoPrice').val();
			let accomoIntro = $('#accomoIntro').val();
			let accomoPhoneNumber = $('#accomoPhoneNumber').val();
			let accomoEmail = $('#accomoEmail').val();
			
			// 관광지 input 값들
			let touristName = $('#touristName').val();
			let touristMainAddress = $('#touristMainAddress').val();
			let touristZipCode= $('#touristZipCode').val();
			let touristPrice = $('#touristPrice').val();
			let touristIntro = $('#touristIntro').val();
			let touristPhoneNumber = $('#touristPhoneNumber').val();
			let touristEmail = $('#touristEmail').val();
			let touristOperatingTime = $('#touristOperatingTime').val();
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
			
			// 숙소 validation 구문
			if (categoryAttr == "accomodation") {
				if (accomoName == "") {
					alert("숙소 이름을 입력하세요.");
					return;
				}
				if (accomoMainAddress == "") {
					alert("숙소 메인 주소를 입력하세요.");
					return;
				}
				if (accomoZipCode == "") {
					alert("숙소 우편 주소를 입력하세요.");
					return;
				}
				if (accomoPrice == "") {
					alert("숙소 가격을 입력하세요.");
					return;
				}
				if (accomoIntro == "") {
					alert("숙소 정보를 입력하세요.");
					return;
				}
				if (accomoPhoneNumber == "") {
					alert("숙소 연락처를 입력하세요.");
					return;
				}
				if (accomoEmail == "") {
					alert("숙소 이메일을 입력하세요.");
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
				formData.append("address", accomoMainAddress);
				formData.append("zipCode", accomoZipCode);
				formData.append("price", accomoPrice);
				formData.append("intro", accomoIntro);
				formData.append("phoneNumber", accomoPhoneNumber);
				formData.append("email", accomoEmail);
				formData.append("file", $('#file')[0].files[0]);
			} else if (categoryAttr == "tourist") {
				formData.append("categoryAttr", categoryAttr);
				formData.append("name", touristName);
				formData.append("address", touristMainAddress);
				formData.append("zipCode", touristZipCode);
				formData.append("price", touristPrice);
				formData.append("intro", touristIntro);
				formData.append("phoneNumber", touristPhoneNumber);
				formData.append("email", touristEmail);
				formData.append("operatingTime", touristOperatingTime);
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
	});
</script>