<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<title>메인</title>

<head>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"></script>

<!-- Icon -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />

<!-- CSS -->
<link rel="stylesheet" href="${contextPath}/resources/css/main.css">
<link rel="stylesheet" href="${contextPath}/resources/css/font.css">
<link rel="stylesheet" href="${contextPath}/resources/css/header.css">
<link rel="stylesheet" href="${contextPath}/resources/css/footer.css">

<style>
footer {
	background-color: #f5f5f7;
	width: 100%;
}

.advice-img {
  width: 100%;
  object-fit: cover;
  border-radius: 8px 0px 0px 8px;
}

.advice-content-area {
  background-color: #FE5000;
  width: 100%;
  padding: 48px;
  border-radius: 0px 8px 8px 0px;
}

.main-planner-add-button {
  color: #ffffff;
  background-color: #000000;
  border-radius: 64px;
  padding-left: 24px;
  padding-right: 24px;
  padding-top: 14px;
  padding-bottom: 14px;
  font-weight: 700;
  font-size: 12px;
}

.main-planner-add-button:hover {
  background-color: #484848;
  cursor: pointer;
}

.advice-title {
  font-size: 25px;
  font-weight: 700;
}

.advice-content {
  font-size: 14px;
}

</style>
</head>

<body>

	<%@ include file="/WEB-INF/views/includes/header_main.jsp"%>

	<header>
	  <img src="${pageContext.request.contextPath}/resources/img/main/main_test.jpg" class="main-img">
	</header>
	
	<div class="covid-19">
		<a href="https://www.0404.go.kr/dev/newest_view.mofa?id=ATC0000000008500&pagenum=1&mst_id=MST0000000000040&ctnm=&div_cd=&st=title&stext=" target="_blank" class="covid-19-link"><i class="fas fa-info-circle"></i>발효중인 여행 주의보</a>
	</div>
	
	<div class="divider-header-blank"></div>

	<section class="card-recommendation-section">
		<div class="container">
		<h2 class="headline">가다가 추천하는 여행지</h2>
		</div>
		<div class="container">
			<p class="view-more-p">
				<a class="view-more-a" href="#">더 보기</a>
			</p>
			<div class="row">
				<!-- Insert Here -->
				<div class="col-md-3">
					<div class="recommendation-content">
						<img src="https://source.unsplash.com/TMgQMXoglsM/500x350"
							class="card-img-top recommendation" alt="...">
						<div class="card-body text-center">
							<span class="recommendation-country-name">프랑스</span>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="recommendation-content">
						<img src="https://source.unsplash.com/TMgQMXoglsM/500x350"
							class="card-img-top recommendation" alt="...">
						<div class="card-body text-center">
							<span class="recommendation-country-name">프랑스</span>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="recommendation-content">
						<img src="https://source.unsplash.com/TMgQMXoglsM/500x350"
							class="card-img-top recommendation" alt="...">
						<div class="card-body text-center">
							<span class="recommendation-country-name">프랑스</span>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="recommendation-content">
						<img src="https://source.unsplash.com/TMgQMXoglsM/500x350"
							class="card-img-top recommendation" alt="...">
						<div class="card-body text-center">
							<span class="recommendation-country-name">프랑스</span>
						</div>
					</div>
				</div>
				<!-- /Insert Here -->
			</div>
		</div>
	</section>

	<div class="divider-card-blank"></div>

	<section class="diary-section">
	<div class="container">
		<h2 class="headline">가다에서 추억을 공유해 보세요</h2>
	</div>
		<div class="container">
			<p class="view-more-p">
				<a class="view-more-a" href="/diary">더 보기</a>
			</p>
			<div class="row">
				<c:forEach var="diary" items="${diary}" end="5">
					<div class="col-md-4">
						<div class="card-diary">
							<img src="resources/diary/${diary.img_path}" class="card-img-top diary" alt="...">
							<div class="diary-content">
								<div class="diary-profile">
									<img class="diary-profile-img"
										src="${contextPath}/resources/museum.jpg"> <a
										class="diary-profile-id" href="#">닉네임</a>
								</div>
								<p class="diary-text">${diary.text}</p>
								<div class="diary-hashtag-area">
									<a class="diary-hashtag" href="#">${diary.hashtag}</a>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>
	
	<div class="divider-card-blank"></div>
	
	<div class="container">
	<div class="row">
	  <div class="col-md-8 advice-image-area">
	  <img src="${pageContext.request.contextPath}/resources/img/main/camping.jpg" class="advice-img">
	  </div>
	  <div class="col-md-4 advice-content-area">
	  <h2 class="advice-title">가다에서 일정을 계획해 보세요</h2>
	  <p class="advice-content">플래너를 이용하여 여행 계획을 세우고 여행 루트와 챙겨야 할 준비물을 체크할 수 있습니다</p>
	  <br>
	  <span class="main-planner-add-button" onclick="location.href='http://localhost:8282/planner/schedule'">일정 생성하기</span>
	  </div>
	  </div>
	</div>
	
	<%@ include file="/WEB-INF/views/includes/chat_icon.jsp"%>
	
	<%@ include file="/WEB-INF/views/includes/footer.jsp"%>

</body>

</html>