<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<article class="col-6 d-flex justify-content-start">
	<img src="/static/image/travleIcon.png" width="80px" class="mr-2 mt-1" alt="logo">
	<div class="display-4 mt-1 banner"><a href="/mainpage/mainpageView" class="banner-color">Trip to Canada</a></div>
</article>
<article class="col-6">
	<%-- 로그인 유저 노출 --%>
	<c:if test="${not empty userName && adminId != 1}">
		<div class="d-flex justify-content-end align-items-center mt-3">
			<span class="text-secondary"><span class="font-weight-bold">${userName}</span>님 안녕하세요</span>
			<a href="/user/sign_out" class="ml-2 text-secondary font-weight-bold">로그아웃</a>
		</div>
		<div class="d-flex justify-content-end mt-1">
			<a href="#" class="small text-primary">내 정보 변경</a>
		</div>
	</c:if>
	<%-- 비로그인 유저 노출 --%>
	<c:if test="${empty userName}">
		<div class="d-flex justify-content-end mt-4">
			<div class="mr-3"><a href="/user/sign_in_view" class="text-secondary font-weight-bold">로그인</a></div>
			<div class="pr-5"><a href="/user/sign_up_view" class="text-secondary font-weight-bold">회원가입</a></div>
		</div>
	</c:if>
	<%-- 관리자 전용 페이지 노출 --%>
	<c:if test="${adminId eq 1}">
		<div class="d-flex justify-content-end mt-3">
			<div>관리자 페이지입니다.</div>
		</div>
		<div class="d-flex justify-content-end mt-1">
			<a href="/admin/create" class="text-secondary font-weight-bold">상품 추가</a>
			<a href="" class="ml-2 text-secondary font-weight-bold">회원관리</a>
			<a href="/user/sign_out" class="ml-2 text-secondary font-weight-bold">로그아웃</a>
		</div>
	</c:if>
</article>

