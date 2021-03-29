<%@ page language="java" contentType="text/html; charset=UTF-8"
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

.delete-btn {
	display: inline-block;
	float: right;
	color: #A2A2A2;
}

tbody > div {
	border: 1px solid black;
}

#map {
  width: 300px;
  height: 300px;
  display: none;
  overflow: hidden;
  float: right;
}

</style>
<script type="text/javascript">
	function moveToMap() {
		var lattitude = 35.160973
		var center = new google.maps.LatLng(35.160973, 35.160973);
		map.panTo(center);
	}
	

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
		$("#map").slideUp(400);
		setTimeout(function() {
				$(obj).parent().parent().parent().parent().delay(1000).remove();
			}, 350);
	}
	//
	//delete function
	function deleteSchedule(obj) {
		console.log("delete");
		
		var schedule = $(obj).parent();
		var td = $(obj).parent().parent();
		var budget = $(obj).parent().parent().parent().children('.budget-area').children('.budget-total');
		var now = $(obj).siblings('.budget').text().substr(1, $(obj).siblings('.budget').text().length-3);
		var total = $(obj).parent().parent().parent().children('.budget-area').children('.budget-total').text();
		var schedule_type = td.attr('class');
		if(!now) {
			var next = total
		} else {
			var next = parseInt(total) - parseInt(now);
		}
		
 		$.ajax({
			type : "DELETE",
			url : "/planner/schedule/" + $(obj).attr('id'),
			cache : false,
			beforeSend : function(xhr){
	  	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(result) {
				console.log(result);
				var size = td.children("div").children(".order").size();
				schedule.remove();
				budget.html(next);
				if(schedule_type == 'schedule-area') {
					for(var i = 1; i < size; i++) {
						console.log(td.children("div").children(".order").eq(i).text());
						td.children("div").children(".order").eq(i-1).html(i + ". ");
					}
				}
			},
			error : function(e) {
				console.log(e);
				alert("에러가 발생했습니다.");
			}
		});
	}
	//
	
	//
	function submitForm(obj) {
		if(schedule_content = $("input[name=schedule_content]").val() == "") {
			schedule_content = $("input[name=schedule_content]").val($("#search-area").val());
		}
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
	            dataType : "json",
				contentType : "application/json",
				cache : false,
	            beforeSend : function(xhr){
	  	             xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				},
				success : function(data){
					remove(obj);
					console.log(data);
					var schedule_content = data.schedule_content;
					var schedule_order = data.schedule_order;
					var schedule_id = data.schedule_id;
					var latitude = data.latitude;
					var longitude = data.longitude;
					var planner_id = data.planner_id;
					var content = "";
					if(schedule_type_id == 4) {
						if(budget == "") {
							content += "<div>";
							content += "	<span class='order'>" + schedule_order + ".</span>";
							content += "    <span class='content'>" + schedule_content + "</span>";
							content += "	<span class='order-control'>&nbsp;&nbsp;<i class='fas fa-bars'></i></span>";
							content += "    <span class='delete-btn' id=" + schedule_id + " onclick='deleteSchedule(this)'><i class='far fa-trash-alt'></i></span>";
							content += "</div>";
							var curr = $("#" + schedule_date).children(".budget-area").children(".budget-total").text();
							var next = parseInt(curr);
						} else {
							content += "<div>";
							content += "	<span class='order'>" + schedule_order + ".</span>";
							content += "    <span class='content'>" + schedule_content + "</span>";
							content += "	<span class='budget'>(" + budget + "₩)</span>";
							content += "	<span class='order-control'>&nbsp;&nbsp;<i class='fas fa-bars'></i></span>";
							content += "    <span class='delete-btn' id=" + schedule_id + " onclick='deleteSchedule(this)'><i class='far fa-trash-alt'></i></span>";
							content += "</div>";
							var curr = $("#" + schedule_date).children(".budget-area").children(".budget-total").text();
							var next = parseInt(curr) + parseInt(budget);
						}
					} else{
						if(budget == "") {
							content += "<div>";
							content += "    <span class='content'>" + schedule_content + "</span>";
							content += "    <span class='delete-btn' id=" + schedule_id + " onclick='deleteSchedule(this)'><i class='far fa-trash-alt'></i></span>";
							content += "</div>";
							var curr = $("#" + schedule_date).children(".budget-area").children(".budget-total").text();
							var next = parseInt(curr);
						} else {
							content += "<div>";
							content += "    <span class='content'>" + schedule_content + "</span>";
							content += "	<span class='budget'>(" + budget + "₩)</span>";
							content += "    <span class='delete-btn' id=" + schedule_id + " onclick='deleteSchedule(this)'><i class='far fa-trash-alt'></i></span>";
							content += "</div>";
							var curr = $("#" + schedule_date).children(".budget-area").children(".budget-total").text();
							var next = parseInt(curr) + parseInt(budget);
						}
					}
					
					switch(schedule_type_id) {
						case "1" :
							$("#" + schedule_date).children(".city-area").children("a.insert-btn").before(content);
							break
						case "2" :
							$("#" + schedule_date).children(".hotel-area").children("a.insert-btn").before(content);
							$("#" + schedule_date).children(".budget-area").children(".budget-total").html(next);
							break
						case "3" :
							$("#" + schedule_date).children(".vehicle-area").children("a.insert-btn").before(content);
							$("#" + schedule_date).children(".budget-area").children(".budget-total").html(next);
							break
						case "4" :
							$("#" + schedule_date).children(".schedule-area").children("a.insert-btn").before(content);
							$("#" + schedule_date).children(".budget-area").children(".budget-total").html(next);
							break
						case "5" :
							content = "";
							content += "<div>";
							content += "    <span class='content'>" + schedule_content + "</span>";
							content += "	<span class='latitude' style='display:none'>" + latitude + "</span>";
							content += "	<span class='longitude' style='display:none'>" + longitude + "</span>";
							content += "	<span class='this_planner_id' style='display:none'>" + planner_id + "</span>";
							content += "    <span class='delete-btn' id=" + schedule_id + " onclick='deleteSchedule(this)'><i class='far fa-trash-alt'></i></span>";
							content += "</div>";
							$("#" + schedule_date).children(".country-area").children("a.insert-btn").before(content);
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
			if($(".insert-area")) {
				remove($(".insert-cancel-btn"));
			}
			var date = $(this).parent().parent().attr("id");
			var schedule_type  = $(this).parent().attr("class");
			var schedule_type_id;
			var planner_id = $(this).parent().parent().children(".country-area").children("div").children(".this_planner_id").text();
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
			insertForm += "<div class='insert-box' style='display:none'>";
			insertForm += "<form>";
			insertForm += "<p style='font-family:yg-jalnan'>일정 추가하기</p>";
			insertForm += "<div class='input'>";
			insertForm += "<input type='hidden' name = 'planner_id' value='${planner_id}' />";
			insertForm += "<input type='hidden' name = 'schedule_date' value='" + date + "' />";
			insertForm += "<input type='hidden' name = 'schedule_type_id' value='" + schedule_type_id + "' />";
			insertForm += "<input type='hidden' name = 'schedule_content' id='input-content' />";
			insertForm += "<input type='hidden' name = 'latitude' id='latitude' />";
			insertForm += "<input type='hidden' name = 'longitude' id='longitude' />";
			insertForm += "<label for='search-area'>일정 검색</label>";
			insertForm += "<input id='search-area' type='text' placeholder='일정을 검색하세요.' />";
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
			insertForm += "<div id='map'></div>";
			insertForm += "</td>";
			insertForm += "</tr>";
			
			$(this).parent().parent().after(insertForm);
			$(this).parent().parent().parent().children('.insert-area').children('td').children('div').slideDown(400);
			$(this).parent().parent().parent().children('.insert-area').children('td').children('div.insert-box').css("display", "inline-block");
			//center 설정
			var latitude = $(this).parent().parent().children(".country-area").children("div").children(".latitude").text();
			var longitude = $(this).parent().parent().children(".country-area").children("div").children(".longitude").text();
			var country = {
				lat: parseFloat(latitude),
				lng: parseFloat(longitude)
			};
			//google map 시작
			initMap(country);
			
		})
		// GoogleMap
		function initMap(country) {
	        var map = new google.maps.Map(document.getElementById('map'), {
	          center: country,
	          zoom: 5
	        });
	
	        var input = document.getElementById('search-area');
	
	        var autocomplete = new google.maps.places.Autocomplete(input);
	        autocomplete.bindTo('bounds', map);
	
	        var infowindow = new google.maps.InfoWindow();
	        var marker = new google.maps.Marker({
	          map: map,
	          anchorPoint: new google.maps.Point(0, -29)
	        });
	
	        autocomplete.addListener('place_changed', function () {
	          infowindow.close();
	          marker.setVisible(false);
	          var place = autocomplete.getPlace();
	
	          if (place.geometry.viewport) {
	            map.fitBounds(place.geometry.viewport);
	          } else {
	            map.setCenter(place.geometry.location);
	            map.setZoom(17);
	          }
	          
	          marker.setIcon(({
	            url: place.icon,
	            size: new google.maps.Size(71, 71),
	            origin: new google.maps.Point(0, 0),
	            anchor: new google.maps.Point(17, 34),
	            scaledSize: new google.maps.Size(35, 35)
	          }));
	          marker.setPosition(place.geometry.location);
	          marker.setVisible(true);
	
	          var address = '';
	          if (place.address_components) {
	            address = [
	              (place.address_components[0] && place.address_components[0].short_name || ''),
	              (place.address_components[1] && place.address_components[1].short_name || ''),
	              (place.address_components[2] && place.address_components[2].short_name || ''),
	            ].join(' ');
	          }
	
	          infowindow.setContent('<div><strong>' + place.name + '</strong><br>' + address);
	          infowindow.open(map, marker);
	          
	          $("#latitude").val(place.geometry.location.lat());
	          $("#longitude").val(place.geometry.location.lng());
	          $("#input-content").val(place.name);
	          
	          console.log("위도: " + $("#latitude").val());
	          console.log("경도: " + $("#longitude").val());
	          console.log("장소 이름: " + $("#input-content").val());
	        });
	      }
		
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
	});
