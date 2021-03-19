<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="http://kenwheeler.github.io/slick/slick/slick.css" />

    <link rel="stylesheet" type="text/css" href="http://kenwheeler.github.io/slick/slick/slick-theme.css" />

    <script src="http://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha256-k2WSCIexGzOj3Euiig+TlR8gA0EmPjuc79OEeY5L45g=" crossorigin="anonymous"></script>

    <script type="text/javascript" src="http://kenwheeler.github.io/slick/slick/slick.min.js"></script>
    
 
 	<!-- Bootstrap -->

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"></script>
<!-- Font -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@700;800&display=swap"
	rel="stylesheet">
 	
 	<!-- 카카오 -->
 	<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
    
<style>
/* Navbar */
.navbar {
  padding: 2px;
  box-shadow: rgb(0 0 0 / 8%) 0px 1px 12px;
}

.nav-logo-img {
  max-width: 70px;
  max-height: 70px;
}

.navbar-brand {
  font-family: 'yg-jalnan';
  font-size: 1.4em;
}

.nav-logo-img {
  max-width: 30px;
  max-height: 30px;
  margin: 0px 4px 0px 0px;
  padding: 0px 0px 3px;
}

.nav-item {
  padding: 0px 15px;
}

/* Footer */
footer {
  background-color: #f5f5f7;
}

.footer-company-info {
  text-align: center;
  padding: 50px;
  font-size: 14px;
}


/* #plus {
	width: 200px;
	height: 100px;
	text-align: center;
	line-height: 100px;
	border: 1px solid #cccccc;
	border-radius: 20px;
}

#first {
	width: 200px;
	height: 100px;
	text-align: center;
}

#sec {
	width: 200px;
	height: 100px;
	text-align: center;
}

#three {
	width: 200px;
	height: 100px;
	text-align: center;
} */
/* .slick-items{
	width:1000px;	
	hegiht:500px;
} */

#plus{
	width:100px;
	height:100px;
	border-radius:20px;
	background-color:#FACC2E;
}

#day{
	width:100px;
	height:100px;
	border-radius:20px;
	margin:0 auto;
	background-color:#FACC2E;
}

.form-control{
	width:200px;
	height:30px;
}

