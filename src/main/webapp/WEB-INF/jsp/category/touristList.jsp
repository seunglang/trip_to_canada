<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="d-flex flex-wrap-set justify-content-around" id="accomoListBox">
	<c:forEach items="${touristList}" var="touristList">
		<div class="border rounded mt-4 img-link" onClick="location.href='/category/tourist_detail_view?touristId=${touristList.id}'">
			<img src="${touristList.thumbnailPic}" alt="호텔 사진" width="275px" height="200px" id="figureImg">
			<div class="touristNameFont mt-1">${touristList.name}</div>
			<div>평점</div><!-- 별점 넣기 -->
			<div>입장료: ${touristList.price}원</div>
		</div>
	</c:forEach>
	<!-- onClick="location.href='/category/accomodation_list_view?accomodationId=${accomoList.id}'" -->
</div>