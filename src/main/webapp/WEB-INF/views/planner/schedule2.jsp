<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- bootstrap -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!-- font -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@700;800&display=swap" rel="stylesheet">
<!-- GADA CSS -->
<link rel="stylesheet" href="${contextPath}/resources/css/main.css">
<link rel="stylesheet" href="${contextPath}/resources/css/font.css">
<link rel="stylesheet" href="${contextPath}/resources/css/header.css">
<link rel="stylesheet" href="${contextPath}/resources/css/footer.css">
<!-- slick -->
<link rel="stylesheet" type="text/css" href="/resources/slick/slick.css"/>
<link rel="stylesheet" type="text/css" href="/resources/slick/slick-theme.css"/>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript" src="/resources/slick/slick.min.js"></script>
<meta charset="UTF-8">
<title>Schedule</title>
<style>
.slick-arrow {
	background-color: grey;;
}

.content {
	
}

.budget {
	color: grey;
	font-size: 15px;
}

.order-control {
	display: inline-block;
	float: right;
	color: #A2A2A2;
}

.delete {
	display: inline-block;
	float: right;
	color: #A2A2A2;
}

tbody>div {
	border: 1px solid black;
}

#map {
	width: 50%;
	height: 100%;
	float: right;
}

header{

	position:sticky;
	top:40px;
	padding:5px;
	
	
}


