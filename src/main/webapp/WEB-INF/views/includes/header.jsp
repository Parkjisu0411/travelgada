<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>

<!-- Font -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@700;800&display=swap"
	rel="stylesheet">

<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css">
<script type="text/javascript">
	
</script>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-white fixed-top">
		<div class="container">
			<a class="navbar-brand" href="/"><img class="nav-logo-img"
				src="${contextPath}/resources/img/main/logo.png">가다</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 플래너 </a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="/planner/schedule">일정</a>
							<a class="dropdown-item" href="#">지도</a>
							<a class="dropdown-item" href="/todo">준비물</a>
							<a class="dropdown-item" href="/diary">다이어리</a>
						</div></li>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 커뮤니티 </a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="/board/qna">Q&amp;A</a>
							<a class="dropdown-item" href="/board/review">리뷰</a>
							<a class="dropdown-item" href="/board/accompany">동행</a>
						</div>
					</li>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">스토어</a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="/shopping?product_type_id=3">가방</a>
							<a class="dropdown-item" href="/shopping?product_type_id=1">백팩</a>
							<a class="dropdown-item" href="/shopping?product_type_id=2">캐리어</a>
							<a class="dropdown-item" href="/shopping?product_type_id=4">악세사리</a>
						</div>
					</li>
				</ul>
				<form class="form-inline" action="${pageContext.request.contextPath}/search" method="get">
					<input id="keyword" class="form-control mr-sm-2" type="text" aria-label="Search" name="keyword" placeholder="검색">
					<button class="btn btn-outline-white btn-sm my-0" type="submit">
						<i class="fas fa-search"></i>
					</button>
				</form>
				<div class="nav-item dropdown">
					<sec:authorize access="isAuthenticated()">
						<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"><img
							src="/resources/img/profile/<sec:authentication property="principal.profile"/>"
							class="nav-profile-img"
							onerror="this.src='/resources/img/profile/default_profile_img.jpg'"></a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="/member/mypage">회원정보</a>
							<a class="dropdown-item" href="/shopping/buy_list">주문내역</a>
							<a class="dropdown-item" href="/shopping/cart">장바구니</a>
							<div class="dropdown-divider"></div>
							<form id="logout" action="/member/logout" method="POST">
								<input name="${_csrf.parameterName}" type="hidden"
									value="${_csrf.token}" /> <a class="dropdown-item" href="#"
									onclick="document.getElementById('logout').submit();">로그아웃</a>
							</form>
						</div>
					</sec:authorize>
					<sec:authorize access="isAnonymous()">
						<a class="nav-link dropdown-toggle.user" href="/member/login"
							id="navbarDropdown" role="button" aria-haspopup="true"
							aria-expanded="false"><img
							src="/resources/img/profile/default_profile_img.jpg"
							class="nav-profile-img"></a>
					</sec:authorize>
				</div>
			</div>
		</div>
	</nav>
	<div class="divider-header-blank"></div>
</body>
</html>