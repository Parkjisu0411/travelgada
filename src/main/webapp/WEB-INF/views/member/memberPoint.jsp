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
	height:100px;
	display: block;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		console.log($("tbody tr").length);
	})
</script>
</head>
<body>
	<!-- Header -->
	<%@ include file="/WEB-INF/views/includes/header.jsp" %>
	<!--Content -->
	<div id="wrap">
		<div class="container">
			<h2 class="headline" style="font-family: 'yg-jalnan'">포인트 내역</h2>
			<div class="row">
				<div class="col-md-12 member-detail">
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
									<td class="flag">
										<c:choose>
											<c:when test="${point.save_flag eq 0 }">
												적립
											</c:when>
											<c:otherwise>
												사용
											</c:otherwise>
										</c:choose>
									</td>
									<td class="date"><fmt:formatDate value="${point.save_date }" pattern="yyyy.MM.dd"/></td>
									<td class="point">${point.amount }</td>
									<td class="amount">
										
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<button type="button" class="btn btn-secondary" onclick="window.history.back();">돌아가기</button>
				</div>
			</div>
		</div>
	</div>
	<!-- Footer -->
	<%@ include file="/WEB-INF/views/includes/footer.jsp" %>
</body>
</html>