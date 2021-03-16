<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">

<head>
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"></script>

  <!-- Font -->
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@700;800&display=swap" rel="stylesheet">

  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css">

  <style>
    body {
      font-family: 'Gothic A1', sans-serif;
      color: #333333;
    }

    .carousel-item {
      height: 100vh;
      min-height: 350px;
      background: no-repeat center center scroll;
      -webkit-background-size: cover;
      -moz-background-size: cover;
      -o-background-size: cover;
      background-size: cover;
    }

    .card-headline {
      text-align: center;
      margin: 50px 50px 70px 70px;
      font-size: 2.4em;
      font-weight: 900;
    }

    .main-logo {
      max-width: 70px;
      max-height: 70px;
      margin: 5px 10px;
    }

    .country-name {
      font-size: 1.1em;
    }

    .card-title {
      font-size: 1.1em;
      margin: 5px;
    }

    .card-content-hashtag {
      padding: 10px;
      margin: 0px 0px 25px 0px;
    }

    footer {
      background-color: #f5f5f7;
    }

    .company-info {
      text-align: center;
      padding: 50px;
      font-size: 14px;
      color: #222222
    }

    .content-divider-blank {
      margin: 100px;
    }

    .card-content-hashtag-divider-blank {
      margin: 135px;
    }

    .card-content-hashtag-divider-blank2 {
      margin: 135px;
    }

    .logo-img {
      max-width: 70px;
    }

    .navbar {
      padding: 2px;
    }

    .nav-item {
      padding: 0px 15px;
    }

    .planner-card {
      height: 400px;
      padding: 15px;
      border: 1px solid;
      text-align: center;
      overflow: hidden;
    }

    .planner-card:hover {
      box-shadow: 0px 7px 10px rgba(0, 0, 0, 0.2);
      cursor: pointer;
    }

    .solid {
      border-top: 2px solid #222222;
      width: 80px;
    }

    .add-schedule {
      text-align: center;
    }

    .icon {
      text-align: center;
    }

    .profile {
      width: 40px;
      height: 40px;
      object-fit: cover;
      border-radius: 70%;
      margin: 5px;
    }

    .nickname {
      color: black;
    }

    .nickname:hover {
      color: black;
      text-decoration: underline 2px;
    }

    .card-img-top {
      object-fit: cover;
    }

    .col-md {
      border: 1px solid;
      padding: 0px;
      margin: 15px;
    }

    .col-md:hover {
      box-shadow: 0px 7px 10px rgba(0, 0, 0, 0.2);
      cursor: pointer;
    }

    .hashtag {
      color: black;
    }

    .hashtag:hover {
      color: black;
      text-decoration: underline 2px;
    }

    .planner-hr {
      border-top: 2px solid #222222;
    }

    .dummy {
      margin: 145px;
    }

    .view-more-p {
      text-align: right;
      margin: 0px;
    }

    .view-more-a {
      color: black;
      text-decoration: underline 2px;
    }

    .view-more-a:hover {
      color: black;
    }
  </style>

</head>