</script>
<!-- google Map API -->
<script src="https://maps.googleapis.com/maps/api/js?libraries=places&key=AIzaSyDK3h87HvHsFJIOBZ7Vuo-9V6lqognoY2M&callback=initMap"></script>
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
		<div class="col-md-12">
			<div class="date-btn">
				<c:forEach var="date" items="${dateList }">
					<button class="btn btn-secondary btn-lg" onclick="moveTo('${date}')">
						${date}
					</button>
				</c:forEach>
			</div>
		</div>
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
											<span class='latitude' style='display:none'>${country.latitude }</span>
											<span class='longitude' style='display:none'>${country.longitude }</span>
											<span class='this_planner_id' style='display:none'>${country.planner_id }</span>
											<span class="delete-btn" id="${country.schedule_id }" onclick="deleteSchedule(this)"><i class="far fa-trash-alt"></i></span>
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
											<span class="delete-btn" id="${city.schedule_id }" onclick="deleteSchedule(this)"><i class="far fa-trash-alt"></i></span>
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
											<span class="delete-btn" id="${vehicle.schedule_id }" onclick="deleteSchedule(this)"><i class="far fa-trash-alt"></i></span>
										</div>
									</c:if>
								</c:forEach>
								<a class="insert-btn" href="#">추가하기</a>
							</td>
							<td class="schedule-area">
								<c:forEach var="schedule" items="${scheduleList }">
									<c:if test="${schedule.schedule_date eq date }">
										<div>
											<span class="order">${schedule.schedule_order}. </span><span class="content">${schedule.schedule_content }</span>
											<c:if test="${schedule.budget ne 0 }"><span class="budget">(${schedule.budget }₩)</span></c:if>
											<span class='order-control'>&nbsp;&nbsp;<i class="fas fa-bars"></i></span>
											<span class="delete-btn" id="${schedule.schedule_id }" onclick="deleteSchedule(this)"><i class="far fa-trash-alt"></i></span>
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
											<span class="delete-btn" id="${hotel.schedule_id }" onclick="deleteSchedule(this)"><i class="far fa-trash-alt"></i></span>
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
</html>