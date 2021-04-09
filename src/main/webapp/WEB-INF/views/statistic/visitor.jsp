<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>

<title>방문자 통계</title>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/jquery-date-range-picker/0.21.1/daterangepicker.min.css"
		integrity="sha512-nmvKZG8E3dANbZAsJXpdK6IqpfEXbPNbpe3M3Us1qTipq74IpTRShbpCf8lJFapB7e0MkDbNDKxLjS1VWt2vVg=="
		crossorigin="anonymous" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-date-range-picker/0.21.1/jquery.daterangepicker.min.js"
    	integrity="sha512-jM36zj/2doNDqDlSIJ+OAslGvZXkT+HrtMM+MMgVxCqax1AIm1XAfLuUFP7uMSavUxow+z/T2CRnSu7PDaYu2A=="
    	crossorigin="anonymous"></script>
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>-->
 	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@700;800&display=swap" rel="stylesheet">
	
	<link rel="stylesheet" href="${contextPath}/resources/css/font.css">
	<link rel="stylesheet" href="${contextPath}/resources/css/header.css">
	<link rel="stylesheet" href="${contextPath}/resources/css/footer.css">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<!-- 차트 -->
	<!-- Icons CSS 필수 -->
	<link href="resources/visitor/icons.css" rel="stylesheet" type="text/css"/>
	<!-- Custom Style 필수 -->
	<link href="resources/visitor/app-style.css" rel="stylesheet"/>

</head>
<body>

	<!-- Header -->
	<%@ include file="/WEB-INF/views/includes/header.jsp"%>

	<!--Content -->
	<div class="container">
	<br/><br/><br/>
	
 	
	<h3> ${year}년 ${month}월 ${day}일</h3>
	<%--<br/>
	<h3>월별 방문자</h3>
	<br/>
	<% int month=1;%>
	<c:forEach items= "${monthCount}" var="monthVisitor">
	 <%= month %> <% month++; %>
		윌 : ${monthVisitor}
	&nbsp;&nbsp;&nbsp;
	</c:forEach>
	
	<br/><br/>
	<h3> 일별 방문자</h3>
	<br/>
	
	<% int day=1;%>
	<c:forEach items= "${dayCount}" var="dayVisitor">
	 <%= day %> <% day++; %>
		윌 : ${dayVisitor}
	&nbsp;&nbsp;&nbsp;
	</c:forEach> --%>

	<!-- 차트 부분 -->
	<!-- 여기 부분 월별 방문자 수 -->
	<div class="row">
		<div class="col-6">
			<div class="card">
				<div class="card-header">
					<h4>월별 방문자</h4>
				</div>
				<div class="card-body">
						<div id="chart-profile-visit"></div>
					</div>
				</div>
			</div>
			
						<div class="col-6">
				<div class="card">
					<div class="card-header">
						일일 방문자
						<div class="card-action"></div>
					</div>
					<div class="card-body">
						<ul class="list-inline">
							<li class="list-inline-item"><i
								class="fa fa-circle mr-2 text-white"></i>Visitor</li>
						</ul>
						<div class="chart-container-1">
							<canvas id="chart1"></canvas>
						</div>
					</div>

				</div>
			</div>
		</div>
		<!-- 월별 방문자 수 -->

		<!-- 여기 동그라미 -->
		<!--       <div class="card">
                            <div class="card-header">
                                <h4>Visitor Profile</h4>
                            </div>
                            <div class="card-body">
                                <div id="chart-visitors-profile"></div>
                            </div>
                        </div> -->
		<!-- 여기 동그라미 -->

		<!-- 여기가 카드 부분이다. -->

		<div class="row">

		</div>
		<!-- Chart js 필수 -->
  </div><!-- container end -->
  
  <script src="resources/visitor/Chart.js/Chart.min.js"></script>
 
  <!-- Index js -->
  <!-- 일일 방문자 수  -->
  <script>
  $(function() {
	    "use strict";

	     // chart 1
 
			  var ctx = document.getElementById('chart1').getContext('2d');
			
				var myChart = new Chart(ctx, {
					type: 'line',
					data: {
						labels: ["1일", "2일", "3일", "4일", "5일", "6일", "7일", "8일", "9일", "10일",
							"11일","12일","13일","14일","15일","16일","17일","18일","19일","20일","21일","22일","23일","24일","25일","26일","27일","28일","29일","30일","31일"],
						datasets: [{ 
							label: 'Old Visitor',
							data: ${dayCount},
							backgroundColor: "rgba(255, 255, 255, 0.25)",//그래프 색깔
							borderColor: "transparent",
							pointRadius :"0",
							borderWidth: 1
						}]
					},
				options: {
					maintainAspectRatio: false,
					legend: {
					  display: false,
					  labels: {
						fontColor: '#ddd',  
						boxWidth:40
					  }
					},
					tooltips: {
					  displayColors:false
					},	
				  scales: {
					  xAxes: [{
						ticks: {
							beginAtZero:true,
							fontColor: '#ddd'
						},
						gridLines: {
						  display: true ,
						  color: "rgba(221, 221, 221, 0.08)"
						},
					  }],
					   yAxes: [{
						ticks: {
							beginAtZero:true,
							fontColor: '#ddd'
						},
						gridLines: {
						  display: true ,
						  color: "rgba(221, 221, 221, 0.08)"
						},
					  }]
					 }

				 }
				});  
	   });	 
	   </script>

	<!-- 차트 끝 -->

 	<!-- 여기는 들어가야 한다!!!! -->
     <script src="resources/visitor/apexcharts.js"></script>
     <!-- 쟤는 위여야 한다. -->
     <!-- 여기가 밑이어야 한다.  -->
   <!--   <script src="resources/visitor/dashboard.js"></script> -->
