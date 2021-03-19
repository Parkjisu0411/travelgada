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
<title>SignUp Form</title>
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

#signup-form {
	margin: 0 auto;
}
</style>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$("#btnSubmit")
								.click(
										function(event) {
											event.preventDefault();
											var form = {
												member_id : $("#id").val(),
												pw : $("#pw").val(),
												member_name : $("#name").val(),
												email : $("#email").val(),
												phone_num : $("#phone_num")
														.val(),
											};

											$
													.ajax({
														type : "POST",
														url : "${pageContext.request.contextPath}/member",
														data : JSON
																.stringify(form),
														contentType : 'application/json',
														beforeSend : function(
																xhr) {
															xhr
																	.setRequestHeader(
																			"${_csrf.headerName}",
																			"${_csrf.token}");
														},
														success : function(
																result) {
															if (result == "SUCCESS") {
																alert("회원가입 완료.");
																$(location)
																		.attr(
																				'href',
																				'${pageContext.request.contextPath}/');
															}
														},
														error : function(e) {
															console.log(
																	"ERROR : ",
																	e);
															alert("회원가입 실패.");
															return false;
														}
													});
										});
					})
</script>
</head>
<body>
	<!-- Header -->
	<%@ include file="/WEB-INF/views/includes/header.jsp"%>
	<!--Content -->
	<div class="divider-header-blank"></div>
	<div id="wrap">
		<div class="container">
			<div class="col-md-6" id="signup-form">
				<h2 class="headline" style="font-family: 'yg-jalnan'">
					<img class="nav-logo-img" src="${contextPath}/resources/logo.png">가다
					회원가입
				</h2>
				<form>
					<div class="form-group">
						<label for="id">아이디:</label> <input type="text"
							class="form-control" placeholder="ID" id="id" />
					</div>
					<div class="form-group">
						<label for="pw">비밀번호:</label> <input type="password"
							class="form-control" placeholder="Password" id="pw" />
					</div>
					<div class="form-group">
						<label for="pw2">비밀번호 재확인:</label> <input type="password"
							class="form-control" placeholder="Password" id="pw2" />
					</div>
					<div class="form-group">
						<label for="name">이름:</label> <input type="text"
							class="form-control" placeholder="Name" id="name" />
					</div>
					<div class="form-group">
						<label for="email">이메일:</label> <input type="email"
							class="form-control" placeholder="Email" id="email" />
					</div>
					<div class="form-group">
						<label for="phone_num">휴대폰:</label> <input type="text"
							class="form-control" placeholder="Phone Number" id="phone_num" />
					</div>
					<button type="submit" class="btn btn-primary" id="btnSubmit">회원가입</button>
				</form>
			</div>
		</div>
	</div>
	<!-- Footer -->
	<%@ include file="/WEB-INF/views/includes/footer.jsp"%>
</body>
</html>