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
      margin: 70px;
      font-size: 2.1em;
      font-weight: 900;
    }

    .main-logo {
      max-width: 70px;
      max-height: 70px;
      margin: 5px 10px;
    }

    .card-img-top {
      border-radius: 5px;
    }

    .country-name {
      font-size: 1.1em;
    }

    .card-title {
      font-size: 1.1em;
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

    .card-content-divider-blank {
      margin: 160px;
    }

    .card-content-divider-blank2 {
      margin: 140px;
    }

    .logo-img {
      max-width: 70px;
    }

    .navbar {
      padding: 2px;
    }

    .nav-item {
      padding: 0px 12px;
    }

    .planner-card {
      height: 400px;
      padding: 15px;
      border: 1px solid;
      border-radius: 5px;
      text-align: center;
    }

    hr {
      border-top: 4px solid #222222;
      width: 80px;
    }

    .add-schedule {
      text-align: center;
    }

    .icon {
      text-align: center;
    }

    .diary-card-divider {
      padding: 0px 0px 50px 50px;
    }

    .profile {
      width: 40px;
      height: 40px;
      overflow: hidden;
      border-radius: 70%;
    }

    strong {
      padding: 8px;
    }
  </style>

</head>

<body>
  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-light bg-light">
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
              <a class="dropdown-item" href="#">Action</a>
              <a class="dropdown-item" href="#">Another action</a>
            </div>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
              aria-haspopup="true" aria-expanded="false">
              커뮤니티
            </a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
              <a class="dropdown-item" href="#">Action</a>
              <a class="dropdown-item" href="#">Another action</a>
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
              <a class="dropdown-item" href="#">Action</a>
              <a class="dropdown-item" href="#">Another action</a>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="#">로그아웃</a>
            </div>
          </li>
        </ul>
        <form class="form-inline my-2 my-lg-0">
          <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
          <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form>
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
        <div class="carousel-item active"
          style="background-image: url('https://source.unsplash.com/LAaSoL0LrYs/1920x1080')">
          <div class="carousel-caption d-none d-md-block">
            <h2 class="display-4">First Slide</h2>
            <p class="lead">This is a description for the first slide.</p>
          </div>
        </div>
        <div class="carousel-item" style="background-image: url('https://source.unsplash.com/bF2vsubyHcQ/1920x1080')">
          <div class="carousel-caption d-none d-md-block">
            <h2 class="display-4">Second Slide</h2>
            <p class="lead">This is a description for the second slide.</p>
          </div>
        </div>
        <div class="carousel-item" style="background-image: url('https://source.unsplash.com/szFUQoyvrxM/1920x1080')">
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
      <div class="row">
        <div class="col-md">
          <div class="planner-card">
            <h3 class="add-schedule">일정 추가</h3>
              <i class="fas fa-plus-circle fa-5x"></i>
          </div>
        </div>
        <div class="col-md">
          <div class="planner-card">
            <h3 class="add-schedule">체코 여행</h3>
            <h1>D-1</h1>
          </div>
        </div>
        <div class="col-md">
          <div class="planner-card">
            <h3 class="add-schedule">슬로베니아 여행</h3>
            <h1>D+100</h1>
          </div>
        </div>
      </div>
    </div>
  </section>

  <section class="card-content-divider-blank"></section>

  <div class="mb-4">
    <!-- Solid divider -->
    <hr class="solid">
  </div>

  <section class="recommendation">
    <h2 class="card-headline">가다가 추천하는 여행지</h2>
    <div class="container">
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
    <div class="container">
      <div class="row">
        <div class="col-md">
          <img src="https://source.unsplash.com/TMgQMXoglsM/500x350" class="card-img-top" alt="...">
          <div class="card-body text-center">
            <span class="country-name">벨기에</span>
          </div>
        </div>
        <div class="col-md">
          <img src="https://source.unsplash.com/9UVmlIb0wJU/500x350" class="card-img-top" alt="...">
          <div class="card-body text-center">
            <span class="country-name">스페인</span>
          </div>
        </div>
        <div class="col-md">
          <img src="https://source.unsplash.com/sNut2MqSmds/500x350" class="card-img-top" alt="...">
          <div class="card-body text-center">
            <span class="country-name">아일랜드</span>
          </div>
        </div>
        <div class="col-md">
          <img src="https://source.unsplash.com/sNut2MqSmds/500x350" class="card-img-top" alt="...">
          <div class="card-body text-center">
            <span class="country-name">이탈리아</span>
          </div>
        </div>
      </div>
    </div>
  </section>

  <section class="card-content-divider-blank2"></section>

  <div class="mb-4">
    <!-- Solid divider -->
    <hr class="solid">
  </div>

  <section class="diary-card">
    <h2 class="card-headline">다이어리</h2>
    <div class="container">
      <div class="row">
        <div class="col-md">
          <img src="https://source.unsplash.com/TMgQMXoglsM/500x350" class="card-img-top" alt="..."
            style="height: 500px">
          <div class="card-title" style="padding:20px 0px 0px 0px">
            <img class="profile" src="${pageContext.request.contextPath}/resources/museum.jpg"><strong>닉네임</strong></div>
          <div class="card-content">#refresh #몰핀 #몰핀슈즈 #로퍼 #플랫슈즈 #봄스타일링 #단화 #여자신발 #패션</div>
        </div>
        <div class="col-md">
          <img src="https://source.unsplash.com/9UVmlIb0wJU/500x350" class="card-img-top" alt="..."
            style="height: 500px">
            <div class="card-title" style="padding:20px 0px 0px 0px">
              <img class="profile" src="${pageContext.request.contextPath}/resources/museum.jpg"><strong>닉네임</strong></div>
            <div class="card-content">#refresh #몰핀 #몰핀슈즈 #로퍼 #플랫슈즈 #봄스타일링 #단화 #여자신발 #패션</div>
        </div>
        <div class="col-md">
          <img src="https://source.unsplash.com/sNut2MqSmds/500x350" class="card-img-top" alt="..."
            style="height: 500px">
            <div class="card-title" style="padding:20px 0px 0px 0px">
              <img class="profile" src="${pageContext.request.contextPath}/resources/museum.jpg"><strong>닉네임</strong></div>
            <div class="card-content">#refresh #몰핀 #몰핀슈즈 #로퍼 #플랫슈즈 #봄스타일링 #단화 #여자신발 #패션</div>
        </div>
      </div>
    </div>
    <section class="diary-card-divider"></section>
    <div class="container">
      <div class="row">
        <div class="col-md">
          <img src="https://source.unsplash.com/TMgQMXoglsM/500x350" class="card-img-top" alt="..."
            style="height: 500px">
            <div class="card-title" style="padding:20px 0px 0px 0px">
              <img class="profile" src="${pageContext.request.contextPath}/resources/museum.jpg"><strong>닉네임</strong></div>
            <div class="card-content">#refresh #몰핀 #몰핀슈즈 #로퍼 #플랫슈즈 #봄스타일링 #단화 #여자신발 #패션</div>
        </div>
        <div class="col-md">
          <img src="https://source.unsplash.com/9UVmlIb0wJU/500x350" class="card-img-top" alt="..."
            style="height: 500px">
            <div class="card-title" style="padding:20px 0px 0px 0px">
              <img class="profile" src="${pageContext.request.contextPath}/resources/museum.jpg"><strong>닉네임</strong></div>
            <div class="card-content">#refresh #몰핀 #몰핀슈즈 #로퍼 #플랫슈즈 #봄스타일링 #단화 #여자신발 #패션</div>
        </div>
        <div class="col-md">
          <img src="https://source.unsplash.com/sNut2MqSmds/500x350" class="card-img-top" alt="..."
            style="height: 500px">
            <div class="card-title" style="padding:20px 0px 0px 0px">
              <img class="profile" src="${pageContext.request.contextPath}/resources/museum.jpg"><strong>닉네임</strong></div>
            <div class="card-content">#refresh #몰핀 #몰핀슈즈 #로퍼 #플랫슈즈 #봄스타일링 #단화 #여자신발 #패션</div>
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