<script type="text/javascript">

var optionsProfileVisit = {
		annotations: {
			position: 'back'
		},
		dataLabels: {
			enabled:false
		},
		chart: {
			type: 'bar',
			height: 300
		},
		fill: {
			opacity:1
		},
		plotOptions: {
		},
		series: [{
			name: 'sales',
			data: ${monthCount}
		}],
		colors: '#435ebe',
		xaxis: {
			categories: ["1월","2월","3월","4월","5월","6월","7월", "8월","9월","10월","11월","12월"],
		},
	}
	let optionsVisitorsProfile  = {
		series: [70, 30],
		labels: ['Male', 'Female'],
		colors: ['#435ebe','#55c6e8'],
		chart: {
			type: 'donut',
			width: '100%',
			height:'350px'
		},
		legend: {
			position: 'bottom'
		},
		plotOptions: {
			pie: {
				donut: {
					size: '30%'
				}
			}
		}
	}

	var optionsEurope = {
		series: [{
			name: 'series1',
			data: [310, 800, 600, 430, 540, 340, 605, 805,430, 540, 340, 605]
		}],
		chart: {
			height: 80,
			type: 'area',
			toolbar: {
				show:false,
			},
		},
		colors: ['#5350e9'],
		stroke: {
			width: 2,
		},
		grid: {
			show:false,
		},
		dataLabels: {
			enabled: false
		},
		xaxis: {
			type: 'datetime',
			categories: ["2018-09-19T00:00:00.000Z", "2018-09-19T01:30:00.000Z", "2018-09-19T02:30:00.000Z", "2018-09-19T03:30:00.000Z", "2018-09-19T04:30:00.000Z", "2018-09-19T05:30:00.000Z", "2018-09-19T06:30:00.000Z","2018-09-19T07:30:00.000Z","2018-09-19T08:30:00.000Z","2018-09-19T09:30:00.000Z","2018-09-19T10:30:00.000Z","2018-09-19T11:30:00.000Z"],
			axisBorder: {
				show:false
			},
			axisTicks: {
				show:false
			},
			labels: {
				show:false,
			}
		},
		show:false,
		yaxis: {
			labels: {
				show:false,
			},
		},
		tooltip: {
			x: {
				format: 'dd/MM/yy HH:mm'
			},
		},
	};

	let optionsAmerica = {
		...optionsEurope,
		colors: ['#008b75'],
	}
	let optionsIndonesia = {
		...optionsEurope,
		colors: ['#dc3545'],
	}



	var chartProfileVisit = new ApexCharts(document.querySelector("#chart-profile-visit"), optionsProfileVisit);
	var chartVisitorsProfile = new ApexCharts(document.getElementById('chart-visitors-profile'), optionsVisitorsProfile)
	var chartEurope = new ApexCharts(document.querySelector("#chart-europe"), optionsEurope);
	var chartAmerica = new ApexCharts(document.querySelector("#chart-america"), optionsAmerica);
	var chartIndonesia = new ApexCharts(document.querySelector("#chart-indonesia"), optionsIndonesia);

	chartIndonesia.render();
	chartAmerica.render();
	chartEurope.render();
	chartProfileVisit.render();
	chartVisitorsProfile.render()


