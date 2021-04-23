<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
   
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <title>Header</title>

  <style>
    .fixed-top {
      background-color: #ffffff;
      color: #000000;
    }

    .nav-dropdown-toggle {
      color: #000000 !important;
    }

    .navbar-brand {
      color: #000000 !important;
    }
  </style>

  <!-- Font -->
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@700;800&display=swap" rel="stylesheet">

  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css">
  <script type="text/javascript">

  </script>
</head>

<body>
  <nav class="navbar navbar-expand-lg fixed-top">
    <div class="container">
      <a class="navbar-brand" href="/"><img class="nav-logo-img" src="${contextPath}/resources/img/main/logo.png">가다</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
          <li class="nav-item dropdown"><a class="nav-link dropdown-toggle nav-dropdown-toggle" href="/planner" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">플래너</a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
              <a class="dropdown-item nav-dropdown-item" href="/planner/schedule">일정</a>
              <a class="dropdown-item nav-dropdown-item" href="/todo">준비물</a>
              <a class="dropdown-item nav-dropdown-item" href="/diary">다이어리</a>
            </div>
          </li>
          <li class="nav-item dropdown"><a class="nav-link dropdown-toggle nav-dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">커뮤니티</a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
              <a class="dropdown-item nav-dropdown-item" href="/board/2">Q&amp;A</a>
              <a class="dropdown-item nav-dropdown-item" href="/board/1">리뷰</a> 
              <a class="dropdown-item nav-dropdown-item" href="/board/3">동행</a>
              <a class="dropdown-item nav-dropdown-item" href="/board/4">공지사항</a>
            </div>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle nav-dropdown-toggle" href="#" id="navbarDropdown" role="button"
              data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">스토어</a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
              <a class="dropdown-item nav-dropdown-item" href="/shopping?product_type_id=3">가방</a>
              <a class="dropdown-item nav-dropdown-item" href="/shopping?product_type_id=1">백팩</a>
              <a class="dropdown-item nav-dropdown-item" href="/shopping?product_type_id=2">캐리어</a>
              <a class="dropdown-item nav-dropdown-item" href="/shopping?product_type_id=4">악세사리</a>
            </div>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle nav-dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" onclick="window.open('https://www.google.com/travel/hotels')">호텔&nbsp;예약</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle nav-dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" onclick="window.open('https://www.google.com/travel/flights')">항공편&nbsp;예약</a>
          </li>
        </ul>
        <form class="form-inline" action="${pageContext.request.contextPath}/search" method="get">
          <input id="keyword" style="margin: 5px !important;" class="form-control mr-sm-2 nav-form-control" type="text" aria-label="Search" name="keyword">
          <button class="btn btn-outline-white btn-sm my-0 nav-btn" style="margin-left: -33px !important;" type="submit">
            <i class="fas fa-search fa-lg"></i>
          </button>
        </form>
        <button class="btn btn-outline-white btn-sm my-0 nav-btn">
          <i class="fas fa-shopping-cart fa-lg header-cart-icon" onclick="location.href='/shopping/cart'" style="color: #000000; padding-left: 3px !important;"></i>
        </button>
        <div class="nav-item dropdown">
          <sec:authorize access="isAuthenticated()">
            <a class="nav-link dropdown-toggle nav-dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img src="/resources/img/profile/<sec:authentication property="principal.profile" />" class="nav-profile-img" onerror="this.src='/resources/img/profile/default_profile_img.jpg'"></a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
              <a class="dropdown-item nav-dropdown-item" href="/member/mypage">회원정보</a>
              <a class="dropdown-item nav-dropdown-item" href="/shopping/buy_list">주문내역</a>
              <div class="dropdown-divider"></div>
              <form id="logout" action="/member/logout" method="POST">
                <input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/> 
                <a class="dropdown-item nav-dropdown-item" href="#" onclick="document.getElementById('logout').submit();">로그아웃</a>
              </form>
            </div>
          </sec:authorize>
          <sec:authorize access="isAnonymous()">
            <a class="nav-link dropdown-toggle nav-dropdown-toggle-user" href="/member/login" id="navbarDropdown" role="button" aria-haspopup="true" aria-expanded="false"><img src="/resources/img/profile/default_profile_img.jpg" class="nav-profile-img"></a>
          </sec:authorize>
        </div>
      </div>
    </div>
  </nav>
  <div style="padding: 60px"></div>
</body>

</html>