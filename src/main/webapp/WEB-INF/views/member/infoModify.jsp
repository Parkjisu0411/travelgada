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

.member-img {
	margin: 30px;
	height: 100px;
	display: block;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		$("#change-password-btn").click(function(e) {
			e.preventDefault();
			$("#password-area").css("display", "none");
			$("#change-password-area").css("display", "");
		});

		$("#change-password-cancle-btn").click(function(e) {
			e.preventDefault();
			$("#password").val('');
			$("#newPassword").val('');
			$("#confirmPassword").val('');
			$("#password-area").css("display", "");
			$("#change-password-area").css("display", "none");
		});

		$("#change-name-btn").click(function(e) {
			e.preventDefault();
			$("#name-area").css("display", "none");
			$("#change-name-area").css("display", "");
		});

		$("#change-name-cancle-btn").click(function(e) {
			e.preventDefault();
			$("#name").val('');
			$("#name-area").css("display", "");
			$("#change-name-area").css("display", "none");
		});

		$("#change-email-btn").click(function(e) {
			e.preventDefault();
			$("#email-area").css("display", "none");
			$("#change-email-area").css("display", "");
		});

		$("#change-email-cancle-btn").click(function(e) {
			e.preventDefault();
			$("#email").val('');
			$("#email-area").css("display", "");
			$("#change-email-area").css("display", "none");
		});
		
		$("#change-phone-btn").click(function(e) {
			e.preventDefault();
			$("#phone-area").css("display", "none");
			$("#change-phone-area").css("display", "");
		});

		$("#change-phone-cancle-btn").click(function(e) {
			e.preventDefault();
			$("#phone").val('');
			$("#phone-area").css("display", "");
			$("#change-phone-area").css("display", "none");
		});

	})
</script>
</head>
<body>
	<!-- Header -->
	<%@ include file="/WEB-INF/views/includes/header.jsp"%>
	<!--Content -->
	<div id="wrap">
		<div class="container">
			<h2 class="headline" style="font-family: 'yg-jalnan'">회원 정보</h2>
			<div class="col-md-8" style="margin:auto;">
				<table class="table">
					<tr>
						<th>사진</th>
						<td><img class="rounded-circle member-img"
							src="${member.profile_img_path }"
							onerror="this.src='/resources/img/profile/default_profile_img.jpg'"></td>
						<td><button type="button" class="btn btn-secondary">사진
								변경</button></td>
					</tr>
					<tr>
						<th>아이디</th>
						<td colspan="2">${member.member_id }</td>
					</tr>
					<tr id="password-area">
						<th>비밀번호</th>
						<td><strong>********</strong></td>
						<td><button type="button" class="btn btn-secondary"
								id="change-password-btn">비밀번호 변경</button></td>
					</tr>
					<tr id="change-password-area" style="display: none;">
						<th>비밀번호</th>
						<td colspan="2">
							<div class="password-change">
								<div class="input">
									<label for="password">현재 비밀번호</label> <input type="password"
										class="now-input" id="password" />
								</div>
								<div class="input">
									<label for="password">신규 비밀번호</label> <input type="password"
										class="now-input" id="newPassword" />
								</div>
								<div class="input">
									<label for="password">신규 비밀번호 재 입력</label> <input
										type="password" class="now-input" id="confirmPassword" />
								</div>
								<div class="btn-group">
									<button type="button" class="n-btn btn-sm-btn-lighter"
										id="change-password-cancle-btn">취소</button>
									<button type="button" class="n-btn btn-sm-btn-accent disabled"
										id="change-password-finish-btn" disabled>완료</button>
								</div>
							</div>
						</td>
					</tr>
					<tr id="name-area">
						<th>이름</th>
						<td>${member.member_name }</td>
						<td><button type="button" class="btn btn-secondary"
								id="change-name-btn">이름 변경</button></td>
					</tr>
					<tr id="change-name-area" style="display: none;">
						<th>이름</th>
						<td colspan="2">
							<div class="name-change">
								<div class="input">
									<label for="name">변경할 이름</label> <input type="text"
										class="name-input" id="name" />
								</div>
								<div class="btn-group">
									<button type="button" class="n-btn btn-sm-btn-lighter"
										id="change-name-cancle-btn">취소</button>
									<button type="button" class="n-btn btn-sm-btn-accent disabled"
										id="change-name-finish-btn" disabled>완료</button>
								</div>
							</div>
						</td>
					</tr>
					<tr id="email-area">
						<th>이메일</th>
						<td>${member.email }</td>
						<td><button type="button" class="btn btn-secondary"
								id="change-email-btn">이메일 변경</button></td>
					</tr>
					<tr id="change-email-area" style="display: none;">
						<th>이메일</th>
						<td colspan="2">
							<div class="email-change">
								<div class="input">
									<label for="email">변경할 이메일</label> <input type="text"
										class="email-input" id="name" />
								</div>
								<div class="btn-group">
									<button type="button" class="n-btn btn-sm-btn-lighter"
										id="change-email-cancle-btn">취소</button>
									<button type="button" class="n-btn btn-sm-btn-accent disabled"
										id="change-email-finish-btn" disabled>완료</button>
								</div>
							</div>
						</td>
					</tr>
					<tr id="phone-area">
						<th>휴대전화</th>
						<td>${member.phone_num }</td>
						<td><button type="button" class="btn btn-secondary"
								id="change-phone-btn">휴대전화 변경</button></td>
					</tr>
					<tr id="change-phone-area" style="display: none;">
						<th>휴대전화</th>
						<td colspan="2">
							<div class="phone-change">
								<div class="input">
									<label for="phone">변경할 휴대전화</label> <input type="text"
										class="phone-input" id="phone" />
								</div>
								<div class="btn-group">
									<button type="button" class="n-btn btn-sm-btn-lighter"
										id="change-phone-cancle-btn">취소</button>
									<button type="button" class="n-btn btn-sm-btn-accent disabled"
										id="change-phone-finish-btn" disabled>완료</button>
								</div>
							</div>
						</td>
					</tr>
				</table>
				<button type="button" class="btn btn-secondary"
					onclick="window.history.back();">돌아가기</button>
			</div>
		</div>
	</div>
	<!-- Footer -->
	<%@ include file="/WEB-INF/views/includes/footer.jsp"%>
</body>
</html>