</script>
	<!-- Footer -->
	<%@ include file="/WEB-INF/views/includes/footer.jsp"%>

</body>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>

<title>달력</title>

	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/jquery-date-range-picker/0.21.1/daterangepicker.min.css"
		integrity="sha512-nmvKZG8E3dANbZAsJXpdK6IqpfEXbPNbpe3M3Us1qTipq74IpTRShbpCf8lJFapB7e0MkDbNDKxLjS1VWt2vVg=="
		crossorigin="anonymous" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-date-range-picker/0.21.1/jquery.daterangepicker.min.js"
    	integrity="sha512-jM36zj/2doNDqDlSIJ+OAslGvZXkT+HrtMM+MMgVxCqax1AIm1XAfLuUFP7uMSavUxow+z/T2CRnSu7PDaYu2A=="
    	crossorigin="anonymous"></script>
	
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<!-- <script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 -->	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link
		href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@700;800&display=swap"
		rel="stylesheet">
	

	<link rel="stylesheet" href="${contextPath}/resources/css/font.css">
	<link rel="stylesheet" href="${contextPath}/resources/css/header.css">
	<link rel="stylesheet" href="${contextPath}/resources/css/footer.css">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<!-- 달력 부분 -->
	<link href="resources/calendar/datepicker/daterangepicker.css" rel="stylesheet" media="all">
    <link href="resources/calendar/css/datepicker2.css" rel="stylesheet" media="all">


<style>
/* 달력 생성 모달 */
	/* 달력 아이콘 */
	#calImg {
		position: fixed;
		right: 20px;
		width: 25px;
		height: 30px;
	}

	/* 모달 스타일 */
	.modalInput{
        margin-left: 20px;
    }

	.modal_input-style{
		border: none;
		font-size: 15px;
		background-color: rgb(238, 237, 237);
		outline: none;
		height: 40px;
		width: 270px;
		border-radius: 15px;
		padding-left: 20px;
	}

	.modal-submit{
		border: none;
		height: 40px;
		width: 270px;
		border-radius: 15px;
		background-color: rgb(211, 211, 211);
	}

	.modalLabel{
		margin:15px 10px 10px 10px;			
		font-size: 12px;
		color: black;
		display: block;
		height: 10px;
		font-weight: bold;
	}
            
	/* 모달 배경 투명 */
	.modal-backdrop {
		background-color: rgba(0,0,0,.0001) !important;
	}
	
	.modal-dialog2{
		position: fixed;
		top:60px;
		right: 60px;
		width:310px;
	}

/* 모달 스타일 end */
</style>

<style>
/* 다이어리 이미지 */
.diary_img {
	width: 240px;
	height: 240px;
	object-fit: cover;
	display: block;
	margin: 0px auto;
	padding-bottom: 20px;
}
</style>

<style>
/* 모달 스타일 */
	.dialogDi{
    	width : 300px;
   	 	height : 50px;
    	float: left;
    	margin-left: 30px;
    	margin-botton: 10px;
	}

	.mainImg{
	    float: left;
	}
	
</style>

<script>
/* 플래너 생성 경고 */
	$(document).ready(function(){
		$(".modal-submit").click(function(){
			if($("#planner_name").val().length==0){
				alert("플래너 이름을 입력하세요!");
				$("#planner_name").focus();
				return false;
			}//if end
			if($("#input-start").val().length==0){
				alert("여행 기간을 선택해주세요!");
				$("#input-start").focus();
				return false;
			}//if end
			if($("#input-end").val().length==0){
				alert("여행 기간을 선택해주세요!");
				$("#input-start").focus();
				return false;
			}//if end
			if($("#schedule_content").val().length==0){
				alert("나라를 입력하세요!");
				$("#schedule_content").focus();
				return false;
			}//if end
		});//click function end
	});//ready function end