<body>
  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-light bg-white">
    <div class="container">
      <a class="navbar-brand" href="#"><img class="logo-img" src="${pageContext.request.contextPath}/resources/logo.png"></a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
              aria-haspopup="true" aria-expanded="false">
              일정
            </a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
              <a class="dropdown-item" href="#">플래너</a>
              <a class="dropdown-item" href="#">준비물</a>
              <a class="dropdown-item" href="#">지도</a>
            </div>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
              aria-haspopup="true" aria-expanded="false">
              커뮤니티
            </a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
              <a class="dropdown-item" href="#">Q&A</a>
              <a class="dropdown-item" href="#">리뷰</a>
              <a class="dropdown-item" href="#">동행</a>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">쇼핑</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
              aria-haspopup="true" aria-expanded="false">
              회원정보
            </a>
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

  <header>
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
      <ol class="carousel-indicators">
        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner" role="listbox">
        <div class="carousel-item active" style="background-image: url('${pageContext.request.contextPath}/resources/flight.png')">
          <div class="carousel-caption d-none d-md-block">
            <h2 class="display-4">First Slide</h2>
            <p class="lead">This is a description for the first slide.</p>
          </div>
        </div>
        <div class="carousel-item" style="background-image: url('${pageContext.request.contextPath}/resources/map.jpg')">
          <div class="carousel-caption d-none d-md-block">
            <h2 class="display-4">Second Slide</h2>
            <p class="lead">This is a description for the second slide.</p>
          </div>
        </div>
        <div class="carousel-item" style="background-image: url('${pageContext.request.contextPath}/resources/truck.jpg')">
          <div class="carousel-caption d-none d-md-block">
            <h2 class="display-4">Third Slide</h2>
            <p class="lead">This is a description for the third slide.</p>
          </div>
        </div>
      </div>
      <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>
  </header>

  <section class="content-divider-blank"></section>

  <section class="planner">
    <h2 class="card-headline">가다에서 여행을 계획해 보세요</h2>
    <div class="container">
      <p class="view-more-p">
        <a class="view-more-a" href="#">더 보기</a>
      </p>
      <div class="row">
        <div class="col-md">
          <div class="planner-card" onclick="location.href='http://google.com';">
            <div class="dummy"></div>
            <h4 class="add-schedule">일정 추가</h4>
            <i class="fal fa-plus fa-3x"></i>
          </div>
        </div>
        <div class="col-md">
          <div class="planner-card">
            <h4 class="add-schedule">체코 여행</h4>
            <h2>D-3</h2>
            <hr class="planner-hr">
            <h5>3월 16일</h5>
            <p>까를 → 구시가지 광장 → 프라하 성 → 프라하 천문시계 → 성 비투스 대성당 → 브니트르주니 므네스트</p>
            <h5>3월 17일</h5>
            <p>댄싱 하우스 → 틴 성모 마리아 교회 → 세들레츠 납골당 → 존 레논 벽 → 프라하 시민 회관 → 바츨라프 광장</p>
          </div>
        </div>
        <div class="col-md">
          <div class="planner-card">
            <h4 class="add-schedule">무려 30자를 넘는 엄청난 길이의 플래너 제목을 가진 한 가족의 너무너무너무너무너무즐거운 슬로베니아 가족여행</h4>
            <h2>D+100</h2>
            <hr class="planner-hr">
            <h5>대충 날짜</h5>
            <p>대충 슬로베니아 여행 코스</p>
          </div>
        </div>
      </div>
    </div>
  </section>

  <section class="card-content-hashtag-divider-blank"></section>

  <div class="mb-4">
    <!-- Solid divider -->
    <hr class="solid">
  </div>

  <section class="recommendation">
    <h2 class="card-headline">가다가 추천하는 여행지</h2>
    <div class="container">
      <p class="view-more-p">
        <a class="view-more-a" href="#">더 보기</a>
      </p>
      <div class="row">
        <div class="col-md">
          <img src="https://source.unsplash.com/TMgQMXoglsM/500x350" class="card-img-top" alt="...">
          <div class="card-body text-center">
            <span class="country-name">프랑스</span>
          </div>
        </div>
        <div class="col-md">
          <img src="https://source.unsplash.com/9UVmlIb0wJU/500x350" class="card-img-top" alt="...">
          <div class="card-body text-center">
            <span class="country-name">독일</span>
          </div>
        </div>
        <div class="col-md">
          <img src="https://source.unsplash.com/sNut2MqSmds/500x350" class="card-img-top" alt="...">
          <div class="card-body text-center">
            <span class="country-name">영국</span>
          </div>
        </div>
        <div class="col-md">
          <img src="https://source.unsplash.com/sNut2MqSmds/500x350" class="card-img-top" alt="...">
          <div class="card-body text-center">
            <span class="country-name">체코</span>
          </div>
        </div>
      </div>
    </div>
  </section>

  <section class="card-content-hashtag-divider-blank2"></section>

  <div class="mb-4">
    <hr class="solid">
  </div>

  <section class="diary-card">
    <h2 class="card-headline">가다에서 추억을 공유해 보세요</h2>
    <div class="container">
      <p class="view-more-p">
        <a class="view-more-a" href="#">더 보기</a>
      </p>
      <div class="row">
        <div class="col-md">
          <img src="https://source.unsplash.com/TMgQMXoglsM/500x350" class="card-img-top" alt="..."
            style="height: 500px">
          <div class="card-title" style="padding:20px 0px 0px 0px">
            <div clas="card-content">
              <img class="profile" src="${pageContext.request.contextPath}/resources/museum.jpg"><a class="nickname" href="#">닉네임</ㅁ=>
            </div>
            <div class="card-content-hashtag">
              <a class="hashtag" href="#">#하늘</a>
              <a class="hashtag" href="#">#바다</a>
              <a class="hashtag" href="#">#여행</a>
              <a class="hashtag" href="#">#친구들</a>
            </div>
          </div>
        </div>
        <div class="col-md">
          <img src="https://source.unsplash.com/9UVmlIb0wJU/500x350" class="card-img-top" alt="..."
            style="height: 500px">
          <div class="card-title" style="padding:20px 0px 0px 0px">
            <img class="profile" src="${pageContext.request.contextPath}/resources/museum.jpg"><a class="nickname" href="#">닉네임</ㅁ=>
          </div>
          <div class="card-content-hashtag">
            <a class="hashtag" href="#">#하늘</a>
            <a class="hashtag" href="#">#바다</a>
            <a class="hashtag" href="#">#여행</a>
            <a class="hashtag" href="#">#친구들</a>
          </div>
        </div>
        <div class="col-md">
          <img src="https://source.unsplash.com/sNut2MqSmds/500x350" class="card-img-top" alt="..."
            style="height: 500px">
          <div class="card-title" style="padding:20px 0px 0px 0px">
            <img class="profile" src="${pageContext.request.contextPath}/resources/museum.jpg"><a class="nickname" href="#">닉네임</ㅁ=>
          </div>
          <div class="card-content-hashtag">
            <a class="hashtag" href="#">#하늘</a>
            <a class="hashtag" href="#">#바다</a>
            <a class="hashtag" href="#">#여행</a>
            <a class="hashtag" href="#">#친구들</a>
          </div>
        </div>
      </div>
    </div>
    <div class="container">
      <div class="row">
        <div class="col-md">
          <img src="https://source.unsplash.com/TMgQMXoglsM/500x350" class="card-img-top" alt="..."
            style="height: 500px">
          <div class="card-title" style="padding:20px 0px 0px 0px">
            <img class="profile" src="${pageContext.request.contextPath}/resources/museum.jpg"><a class="nickname" href="#">닉네임</ㅁ=>
          </div>
          <div class="card-content-hashtag">
            <a class="hashtag" href="#">#하늘</a>
            <a class="hashtag" href="#">#바다</a>
            <a class="hashtag" href="#">#여행</a>
            <a class="hashtag" href="#">#친구들</a>
          </div>
        </div>
        <div class="col-md">
          <img src="https://source.unsplash.com/9UVmlIb0wJU/500x350" class="card-img-top" alt="..."
            style="height: 500px">
          <div class="card-title" style="padding:20px 0px 0px 0px">
            <img class="profile" src="${pageContext.request.contextPath}/resources/museum.jpg"><a class="nickname" href="#">닉네임</ㅁ=>
          </div>
          <div class="card-content-hashtag">
            <a class="hashtag" href="#">#하늘</a>
            <a class="hashtag" href="#">#바다</a>
            <a class="hashtag" href="#">#여행</a>
            <a class="hashtag" href="#">#친구들</a>
          </div>
        </div>
        <div class="col-md">
          <img src="https://source.unsplash.com/sNut2MqSmds/500x350" class="card-img-top" alt="..."
            style="height: 500px">
          <div class="card-title" style="padding:20px 0px 0px 0px">
            <img class="profile" src="${pageContext.request.contextPath}/resources/museum.jpg"><a class="nickname" href="#">닉네임</ㅁ=>
          </div>
          <div class="card-content-hashtag">
            <a class="hashtag" href="#">#하늘</a>
            <a class="hashtag" href="#">#바다</a>
            <a class="hashtag" href="#">#여행</a>
            <a class="hashtag" href="#">#친구들</a>
          </div>
        </div>
      </div>
    </div>
  </section>

  <section class="content-divider-blank"></section>
  <footer>
    <div class="company-info">
      © 2021 가다, Inc. All rights reserved<br>
      개인정보 처리방침·이용약관·사이트맵
    </div>
  </footer>
</body>

</html>