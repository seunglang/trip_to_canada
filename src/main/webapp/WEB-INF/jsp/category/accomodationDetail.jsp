<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div>
	<h4>${accomodation.address}</h4>
	<div>${accomodation.zipCode}</div>
	<img src="${accomodation.thumbnailPic}" width="500px">
	<div>${accomodation.name}</div>
	<div>￦${accomodation.price}</div>
</div>