/* 플래너 생성 경고 end */
</script>

<script>
/* 엔드 날짜 클릭시 시작 날짜로 포커스가게 하기 */
	$(document).ready(function(){
		$("#input-end").click(function(){
			$("#input-start").focus();
		});//click function end
	});//ready function end
/* 날짜 동시에 띄우기 end */
</script>

</head>
<body>

	<!-- Header -->
	<%@ include file="/WEB-INF/views/includes/header.jsp"%>

	<!-- 달력 이미지 - container 안에 있으면 안됨 -->
	<img id="calImg" src="resources/calendar/cal.png" data-toggle="modal" data-target="#calModal"/>

	<!--Content -->
	<div class="container">
	<br/><br/><br/><br/><br/><br/>
	
	<!-- 데이트에서 4월을 빼고 
		날짜를 뽑아주고
	--> 
	<h3> ${year}년 ${month}월 ${day}일</h3>
	<br/>
	<h3>월별 방문자</h3>
	<br/>
	<% int month=1;%>
	<c:forEach items= "${monthCount}" var="monthVisitor">
	 <%= month %> <% month++; %>
		윌 : ${monthVisitor}
	&nbsp;&nbsp;&nbsp;
	</c:forEach>
	
	<br/><br/>
	<h3> 일별 방문자</h3>
	<br/>
	
	<% int day=1;%>
	<c:forEach items= "${dayCount}" var="dayVisitor">
	 <%= day %> <% day++; %>
		윌 : ${dayVisitor}
	&nbsp;&nbsp;&nbsp;
	</c:forEach>

	<br/><br/><br/><br/><br/><br/>
	
	
	</div><!-- container end -->
	

	<!-- 달력 모달 -->
	<!-- Modal -->
	<div class="modal" id="calModal" role="dialog">
		<div class="modal-dialog modal-dialog2">
			<div class="modal-content">
				<form class="form" action="${pageContext.request.contextPath}/planner_create" method="post">

	<!-- 숨겨서 보내야 하는 정보들 -->
		<input type="hidden" name="member_id" value="${member}"/>
		<input type="hidden" id="_csrf" name="_csrf" value="${_csrf.token}"/>
		<input type="hidden" id="_csrf_header" name="_csrf_header" value="${_csrf.headerName}"/>			
			<div class="modalWrapper">
				
					<button type="button" class="close" data-dismiss="modal">&times;</button>  
                    <br>
                    <div class="modalInput">
                        <h3 class="modalLabel">플래너 이름</h3>
                            <input style="font-family: 'yg-jalnan'" name="planner_name" class="modal_input-style" type="text" placeholder="가다랑 함께 즐거운 여행!" id="planner_name">
                        </div>
                        <div class="modalInput">
                            <h3 class="modalLabel">여행시작</h3>
                            <input style="font-family: 'yg-jalnan'" name="start_date" class="modal_input-style" type="text"  placeholder="YYYY/MM/DD" id="input-start">
                        </div>
                        <div class="modalInput">
                            <h3 class="modalLabel">여행종료</h3>
                            <input style="font-family: 'yg-jalnan'" name="end_date" class="modal_input-style" type="text"  placeholder="YYYY/MM/DD" id="input-end">
                        </div>
                        <div class="modalInput">
                            <h3 class="modalLabel">나라</h3>
                            <input style="font-family: 'yg-jalnan'" name="schedule_content" class="modal_input-style" type="text" placeholder="어디로 여행 갈까요?" id="schedule_content">
                        </div>
                        <br>
						<div class="modalInput">
                        	<input class="modal-submit" style="font-family: 'yg-jalnan'" type="submit" value="작성"/>
						</div>
					<br>
				</div>
				</form>
			</div>
		</div>
	</div><!-- 달력 모달 end -->

	<!-- 달력 (아래 추가) -->
	<script src="resources/calendar/datepicker/moment.min.js"></script>
	<script src="resources/calendar/datepicker/daterangepicker.js"></script>
    <script src="resources/calendar/js/global.js"></script>

	<!-- Footer -->
	<%@ include file="/WEB-INF/views/includes/footer.jsp"%>

</body>
</html>