.modal_wrap{
        display: none;
        width: 70px;
        height: 70px;
        position: absolute;
        top:50%;
        left: 50%;
        margin: -250px 0 0 -250px;
        background:#eee;
        z-index: 2;
        border-radius:10px;
    }
    .black_bg{
        display: none;
        position: absolute;
        content: "";
        width: 100%;
        height: 100%;
        background-color:rgba(0, 0,0, 0.5);
        top:0;
        left: 0;
        z-index: 1;
    }
    .modal_close{
        width: 26px;
        height: 26px;
        position: absolute;
        top: -30px;
        right: 0;
    }
    .modal_close> a{
        display: block;
        width: 100%;
        height: 100%;
        background:url(https://img.icons8.com/metro/26/000000/close-window.png);
        text-indent: -9999px;
    }

</style>

</head>
<body>
<!-- Header -->
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
  
 <!--  <a id="kakao-link-btn" href="javascript:sendLink()">
<img src="//developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png"/>
</a> -->

	<div id = "top" style="float:none">
	<select class="form-control" name="schedule_id">
		<c:forEach var="planner" items="${plannerList}">
			<option value='${planner.planner_name}'>${planner.planner_name}</option>
		</c:forEach>
	</select>
	
	<br />
	
	<!-- <button style="background: #FACC2E; width:100px; height:30px;">일정</button>
	<button style="background: #FACC2E; width:100px; height:30px;">지도</button>
	<button style="background: #FACC2E; width:100px; height:30px;">준비물</button>
	<button style="background: #FACC2E; width:100px; height:30px;">다이어리</button> -->
	</div>
	
	
	<div class="row text-center" style="width: 100%;">
	<div style="width: 30%; float:none; margin:0 auto">
		  <div class="btn-group">
		    <button type="button" class="btn btn-warning">일정</button>
		    <button type="button" class="btn btn-warning">지도</button>
		    <button type="button" class="btn btn-warning">준비물</button>
		    <button type="button" class="btn btn-warning" >다이어리</button>
		  </div>
	</div>
	</div> 	  
	<br />
	<br />
	
	<button type='button' id="modal_btn">일정 공유</button>
	<div class="black_bg"></div>
	<div class="modal_wrap">
		<div class="modal_close">
			<a href="#">close</a>
		</div>
		<div><a id="kakao-link-btn" href="javascript:sendLink()">
<img src="//developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png"/>
</a></div>
		<div>
		</div>
		</div>


			<div class="slick-items"
				style="display: flex; justify-content: space-between;">
				<button id="plus">
					<div>+</div>
				</button>


				<c:forEach var="date" items="${dateList}">
					<button id="day">${date}</button>
				</c:forEach>
			</div>

			<table border="1" width="1000px" height="300px" margin="auto"
				align="center">
				<thead>

					<tr>
						<th style="background-color: #FACC2E">날짜</th>
						<th style="background-color: #FACC2E">도시</th>
						<th style="background-color: #FACC2E">교통</th>
						<th style="background-color: #FACC2E">일정</th>
						<th style="background-color: #FACC2E">숙소</th>
						<th style="background-color: #FACC2E">비용</th>
					</tr>

				</thead>
				<tbody>
					<c:forEach var="date" items="${dateList}">
						<tr>
							<td>${date}</td>
							<td><c:forEach var="city" items="${cityList }">
									<c:if test="${city.schedule_date eq date }">
										<p>${city.schedule_content }</p>
									</c:if>
								</c:forEach></td>
							<td><c:forEach var="vehicle" items="${vehicleList }">
									<c:if test="${vehicle.schedule_date eq date }">
										<p>${vehicle.schedule_content }</p>
									</c:if>
								</c:forEach></td>
							<td><c:forEach var="schedule" items="${scheduleList }">
									<c:if test="${schedule.schedule_date eq date }">
										<p>${schedule.schedule_content }</p>

									</c:if>
								</c:forEach></td>
							<td><c:forEach var="hotel" items="${hotelList }">
									<c:if test="${hotel.schedule_date eq date }">
										<p>${hotel.schedule_content }</p>
									</c:if>
								</c:forEach></td>
							<td></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>




			<!--  <div id ="up_to_top">Top</div> -->
			<a href="javascript:apple();"><img src="logo.png"></a>

			<!-- Footer -->
			<footer>
				<div class="footer-company-info">
					© 2021 가다, Inc. All rights reserved<br> 개인정보 처리방침·이용약관·사이트맵
				</div>
			</footer>
</body>
<script type="text/javascript">



$(document).ready(function () {

   //alert('123');

   $('.slick-items').slick({
        dots: true,
        infinite: false,
        speed: 300,
        slidesToShow: 4,
        slidesToScroll: 4,
        responsive: [
          {
            breakpoint: 1024,
            settings: {
              slidesToShow: 3,
              slidesToScroll: 3,
              infinite: true,
              dots: true
            }
          },
          {
            breakpoint: 600,
            settings: {
              slidesToShow: 2,
              slidesToScroll: 2
            }
          },
          {
            breakpoint: 480,
            settings: {
              slidesToShow: 1,
              slidesToScroll: 1
            }
          }
          // You can unslick at a given breakpoint now by adding:
          // settings: "unslick"
          // instead of a settings object
        ]
      });

});


</script>

    
<script>
function grapes(){
    scrollBy(0,scrollY/-10); 
}
 
function apple(){
banana = setInterval("if(scrollY>10){grapes();}else{clearInterval(banana);}",10);
}
</script>

<script type='text/javascript'>
  //<![CDATA[
    // // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('11d0e5e983e5fa34cd54695c02482c5b');
    // // 카카오링크 버튼을 생성합니다. 처음 한번만 호출하면 됩니다.
    Kakao.Link.createDefaultButton({
      container: '#kakao-link-btn',
      objectType: 'feed',
      content: {
        title: 'GADA',
        description: '#여행 #가족 #커플 #무엇을 #쓸까 #?',
        imageUrl: 'C:\Users\dongh\OneDrive\바탕 화면\프로젝트\로고-캐릭터',
        link: {
          mobileWebUrl: '',
          webUrl: ''
        }
      },
      social: {
        likeCount: 286,
        commentCount: 45,
        sharedCount: 845
      },
      buttons: [
        {
          title: '웹으로 보기',
          link: {
            mobileWebUrl: 'https://developers.kakao.com',
            webUrl: 'https://developers.kakao.com'
          }
        },
        {
          title: '앱으로 보기',
          link: {
            mobileWebUrl: 'https://developers.kakao.com',
            webUrl: 'https://developers.kakao.com'
          }
        }
      ]
    });
  //]]>
</script>

<script>
    window.onload = function() {
 
    function onClick() {
        document.querySelector('.modal_wrap').style.display ='block';
        document.querySelector('.black_bg').style.display ='block';
    }   
    function offClick() {
        document.querySelector('.modal_wrap').style.display ='none';
        document.querySelector('.black_bg').style.display ='none';
    }
 
    document.getElementById('modal_btn').addEventListener('click', onClick);
    document.querySelector('.modal_close').addEventListener('click', offClick);
 
};
</script>



</html>