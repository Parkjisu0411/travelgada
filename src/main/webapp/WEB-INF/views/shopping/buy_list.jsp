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
</style>
<script type="text/javascript">
	
</script>
</head>
<body>
	<!-- Header -->
	<%@ include file="/WEB-INF/views/includes/header.jsp"%>
	<!--Content -->
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="buy-header-area">
					<h3 style="font-family:'yg-jalnan'">주문내역 조회</h3>
				</div>
				<div class="buy-list-area">
					<div class="buy-search-area">
						<div class="btn-group">
							<button class="btn btn-secondary">1주일</button>
							<button class="btn btn-secondary">1개월</button>
							<button class="btn btn-secondary">3개월</button>
							<button class="btn btn-secondary">전체</button>
						</div>
					</div>
					<table class="table">
						<thead>
							<tr>
								<th>상품정보</th>
								<th>주문일자</th>
								<th>주문번호</th>
								<th>주문금액</th>
								<th>주문상태</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="buy" items="${buyList }">
								<tr>
									<td>
									</td>
									<td>${buy.buy_date }</td>
									<td>${buy.buy_id }</td>
									<td></td>
									<td>구매확정</td>
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