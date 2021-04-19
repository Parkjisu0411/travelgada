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
<link rel="stylesheet" href="${contextPath}/resources/css/utils.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login Form</title>
<style>
html, body {
	width: 100%;
	height: 100%;
	margins: 0;
	padding: 0;
	background-color: white; 
}

#wrap {
	min-heigth: 100%;
}

#member-info-profile {
	text-align: center;
}

#member-info-detail {
	text-align: center;
}

#member-info-buyList {
	margin-top: 30px;
}

.member-img {
	height: 100px;
	width: 100px;
	display: block;
	vertical-align: middle;
	margin-top: 50px;
	margin-bottom: 30px;
	margin-left: auto;
	margin-right: auto;
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
	<div class="container">
		<h2 class="gada-headline">MY PAGE</h2>
		<hr />
		<p class="view-more-p">
			<button type="button" class="btn gada-btn"
				onclick="location.href='/member/modify'">회원정보 수정</button>
		</p>
		<div class="row">
			<div class="col-md-3" id="member-info-profile">
				<div class="card gada-card">
					<img class="rounded-circle member-img" src="/resources/img/profile/${member.profile_img_path }" onerror="this.src='/resources/img/profile/default_profile_img.jpg'">
					<span>${member.member_id }</span>
				</div>
				<div class="card">
					<table class="table-borderless" id="member-info-table">
						<tr>
							<th>이름</th>
							<td>${member.member_name }</td>
						</tr>
					</table>
				</div>
			</div>
			<div class="col-md-9" id="member-info-detail">
				<div class="card gada-card">
					<table class="table">
						<tr>
							<th>포인트</th>
							<td>${point }</td>
							<td><a href="/member/mypage/point">내역조회</a></td>
						</tr>
						<tr>
							<th>이메일</th>
							<td>${member.email }</td>
							<td></td>
						</tr>
						<tr>
							<th>배송지 목록</th>
							<td><c:forEach var="shipping_loc" items="${shippingList }">
									<p>${shipping_loc.shipping_loc_name }(${shipping_loc.address })</p>
								</c:forEach></td>
							<td><a href="/member/shipping">관리</a></td>
						</tr>
					</table>
				</div>
			</div>
			<div class="col-md-12" id="member-info-buyList">
				<div class="card gada-card">
					<table class="table-borderless">
						<thead>
							<tr>
								<th>상품 정보</th>
								<th>수량</th>
								<th>결제 금액</th>
								<th>운송장 번호</th>
							</tr>
						</thead>
					</table>
				</div>
			</div>
		</div>
		<hr />
	</div>
	<!-- Footer -->
	<%@ include file="/WEB-INF/views/includes/footer.jsp"%>
</body>
</html>