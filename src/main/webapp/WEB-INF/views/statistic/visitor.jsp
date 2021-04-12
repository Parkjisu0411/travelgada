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
</html>