<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script>
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
	$(".insert-btn").click(async function(e) {
		e.preventDefault();
		if($(".insert-area").length) {
			remove($(".insert-cancel-btn"));
			await sleep(500);
		}
		var date = $(this).parent().parent().attr("id");
		var schedule_type  = $(this).parent().attr("class");
		console.log(schedule_type);
		var schedule_type_id;
		var planner_id = $(this).parent().parent().children(".country-area").children("div").children(".this_planner_id").text();
		if(schedule_type == "country-area") {
			schedule_type_id = 5;
		} else if(schedule_type == "city-area") {
			schedule_type_id = 1;
		}  else if(schedule_type == "vehicle-area") {
			schedule_type_id = 3;
		}  else if(schedule_type == "schedule-area ui-sortable") {
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
			url : "/planner/schedule/callback?planner_id=" + planner_id,
			cache : false,
			dataType : "html",
			success : function(result) {
				$("body > div.container").html(result);
			},
			error : function(e) {
				console.log(e);
				alert("에러가 발생했습니다.");
			}
		});
	})
	//드래그 앤 드롭으로 일정 순서 변경하기
	$(".schedule-area").sortable({
		axis : 'y',
		opacity : 0.7,
		placeholder: "ui-state-highlight",
		handle: ".order-control",
        stop: function (event, ui) {
        	console.log(this);
        	reOrder(this);
        	reOrderDB(this);
        }
	});
	//
	//hover event
	$(".content-box").hover(function() {
		$(this).children(".input-budget-after").css("display","inline");
	}, function() {
		$(this).children(".input-budget-after").css("display", "none");
	})
	//
	
});
</script>
</head>
<body>
	
		<!-- headline -->
		<h2 class="headline" style="font-family: 'yg-jalnan'">Schedule</h2>
		<!-- planner option -->
		<form>
				<div class="col-md-12"> 
					<select class="form-control" name="planner_id" id="select-planner" style="font-family: 'yg-jalnan'">
						<c:forEach var="planner" items="${plannerList}">
							<c:if test="${planner.planner_id eq planner_id}">
								<option value='${planner.planner_id}' style="font-family: 'yg-jalnan'" selected>
							  		${planner.planner_name}&nbsp;&nbsp; ${planner.start_date}&nbsp;&nbsp;~&nbsp;&nbsp;${planner.end_date}
								</option>
							</c:if>
							<c:if test="${planner.planner_id ne planner_id}">
								<option value='${planner.planner_id}' style="font-family: 'yg-jalnan'">
							  		${planner.planner_name}&nbsp;&nbsp; ${planner.start_date}&nbsp;&nbsp;~&nbsp;&nbsp;${planner.end_date}
								</option>
							</c:if>
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
					<col width="15%" />
					<col width="10%" />
					<col width="10%" />
					<col width="10%" />
					<col width="25%" />
					<col width="15%" />
					<col width="15%" />
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
										<div class="content-box">
											<span class="content">${country.schedule_content }</span>
											<span class='latitude' style='display:none'>${country.latitude }</span>
											<span class='longitude' style='display:none'>${country.longitude }</span>
											<span class='this_planner_id' style='display:none'>${country.planner_id }</span>
											<span class="delete-btn" id="${country.schedule_id }" onclick="deleteSchedule(this)"><i class="far fa-trash-alt"></i></span>
										</div>
									</c:if>
								</c:forEach>
								<div class="insert-btn"><i class="fas fa-plus-circle"></i></div>
							</td>
							<td class="city-area">
								<c:forEach var="city" items="${cityList }">
									<c:if test="${city.schedule_date eq date }">
										<div class="content-box">
											<span class="content">${city.schedule_content }</span>
											<span class="delete-btn" id="${city.schedule_id }" onclick="deleteSchedule(this)"><i class="far fa-trash-alt"></i></span>
										</div>
									</c:if>
								</c:forEach>
								<div class="insert-btn"><i class="fas fa-plus-circle"></i></div>
							</td>
							<td class="vehicle-area">
								<c:forEach var="vehicle" items="${vehicleList }">
									<c:if test="${vehicle.schedule_date eq date }">
										<div class="content-box">
											<span class="content">${vehicle.schedule_content }</span>
											<c:if test="${vehicle.budget ne 0 }"><span class="budget" onclick="modifyBudget(this)">(${vehicle.budget }₩)</span></c:if>
											<c:if test="${vehicle.budget eq 0 }"><span class="input-budget-after" onclick="inputBudget(this)"><i class="fas fa-plus"></i></span></c:if>
											<span class="delete-btn" id="${vehicle.schedule_id }" onclick="deleteSchedule(this)"><i class="far fa-trash-alt"></i></span>
										</div>
									</c:if>
								</c:forEach>
								<div class="insert-btn"><i class="fas fa-plus-circle"></i></div>
							</td>
							<td class="schedule-area">
								<c:forEach var="schedule" items="${scheduleList }">
									<c:if test="${schedule.schedule_date eq date }">
										<div class="sortable-order content-box">
											<span class="order">${schedule.schedule_order}. </span><span class="content">${schedule.schedule_content }</span>
											<c:if test="${schedule.budget ne 0 }"><span class="budget" onclick="modifyBudget(this)">(${schedule.budget }₩)</span></c:if>
											<c:if test="${schedule.budget eq 0 }"><span class="input-budget-after" onclick="inputBudget(this)"><i class="fas fa-plus"></i></span></c:if>
											<span class='order-control'>&nbsp;&nbsp;<i class="fas fa-bars"></i></span>
											<span class="delete-btn" id="${schedule.schedule_id }" onclick="deleteSchedule(this)"><i class="far fa-trash-alt"></i></span>
										</div>
									</c:if>
								</c:forEach>
								<div class="insert-btn ui-state-disabled"><i class="fas fa-plus-circle"></i></div>
							</td>
							<td class="hotel-area">
								<c:forEach var="hotel" items="${hotelList }">
									<c:if test="${hotel.schedule_date eq date }">
										<div class="content-box">
											<span class="content">${hotel.schedule_content }</span>
											<br />
											<c:if test="${hotel.budget ne 0 }"><span class="budget" onclick="modifyBudget(this)">(${hotel.budget }₩)</span></c:if>
											<c:if test="${hotel.budget eq 0 }"><span class="input-budget-after" onclick="inputBudget(this)"><i class="fas fa-plus"></i></span></c:if>
											<span class="delete-btn" id="${hotel.schedule_id }" onclick="deleteSchedule(this)"><i class="far fa-trash-alt"></i></span>
										</div>
									</c:if>
								</c:forEach>
								<div class="insert-btn"><i class="fas fa-plus-circle"></i></div>
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
	
</body>
</html>