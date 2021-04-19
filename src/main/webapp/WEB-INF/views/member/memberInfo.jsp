<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@700;800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${contextPath}/resources/css/main.css">
<link rel="stylesheet" href="${contextPath}/resources/css/font.css">
<link rel="stylesheet" href="${contextPath}/resources/css/header.css">
<link rel="stylesheet" href="${contextPath}/resources/css/footer.css">
<link rel="stylesheet" href="${contextPath}/resources/css/utils.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login Form</title>
<style>
	body {
		font-family: 'IBMPlexSansKR-Light';
	}
	
	hr {
		background-color: #1DCAD3;
	}
	
	th {
		font-weight: bold;
	}
	
	#member_id {
		font-family: 'GongGothicMedium';
		margin-bottom: 10px;
	}
	
	#member-info-profile {
		text-align: center;
		margin-bottom: 100px;
	}
	
	#member-info-detail {
		text-align: center;
	}
	
	#member-info-buyList thead {
		text-align: center;
	}
	
	#member-info-buyList {
	}
	
	#member-info-detail td{
		height: 50px;
	}
	
	#member-info-detail .card{
		height: 214px;
	}
	
	.gada-link:hover {
		color: #1DCAD3;
		cursor: pointer;
	}
	
	.member-img {
		height: 100px;
		width: 100px;
		display: block;
		vertical-align: middle;
		margin-top: 30px;
		margin-bottom: 30px;
		margin-left: auto;
		margin-right: auto;
	}
	
	.product-img {
		height: 100px;
		width: 100px;
		display: inline-block;
		vertical-align: middle;
		margin: 5px 10px 5px 10px;
		border-radius: 10px;
	}
	
	.product-info {
		display: inline-block;
	}
	
	.more-view {
		float: right;
	}
	
	.td-content {
		text-align: left;
		padding-left: 50px;
	}
	
	.shipping_loc_name {
		font-weight: bold;
	}
	
	a {
		color: #1DCAD3;
		font-weight: bold;
	}
	
	a:hover {
		color: #CFD2D3;
		text-decoration: none;
	}
	
	thead > tr {
		height: 60px;
	}
</style>
<script type="text/javascript">
	function viewDetail(product_id) {
		location.href = "/shopping/" + product_id;
	}
	
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
		<a class="more-view" href="/member/modify">회원정보 수정</a>
		<h2 class="gada-headline" style="">MY PAGE</h2>
		<hr />
		<div class="row">
			<div class="col-md-3" id="member-info-profile">
				<div class="card gada-card">
					<img class="rounded-circle member-img" src="/resources/img/profile/${member.profile_img_path }" onerror="this.src='/resources/img/profile/default_profile_img.jpg'">
					<span id="member_id">${member.member_id }</span>
				</div>
			</div>
			<div class="col-md-9" id="member-info-detail">
				<div class="card gada-card">
					<table class="table-borderless">
						<colgroup>
							<col width=20%>
							<col width=60%>
							<col width=20%>
						</colgroup>
						<tr>
							<th>포인트</th>
							<td class="td-content">${point }</td>
							<td><a href="/member/mypage/point" class="btn gada-btn">내역조회</a></td>
						</tr>
						<tr>
							<th>이메일</th>
							<td class="td-content">${member.email }</td>
							<td></td>
						</tr>
						<tr style="height: 80px">
							<th>배송지 목록</th>
							<td class="shipping_loc td-content">
								<c:forEach var="shipping_loc" items="${shippingList }">
									<span class="shipping_loc_name">${shipping_loc.shipping_loc_name }</span>
									<span class="shipping_loc_address">(${shipping_loc.address })</span>
									<br/>
								</c:forEach>
							</td>
							<td><a href="/member/shipping" class="btn gada-btn">목록관리</a></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
			<a href="shopping/buy_list" class="more-view">주문 더보기</a>
			<h2 class="gada-headline" style="">SHOPPING LIST</h2>
			<hr />
		<div class="row">
			<div class="col-md-12" id="member-info-buyList">
				<div class="card gada-card">
					<table class="table-borderless">
						<thead>
							<tr>
								<th>상품 정보</th>
								<th>주문 일자</th>
								<th>주문 번호</th>
								<th>주문 금액</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="buyDetail" items="${buyDetailList }">
								<tr>
									<td>
										<img class="product-img rounded" src="/resources/img/product/${productMap[buyDetail.buy_detail_id].img_path }" />
										<div class="product-info">
											<strong class="gada-link" onclick="viewDetail(${buyDetail.product_id})">${buyDetail.product_name }</strong>
											<p>₩ ${productMap[buyDetail.buy_detail_id].price }</p>
										</div>
									</td>
									<td><fmt:formatDate value="${buyMap[buyDetail.buy_detail_id].buy_date }" pattern="yyyy.MM.dd"/></td>
									<td><a href="/shopping/buy_list/${buyMap[buyDetail.buy_detail_id].buy_id }">${buyMap[buyDetail.buy_detail_id].buy_id }</a></td>
									<td>₩ ${buyDetail.price }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<!-- Footer -->
	<%@ include file="/WEB-INF/views/includes/footer.jsp"%>
</body>
</html>