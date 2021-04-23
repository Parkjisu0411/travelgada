<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
	<title>방문자 통계</title>
	<!-- simplebar CSS-->
	<link href="/resources/assets/plugins/simplebar/css/simplebar.css" rel="stylesheet"/>
	<!-- Bootstrap core CSS-->
	<link href="/resources/assets/css/bootstrap.min.css" rel="stylesheet"/>
	<!-- animate CSS-->
	<link href="/resources/assets/css/animate.css" rel="stylesheet" type="text/css"/>
	<!-- Icons CSS-->
	<link href="/resources/assets/css/icons.css" rel="stylesheet" type="text/css"/>
	<!-- Sidebar CSS-->
	<link href="/resources/assets/css/sidebar-menu.css" rel="stylesheet"/>
	<!-- Custom Style-->
	<link href="/resources/assets/css/app-style.css" rel="stylesheet"/>
	<!-- Bootstrap core JavaScript-->
	<script src="/resources/assets/js/jquery.min.js"></script>
	<script src="/resources/assets/js/popper.min.js"></script>
	<script src="/resources/assets/js/bootstrap.min.js"></script>
	<!-- simplebar js -->
	<script src="/resources/assets/plugins/simplebar/js/simplebar.js"></script>
	<!-- sidebar-menu js -->
	<script src="/resources/assets/js/sidebar-menu.js"></script>
	<!-- Custom scripts -->
	<script src="/resources/assets/js/app-script.js"></script>
	<!-- Chart js -->
	<script src="/resources/assets/plugins/Chart.js/Chart.min.js"></script>
	<script src="/resources/visitor/apexcharts.js"></script>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@700;800&display=swap" rel="stylesheet">
	
	<link rel="stylesheet" href="/resources/css/main.css">
	<link rel="stylesheet" href="/resources/css/font.css">
	<link rel="stylesheet" href="/resources/css/header.css">
	<link rel="stylesheet" href="/resources/css/footer.css">
	<!-- Font Awesome -->
	<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style>
text {
	fill: white;
}

#chart-product-list td {
	max-width: 180px;
	overflow: hidden;
	table-layout: fixed;
}
</style>

<script type="text/javascript">
/* 월별 통계 */
	$(document).ready(function() {
		
		var mothlyVisitor = {
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
				colors: '#ffffff',
				xaxis: {
					categories: ["1월","2월","3월","4월","5월","6월","7월", "8월","9월","10월","11월","12월"],
				},
			}
				
		var chartMothlyVisitor = new ApexCharts(document.querySelector("#chart-profile-visit"), mothlyVisitor);
			
		chartMothlyVisitor.render();	
	});
