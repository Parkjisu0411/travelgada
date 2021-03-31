<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@700;800&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="${contextPath}/resources/css/main.css">
<link rel="stylesheet" href="${contextPath}/resources/css/font.css">
<link rel="stylesheet" href="${contextPath}/resources/css/header.css">
<link rel="stylesheet" href="${contextPath}/resources/css/footer.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login Form</title>
<style>
html, body {
	width: 100%;
	height: 100%;
	margins: 0;
	padding: 0;
}
#wrap {
	min-heigth: 100%;
}
.login-icon {
	width: 300px;
	height: 50px;
	margin: 5px;
	display: block;
	margin: auto;
}
#login-form {
	margin: 0 auto;
}
</style>
<script type="text/javascript">
	window.onload = function() {
		var result = location.search.substring(1);
		if (result == 'error') {
			console.log('Login Error');
			document.getElementById("errorMsg").innerHTML = "<p style='color: #f00;'>로그인에 실패했습니다. 아이디 또는 패스워드를 다시 입력해주십시오.</p>";
		}
	}
</script>
</head>
<body>
	<!-- Header -->
	<%@ include file="/WEB-INF/views/includes/header.jsp"%>
	<!--Content -->
	<div id="wrap">
		<div class="container">
			<h2 class="headline" style="font-family: 'yg-jalnan'">
				<img class="nav-logo-img" src="${contextPath}/resources/logo.png">가다 로그인
			</h2>
			<div class="col-md-6" id="login-form">
				<form action="/member/login" method="POST">
					<input name="${_csrf.parameterName}" type="hidden"
						value="${_csrf.token}" />
					<div class="form-group">
						<label for="id">아이디:</label> <input type="text"
							class="form-control" placeholder="ID" id="id" name="username" />
					</div>
					<div class="form-group">
						<label for="pw">비밀번호:</label> <input type="password"
							class="form-control" placeholder="Password" id="pw"
							name="password" />
					</div>
					<div id="errorMsg"></div>
					<input type="checkbox" id="remember-me" name="remember-me" class="form-check-input" />
					<label class"form-check-label" for="remember-me">Remember me</label>
					&nbsp;&nbsp; <a href="/member">회원가입</a>
					<button type="submit" class="btn btn-primary login-icon"
						id="btnSubmit">로그인</button>
				</form>
				<div class="mb-auto">
					<hr />
				</div>
				<a href="/oauth2/authorization/kakao"><img class="login-icon"
					src="/resources/img/social/kakao_login_medium_wide.png"></a> <a
					href="/oauth2/authorization/google "><img class="login-icon"
					src="/resources/img/social/btn_google_signin_light_normal_web@2x.png"></a>
				<a href="/oauth2/authorization/naver "><img class="login-icon"
					src="/resources/img/social/naver_login_wide_white.PNG"></a>
			</div>
		</div>
	</div>

	<!-- Footer -->
	<%@ include file="/WEB-INF/views/includes/footer.jsp"%>
</body>
</html>