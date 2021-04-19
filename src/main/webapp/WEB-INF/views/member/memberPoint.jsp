<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	hr {
		background-color: #1DCAD3;
	}
	
	.gada-btn-group {
		text-align: center;
	}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		var count = $("tbody tr").length;
		for(var i = count; i >= 0; i--) {
			var tr = $("tbody tr:nth-child(" + i + ")");
			var point = tr.children(".point").text();
			var flag = tr.children(".flag").text();
			console.log(flag);
			if(flag == "사용") {
				point = point * -1;
			}
			var amount = tr.children(".amount");
			if(i == (count)) {
				amount.text(point);
			} else {
				point = parseInt($("tbody tr:nth-child(" + (i + 1) + ")").children(".amount").text()) + parseInt(point);
				amount.text(point);
				console.log(point);
			}
		};
	})
</script>
</head>
<body>
	<!-- Header -->
	<%@ include file="/WEB-INF/views/includes/header.jsp" %>
	<!--Content -->
	<div id="wrap">
		<div class="container">
			<h2 class="gada-headline">POINT LIST</h2>
			<hr />
			<div class="row">
				<div class="col-md-12 member-detail">
					<div class="gada-card">
					<table class="table">
						<thead>
							<tr>
								<th>적립/사용</th>
								<th>일시</th>
								<th>포인트</th>
								<th>잔여 포인트</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="point" items="${pointList }">
								<tr id="${point.point_id }">
									<c:choose>
										<c:when test="${point.save_flag eq 0 }">
											<td class="flag" style="color:#1DCAD3;">적립</td>
										</c:when>
										<c:otherwise>
											<td class="flag" style="color:#ff7473;">사용</td>
										</c:otherwise>
									</c:choose>
									<td class="date"><fmt:formatDate value="${point.save_date }" pattern="yyyy.MM.dd hh:mm:ss"/></td>
									<td class="point">${point.amount }</td>
									<td class="amount">
										
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="gada-btn-group">
						<button type="button" class="btn gada-btn-reverse" onclick="window.history.back();">돌아가기</button>
					</div>
				</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Footer -->
	<%@ include file="/WEB-INF/views/includes/footer.jsp" %>
</body>
</html>