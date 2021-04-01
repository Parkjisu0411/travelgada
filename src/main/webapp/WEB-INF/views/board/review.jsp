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
<title>REVIEW BOARD</title>
<style>
html, body {
	width: 100%;
	height: 100%;
	margins: 0;
	padding: 0;
}


</style>

</head>
<body>
	<!-- Header -->
	<%@ include file="/WEB-INF/views/includes/header.jsp"%>
	<!--Content -->
	<div class="divider-header-blank"></div>
	<div id="wrap">
		<div class="container">
			<h2 class="headline" style="font-family: 'yg-jalnan'">REVIEW</h2>
			<table class="table">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>날짜</th>
						<th>조회수</th>
					</tr>
				</thead>

				<tbody>
					<c:forEach items="${boardNoticeList }" var="boardNoticeList">
						<tr>
							<td>${boardNoticeList.board_id }</td>
							<td>${boardNoticeList.title }</td>
							<td>${boardNoticeList.member_id }</td>
							<td>${boardNoticeList.board_date }</td>
							<td>${boardNoticeList.bhit }</td>
						</tr>
					</c:forEach>
				
					<c:forEach items="${boardReviewList }" var="boardReviewList">
					<tr>
						<td>${boardReviewList.board_id }</td>
						<td>
							<c:forEach begin="1" end="${boardReviewList.bindent }">[답변]</c:forEach>
							<a href="${pageContext.request.contextPath }/board/${boardReviewList.board_id}&${boardReviewList.member_id}">${boardReviewList.title }</a>
						</td>
						<td>${boardReviewList.member_id }</td>
						<td>${boardReviewList.board_date }</td>
						<td>${boardReviewList.bhit }</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>

			<div>
				<button type="button" class="btn-default text-primary" onclick="window.location.href='${pageContext.request.contextPath }/board'" style="border-radius:0.2em; border:none; float:right;">쓰기</button>
			</div>

			<ul class="pagination" style="padding:80px 500px;">	
		  		<c:if test="${pageMaker.prev}">
	       		  <li class="page-item"><a class="page-link" href="review${pageMaker.makeQuery(pageMaker.startPage - 1) }">prev</a></li>
	     		</c:if>

	      		<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
	         		<li class="page-item"><a class="page-link" href="review${pageMaker.makeQuery(idx)}">${idx}</a></li>
	      		</c:forEach>
	      
	      		<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
	         		<li class="page-item"><a class="page-link" href="review${pageMaker.makeQuery(pageMaker.endPage +1) }">next</a></li>
	      		</c:if> <br> 
		 	</ul>

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
	<%@ include file="/WEB-INF/views/includes/footer.jsp"%>
</body>
</html>