</script>

 <script>
 /* 차트 */
	$(document).ready(function() {
		$(function() {
    		"use strict";

     		// 일별 방문자
			console.log(${dayCount});
     		var ctx = document.getElementById('chart1').getContext('2d');
		
			var myChart = new Chart(ctx, {
				type: 'line',
				data: {
					labels: ["1일", "2일", "3일", "4일", "5일", "6일", "7일", "8일", "9일", "10일",
							"11일","12일","13일","14일","15일","16일","17일","18일","19일","20일",
							"21일","22일","23일","24일","25일","26일","27일","28일","29일","30일","31일"],
					datasets: [{ 
						label: '일별 방문자',
						data: ${dayCount},
						backgroundColor: "rgba(255, 255, 255,0.60)",//그래프 색깔
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
			
			// 회원 수

			var ctx = document.getElementById("chart2").getContext('2d');
			var myChart = new Chart(ctx, {
				
				type: 'doughnut',
				
				data: {
					labels: ["회원", "탈퇴", "", ""],
					datasets: [{
						backgroundColor: [
							"#ffffff",
							"rgba(255, 255, 255, 0.20)"
						],
						data: [${total-withdrawal}, ${withdrawal}],
						borderWidth: [0, 0, 0, 0]
					}]
				},
				options: {
					maintainAspectRatio: false,
				   legend: {
					 position :"bottom",	
					 display: false,
					    labels: {
						  fontColor: '#ddd',  
						  boxWidth:15
					   }
					}
					,
					tooltips: {
					  displayColors:false
					}
				}
			});
		});	
	});
 /* 차트 */
</script>

</head>

<body class="bg-theme bg-theme9">
 
	<!-- Start wrapper-->
 	<div id="wrapper">
 	
 		<!--Start sidebar-wrapper-->
		<div id="sidebar-wrapper" data-simplebar="" data-simplebar-auto-hide="true">
			<div class="brand-logo">
				<a href="/" style="font-family:yg-jalnan"><img src="/resources/img/main/logo.png" class="logo-icon" alt="logo icon">가다</a>
			</div>
   				<ul class="sidebar-menu do-nicescrol">
      				<li>
        				<a href="/admin">
          					<i class="fas fa-user-cog"></i> <span>회원 관리</span>
        				</a>
      				</li>
      				<li>
        				<a href="/admin/room">
          					<i class="fas fa-comment-dots"></i> <span>1:1 채팅 문의</span>
        				</a>
      				</li>
					<li>
						<a href="/visitor">
							<i class="fas fa-chart-line"></i> <span>방문자 통계</span>
						</a>
					</li>
					<li>
						<a href="/statistic/sales">
							<i class="fas fa-hand-holding-usd"></i> <span>매출 통계</span>
						</a>
					</li>
					<li>
						<a href="/statistic/destination">
							<i class="fas fa-globe-americas"></i> <span>여행지 통계</span>
						</a>
					</li>
				</ul>
		</div>
		<!--End sidebar-wrapper-->

 		<div class="content-wrapper">
			<div class="container-fluid">


			<h3> ${year}년 ${month}월 ${day}일</h3>
			<br/>

				<!-- 차트 -->
				<div class="row">
					<div class="col-12 col-lg-8 col-xl-8">
						<div class="card">
							<div class="card-header">월별 방문자</div>
							<div class="card-body">
								<div id="chart-profile-visit"></div>
							</div>
						</div>
					</div>


					<div class="col-12 col-lg-4 col-xl-4">
						<div class="card">
							<div class="card-header">
								총 회원 &nbsp;: ${total}
								<div class="card-action"></div>
							</div>
							<div class="card-body">
								<div class="chart-container-2">
									<canvas id="chart2"></canvas>
								</div>
							</div>
							<div class="table-responsive">
								<table class="table align-items-center">
									<tbody>
										<tr>
											<td><i class="fa fa-circle text-white mr-2"></i> 회원</td>
											<td>${total-withdrawal}</td>
											<td>${(total-withdrawal)/total*100}%</td>
										</tr>

										<tr>
											<td><i class="fa fa-circle text-light-3 mr-2"></i> 탈퇴</td>
											<td>${withdrawal}</td>
											<td>${withdrawal/total*100}%</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				<!--End Row-->

				<div class="row">
					<div class="col-12 col-lg-12 col-xl-12">
						<div class="card">
							<div class="card-header">
								일일 방문자
								<div class="card-action"></div>
							</div>
							<div class="card-body">

								<div class="chart-container-1">
									<canvas id="chart1"></canvas>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 차트 끝 -->

	  
		<!--start overlay-->
		<div class="overlay toggle-menu"></div>
		<!--end overlay-->
		
    		</div><!-- End container-fluid-->
    	</div><!--End content-wrapper-->

		<!--start color switcher-->
		<div class="right-sidebar">
			<div class="switcher-icon">
				<i class="zmdi zmdi-settings zmdi-hc-spin"></i>
			</div>
			<div class="right-sidebar-content">
				<p class="mb-0">Gaussion Texture</p>
				<hr>
				<ul class="switcher">
					<li id="theme1"></li>
					<li id="theme2"></li>
					<li id="theme3"></li>
					<li id="theme4"></li>
					<li id="theme5"></li>
					<li id="theme6"></li>
				</ul>
				<p class="mb-0">Gradient Background</p>
				<hr>
				<ul class="switcher">
					<li id="theme7"></li>
					<li id="theme8"></li>
					<li id="theme9"></li>
					<li id="theme10"></li>
					<li id="theme11"></li>
					<li id="theme12"></li>
					<li id="theme13"></li>
					<li id="theme14"></li>
					<li id="theme15"></li>
				</ul>
			</div>
		</div><!--end color switcher-->
	</div><!--End wrapper-->

</body>
</html>
