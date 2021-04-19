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
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@800;900&display=swap" rel="stylesheet"><!-- 큰 영어 -->
<!-- GADA CSS -->
<link rel="stylesheet" href="${contextPath}/resources/css/main.css">
<link rel="stylesheet" href="${contextPath}/resources/css/font.css">
<link rel="stylesheet" href="${contextPath}/resources/css/header.css">
<link rel="stylesheet" href="${contextPath}/resources/css/footer.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login Form</title>
<style>
/* 디데이 글씨 */
@font-face {
    font-family: 'GongGothicLight';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10@1.0/GongGothicLight.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

/* 내용 글씨 */
@font-face {
    font-family: 'IBMPlexSansKR-Light';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/IBMPlexSansKR-Light.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

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

/* 플래너 text */
.text_box{
	padding:15px;
	font-family: 'IBMPlexSansKR-Light';
}

.cal{
	margin-bottom:30px;
}

/* 플래너 */
.card-pl-area{
	border-radius: 10px;
	margin: 0px 0px 30px 0px;
	height: 460;
	background-color: #f5f5f5;
}

/* 플래너 이미지 */
.card-pl-img {
	width: 100%;
	height: 350px;
	border-radius: 10px 10px 0px 0px;
	object-fit: cover;
}

/* 디데이 */
.dday{
	background-color:#fcd581; 
	font-family: 'GongGothicLight';
}

/* 해드라인 */
.headline{
	font-family: 'Montserrat', sans-serif;  
	color: #1dcad3; 
	font-size:40px; 
	font-weight:bold;
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
			<h2 class="headline">MY PLANNER</h2>
			<br>
			<div class="cal">
				<%@ include file="/WEB-INF/views/calendar/calendar3.jsp"%>
			</div>
			<br><br><br><br>
			
			<div class="row">
				<c:forEach var="planner" items="${plannerList }">
					<div class="col-md-4" id="${planner_planner_id }"
						onclick="selectPlanner(${planner.planner_id})">
						<div class="card-pl-area">
							<img class="card-pl-img" src="/resources/img/profile/gada">
							<div class="text_box">
								<strong>${planner.planner_name }</strong>&nbsp; 
								<span class="badge dday">
									D - <c:out value="${DDayMap[planner.planner_id] }" />
								</span>
								<br><br>
								<p>${planner.start_date } ~ ${planner.end_date }</p>
								<%-- <p>${planner.member_id }</p> --%>
							</div>
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