</style>
<script type="text/javascript">
	//text parsing to json object
	$.fn.serializeObject = function() {
		var o = {};
		var a = this.serializeArray();
		$.each(a, function() {
			if (o[this.name]) {
				if (!o[this.name].push) {
					o[this.name] = [o[this.name]];
					}
				o[this.name].push(this.value || '');
				} else {
					o[this.name] = this.value || '';
					}
			});
		return o;
	};
	//
	//버튼 스크롤 이동
	function moveTo(date) {
		var offset = $("#" + date).offset();
		//헤더의 크기 52를 빼줌.
		$("html, body").animate({scrollTop : offset.top - 52}, 400);
	}
	//
	//일정 추가 테이블 삭제
	function remove(obj) {
		$(obj).parent().parent().parent().slideUp(400);
		setTimeout(function() {
				$(obj).parent().parent().parent().parent().delay(1000).remove();
			}, 350);
	}
	//
	//delete function
	function deleteSchedule(obj) {
		console.log("delete");
		
		var schedule = $(obj).parent();
		var budget = $(obj).parent().parent().parent().children('.budget-area').children('.budget-total');
		var text = $(obj).siblings('.budget').text();
		var now = text.substr(1, text.length-3);
		var total = $(obj).parent().parent().parent().children('.budget-area').children('.budget-total').text();
		var next = parseInt(total) - parseInt(now);
		
		console.log(schedule);
		console.log(budget);
		console.log(text);
		console.log(now);
		console.log(total);
		console.log(next);
/* 		$.ajax({
			type : "DELETE",
			url : "/planner/schedule/" + $(this).attr('id'),
			cache : false,
			beforeSend : function(xhr){
	  	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(result) {
				console.log(result);
				schedule.remove();
				budget.html(next);
			},
			error : function(e) {
				console.log(e);
				alert("에러가 발생했습니다.");
			}
		}); */
	}
	//
	
	//
	function submitForm(obj) {
		var formData = $(obj).parent().parent().serializeObject();
		var jsonForm = JSON.stringify(formData);
		
		var schedule_date = $("input[name=schedule_date]").val();
		var schedule_content = $("input[name=schedule_content]").val();
		var schedule_type_id = $("input[name=schedule_type_id]").val();
		var budget = $("input[name=budget]").val();
		
		if(confirm("저장하시겠습니까?")) {
			$.ajax({
	            type: "POST",
	            url: "/planner/schedule2",
	            data : jsonForm,
				contentType : "application/json",
				cache : false,
	            beforeSend : function(xhr){
	  	             xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				},
				success : function(result){
					remove(obj);
					switch(schedule_type_id) {
						case "1" :
							$("#" + schedule_date).children(".city-area").children("a.insert-btn").before("<span>" + result + "</span><span class='delete' id='${hotel.schedule_id }' onclick='deleteSchedule()'><i class='far fa-trash-alt'></i></span><br />");
							break
						case "2" :
							if(budget == 0) {
								$("#" + schedule_date).children(".hotel-area").children("a.insert-btn").before("<span>" + result + "</span><br />");
							} else {
								$("#" + schedule_date).children(".hotel-area").children("a.insert-btn").before("<span>" + result + "</span><span class='budget'> (" + budget + "₩)</span><br />");
								var curr = $("#" + schedule_date).children(".budget-area").children(".budget-total").text();
								var next = parseInt(curr) + parseInt(budget);
								$("#" + schedule_date).children(".budget-area").children(".budget-total").html(next);
							}
							break
						case "3" :
							if(budget == 0) {
								$("#" + schedule_date).children(".vehicle-area").children("a.insert-btn").before("<span>" + result + "</span><br />");
							} else {
								$("#" + schedule_date).children(".vehicle-area").children("a.insert-btn").before("<span>" + result + "</span><span class='budget'> (" + budget + "₩)</span><br />");
								var curr = $("#" + schedule_date).children(".budget-area").children(".budget-total").text();
								var next = parseInt(curr) + parseInt(budget);
								$("#" + schedule_date).children(".budget-area").children(".budget-total").html(next);
							}
							break
						case "4" :
							if(budget == 0) {
								$("#" + schedule_date).children(".schedule-area").children("a.insert-btn").before("<span>" + result + "</span><i class='fas fa-bars'></i><br />");
							} else {
								$("#" + schedule_date).children(".schedule-area").children("a.insert-btn").before("<span>" + result + "</span><span class='budget'> (" + budget + "₩)</span><i class='fas fa-bars'></i><br />");
								var curr = $("#" + schedule_date).children(".budget-area").children(".budget-total").text();
								var next = parseInt(curr) + parseInt(budget);
								$("#" + schedule_date).children(".budget-area").children(".budget-total").html(next);
							}
							break
						case "5" :
							$("#" + schedule_date).children(".country-area").children("a.insert-btn").before("<span>" + result + "</span><br />");
							break
					}
				},
				error : function(e){
					alert("오류가 발생했습니다.");
					console.log(e);
				}
	        });
		}
	}
	//
	$(document).ready(function () {
		$("#insert-country-btn").click(function(e) {
			e.preventDefault();
		});
		
		//slick
		$('.date-btn').slick({
			slide: 'button',
			arrows: true,
			infinite: false,
			slidesToShow: 4,
			slidesToScroll: 4,
			responsive: [ // 반응형 웹 구현 옵션
				{  
					breakpoint: 960, //화면 사이즈 960px
					settings: {
						//위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
						slidesToShow:3 ,
						slidesToScroll:3
					} 
				},
				{ 
					breakpoint: 768, //화면 사이즈 768px
					settings: {	
						//위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
						slidesToShow:2,
						slidesToScroll:2
					} 
				}
			]
	   });
		
		//추가하기 버튼 클릭 이벤트
		$(".insert-btn").click(function(e) {
			e.preventDefault();
			var date = $(this).parent().parent().attr("id");
			var schedule_type  = $(this).parent().attr("class");
			var schedule_type_id;
			if(schedule_type == "country-area") {
				schedule_type_id = 5;
			} else if(schedule_type == "city-area") {
				schedule_type_id = 1;
			}  else if(schedule_type == "vehicle-area") {
				schedule_type_id = 3;
			}  else if(schedule_type == "schedule-area") {
				schedule_type_id = 4;
			}  else if(schedule_type == "hotel-area") {
				schedule_type_id = 2;
			}
			
			var insertForm = "";
			insertForm += "<tr class='insert-area'>";
			insertForm += "<td colspan='7'>";
			insertForm += "<div style='display:none'>";
			insertForm += "<form>";
			insertForm += "<p style='font-family:yg-jalnan'>일정 추가하기</p>";
			insertForm += "<div class='input'>";
			insertForm += "<input type='hidden' name = 'planner_id' value='${planner_id}' />";
			insertForm += "<input type='hidden' name = 'schedule_date' value='" + date + "' />";
			insertForm += "<input type='hidden' name = 'schedule_type_id' value='" + schedule_type_id + "' />";
			insertForm += "<label for='search-area'>일정 검색</label>";
			insertForm += "<input id='search-area' type='text' placeholder='일정을 검색하세요.' name='schedule_content'/>";
			insertForm += "</div>";
			insertForm += "<div class='input'>";
			insertForm += "<label for='input-budget'>예산</label>";
			insertForm += "<input id='input-budget' type='number' placeholder='예산을 입력하세요.' name='budget'/>";
			insertForm += "</div>";
			insertForm += "<div class='btn-group'>";
			insertForm += "<button type='button' class='n-btn btn-sm-btn-lighter insert-cancel-btn' onclick='remove(this)'>취소</button>";
			insertForm += "<button type='button' class='n-btn btn-sm-btn-lighter insert-finish-btn' onclick='submitForm(this)'>저장</button>";
			insertForm += "</div>";
			insertForm += "</form>";
			insertForm += "</div>";
			insertForm += "</td>";
			insertForm += "</tr>";
			
			$(this).parent().parent().after(insertForm);
			$(this).parent().parent().parent().children('.insert-area').children('td').children('div').slideDown(400);	
		})
		
		//Planner-select
		$("#select-planner").on('change',function() {
			var planner_id = this.value;
			
			$.ajax({
				type : "GET",
				url : "/planner/schedule2?planner_id=" + planner_id,
				cache : false,
				success : function(result) {
					console.log(planner_id);
					$("tbody").remove();
					//html방식으로 return 받는 것 알아보기.
					//또는 ModelAndView 로 return 받는 것 알아보기.
				},
				error : function(e) {
					console.log(e);
					alert("에러가 발생했습니다.");
				}
			});
		})
		//
		//delete event
		$(".delete").click(function(e) {
			e.preventDefault();
			console.log("delete");
			var schedule = $(this).parent();
			var budget = $(this).parent().parent().parent().children('.budget-area').children('.budget-total');
			var text = $(this).siblings('.budget').text();
			var now = text.substr(1, text.length-3);
			var total = $(this).parent().parent().parent().children('.budget-area').children('.budget-total').text();
			var next = parseInt(total) - parseInt(now);
			
			$.ajax({
				type : "DELETE",
				url : "/planner/schedule/" + $(this).attr('id'),
				cache : false,
				beforeSend : function(xhr){
	  	             xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				},
				success : function(result) {
					console.log(result);
					schedule.remove();
					budget.html(next);
				},
				error : function(e) {
					console.log(e);
					alert("에러가 발생했습니다.");
				}
			});
		})
		//
	});
