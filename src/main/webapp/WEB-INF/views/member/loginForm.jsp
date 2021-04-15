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
	background-color: #f5f5f5; 
}

#wrap {
	min-heigth: 100%;
}

#login-form-submit {
	width: 466px;
	height: 50px;
	margin: 5px auto;
	display: block;
	background-color: #ff7473;
	color: white;
	border-radius: 30px;
}

#login-form-content {
	margin: 0 auto;
}

#login-form-head {
	padding-top: 30px;
	padding-bottom: 30px;
	text-align: center;
}

#login-form {
	padding: 20px;
	width: 540px;
	margin: 0 auto;
	border-radius: 10px;
}

.form-control {
	border-radius: 30px;
	height: 50px;
}

.login-form-link {
	color: gray;
}

.login-form-link:hover {
	text-decoration: none;
}

#login-form-sns {
	text-align: center;
	margin: 0 auto;
}

.login-sns-icon {
	width: 50px;
	height: 50px;
	border-radius: 25px;
	margin: 5px;
}

#login-form-singUp {
	text-align: center;
	margin-top: 20px;
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
	
	<div class="container">
		<div class="card" id="login-form">
			<h2 id="login-form-head" style="font-family: 'yg-jalnan'">
				<img class="nav-logo-img" src="${contextPath}/resources/img/main/logo.png">가다 로그인
			</h2>
			<div class="col-md-12" id="login-form-content">
				<form action="/member/login" method="POST" id="login-form-form">
					<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}" />
					<div class="form-group">
						<label for="id">아이디</label> <input type="text" class="form-control" placeholder="ID" id="id" name="username" />
					</div>
					<div class="form-group">
						<label for="pw">비밀번호</label> <input type="password" class="form-control" placeholder="Password" id="pw" name="password" />
					</div>
					<div class="form-group">
						<input type="checkbox" id="remember-me" name="remember-me" />
						<label class="form-check-label" for="remember-me">Remember me</label>
						<a href="#" class="login-form-link" style="float:right">아이디/비밀번호 찾기</a>
					</div>
					
					<br/>
					<br/>
					<div id="errorMsg"></div>
					<button type="submit" class="btn" id="login-form-submit">로그인</button>
				</form>
				<hr />
				<div id="login-form-sns">
					<p>or Sign Up Using</p>
					<a href="/oauth2/authorization/kakao"><img class="login-sns-icon" src="/resources/img/social/kakaolink_btn_medium.png"></a>
					<a href="/oauth2/authorization/google "><img class="login-sns-icon" src="/resources/img/social/google_login.svg"></a>
					<a href="/oauth2/authorization/naver "><img class="login-sns-icon" src="/resources/img/social/naver_login_icon_Green.PNG"></a>
				</div>
				<div id="login-form-singUp">
					<a href="/member" class="login-form-link">회원가입</a>
				</div>
			</div>
		</div>
	</div>
	<!-- Footer -->
	<%@ include file="/WEB-INF/views/includes/footer.jsp"%>
</body>
</html>