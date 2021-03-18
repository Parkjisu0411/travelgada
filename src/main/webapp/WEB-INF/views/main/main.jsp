<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">

<head>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"></script>

<!-- Font -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@700;800&display=swap"
	rel="stylesheet">

<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css">

<!-- CSS -->
<link rel="stylesheet" href="${contextPath}/resources/css/main.css">
</head>

<body>
  <nav class="navbar navbar-expand-lg navbar-light bg-white">
    <div class="container">
      <a class="navbar-brand" href="#"><img class="nav-logo-img" src="${contextPath}/resources/logo.png">가다</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
          <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
              data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 일정 </a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
              <a class="dropdown-item" href="#">플래너</a> <a class="dropdown-item" href="#">준비물</a> <a
                class="dropdown-item" href="#">지도</a>
            </div>
          </li>
          <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
              data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 커뮤니티 </a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
              <a class="dropdown-item" href="#">Q&A</a> <a class="dropdown-item" href="#">리뷰</a> <a
                class="dropdown-item" href="#">동행</a>
            </div>
          </li>
          <li class="nav-item"><a class="nav-link" href="#">쇼핑</a></li>
          <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
              data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 회원정보 </a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
              <a class="dropdown-item" href="#">정보 수정</a>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="#">로그아웃</a>
            </div>
          </li>
        </ul>
        <form class="form-inline">
          <input class="form-control mr-sm-2" type="text" aria-label="Search">
          <button class="btn btn-outline-white btn-sm my-0" type="submit">검색</button>
        </form>
      </div>
    </div>
  </nav>

  <div class="covid-19">
    <a href="https://www.0404.go.kr/dev/newest_view.mofa?id=ATC0000000008500&pagenum=1&mst_id=MST0000000000040&ctnm=&div_cd=&st=title&stext="
      class="covid-19-link">발효중인 여행 주의보</a>
  </div>

  <header>
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
      <ol class="carousel-indicators">
        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner" role="listbox">
        <div class="carousel-item active" style="background-image: url('${contextPath}/resources/flight.png')">
          <div class="carousel-caption d-none d-md-block">
            <h2 class="display-4">First Slide</h2>
            <p class="lead">This is a description for the first slide.</p>
          </div>
        </div>
        <div class="carousel-item" style="background-image: url('${contextPath}/resources/map.jpg')">
          <div class="carousel-caption d-none d-md-block">
            <h2 class="display-4">Second Slide</h2>
            <p class="lead">This is a description for the second slide.</p>
          </div>
        </div>
        <div class="carousel-item" style="background-image: url('${contextPath}/resources/truck.jpg')">
          <div class="carousel-caption d-none d-md-block">
            <h2 class="display-4">Third Slide</h2>
            <p class="lead">This is a description for the third slide.</p>
          </div>
        </div>
      </div>
      <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev"> <span
          class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="sr-only">Previous</span>
      </a> <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next"> <span
          class="carousel-control-next-icon" aria-hidden="true"></span> <span class="sr-only">Next</span>
      </a>
    </div>
  </header>

  <div class="divider-header-blank"></div>

  <div class="planner">
    <h2 class="headline">가다에서 여행을 계획해 보세요</h2>
    <div class="container">
      <p class="view-more-p">
        <a class="view-more-a" href="#">더 보기</a>
      </p>
      <div class="row">
        <div class="col-md-4">
          <div class="planner-content" onclick="location.href='http://google.com';">
            <div class="planner-content-align"></div>
            <h4 class="planner-title">일정 추가</h4>
            <i class="fal fa-plus fa-3x"></i>
          </div>
        </div>
        <div class="col-md-4">
          <div class="planner-content">
            <h4 class="planner-title">체코 여행</h4>
            <h2 class="planner-d-day">D-3</h2>
            <hr class="planner-divider-solid">
            <h5 class="planner-date">3월 16일</h5>
            <p class="planner-route">까를 → 구시가지 광장 → 프라하 성 → 프라하 천문시계 → 성
              비투스 대성당 → 브니트르주니 므네스트</p>
            <h5 class="planner-date">3월 17일</h5>
            <p class="planner-route">댄싱 하우스 → 틴 성모 마리아 교회 → 세들레츠 납골당 → 존
              레논 벽 → 프라하 시민 회관 → 바츨라프 광장</p>
          </div>
        </div>
        <div class="col-md-4">
          <div class="planner-content">
            <h4 class="planner-title">무려 30자를 넘는 엄청난 길이의 플래너 제목을 가진 한 가족의
              너무너무너무너무너무즐거운 슬로베니아 가족여행</h4>
            <h2 class="planner-d-day">D+100</h2>
            <hr class="planner-divider-solid">
            <h5 class="planner-date">대충 날짜</h5>
            <p class="planner-route">대충 슬로베니아 여행 코스</p>
          </div>
        </div>
      </div>
    </div>
  </div>

  <div class="divider-card-blank"></div>

  <div class="mb-4">
    <hr class="divider-card-solid">
  </div>

  <section class="card-recommendation-section">
    <h2 class="headline">가다가 추천하는 여행지</h2>
    <div class="container">
      <p class="view-more-p">
        <a class="view-more-a" href="#">더 보기</a>
      </p>
      <div class="row">
        <!-- Insert Here -->
        <div class="col-md-3">
          <div class="recommendation-content">
            <img src="https://source.unsplash.com/TMgQMXoglsM/500x350" class="card-img-top recommendation" alt="...">
            <div class="card-body text-center">
              <span class="recommendation-country-name">프랑스</span>
            </div>
          </div>
        </div>
        <div class="col-md-3">
          <div class="recommendation-content">
            <img src="https://source.unsplash.com/TMgQMXoglsM/500x350" class="card-img-top recommendation" alt="...">
            <div class="card-body text-center">
              <span class="recommendation-country-name">프랑스</span>
            </div>
          </div>
        </div>
        <div class="col-md-3">
          <div class="recommendation-content">
            <img src="https://source.unsplash.com/TMgQMXoglsM/500x350" class="card-img-top recommendation" alt="...">
            <div class="card-body text-center">
              <span class="recommendation-country-name">프랑스</span>
            </div>
          </div>
        </div>
        <div class="col-md-3">
          <div class="recommendation-content">
            <img src="https://source.unsplash.com/TMgQMXoglsM/500x350" class="card-img-top recommendation" alt="...">
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

  <div class="mb-4">
    <hr class="divider-card-solid">
  </div>

  <section class="diary">
    <h2 class="headline">가다에서 추억을 공유해 보세요</h2>
    <div class="container">
      <p class="view-more-p">
        <a class="view-more-a" href="#">더 보기</a>
      </p>
      <div class="row">
        <c:forEach var="diary" items="${diary}" end="5">
          <div class="col-md-4">
            <div class="card-diary">
              <img src="${diary.img_path}" class="card-img-top diary" alt="...">
              <div class="diary-content">
                <div class="diary-profile">
                  <img class="diary-profile-img" src="${contextPath}/resources/museum.jpg"> <a class="diary-profile-id" href="#">닉네임</a>
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

  <footer>
    <div class="footer-company-info">
      © 2021 가다, Inc. All rights reserved<br> 개인정보 처리방침·이용약관·사이트맵
    </div>
  </footer>
</body>

</html>