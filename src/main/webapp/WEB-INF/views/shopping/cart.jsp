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

.member-profile {
	text-align: center;
}

.product-img {
	height: 100px;
	width: 100px;
	display: block;
	vertical-align: middle;
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
		<h2 style="font-family: 'yg-jalnan'"><i class="fas fa-shopping-cart"></i> 장바구니</h2>
		<hr />
		<table class="table">
			<colgroup>
				<col width="5%">
				<col width="20%">
				<col width="60%">
				<col width="15%">
			</colgroup>
			<thead>
				<tr>
					<th>ㅁ</th>
					<th>전체선택</th>
					<th>상품정보</th>
					<th>상품금액</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="product" items="${cart }">
					<tr>
						<td>ㅁ</td>
						<td>
							<img class="rounded product-img" src="/resources/img/product/luggage/${product.img_path }">
						</td>
						<td>
							<p>${product.product_name }</p>
						</td>
						<td>
							<p>${product.price }</p>
						</td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="3">
					</td>
					<td>
						<p>총 상품가격</p>
					</td>
				</tr>
			</tbody>
		</table>
		<button type="button" class="btn btn-lg btn-primary">계속 쇼핑하기</button>
		<button type="button" class="btn btn-lg btn-primary">구매하기</button>
		<hr />
	</div>
	<!-- Footer -->
	<%@ include file="/WEB-INF/views/includes/footer.jsp"%>
</body>
</html>