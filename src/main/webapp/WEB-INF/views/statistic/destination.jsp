<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  

 <!-- loader-->
<link href="/resources/assets/css/pace.min.css" rel="stylesheet"/>
<script src="/resources/assets/js/pace.min.js"></script>
<!--favicon-->
<link rel="icon" href="/resources/assets/images/favicon.ico" type="image/x-icon">
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

<link rel="stylesheet" href="/resources/css/font.css">
<link rel="stylesheet" href="/resources/css/footer.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- Google Map -->
  <script
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDK3h87HvHsFJIOBZ7Vuo-9V6lqognoY2M&callback=initMap"></script>
    
<style>
    #map {
      width: 100%;
      height: 500px;
    }
    
    /* Info Window */
    .gm-ui-hover-effect {
      display: none !important;
    }

    .schedule-content {
      font-size: 1.1em;
    }

    .gm-style-iw-t::after {
      display: none !important;
    }
    
    .gm-style .gm-style-iw-c {
      border-radius: 25px;
      box-shadow: rgb(0 0 0 / 8%) 0px 0px 0px 1px, rgb(0 0 0 / 18%) 0px 1px 2px;
      font-family: 'Gothic A1', sans-serif;
      font-weight: 400;
    }
</style>

<script>
var destinationChart = null;
function getDestinationMonthly(month) {
	$.ajax({
		type : "GET",
		url : "/destination/" + ${year} + "/" + month,
		cache : false,
		success : function(result) {
			var data = [];
			var labels = [];
			
			for(var i = 0; i < result.length; i++) {
				data.push(result[i].total);
				labels.push(result[i].city);
				if(i == 3) {
					break;
				}
			}
			
			var context = document.getElementById("chart-product-sales").getContext("2d");
			var config = {
				type: 'doughnut',
				data: {
					labels: labels,
					datasets: [{
						backgroundColor: [
							"#ffffff",
							"rgba(255, 255, 255, 0.20)"
						],
						data: data,
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
					},
					tooltips: {
						displayColors:false
					}
				}
			}
			if(destinationChart != null) {
				destinationChart.destroy();
				destinationChart = new Chart(context, config);
			} else {
				destinationChart = new Chart(context, config);
			}
			
			var html = "";
			for(var i = 0; i < result.length; i++) {
				html += "<tr>";
				html += "	<td>" + result[i].city + "</td>";
				html += "	<td>" + result[i].total + "</td>";
				html += "</tr>";
				if(i == 3) {
					break;
				}
			}
			$("#chart-product-list").html(html);
		},
		error: function(e) {
			console.log(e);
		}
	})
}

function getDestinationTotalMap() {
    $.ajax({
        url: "/destination/total",
        method: 'GET',
        cache: false,
        contentType: "application/json; charset=utf-8",
        success: function initMap(result) {
          var paths = result;
          var pathsArray = [];

          var map = new google.maps.Map(document.getElementById('map'), {
            mapTypeControl: false,
            fullscreenControl: false
          });
          /* map.setOptions({draggable: false}); */
          var bounds = new google.maps.LatLngBounds();

          for (var index = 0; index < paths.length; index++) {
            if ((paths[index].latitude && paths[index].longitude) == '' || null || undefined || 0 || NaN) {
              continue;
            }
            var latitude = paths[index].latitude;
            var longitude = paths[index].longitude;
            
            var marker = new google.maps.Marker({
              position: { lat: latitude, lng: longitude },
              map: map
            });
            marker.setVisible(false);

            bounds.extend(new google.maps.LatLng(latitude, longitude));
  		  
            var markerContent = '<div id="schedule-content">' + '<strong>' + paths[index].city + '</strong>&nbsp;&nbsp;|&nbsp;&nbsp;' + paths[index].total + '</div>';
            marker.info = new google.maps.InfoWindow({
              content: markerContent,
              pixelOffset: new google.maps.Size(0, 45),
            });

            google.maps.event.addListener(marker, 'click', function () {
              this.info.open(this.getMap(), this);
            });
            marker.info.open(marker.getMap(), marker);
         }
          map.fitBounds(bounds);
        },
        error: function (e) {
          console.log(e);
        }
   });
}

function getDestinationTotalTable() {
    $.ajax({
        url: "/destination/total",
        method: 'GET',
        cache: false,
        contentType: "application/json; charset=utf-8",
        success: function(result) {
          var html = "";
          html += "<table class='table'>";
          console.log(result[0].city);
          for (var i = 0; i < result.length; i++) {
        	  html += "<tr>";
              html += "<td>" + result[i].city + "</td>";
              html += "<td>" + result[i].total + "</td>";
              html += "</tr>";
          }
          html += "</table>";

          console.log(result[0].city);
          $(".card-body-total").html(html);
        },
        error: function (e) {
          console.log(e);
        }
   });
}

$(document).ready(function() {
	var monthlyDestinationOptions = {
			annotations: {
				position: 'back'
			},
			dataLabels: {
				enabled:false
			},
			chart: {
				type: 'bar',
				height: 380,
				events: {
					click: function(series) {
						var ele = series.toElement;
						var month = parseInt($(ele).attr("j")) + parseInt(1);
						getDestinationMonthly(month);
					}
				}
			},
			fill: {
				opacity:1
			},
			plotOptions: {
			},
			series: [{
				name: '월별 여행지 합계',
				data: ${destinationMonthly}
			}],
			colors: '#ffffff',
			xaxis: {
				categories: ["1월","2월","3월","4월","5월","6월","7월", "8월","9월","10월","11월","12월"],
			},
	}
	
	var monthlyDestinationChart = new ApexCharts(document.querySelector("#chart-monthly-sales"), monthlyDestinationOptions);
	monthlyDestinationChart.render();
	
	getDestinationMonthly(${month});
	getDestinationTotalMap();
	getDestinationTotalTable();
});
</script>
 
 <body class="bg-theme bg-theme9">

	<!-- Start wrapper-->
 	<div id="wrapper">
 		<!--Start sidebar-wrapper-->
		<div id="sidebar-wrapper" data-simplebar="" data-simplebar-auto-hide="true">
			<div class="brand-logo">
				<a href="index.html">
					<img src="/resources/assets/images/logo-icon.png" class="logo-icon" alt="logo icon">
				</a>
			</div>
			<ul class="sidebar-menu do-nicescrol">
			<!-- <li class="sidebar-header">MAIN NAVIGATION</li> -->
				<li>
					<a href="/admin"><i class="zmdi zmdi-view-dashboard"></i> <span>회원 관리</span></a>
				</li>
				<li>
					<a href="/visitor"><i class="zmdi zmdi-invert-colors"></i> <span>방문자 통계</span></a>
				</li>
				<li>
					<a href="/statistic/sales"><i class="zmdi zmdi-format-list-bulleted"></i> <span>매출 통계</span></a>
				</li>
				<li>
					<a href="/statistic/destination"><i class="zmdi zmdi-grid"></i> <span>여행지 통계</span></a>
				</li>
			</ul>
		</div>
		<div class="clearfix"></div>
		<div class="content-wrapper">
			<div class="container-fluid">
				<h3> ${year}년 ${month}월 ${day}일</h3>
				<br/>
				<div class="row">
					<!-- start monthly sales -->
					<div class="col-12 col-lg-8 col-xl-8">
						<div class="card">
							<div class="card-header">
								월별 여행지 합계
							</div>
							<div class="card-body">
								<div id="chart-monthly-sales"></div>
							</div>
						</div>
					</div>
					<!-- end monthly sales -->
					<!-- start product sales -->
					<div class="col-12 col-lg-4 col-xl-4">
						<div class="card">
							<div class="card-header">월별 여행지 비율
								<div class="card-action"></div>
							</div>
							<div class="card-body">
								<div class="chart-container-2">
									<canvas id="chart-product-sales"></canvas>
								</div>
							</div>
							<div class="table-responsive">
								<table class="table align-items-center">
									<tbody id = "chart-product-list">
										
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<!-- end product sales -->
				</div>
				<!-- start daily sales -->
				<div class="row">
					<div class="col-12 col-lg-12 col-xl-12">
						<div class="card">
							<div class="card-header">전체 기간
								<div class="card-action"></div>
							</div>
							<div id="map"></div>
							<div class="card-body-total">
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- end daily sales -->
				<!--start overlay-->
				<div class="overlay toggle-menu"></div>
				<!--end overlay-->
			</div>
	    	<!-- End container-fluid-->
	    
		</div>
	    <!--End content-wrapper-->
	
		
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
		</div>
		<!--end color switcher-->
	</div><!--End wrapper-->
</body>
</html>