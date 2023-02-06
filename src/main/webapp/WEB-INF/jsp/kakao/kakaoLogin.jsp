<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	 <a href="#0" id="kakaoLogout">로그아웃</a> | 
    <a href="#0" id="secession">탈퇴</a>

    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <script>

        window.Kakao.init('20812f77c57107d8d78e87f168ed5df5');
        window.Kakao.Auth.setAccessToken(JSON.parse(sessionStorage.getItem('AccessKEY'))); //sessionStorage에 저장된 사용자 엑세스 토큰 받아온다.

        function kakaoLogout() {
            if (!Kakao.Auth.getAccessToken()) {
                console.log('Not logged in.');
                return;
            }
            Kakao.Auth.logout(function(response) {
                alert(response +' logout');
                window.location.href='/'
            });
        };

        function secession() {
            Kakao.API.request({
                url: '/v1/user/unlink',
                success: function(response) {
                    console.log(response);
                    //callback(); //연결끊기(탈퇴)성공시 서버에서 처리할 함수
                    window.location.href='/'
                },
                fail: function(error) {
                    console.log('탈퇴 미완료')
                    console.log(error);
                },
            });
        };

        const logout = document.querySelector('#kakaoLogout');
        const sion = document.querySelector('#secession');

        logout.addEventListener('click', kakaoLogout);
        sion.addEventListener('click', secession);
    </script>
</body>
</html>