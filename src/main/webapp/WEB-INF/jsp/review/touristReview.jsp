<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="d-flex justify-content-center">
	<div class="login-box">
		<h3 class="mt-5 mb-3">방문하신 장소는 어떠셨나요?</h3>
		<div class="border rounded d-flex">
			<img src="${tourist.thumbnailPic}" width="250px">
			<div>
				<div class="ml-2 mt-2 font-weight-bold">${tourist.name}</div>
				<div class="ml-2">${tourist.englishName}</div>
				<div class="ml-2 small mt-2">관광시간: ${tourist.recommendTime}시간</div>
			</div>
		</div>
		<%-- 키보드 Enter키로 로그인이 될 수 있도록 form 태그를 만들어준다.(submit 타입의 버튼이 동작됨) --%>
		<form id="myform" name="myform" action="/review/add_tourist_review" method="post">
			<div class="sign-up mt-3">
				<div class="border rounded p-3 sign-up-shape">
					<div class="sign-up-sen mb-3">후기를 남겨주세요!</div>
						<div class="row">
							<div class="col-xs-12 col-md-12">
								<span>리뷰 작성</span>
								<textarea id="reviewContent" name="reviewContent" maxlength="300" class="form-control input-lg mt-2" placeholder="볼거리가 풍부했어요!" rows="9"></textarea>
								<span id="textBox" class="textLengthWrap d-flex justify-content-end mt-1">
									<span class="textCount small">0</span>
									<span class="textTotal small">/300자</span>
								</span>
							</div>
							<div class="col-xs-12 col-md-12 mt-4">
								<div class="mb-2">리뷰 제목</div>
								<input type="text" id="reviewTitle" maxlength="20" name="reviewTitle" class="form-control input-lg" placeholder="짧고 강렬하게 남겨주세요" />
								<span id="titleBox" class="titleLengthWrap d-flex justify-content-end mt-1">
									<span class="titleTotal small">0/20자</span>
								</span>
							</div>
							<div>
								<div class="mt-2 ml-3">방문 시기</div>
								<input class="form-control ml-3 mt-2" id="visitDay" placeholder="날짜를 선택해주세요" autocomplete="off">
							</div>
						</div>
						<fieldset class="mt-4">
					        <legend>관광지 별점</legend>
					        <input type="radio" name="rating" value="5" id="rate1"><label for="rate1">⭐</label>
					        <input type="radio" name="rating" value="4" id="rate2"><label for="rate2">⭐</label>
					        <input type="radio" name="rating" value="3" id="rate3"><label for="rate3">⭐</label>
					        <input type="radio" name="rating" value="2" id="rate4"><label for="rate4">⭐</label>
					        <input type="radio" name="rating" value="1" id="rate5"><label for="rate5">⭐</label>
					    </fieldset>
						<br>
					<button class="btn form-control btn-primary mt-3" id="addReview" type="submit" data-tourist-id="${tourist.id}">리뷰 제출</button>
				</div>
			</div>
		</form>
	</div>
</div>

<script>
	$(document).ready(function() {
		
		$('#reviewContent').on('input', function() {
			let content = $(this).val();
		    
		    // 글자수 세기
		    if (content.length == 0 || content == '') {
		    	$('.textCount').text('0');
		    } else {
		    	$('.textCount').text(content.length);
		    }
		    
		    // 글자수 제한
		    if (content.length > 300) {
		    	// 200자 부터는 타이핑 되지 않도록
		        content = content.substring(0, 30);
		        // 200자 넘으면 알림창 뜨도록
		        alert('글자수는 300자까지 입력 가능합니다.');
		    };
		});
		
		$('#reviewTitle').on('input', function() {
			let content = $(this).val();
		    
		    // 글자수 세기
		    $('.titleTotal').html($(this).val().length+"/20자");
		    
		    // 글자수 제한
		    if (content.length > 20) {
		    	// 20자 부터는 타이핑 되지 않도록
		        $(this).val($(this).val().substring(0, 20));
		        // 20자 넘으면 알림창 뜨도록
				$('.titleTotal').html("20/20자");
		        alert('글자수는 20자까지 입력 가능합니다.');
		    };
		});
		
		// 관광지 날짜 선택 데이트피커
		$.datepicker.setDefaults({
            dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'] // 요일을 한글로 변경
            , dateFormat: 'yy-mm-dd'
        });

        // 오늘 날짜로 이동하는 함수
        $.datepicker._gotoToday = function(id) {
            $(id).datepicker('setDate', new Date()).datepicker('hide').blur();
        };

		$('#visitDay').datepicker({
            showButtonPanel: true // 오늘 버튼 노출

            , onSelect:function(dateText) {
            	// 나중에 더 기능 추가
            }
        });
		
		// 관광지 서브밋
		$('#myform').submit(function(e) {
			e.preventDefault();
			let star = $('input:radio[name=rating]:checked').val();
			let reviewContent = $('#reviewContent').val();
			let reviewTitle = $('#reviewTitle').val();
			let visitDay = $('#visitDay').val();
			let touristId = $('#addReview').data('tourist-id');
			
			if (reviewContent == "") {
				alert("리뷰 내용을 입력해주세요 !");
				return;
			}
			if (reviewTitle == "") {
				alert("리뷰 제목을 입력해주세요 !");
				return;
			}
			if (star == null) {
				alert("별점을 선택해주세요 !");
				return;
			}
			if (visitDay == "") {
				alert("방문 일자를 선택해주세요 !");
				return;
			}
			
			$.ajax({
				// request
				type:"POST"
				, url:"/review/add_tourist_review"
				, data:{"star":star, "reviewContent":reviewContent, "reviewTitle":reviewTitle, "touristId":touristId, "visitDay":visitDay}
				
				// response
				, success:function(data) {
					if(data.code == 200) {
						alert("리뷰 작성에 성공하셨습니다.");
						location.href = "/category/tourist_detail_view?touristId=" + touristId;
					} else {
						alert(data.errorMessage);
						location.href= "/category/tourist_detail_view?touristId=" + touristId;
					}
				}
				, error:function(e) {
					alert("오류");
				}
			});
		});
	});
</script>