</script>

</head>
<body>

	<!-- Header -->
	<%@ include file="/WEB-INF/views/includes/header.jsp"%>
	
	<div class="container">
		<!-- headline -->
		<h2 class="headline" style="font-family: 'yg-jalnan'">Schedule</h2>
		<!-- planner option -->
		<form action ="/planner/schedule2" method="get">
				<div class="col-md-12"> 
					<select class="form-control" name="planner_id" id="select-planner" style="font-family: 'yg-jalnan'">
						<c:forEach var="planner" items="${plannerList}">
							<option value='${planner.planner_id}' style="font-family: 'yg-jalnan'">
							  	${planner.planner_name}&nbsp;&nbsp; ${planner.start_date}&nbsp;&nbsp;~&nbsp;&nbsp;${planner.end_date}
							</option>
						</c:forEach>
					</select>
				</div>
		</form>
		
		<!-- date button -->
		<header>
		<div class="col-md-12">
			<div id="topBar ">
			<div class="date-btn">
				<c:forEach var="date" items="${dateList }">
					<button class="btn btn-secondary btn-lg" onclick="moveTo('${date}')" style="margin:10px; height:50px;">
						${date}
					</button>
				</c:forEach>
				</div>
			</div>
		</div>
		</header>
		
		<!-- schedule table -->
		<div class="col-md-12">
			<table class="table" id="table-schedule">
				<colgroup>
					<col width="130px" />
				</colgroup>
				<thead style="font-family:yg-jalnan;">
					<tr>
						<th>날짜</th>
						<th>국가</th>
						<th>도시</th>
						<th>교통</th>
						<th>일정</th>
						<th>숙소</th>
						<th>비용</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="date" items="${dateList}">
						<tr id="${date }">
							<td style="font-family: yg-jalnan;">${date}</td>
							<td class="country-area">
								<c:forEach var="country" items="${countryList }">
									<c:if test="${country.schedule_date eq date}">
										<div>
											<span class="content">${country.schedule_content }</span>
											<span class="delete" id="${country.schedule_id }"><i class="far fa-trash-alt"></i></span>
										</div>
									</c:if>
								</c:forEach>
								<a class="insert-btn" href="#">추가하기</a>
							</td>
							<td class="city-area">
								<c:forEach var="city" items="${cityList }">
									<c:if test="${city.schedule_date eq date }">
										<div>
											<span class="content">${city.schedule_content }</span>
											<span class="delete" id="${city.schedule_id }"><i class="far fa-trash-alt"></i></span>
										</div>
									</c:if>
								</c:forEach>
								<a class="insert-btn" href="#">추가하기</a>
							</td>
							<td class="vehicle-area">
								<c:forEach var="vehicle" items="${vehicleList }">
									<c:if test="${vehicle.schedule_date eq date }">
										<div>
											<span class="content">${vehicle.schedule_content }</span>
											<c:if test="${vehicle.budget ne 0 }"><span class="budget">(${vehicle.budget }₩)</span></c:if>
											<span class="delete" id="${vehicle.schedule_id }"><i class="far fa-trash-alt"></i></span>
										</div>
									</c:if>
								</c:forEach>
								<a class="insert-btn" href="#">추가하기</a>
							</td>
							<td class="schedule-area">
								<c:forEach var="schedule" items="${scheduleList }">
									<c:if test="${schedule.schedule_date eq date }">
										<div>
											<span class="content">${schedule.schedule_order}. ${schedule.schedule_content }</span>
											<c:if test="${schedule.budget ne 0 }"><span class="budget">(${schedule.budget }₩)</span></c:if>
											<span class='order-control'>&nbsp;&nbsp;<i class="fas fa-bars"></i></span>
											<span class="delete" id="${schedule.schedule_id }"><i class="far fa-trash-alt"></i></span>
										</div>
									</c:if>
								</c:forEach>
								<a class="insert-btn" href="#">추가하기</a>
							</td>
							<td class="hotel-area">
								<c:forEach var="hotel" items="${hotelList }">
									<c:if test="${hotel.schedule_date eq date }">
										<div>
											<span class="content">${hotel.schedule_content }</span>
											<br />
											<c:if test="${hotel.budget ne 0 }"><span class="budget">(${hotel.budget }₩)</span></c:if>
											<span class="delete" id="${hotel.schedule_id }"><i class="far fa-trash-alt"></i></span>
										</div>
									</c:if>
								</c:forEach>
								<a class="insert-btn" href="#">추가하기</a>
							</td>
							<td class="budget-area">
								<span class="budget-total"><c:out value="${dayBudget[date] }"></c:out></span>
								<span>₩</span>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	
	<!-- Footer -->
	<%@ include file="/WEB-INF/views/includes/footer.jsp"%>
