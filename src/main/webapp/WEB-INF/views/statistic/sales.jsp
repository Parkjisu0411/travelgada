<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<title>매출 통계</title>
<style>
</style>
<script>
</script>

</head>
<body>

	<!-- Header -->
	<%@ include file="/WEB-INF/views/includes/header.jsp"%>
	
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<table class="table">
					<thead>
						<tr>
							<c:forEach var="i" begin="1" end="12">
								<th>${i }</th>
							</c:forEach>
						</tr>
					</thead>
					<tbody>
						<tr>
							<c:forEach var="i" begin="1" end="12">
								<td>
									<c:out value="${monthlySales[i] }"></c:out>
								</td>
							</c:forEach>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="col-md-12">
				<table class="table">
					<thead>
						<tr>
							<c:forEach var="i" begin="1" end="31">
								<th>${i }</th>
							</c:forEach>
						</tr>
					</thead>
					<tbody>
						<tr>
							<c:forEach var="i" begin="1" end="31">
								<td>
									<c:out value="${dailySales[i] }"></c:out>
								</td>
							</c:forEach>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	
	<!-- Footer -->
	<%@ include file="/WEB-INF/views/includes/footer.jsp"%>

</body>
</html>