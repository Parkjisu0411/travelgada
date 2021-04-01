<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<!-- jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- bootstrap -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!-- font -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@700;800&display=swap" rel="stylesheet">
<!-- GADA CSS -->
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
.card {
}
</style>
<script>
	function selectPlanner(planner_id) {
		$.ajax({
			type : "GET",
			url : "/planner/" + planner_id,
			cache : false,
			success : function(result) {
				location.href="/planner/schedule";
			},
			error : function(e) {
				console.log(e);
				alert("에러가 발생했습니다.");
			}
		});
	} 
</script>
</head>
<body>
	<!-- Header -->
	<%@ include file="/WEB-INF/views/includes/header.jsp"%>
	<!--Content -->
	<div id="wrap">
		<div class="container">
			<h2 class="headline" style="font-family: 'yg-jalnan'">MY PLANNER</h2>
			<%@ include file="/WEB-INF/views/calendar/calendar.jsp"%>
			<div class="divider-header-blank"></div>
			<div class="row">
				<c:forEach var="planner" items="${plannerList }">
					<div class="col-lg-4 card" id="${planner_planner_id }" onclick="selectPlanner(${planner.planner_id})">
						<img class="card-img-top rounded" src="/resources/img/profile/gada">
						<div class="card-body">
							<strong>${planner.planner_name }</strong>&nbsp;
								<span class="badge badge-secondary">D - <c:out value="${DDayMap[planner.planner_id] }" /></span>
							<p>${planner.start_date } ~ ${planner.end_date }</p>
							<p>${planner.member_id }</p>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<!-- Footer -->
	<%@ include file="/WEB-INF/views/includes/footer.jsp"%>
</body>
</html>