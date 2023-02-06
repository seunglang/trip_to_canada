<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="d-flex justify-content-center">
	<div class="login-box">
		<legend class="mt-5">로그인</legend>
		<%-- 키보드 Enter키로 로그인이 될 수 있도록 form 태그를 만들어준다.(submit 타입의 버튼이 동작됨) --%>
		<form id="loginForm" action="/user/sign_in" method="post">
			<div class="sign-up">
				<div class="border rounded p-3 sign-up-shape">
					<div class="sign-up-sen mb-3"><span class="text-danger"><img src="/static/image/canadalogo.png" width="30px">캐나다</span> 여행,<br>저희와 함께 준비해요</div>
						<div class="row">
							<div class="col-xs-12 col-md-12 d-flex align-items-center">
								<input type="text" id="loginId" name="loginId" class="form-control input-lg" placeholder="아이디를 입력해주세요" />
							</div>
							<div class="col-xs-12 col-md-12 mt-4">
								<input type="password" id="password" name="password" class="form-control input-lg" placeholder="비밀번호를 입력해주세요" />
							</div>
						</div>
						<br>
					<button class="btn form-control btn-primary" id="signUpBtn" type="submit">로그인</button>
				</div>
			</div>
		</form>
	</div>
</div>

<div class="sign-up-width d-flex justify-content-start mt-1 pl-1">
	<div><a href="/user/sign_up_view" class="sign-up-font-size">회원가입&nbsp;/</a></div>
	<div><a href="/user/kakao_login" class="sign-up-font-size">&nbsp;카카오 회원가입</a></div>
</div>

<script>
$(document).ready(function() {
	// 로그인 서브밋
	$('#loginForm').submit(function(e) {
		e.preventDefault(); // submit 자동 수행 중단
		
		var loginId = $('input[name=loginId]').val().trim();
		if (loginId == '') {
			alert("아이디를 입력해주세요.");
			return;
		}
		
		var password = $('input[name=password]').val();
		if (password == '') {
			alert("비밀번호를 입력해주세요.");
			return;
		}
		
		// AJAX로 서브밋
		var url = $(this).attr("action");
		var params = $(this).serialize(); // form의 name 속성으로 data를 구성한다.
		console.log(params);
		
		$.post(url, params)
		.done(function(data) {
			if (data.code == 1) {
				location.href="/mainpage/mainpageView"; 
			} else {
				alert("로그인에 실패했습니다. 다시 시도해주세요.");
				location.reload();
			}
		}); 
	});
});
</script>