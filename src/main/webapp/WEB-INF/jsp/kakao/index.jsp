<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오 로그인</title>
</head>

<a class="p-2" href="https://kauth.kakao.com/oauth/authorize?client_id=1b173149b4f3e15687a8dec52a9c3a0e&redirect_uri=http://localhost:8080/mainpage/mainpageView&response_type=code">
	<!-- REST_API키 및 REDIRECT_URI는 본인걸로 수정하세요 -->
	<!-- 본인걸로 수정 시 띄어쓰기 절대 하지 마세요. 오류납니다. -->
		<img src="/static/image/kakaoLoginBtn.png" style="height:60px">
</a>			
	<%-- <div class="kakaoView">
		<legend>로그인</legend>
		<input type="text" class="form-control mt-4 col-5" placeholder="아이디">
		<input type="text" class="form-control mt-2 mb-4 col-5" placeholder="비밀번호">
	</div>
	<div class="col-lg-12 text-center mt-3">
	    <button class="btn btn-block waves-effect waves-light btn-rounded btn-outline-info mb-3">로그인하기</button>
	    <img alt="카카오로그인" src="/static/image/kakaoLoginBtn.png" onclick="loginWithKakao()">
	</div>
	${pageContext.request.contextPath}/resources/assets/img/kakao_login_medium_wide.png
	
	<!-- 카카오 로그인 -->
	<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.min.js" charset="utf-8"></script>
	<script type="text/javascript">
	    $(document).ready(function(){
	        Kakao.init('20812f77c57107d8d78e87f168ed5df5');
	        Kakao.isInitialized();
	    });
	    
	
	    function loginWithKakao() {
	        Kakao.Auth.authorize({ 
	        redirectUri: 'http://localhost:8080/mainpage/mainpageView' 
	        }); // 등록한 리다이렉트uri 입력
	        /* 'http://localhost:8080/kakao_callback'  */
	    }
	</script> --%>
</body>
</html>