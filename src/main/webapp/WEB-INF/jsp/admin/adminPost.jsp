<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="d-flex justify-content-center">
	<div class="login-box">
		<legend class="mt-5">글 작성</legend>
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
					<%-- 카테고리 삭제 --%>
					<div class="small mb-1 ml-1">카테고리 삭제 *</div>
					<div class="d-flex">
						<select class="form-control col-5" id="deleteCategoryByName" name="deleteCategoryByName">
							<option value="none">--선택--</option>
							<c:forEach items="${categoryList}" var="list">
								<option value="${list.categoryAttr}">${list.categoryName}</option>
							</c:forEach>
						</select>
						<button type="button" id="deleteCategoryBtn" class="btn btn-sm btn-danger ml-3">삭제</button>
					</div>
					<br><hr>
					<%-- 카테고리 선택 시 input이 태그들이 바뀐다. --%>
					<div class="small mt-4 ml-1">카테고리 선택 *</div>
					<select class="form-control col-5 mt-1" id="selectCategory" name="selectCategory">
						<option value="none">--선택--</option>
						<c:forEach items="${categoryList}" var="list">
							<option value="${list.categoryAttr}">${list.categoryName}</option>
						</c:forEach>
					</select>
					<div class="mt-3">
						<div class="small ml-1 mb-1 d-none" id="accomoForm">숙소 정보 입력란 *</div>
						<div class="d-flex align-items-center">
							<input type="text" id="accomoName" name="accomoName" class="form-control col-12 d-none" placeholder="name of accomodation" required/>
						</div>
						<div class="mt-4 d-flex align-items-center">
							<input type="text" id="accomoMainAddress" name="accomoMainAddress" class="form-control col-12 input-lg d-none" placeholder="Main Street ex) 29th Avenue" required/>
						</div>
						<div class="mt-4 d-flex align-items-center">
							<input type="text" id="accomoZipCode" name="accomoZipCode" class="form-control col-12 input-lg d-none" placeholder="Zip Code ex) V7R 4J1" required/>
						</div>
						<div class="mt-4 d-flex align-items-center">
							<textarea class="form-control d-none" id="accomoInfo" name="accomoInfo" placeholder="Information" rows="10" required></textarea>
						</div>
						<div class="mt-4 d-flex align-items-center">
							<input type="text" id="accomoPrice" name="accomoPrice" class="form-control col-6 input-lg d-none" placeholder="ex) ￦130,000" required/>
						</div>
						<div class="mt-4 d-flex align-items-center">
							<input type="text" id="accomoPhoneNumber" name="accomoPhoneNumber" class="form-control col-12 input-lg d-none" placeholder="ex) 010-1234-4567" required/>
						</div>
						<div class="mt-4 d-flex align-items-center">
							<input type="text" id="accomoEmail" name="accomoEmail" class="form-control col-12 input-lg d-none" placeholder="email" required/>
						</div>
						<!-- <div class="mt-4 d-flex align-items-center">
							<input type="text" id="accomoThumbnail" name="accomoThumbnail" class="form-control col-12 input-lg d-none" placeholder="picture url:" />
						</div> -->
						<div class="file-upload d-flex">
							<%-- file 태그는 숨겨두고 이미지를 클릭하면 file 태그를 클릭한 것처럼 이벤트를 줄 것이다. --%>
							<input type="file" id="file" name="file" class="d-none" accept=".gif, .jpg, .png, .jpeg" required>
							<%-- 이미지에 마우스 올리면 마우스커서가 링크 커서가 변하도록 a 태그 사용 --%>
							<a href="#" id="fileUploadBtn"><img width="30" src="/static/image/thumbnail.png" class="d-none mt-3" id="accomoThumbnail"></a>
							<%-- 업로드 된 임시 파일 이름 저장될 곳 --%>
							<div id="fileName" class="ml-2 mt-4"></div>
						</div>
					</div>
					<br>
					<button class="btn form-control btn-primary" id="categoryFormBtn" type="submit">작성 완료</button>
				</div>
			</div>
		</form>
	</div>
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
		
		// 카테고리 삭제 버튼
		$('#deleteCategoryBtn').on('click', function() {
			let categoryName = $('#deleteCategoryByName option:selected').text();
			let categoryAttr = $('#deleteCategoryByName option:selected').val();
			
			if (categoryAttr == "none") {
				alert("카테고리 선택을 해주세요");
				return;
			}
			
			
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
			let test = $(this).val(); // 카테고리 선택 attr 
			
			// 숙소 클래스 remove d-none or d-none
			$('#accomoName').addClass('d-none');
			$('#accomoMainAddress').addClass('d-none');
			$('#accomoZipCode').addClass('d-none');
			$('#accomoPrice').addClass('d-none');
			$('#accomoInfo').addClass('d-none');
			$('#accomoPhoneNumber').addClass('d-none');
			$('#accomoEmail').addClass('d-none');
			$('#accomoThumbnail').addClass('d-none');
			
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
			
			if (test == "accomodation") {
				$('#accomoName').removeClass('d-none');
				$('#accomoMainAddress').removeClass('d-none');
				$('#accomoZipCode').removeClass('d-none');
				$('#accomoPrice').removeClass('d-none');
				$('#accomoInfo').removeClass('d-none');
				$('#accomoPhoneNumber').removeClass('d-none');
				$('#accomoEmail').removeClass('d-none');
				$('#accomoThumbnail').removeClass('d-none');
			} else if (test == "tourist") {
				
			} else if (test == "restaurant") {
				
			} else if (test == "travleTip") {
				
			} else if (test == "publicTransport") {
				
			} else if (test == "package") {
				
			}
		});
		
		// 카테고리별 정보 저장
		$('#loginForm').submit(function(e) {
			e.preventDefault();
			
			// 선택한 카테고리의 속성 가져오기 - controller에서 사용할 예정
			//let categoryAttr = $('#selectCategory option:selected').val();
			//alert(categoryAttr);
			
			let accomoName = $('#accomoName').val();
			let accomoMainAddress = $('#accomoMainAddress').val();
			let accomoZipCode = $('#accomoZipCode').val();
			let accomoPrice = $('#accomoPrice').val();
			let accomoInfo = $('#accomoInfo').val();
			let accomoPhoneNumber = $('#accomoPhoneNumber').val();
			let accomoEmail = $('#accomoEmail').val();
			//let file = $('#file').val();
			
			
			let formData = new FormData();
			formData.append("accomoName", accomoName);
			formData.append("accomoMainAddress", accomoMainAddress);
			formData.append("accomoZipCode", accomoZipCode);
			formData.append("accomoPrice", accomoPrice);
			formData.append("accomoInfo", accomoInfo);
			formData.append("accomoPhoneNumber", accomoPhoneNumber);
			formData.append("accomoEmail", accomoEmail);
			formData.append("file", $('#file')[0].files[0]);
			
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
						location.href = "/mainpage/mainpageView";
					} else {
						// 실패
						alert(data.errorMessage);
					}
				}
				, error:function(e) {
					alert("메모 저장에 실패했습니다.");
				}
			});
			
			
			// 실패한 첫번째 시도
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