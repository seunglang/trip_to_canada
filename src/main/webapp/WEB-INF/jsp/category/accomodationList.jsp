<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="d-flex justify-content-center mt-3">
	<input class="form-control col-3 ml-2" id="checkIn" placeholder="체크인" autocomplete="off">
	<input class="form-control col-3 ml-2" id="checkOut" placeholder="체크아웃" autocomplete="off">
	<input type="number" class="form-control col-2 ml-2" id="headCount" placeholder="인원수 선택">
	<button type="button" class="btn btn-secondary ml-2" id="searchAvailablehotel">검색</button>
</div>
<div class="d-flex flex-wrap-set justify-content-around" id="accomoListBox">
	<c:forEach items="${accomodationList}" var="accomoList">
		<div class="border rounded mt-4 img-link" onClick="location.href='/category/accomodation_detail_view?accomodationId=${accomoList.id}'">
			<figure>
				<img src="${accomoList.thumbnailPic}" alt="호텔 사진" width="275px" height="200px" id="figureImg">
				<%-- 모달 이용해서 글 삭제 혹은 수정 여부--%>
				<%-- 각 카테고리별 클릭 시 상단 헤더와 nav 페이지 약간 변경 (시간 여유 생기면)--%>
				<figcaption><img src="https://www.iconninja.com/files/860/824/939/more-icon.png" width="40px" alt="더보기"></figcaption>
			</figure>
			<div>${accomoList.name}</div>
			<div>위치: ${accomoList.address}</div>
			<div>가격: ${accomoList.price}</div>
		</div>
	</c:forEach>
	<!-- onClick="location.href='/category/accomodation_list_view?accomodationId=${accomoList.id}'" -->
</div>

<script>
	$(document).ready(function() {
		
		// 호텔 검색
		$('#searchAvailablehotel').on('click', function() {
			let checkIn = $('#checkIn').val();
			let checkOut = $('#checkOut').val();
			let headCount = $('#headCount').val();
			
			if (checkIn == "") {
				alert("체크인 날짜를 선택해주세요.");
				return;
			}
			if (checkOut == "") {
				alert("체크아웃 날짜를 선택해주세요.");
				return;
			}
			if (headCount == "") {
				alert("인원수를 선택해주세요.");
				return;
			}
			
			/* let formData = new FormData();
			formData.append("checkIn", checkIn);
			formData.append("checkOut", checkOut);
			formData.append("headCount", headCount); */
			
			$.ajax({
				// request
				type:"GET"
				, url:"/category/accomodation_test"
				, data:{"checkIn":checkIn, "checkOut":checkOut, "headCount":headCount}
				//, contentType: false
			   // , processData: false
			    
				// response
				, success:function(data) {
					if (data.code == 200) {
						alert("성공");
					} else {
						alert("검색에 실패했습니다. 관리자에게 문의주세요.");
					}
				}
				, error:function(e) {
					alert("호텔 검색을 실패했습니다.");
				}
				
			});
		});
		
		// 체크인 체크아웃
		$.datepicker.setDefaults({
            dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'] // 요일을 한글로 변경
            , dateFormat: 'yy-mm-dd'
        });

        // 오늘 날짜로 이동하는 함수
        $.datepicker._gotoToday = function(id) {
            $(id).datepicker('setDate', new Date()).datepicker('hide').blur();
        };
        

        $('#checkOut').datepicker({
            minDate:0
        });
       
		$('#checkIn').datepicker({
            showButtonPanel: true // 오늘 버튼 노출
            , minDate:0 // 오늘과 그 이후만 선택 가능

            // 시작일이 선택되는 순간 종료일의 minDate 변경
            , onSelect:function(dateText) {
            	
                $('#checkOut').datepicker('option', 'minDate', dateText);
            }
        });
		
       /*  $("#checkOut").datepicker({beforeShow: customRange});
        function customRange(input) {
            var max_date  = $('#checkIn').datepicker('getDate');
            max_date.setDate(max_date.getDate()+4); // 가져온시작일에서 +7일추가
            var min_date = '+0';
            return { minDate: min_date,maxDate: max_date};
        }
         */
	});
</script>