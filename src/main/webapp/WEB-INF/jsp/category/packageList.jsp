<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="d-flex flex-wrap-set justify-content-around" id="accomoListBox">
	<c:forEach items="${packageList}" var="packageList">
		<div class="border rounded mt-4 img-link" onClick="location.href='/category/package_detail_view?packageId=${packageList.id}'">
			<img src="${packageList.thumbnailPic}" alt="호텔 사진" width="275px" height="200px" id="figureImg">
			<div class="small text-secondary ml-2 mt-2">가이드 투어 &middot; 토론토</div>
			<div class="packageNameFont mt-1 package-list-box font-weight-bold mx-2">${packageList.name}</div>
			<div class="d-flex">
				<img src="/static/image/sight.png" alt="sightseeing" width="25px" height="19px" class="mt-2 ml-2"><div class="mr-2 ml-1 mt-2 small">${packageList.field}</div>
			</div>
			<div class="mx-2 mb-2 mt-2 text-secondary">${packageList.price}원 / 1인</div>
		</div>
	</c:forEach>
	<!-- onClick="location.href='/category/accomodation_list_view?accomodationId=${accomoList.id}'" -->
</div>