</body>
</html> --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Shopping</title>

  <!-- Bootstrap core CSS -->
  <link href="resources/shpvendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="resources/shpcss/shop-homepage.css" rel="stylesheet">
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
	
	
	
	 <!-- Page Content -->
	 <!-- 좌측 사이드바 -->
  <div class="container">

    <div class="row">

      <div class="col-lg-3">

        <h1 class="my-4" style="font-family: 'yg-jalnan'">GADA</h1>
        <div class="list-group" style="font-family: 'yg-jalnan'">
          <a href="#" class="list-group-item">Category 1</a>
          <a href="#" class="list-group-item">Category 2</a>
          <a href="#" class="list-group-item">Category 3</a>
        </div>

      </div>
      <!-- /.col-lg-3 -->

      <div class="col-lg-9" style="font-family: 'yg-jalnan'">

        <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
          <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
          </ol>
          <div class="carousel-inner" role="listbox">
            <div class="carousel-item active">
              <img class="d-block img-fluid" src="http://placehold.it/900x350" alt="First slide">
            </div>
            <div class="carousel-item">
              <img class="d-block img-fluid" src="http://placehold.it/900x350" alt="Second slide">
            </div>
            <div class="carousel-item">
              <img class="d-block img-fluid" src="http://placehold.it/900x350" alt="Third slide">
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

        <div class="row">

          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
              <a href="#"><img class="card-img-top" src="https://media.istockphoto.com/photos/adorable-little-girl-taking-a-photo-of-herself-picture-id942546816?s=612x612" alt=""></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="#">셀카봉</a>
                </h4>
                <h5>$24.99</h5>
                <p class="card-text"></p>
              </div>
              <div class="card-footer">
                <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
              <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="#">Item Two</a>
                </h4>
                <h5>$24.99</h5>
                <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur! Lorem ipsum dolor sit amet.</p>
              </div>
              <div class="card-footer">
                <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
              <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="#">Item Three</a>
                </h4>
                <h5>$24.99</h5>
                <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur!</p>
              </div>
              <div class="card-footer">
                <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
              <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="#">Item Four</a>
                </h4>
                <h5>$24.99</h5>
                <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur!</p>
              </div>
              <div class="card-footer">
                <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
              <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="#">Item Five</a>
                </h4>
                <h5>$24.99</h5>
                <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur! Lorem ipsum dolor sit amet.</p>
              </div>
              <div class="card-footer">
                <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
              <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="#">Item Six</a>
                </h4>
                <h5>$24.99</h5>
                <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur!</p>
              </div>
              <div class="card-footer">
                <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
              </div>
            </div>
          </div>

        </div>
        <!-- /.row -->

      </div>
      <!-- /.col-lg-9 -->

    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->

<!-- Footer -->
  <footer>
    <div class="footer-company-info">
      © 2021 가다, Inc. All rights reserved<br> 개인정보 처리방침·이용약관·사이트맵
    </div>
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="resources/shpvendor/jquery/jquery.min.js"></script>
  <script src="resources/shpvendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
