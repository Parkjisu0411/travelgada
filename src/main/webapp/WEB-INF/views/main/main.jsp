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
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"></script>

  <!-- Icon -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />

  <!-- CSS -->
  <link rel="stylesheet" href="${contextPath}/resources/css/main.css">
  <link rel="stylesheet" href="${contextPath}/resources/css/font.css">
  <link rel="stylesheet" href="${contextPath}/resources/css/header.css">
  <link rel="stylesheet" href="${contextPath}/resources/css/footer.css">

  <style>
    .main-main-headline {
      padding-top: 230px;
      font-size: 100px;
      font-weight: 700;
      color: #ffffff;
      text-decoration: underline;
      text-decoration-color: #A2C21D;
    }

    .main-advice-img {
      width: 100%;
      height: 450px;
      object-fit: cover;
      border-radius: 8px;
    }

    .main-advice-button {
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

    .main-advice-button:hover {
      background-color: #484848;
      cursor: pointer;
    }

    .main-advice-title {
      font-size: 25px;
      font-weight: 700;
    }

    .main-advice-content {
      font-size: 14px;
    }

    .main-product-img {
      width: 100%;
      height: 320px;
      object-fit: cover;
      border-radius: 8px;
    }

    .main-advice-planner-inner-area {
      padding: 25px;
      width: 100%;
      height: 100%;
    }
    
    .main-advice-store-inner-area {
      padding: 25px;
      width: 100%;
      height: 100%;
    }
    
    .main-country-select {
      text-align: center;
      background-color: #ffffff;
      margin: 0 auto;
      width: 110px;
      height: 44px;
      line-height: 44px;
      border-radius: 64px;
      font-weight: 700;
      font-size: 12px;
    }
    
    .main-country-select:hover {
      background-color: #111111;
      color: #ffffff;
      cursor: pointer;
    }
	
	.product-area {
		border-radius: 10px;
		margin: 0px 0px 30px 0px;
		height: 430px;
		background-color: #f5f5f5;
	}
	
	.product-text {
		padding:15px;
		font-family: 'IBMPlexSansKR-Light';
	}
	
	.gada-link:hover {
		color: #1DCAD3;
		cursor: pointer;
	}
    
  </style>
  <script type="text/javascript">
  	$(document).ready(function(){
		
		var content; //내용
		var splitedArray; //배열
		var linkedContent; //주소
		
		//jstl
	    
	    <c:forEach items="${member}" var="member">
		    <c:forEach items="${member.plannerVO}" var="pl">
			    <c:forEach items="${pl.diaryVO}" var="di">
		  	    content = "${di.hashtag}";
		  	    splitedArray = content.split('#');//#으로 구분
		  	    linkedContent = '';
		  	    splitedArray.shift();//첫번째 지워주는 함수
		
		  	    for(var word in splitedArray){
		  	      word = splitedArray[word];
		  	       if(word.indexOf("") == 0)
		  	       { var word2 = "#"+word;
		  	          word = '<a href="${pageContext.request.contextPath}/search?keyword='+word+'">'+word2+'</a>'
		  	       }
		  	       linkedContent += word+' ';
		  	    }
		  	    
		  	    $("#${di.diary_id}").append(linkedContent);
			  	</c:forEach>
		  	</c:forEach>
	  	</c:forEach>
	  	
/* 	  	$("#country-list");
	  	<c:forEach items="${countryList}" var="country">
	  		var data = "";
	  		data += "<option value='${country.country_name}' />";
	  		$("#country-list").append(data);
	  		console.log(data);
	  	</c:forEach> */
	});
  	
	function getCountry(clickedCountry) {
		var country = $(clickedCountry).text();
		
		$('#schedule_content').val(country);
		$('#schedule_content').focus();
	}	
	
	function viewDetail(product_id) {
		location.href = "/shopping/" + product_id;
	}
  	
  </script>
</head>

<body>

  <%@ include file="/WEB-INF/views/includes/header_main.jsp" %>
  
  <div style="padding: 40px"></div>

    <header class="main-main-img">
    <div class="container">
    <div style="padding: 30px"></div>
    <%@ include file="/WEB-INF/views/calendar/calendar3.jsp"%>
    <div style="padding: 50px"></div>
    <h1 class="main-main-headline">나만의<br>여행 플래너</h1>
    </div>
    </header>

    <div class="main-covid-19">
      <a href="https://www.0404.go.kr/dev/newest_view.mofa?id=ATC0000000008500&pagenum=1&mst_id=MST0000000000040&ctnm=&div_cd=&st=title&stext="
        target="_blank" class="main-covid-19-link"><i class="fas fa-info-circle main-notice-icon"></i>발효중인 여행 주의보</a>
    </div>

    <div class="main-divider-header-blank"></div>

    <div class="container">
      <div class="row">
        <div class="col-md-8 advice-image-area">
          <img src="${pageContext.request.contextPath}/resources/img/main/camping.jpg" class="main-advice-img">
        </div>
        <div class="col-md-4 advice-planner-outer-area">
        <div class="main-advice-planner-inner-area">
          <h2 class="main-advice-title">가다에서 일정을 계획해 보세요</h2>
          <p class="main-advice-content">플래너를 이용하여 여행 계획을 세우고 챙겨야 할 준비물을 확인할 수 있습니다</p>
          <br>
          <span class="main-advice-button" onclick="location.href='http://localhost:8282/planner/schedule'">일정
            생성하기</span>
            </div>
        </div>
      </div>
    </div>

    <div class="main-divider-section-blank"></div>

    <div class="container">
      <h2 class="main-section-headline">가다가 추천하는 여행지</h2>
    </div>
    <div class="container">
      <div class="row">
      <c:forEach items="${recommendation}" var="recommendation">
        <div class="col-md-3" style="padding-bottom: 30px;">
        <div class="main-product-img" style="background-image: url(/resources/img/main/country/${recommendation.schedule_content}); background-size: cover;">
        <div style="padding: 115px"></div>
        <div class="main-country-select" onclick='getCountry(this);'>${recommendation.schedule_content}</div>
        </div>
        </div>
      </c:forEach>
      </div>
    </div>

    <div class="main-divider-section-blank" style="padding: 10px !important"></div>

    <section class="main-card-diary-section">
      <div class="container">
        <h2 class="main-section-headline" style="padding-top: 25px">가다에서 추억을 공유해 보세요<span class="main-diary-more-view" onclick="location.href='/diary'">더&nbsp;보기</span></h2>
      </div>
      <div class="container">
        <div class="row">
          <c:forEach var="member" items="${member}">
          	<c:forEach var="pl" items="${member.plannerVO }">
          		<c:forEach var="di" items="${pl.diaryVO }">
		            <div class="col-md-4">
		              <div class="main-card-diary-area">
		                <img src="resources/diary/${di.img_path}" class="main-card-diary-img" loading="lazy">
		                <div class="main-card-diary-content">
		                  <div class="main-card-diary-profile">
		                    <img class="nav-profile-img" src='/resources/img/profile/${member.profile_img_path }' onerror="this.src='/resources/img/profile/default_profile_img.jpg'">
		                    <a class="main-card-diary-profile-id" href="#">${member.member_id}</a>
		                  </div>
		                  <div class="main-card-diary-hashtag-area">
		                    <span class="main-card-diary-hashtag" id="${di.diary_id }"></span>
		                  </div>
		                </div>
		              </div>
		            </div>
          		</c:forEach>
          	</c:forEach>
          </c:forEach>
        </div>
      </div>
    </section>

    <div class="main-divider-section-blank"></div>

    <div class="container">
      <div class="row">
        <div class="col-md-8 advice-image-area">
          <img src="${pageContext.request.contextPath}/resources/img/main/product.jpg" class="main-advice-img">
        </div>
        <div class="col-md-4 advice-content-area">
        <div class="main-advice-store-inner-area">
          <h2 class="main-advice-title">가다에서 여행에 필요한 물품을 구매해 보세요</h2>
          <p class="main-advice-content">스토어를 이용하여 여행에 필요한 물품을 구매할 수 있습니다</p>
          <br>
          <span class="main-advice-button" onclick="location.href='/shopping?product_type_id=3'">물품
            구매하기</span>
            </div>
        </div>
      </div>
    </div>

    <div class="main-divider-section-blank"></div>

    <div class="container">
      <h2 class="main-section-headline">가다가 추천하는 아이템</h2>
    </div>
    <div class="container">
      <div class="row">
      	<c:forEach var="product" items="${recommendProduct }">
      		<div class="col-md-3">
	      		<div class="product-area">
	      			<div class="product-img">
		      			<img src="/resources/img/product/${product.img_path }" class="main-product-img">
	      			</div>
	      			<div class="product-text">
		      			<p class="gada-link" onclick="viewDetail(${product.product_id})">${product.product_name }</p>
		      			<p>₩ ${product.price }</p>
	      			</div>
	      		</div>
      		</div>
      	</c:forEach>
      </div>
    </div>

    <%@ include file="/WEB-INF/views/includes/chat_icon.jsp" %>
    
    <%@ include file="/WEB-INF/views/includes/footer.jsp" %>

</body>

</html>