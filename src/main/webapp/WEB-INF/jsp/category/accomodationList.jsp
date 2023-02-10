<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="d-flex flex-wrap-set justify-content-around" id="accomoListBox">
	<c:forEach items="${accomodationList}" var="accomoList">
		<div class="border rounded mt-4 img-link" onClick="location.href='/category/accomodation_detail_view?accomodationId=${accomoList.id}'">
			<figure>
				<img src="${accomoList.thumbnailPic}" alt="호텔 사진" width="275px" height="200px" id="figureImg">
				<%-- 모달 이용해서 글 삭제 혹은 수정 여부 --%>
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

