<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="d-flex justify-content-center">
	<div class="sign-up mt-5">
		<legend>회원가입</legend>
		<div class="border rounded p-3 sign-up-shape">
			<div class="sign-up-sen mb-3"><span class="text-danger"><img src="/static/image/canadalogo.png" width="30px">캐나다</span> 여행,<br>저희와 함께 준비해요</div>
				<div class="row">
					<div class="col-xs-12 col-md-12 d-flex align-items-center">
						<input type="text" id="loginId" name="loginId" class="form-control input-lg" placeholder="아이디를 입력해주세요" />
						<button type="button" id="loginIdCheckBtn" class="btn btn-sm btn-inline ml-3">중복확인</button>
					</div>
					
					<div id="idCheckLength" class="small text-danger d-none ml-3">ID를 4자 이상 입력해주세요.</div>
					<div id="idCheckDuplicated" class="small text-danger d-none ml-3">이미 사용중인 ID입니다.</div>
					<div id="idCheckOk" class="small text-success d-none ml-3">사용 가능한 ID 입니다.</div>
					
					<div class="col-xs-12 col-md-12 mt-4">
						<input type="password" id="password" name="password" class="form-control input-lg" placeholder="비밀번호를 입력해주세요" />
					</div>
				</div>
				<br>
				<input type="password" id="confirmPassword" name="confirmPassword" class="form-control input-lg" placeholder="비밀번호 확인" />
				<span id="passwordChecker" class="small text-danger">비밀번호가 일치하지 않습니다.</span><br> 
				<input type="text" id="name" name="name" class="form-control input-lg" placeholder="이름을 입력해주세요" /> <br>
				<input type="text" id="email" name="email" class="form-control input-lg" placeholder="이메일을 입력해주세요" /> <br>
				<div class="sign-up-font-size">이미 회원이세요? <a href="/user/sign_in_view">로그인하러 가기</a></div>
				<br>
				<button class="btn form-control btn-primary" id="signUpBtn" type="submit">회원가입</button>
		</div>
	</div>
</div>
<script>
	$(document).ready(function() {
		$('#loginIdCheckBtn').on('click', function() {
			//alert('테스트');
			$('#idCheckLength').addClass('d-none');
			$('#idCheckDuplicated').addClass('d-none');
			$('#idCheckOk').addClass('d-none');
			
			let loginId = $('input[name=loginId]').val().trim();
			
			if (loginId.length < 4) {
				$('#idCheckLength').removeClass('d-none'); // 경고문구 노출
				return;
			}
			
			// 중복여부는 DB를 조회해야 하므로 서버에 묻는다. 
			// 화면을 이동시키지 않고 ajax 통신으로 중복여부 확인하고 동적으로 문구 노출
			$.ajax({
				url: "/user/is_duplicated_id",
				data: {"loginId": loginId},
				success: function(data) {
					if (data.result == true) { // 중복인 경우
						$('#idCheckDuplicated').removeClass('d-none'); // 중복 경고문구 노출
						$('#idCheckLength').addClass('d-none'); // 숨김
						$('#idCheckOk').addClass('d-none'); // 숨김
					} else {
						$('#idCheckOk').removeClass('d-none'); // 사용가능 문구 노출
						$('#idCheckLength').addClass('d-none'); // 숨김
						$('#idCheckDuplicated').addClass('d-none'); // 숨김
					}
				},
				error: function(error) {
					alert("아이디 중복확인에 실패했습니다. 관리자에게 문의해주세요.");
				}
			});
			
		});
		
		$('#passwordChecker').hide();
		$('#confirmPassword').on('keyup', function() {
			let password = $('#password').val().trim();
			let confirmPassword = $('#confirmPassword').val().trim();
			if (password != confirmPassword) {
				$('#passwordChecker').show();
			} else {
				$('#passwordChecker').hide();
			}
		});
		
		// 회원가입
		$('#signUpBtn').on('click', function(e) {
			e.preventDefault(); // 서브밋 중단 구문 - 눌러도 submit 되지 않음
			
			let loginId = $('#loginId').val().trim();
			let password = $('#password').val().trim();
			let confirmPassword = $('#confirmPassword').val().trim();
			let name = $('#name').val().trim()
			let email = $('#email').val().trim();
			
			if (loginId == "") {
				alert("아이디를 입력해주세요");
				return false;
			}
			if(password == "") {
				alert("비밀번호를 입력해주세요");
				return false;
			}
			if(confirmPassword == "") {
				alert("비밀번호를 입력해주세요");
				return false;
			}
			if (password != confirmPassword) {
				alert("비밀번호가 일치하지 않습니다.");
				return false;
			}
			if(name == "") {
				alert("이름을 입력해주세요");
				return false;
			}
			if(email == "") {
				alert("이메일을 입력해주세요");
				return false;
			}
			
			// 아이디 중복확인 완료 됐는지 확인 -> idCheckOk d-none을 가지고 있으면 확인하라는 alert 띄워야 함
			if($('#idCheckOk').hasClass('d-none')) {
				alert("아이디 중복확인을 다시 해주세요");
				return false;
			}
			
			// 서버로 보내는 첫 번째 방법
			// 1) submit을 동작시킨다 
			// $(this)[0].submit(); // 첫번째 폼태그를 작동시킨다는 뜻이다. - sumit이기 때문에 화면이 넘어간다. view 페이지 이동
			
			// 2) ajax
			$.ajax({
				// request
				type:"POST"
				, url:"/user/sign_up"
				, data:{"loginId":loginId, "password":password, "name":name, "email":email}
				
				// response
				, success:function(data) {
					if (data.result == "success") {
						alert("가입을 환영합니다! 로그인 해주세요");
						location.href = "/user/sign_in_view";
					} else {
						alert(data.errorMessage);
					}
				}
				
				, error:function(e) {
					alert("회원가입에 실패했습니다. 관리자에게 문의해주세요.");
				}
			});
				
		});
	});
</script>