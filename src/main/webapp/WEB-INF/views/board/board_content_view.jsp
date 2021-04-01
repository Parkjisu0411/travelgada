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
<title>BOARD CONTENT</title>
<style>
html, body {
	width: 100%;
	height: 100%;
	margins: 0;
	padding: 0;
}

thead, tbody{
	text-align:left;
}

</style>
</head>
<body>
	<!-- Header -->
	<%@ include file="/WEB-INF/views/includes/header.jsp" %>
	<!--Content -->
	<div class="divider-header-blank"></div>
	<div id="wrap">
		<div class="container">
			<h2 class="headline" style="font-family: 'yg-jalnan'">ACCOMPANY</h2>
					<table class="table">
					<thead>
						<tr>
							<th><br/>
								<h3  style="font-family: 'yg-jalnan'; font_weight:lighter;">${bContentView.title }</h3><br/>
								${bContentView.member_id }&nbsp;&nbsp;&nbsp;
								${bContentView.board_date }
								${bContentView.profile_img_path }
								</th>
						</tr>						
					</thead>

					<tbody>
						<tr>
							<th>${bContentView.text }</th>
						</tr>
					</tbody>
				</table>

			<div>
				<button type="button" class="btn-default text-primary" onclick="window.location.href='${pageContext.request.contextPath }/board'" style="border-radius:0.2em; border:none; float:right;">쓰기</button>
			</div>

				<div style="padding:0 400px;">
				<form class="form-inline">
					<select style="border-radius:0.2em; border:2px solid black;">
						<option>제목</option>
						<option>제목+내용</option>
						<option>내용</option>
					</select>&nbsp;&nbsp;
					<input class="form-control mr-sm-2" type="text" aria-label="Search" style="width:50%;">
					<button class="btn btn-outline-white btn-sm my-0" type="submit">
						<i class="fas fa-search"></i>
					</button>
				</form>
				</div>
		</div>
	</div>
	<!-- Footer -->
	<%@ include file="/WEB-INF/views/includes/footer.jsp" %>
</body>
</html>