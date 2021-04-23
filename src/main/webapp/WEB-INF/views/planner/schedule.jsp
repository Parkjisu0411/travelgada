<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<link rel="stylesheet" href="${contextPath}/resources/css/utils.css">
<!-- slick -->
<link rel="stylesheet" type="text/css" href="/resources/slick/slick.css"/>
<link rel="stylesheet" type="text/css" href="/resources/slick/slick-theme.css"/>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript" src="/resources/slick/slick.min.js"></script>
<!-- jquery UI -->
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js" type="text/javascript"></script>
<meta charset="UTF-8">
<title>Schedule</title>
<style>
	.insert-cancel-btn {
		float: right;
		color: #1dcad3;
		font-size: 24px;
	}
	
	.insert-cancel-btn:hover {
		cursor: pointer;
		color: #189fa6;
	}

	.gada-btn-group {
		text-align: right;
	}
	
	.input {
		padding-left: 40px;
		font-family: 'GongGothicMedium';
	}
	
	.input input {
		margin-left: 15px;
		border-radius: 5px;
		border: none;
		background-color: white;
		margin: 5px;
		width: 200px;
	}
	
	.input input:focus {
		outline: none;
		border: 2px solid #1dcad3;
	}
	
	.budget {
		color: grey;
		font-size: 16px;
	}
	
	.order-control {
		display: inline-block;
		float: right;
		color: #A2A2A2;
	}
	
	.date-btn {
		height: 50px !important;
		margin: 10px;
		border: solid 1px;
		font-family: 'GongGothicMedium';
		color: white;
		font-size: 18px;
		background-color: #1dcad3;
		border-radius: 15px;
	}
	
	.date-btn:hover {
		background-color: #189fa6;
		border: none;
	}
	
	.delete-btn {
		display: none;
		float: right;
		color: #A2A2A2;
	}
	
	.delete-btn:hover {
		cursor: pointer;
	}
	
	.input-budget-after {
		color: #1dcad3;
		display: none;
		font-size: 0.8em;
		opacity: 0.8;
	}
	
	.input-budget-area {
		width: 70px;
		border: none;
		border-bottom: 2px solid gray;
	}
	
	#map {
	  width: 450px;
	  height: 300px;
	  overflow: hidden;
	  margin: auto;
	  margin-bottom: 10px;
	  border-radius: 10px;
	}
	
	.ui-state-highlight{
	  width:200px;
	  height: 2px;
	  background-color:grey;
	}
	
	.table td {
		position: relative;
		font-size: 18px;
	}
	
	.insert-btn {
		text-align: center;
		color: #1dcad3;
		position: absolute;
		bottom: 3%;
		right: 50%;
	}
	
	.insert-btn:hover {
		cursor: pointer;
	}
	
	.table thead th {
		border-top: 2px solid #1dcad3 !important;
		border-bottom: 2px solid #1dcad3 !important;
	}
	
	.table {
		font-family: 'IBMPlexSansKR-Light';
		font-weight: bold;
		text-align: center;
	}
	
	.table-schedule-hr {
		font-family: 'GongGothicLight';
		font-size: 20px;
	}
	
	.date-area-country {
		font-size: 20px;
		color: #CFD2D3;
		font-family: 'GongGothicMedium';
	}
	
	.date-area-date {
		font-size: 20px;
		color: #1dcad3;
		font-family: 'GongGothicMedium';
	}
	
	.date-area-day {
		font-size: 24px;
		color: #FF7472;
		font-family: 'GongGothicMedium';
	}
	
	.schedule-area {
		text-align: left;
	}
	
	.budget-area {
		font-size: 20px;
		text-align: right;
		vertical-align: middle !important;
	}
	
	.city-area {
		text-align: center;
	}
	
	.vehicle-area {
		text-align: left;
	}
	
	.hotel-area {
		text-align: left;
	}
	
	h1 {
		margin-left: 30px;
	}
	
	.introduction{
		font-family: 'GongGothicMedium';
		color: #CFD2D3;
		font-size: 24px;
	}
	
	.bar{
		color: #b4b5b4;
		font-size:20pt;
		font-weight:bold;
		margin-left: 30px;
	}
	
	.planner-area {
		font-family: 'GongGothicMedium';
	}
	
	.insert-schedule-form {
		padding: 10px;
		width: 570px;
		height: 490px;
		position: absolute;
		top: 3%;
		left: 100%;
		background-color: #f5f5f5;
		border-radius: 10px;
		text-align: left;
		z-index: 1;
		animation: slit-in-vertical 0.45s ease-out both;
	}
	@keyframes slit-in-vertical {
	  0% {
	    -webkit-transform: translateZ(-800px) rotateY(90deg);
	            transform: translateZ(-800px) rotateY(90deg);
	    opacity: 0;
	  }
	  54% {
	    -webkit-transform: translateZ(-160px) rotateY(87deg);
	            transform: translateZ(-160px) rotateY(87deg);
	    opacity: 1;
	  }
	  100% {
	    -webkit-transform: translateZ(0) rotateY(0);
	            transform: translateZ(0) rotateY(0);
	  }
	}
	@keyframes slit-out-vertical {
	  0% {
	    -webkit-transform: translateZ(0) rotateY(0);
	            transform: translateZ(0) rotateY(0);
	    opacity: 1;
	  }
	  54% {
	    -webkit-transform: translateZ(-160px) rotateY(87deg);
	            transform: translateZ(-160px) rotateY(87deg);
	    opacity: 1;
	  }
	  100% {
	    -webkit-transform: translateZ(-800px) rotateY(90deg);
	            transform: translateZ(-800px) rotateY(90deg);
	    opacity: 0;
	  }
	}
	
	
</style>
<script type="text/javascript">
	function sleep(ms) {
	  return new Promise(resolve=>setTimeout(resolve, ms));
	}

	//예산 추가/수정
	function inputBudget(obj) {
		$(obj).html("<input class='input-budget-area' type='number' name='input-budget-area'>₩</input>");
		$(obj).children(".input-budget-area").focus();
		$(obj).children(".input-budget-area").blur(function() {
			if(!$(obj).children(".input-budget-area").val()) {
				$(obj).html("예산 추가하기");				
			}
		});
		$(obj).children(".input-budget-area").keydown(function(key) {
			if(key.keyCode == 13) {
				data = {
					budget : $(obj).children(".input-budget-area").val(),
					schedule_id : $(obj).siblings(".delete-btn").attr("id")
				};
				$.ajax({
					type : "PUT",
					url : "/planner/schedule",
					data : JSON.stringify(data),
					contentType : "application/json",
					cache : false,
					beforeSend : function(xhr){
		  	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
					},
					success : function(result) {
						var now = $(obj).parent().parent().parent().children('.budget-area').children('.budget-total').text();
						var budgetObj = $(obj).parent().parent().parent().children(".budget-area").children(".budget-total");
						if(!$(obj).children(".input-budget-area").val()) {
							$(obj).html("<i class='fas fa-plus'></i>");		
						} else {
							$(obj).replaceWith($("<span class='budget' onclick='modifyBudget(this)'>(" + $(obj).children(".input-budget-area").val() + "₩)</span>"));
							var plus = $(obj).children(".input-budget-area").val();
							var total = parseInt(now) + parseInt(plus);
							budgetObj.html(total);
						}
					},
					error : function(e) {
						console.log(e);
						alert("에러가 발생했습니다.");
					}
				});
			}
		});
	}
	
	function modifyBudget(obj) {
		var nowHtml = $(obj).text();
		var now = $(obj).text().substr(1, $(obj).text().length - 3);
		console.log(now);
		$(obj).html("<input class='input-budget-area' type='number' name='input-budget-area' value='" + now + "'>₩</input>");
		$(obj).children(".input-budget-area").focus();
		$(obj).children(".input-budget-area").blur(function() {
			$(obj).html(nowHtml);
		})
		$(obj).children(".input-budget-area").keydown(function(key) {
			if(key.keyCode == 13) {
				var next = $(obj).children(".input-budget-area").val();
				data = {
					budget : next,
					schedule_id : $(obj).siblings(".delete-btn").attr("id")
				};
				$.ajax({
					type : "PUT",
					url : "/planner/schedule",
					data : JSON.stringify(data),
					contentType : "application/json",
					cache : false,
					beforeSend : function(xhr){
		  	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
					},
					success : function(result) {
						var total = $(obj).parent().parent().parent().children('.budget-area').children('.budget-total').text();
						var budgetObj = $(obj).parent().parent().parent().children(".budget-area").children(".budget-total");
						if(!next) {
							$(obj).replaceWith($("<span class='input-budget-after' onclick='inputBudget(this)'>예산 추가하기</span>"));
							var total = parseInt(total) - parseInt(now);
							budgetObj.html(total);
						} else {
							$(obj).html(nowHtml);
							$(obj).text("(" + next + "₩)");
							var total = parseInt(total) - parseInt(now) + parseInt(next);
							budgetObj.html(total);
						}
					},
					error : function(e) {
						console.log(e);
						alert("에러가 발생했습니다.");
					}
				});
			}
		});
	}
	//
	//일정 순서 재정렬
	function reOrder(date) {
		var size = $("#" + date + " .order").size();
		for(var i = 0; i < size; i++) {
			$("#" + date + " .order").eq(i).html(i+1 + ". ");
		}
	}
	
	function reOrderDB(date) {
		var size = $("#" + date + " .order").size();
		for(var i = 0; i < size; i++) {
			var index = i + 1;
			var data = {
				schedule_order : index,
				schedule_id : $("#" + date + " .schedule-area .delete-btn").eq(i).attr('id'),
				budget : -1
			};
			
			$.ajax({
				type : "PUT",
				url : "/planner/schedule",
				data : JSON.stringify(data),
				contentType : "application/json",
				cache : false,
				beforeSend : function(xhr){
	  	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				},
				success : function(result) {
					console.log(result);
				},
				error : function(e) {
					console.log(e);
				}
			})
		}
	}
	//
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
		$("html, body").animate({scrollTop : offset.top - 82}, 400);
	}
	//
	//일정 추가 테이블 삭제
	function remove(obj) {
		$(obj).parent().parent().parent().slideUp(400);
		$("#map").slideUp(400);
		setTimeout(function() {
				$(obj).parent().parent().parent().parent().parent().delay(500).remove();
			}, 350);
	}
	//
	//delete function
	function deleteSchedule(obj) {
		console.log("delete");
		
		var date = $(obj).parent().parent().parent().attr("id");
		var schedule = $(obj).parent();
		var budget = $(obj).parent().parent().parent().children('.budget-area').children('.budget-total');
		var now = $(obj).siblings('.budget').text().substr(1, $(obj).siblings('.budget').text().length-3);
		var total = $(obj).parent().parent().parent().children('.budget-area').children('.budget-total').text();
		var schedule_type = $(obj).parent().parent().attr('class');
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
				schedule.remove();
				budget.html(next);
				if(schedule_type == 'schedule-area ui-sortable') {
					reOrder(date);
					reOrderDB(date);
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
	function submitForm() {
		
		var formData = $("#insert-schedule-form").serializeObject();
		var jsonForm = JSON.stringify(formData);
		console.log(formData);
		
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
					
					switch(schedule_type_id) {
						case "1" :
							content += "<div>";
							content += "    <span class='content'>" + schedule_content + "</span>";
							content += "    <span class='delete-btn' id=" + schedule_id + " onclick='deleteSchedule(this)'><i class='far fa-trash-alt'></i></span>";
							content += "</div>";
							$("#" + schedule_date).children(".city-area").children("div.insert-btn").before(content);
							break
						case "2" :
							if(budget == "") {
								content += "<div>";
								content += "    <span class='content'>" + schedule_content + "</span>";
								content += "	<span class='input-budget-after' onclick='inputBudget(this)'>예산 추가하기</i></span>";
								content += "    <span class='delete-btn' id=" + schedule_id + " onclick='deleteSchedule(this)'><i class='far fa-trash-alt'></i></span>";
								content += "</div>";
								var curr = $("#" + schedule_date).children(".budget-area").children(".budget-total").text();
								var next = parseInt(curr);
							} else {
								content += "<div>";
								content += "    <span class='content'>" + schedule_content + "</span>";
								content += "	<span class='budget' onclick='modifyBudget(this)'>(" + budget + "₩)</span>";
								content += "    <span class='delete-btn' id=" + schedule_id + " onclick='deleteSchedule(this)'><i class='far fa-trash-alt'></i></span>";
								content += "</div>";
								var curr = $("#" + schedule_date).children(".budget-area").children(".budget-total").text();
								var next = parseInt(curr) + parseInt(budget);
							}
							$("#" + schedule_date).children(".hotel-area").children("div.insert-btn").before(content);
							$("#" + schedule_date).children(".budget-area").children(".budget-total").html(next);
							break
						case "3" :
							if(budget == "") {
								content += "<div>";
								content += "    <span class='content'>" + schedule_content + "</span>";
								content += "	<span class='input-budget-after' onclick='inputBudget(this)'>예산 추가하기</span>";
								content += "    <span class='delete-btn' id=" + schedule_id + " onclick='deleteSchedule(this)'><i class='far fa-trash-alt'></i></span>";
								content += "</div>";
								var curr = $("#" + schedule_date).children(".budget-area").children(".budget-total").text();
								var next = parseInt(curr);
							} else {
								content += "<div>";
								content += "    <span class='content'>" + schedule_content + "</span>";
								content += "	<span class='budget' onclick='modifyBudget(this)'>(" + budget + "₩)</span>";
								content += "    <span class='delete-btn' id=" + schedule_id + " onclick='deleteSchedule(this)'><i class='far fa-trash-alt'></i></span>";
								content += "</div>";
								var curr = $("#" + schedule_date).children(".budget-area").children(".budget-total").text();
								var next = parseInt(curr) + parseInt(budget);
							}
							$("#" + schedule_date).children(".vehicle-area").children("div.insert-btn").before(content);
							$("#" + schedule_date).children(".budget-area").children(".budget-total").html(next);
							break
						case "4" :
							if(budget == "") {
								content += "<div>";
								content += "	<span class='order'>" + schedule_order + ".</span>";
								content += "    <span class='content'>" + schedule_content + "</span>";
								content += "	<span class='input-budget-after' onclick='inputBudget(this)'>예산 추가하기</span>";
								content += "	<span class='order-control'>&nbsp;&nbsp;<i class='fas fa-bars'></i></span>";
								content += "    <span class='delete-btn' id=" + schedule_id + " onclick='deleteSchedule(this)'><i class='far fa-trash-alt'></i></span>";
								content += "</div>";
								var curr = $("#" + schedule_date).children(".budget-area").children(".budget-total").text();
								var next = parseInt(curr);
							} else {
								content += "<div>";
								content += "	<span class='order'>" + schedule_order + ".</span>";
								content += "    <span class='content'>" + schedule_content + "</span>";
								content += "	<span class='budget' onclick='modifyBudget(this)'>(" + budget + "₩)</span>";
								content += "	<span class='order-control'>&nbsp;&nbsp;<i class='fas fa-bars'></i></span>";
								content += "    <span class='delete-btn' id=" + schedule_id + " onclick='deleteSchedule(this)'><i class='far fa-trash-alt'></i></span>";
								content += "</div>";
								var curr = $("#" + schedule_date).children(".budget-area").children(".budget-total").text();
								var next = parseInt(curr) + parseInt(budget);
							}
							$("#" + schedule_date).children(".schedule-area").children("div.insert-btn").before(content);
							$("#" + schedule_date).children(".budget-area").children(".budget-total").html(next);
							break
						case "5" :
							content += "<div>";
							content += "    <span class='content'>" + schedule_content + "</span>";
							content += "	<span class='latitude' style='display:none'>" + latitude + "</span>";
							content += "	<span class='longitude' style='display:none'>" + longitude + "</span>";
							content += "	<span class='this_planner_id' style='display:none'>" + planner_id + "</span>";
							content += "    <span class='delete-btn' id=" + schedule_id + " onclick='deleteSchedule(this)'><i class='far fa-trash-alt'></i></span>";
							content += "</div>";
							$("#" + schedule_date).children(".country-area").children("div.insert-btn").before(content);
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
	// schedule type to schedule tyep id
	function getScheduleTypeId(schedule_type) {
		if(schedule_type == "country") {
			return 5;
		} else if(schedule_type == "city") {
			return 1;
		}  else if(schedule_type == "vehicle") {
			return 3;
		}  else if(schedule_type == "schedule") {
			return 4;
		}  else if(schedule_type == "hotel") {
			return 2;
		}
	}
	//
	//
	function parseKOR(schedule_type) {
		if(schedule_type == "country") {
			return "국가";
		} else if(schedule_type == "city") {
			return "도시";
		}  else if(schedule_type == "vehicle") {
			return "교통";
		}  else if(schedule_type == "schedule") {
			return "일정";
		}  else if(schedule_type == "hotel") {
			return "숙소";
		}
	}
	//
	// 
	function cancel() {
		$(".insert-schedule-form").css("animation", "slit-out-vertical 0.45s ease-in both");
		setTimeout(function() {
			$(".insert-schedule-form").delay(500).remove();
		}, 350);
	}
	//
	// insert schedule function
	async function insertSchedule(schedule_type, date, day) {
		if($(".insert-schedule-form").length) {
			cancel();
			await sleep(500);
		}
		var schedule_type_id = getScheduleTypeId(schedule_type);
		var type = parseKOR(schedule_type);
		var area = schedule_type + "-area";
		var insertForm = "";
		insertForm += "<div class='insert-schedule-form'>";
		insertForm += "<span class='date-area-day'>DAY " + day + "</span>";
		insertForm += "<div class='insert-cancel-btn' onclick='cancel()'><i class='fas fa-times'></i></div>";
		insertForm += "<div id='map'></div>"
		insertForm += "<form id='insert-schedule-form'>";
		insertForm += "<div class='input'>";
		insertForm += "<input type='hidden' name = 'planner_id' value='${planner_id}' />";
		insertForm += "<input type='hidden' name = 'schedule_date' value='" + date + "' />";
		insertForm += "<input type='hidden' name = 'schedule_type_id' value='" + schedule_type_id + "' />";
		insertForm += "<input type='hidden' name = 'latitude' id='latitude' />";
		insertForm += "<input type='hidden' name = 'longitude' id='longitude' />";
		insertForm += "<input type='hidden' name = 'schedule_content' id='input-content' />";
		insertForm += "<input id='search-area' class='form-control'  type='text' placeholder='" + type + " 입력하기.' />";
		insertForm += "</div>";
		if(schedule_type != 'city') {
			insertForm += "<div class='input'>";
			insertForm += "<input id='input-budget' class='form-control' type='number' placeholder='예산 입력하기.' name='budget'/>";
			insertForm += "</div>";
		} else {
			insertForm += "<div class='input'>";
			insertForm += "<input id='input-budget' class='form-control' readonly='readonly' type='number' placeholder='예산 입력하기.' name='budget'/>";
			insertForm += "</div>";
		}
		insertForm += "<div class='gada-btn-group'>";
		insertForm += "<button type='button' class='btn gada-btn' onclick='submitForm()'>저장하기</button>";
		insertForm += "</div>";
		insertForm += "</form>";
		insertForm += "</div>";
		
		
		$("#" + date + " ." + area).append(insertForm);
		if(schedule_type == 'hotel') {
			$(".insert-schedule-form").css("left", 0);
			$(".insert-schedule-form").css("top", 100);
		}
		
		var latitude = $("#" + date + " .latitude").text();
		var longitude = $("#" + date + " .longitude").text();
		var country = {
			lat: parseFloat(latitude),
			lng: parseFloat(longitude)
		};
		//google map 시작
		initMap(country);
		
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
		
	}
	//
	$(document).ready(function () {
		//slick
		$('.date-group').slick({
			slide: 'button',
			arrows: true,
			infinite: false,
			slidesToShow: 4,
			slidesToScroll: 4,
			prevArrow : "<img src='/resources/prev2.png' class='slick-prev'/>",      // 이전 화살표 모양 설정
            nextArrow : "<img src='/resources/next2.png' class='slick-next'/>",      // 다음 화살표 모양 설정
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
		
		//드래그 앤 드롭으로 일정 순서 변경하기
		$(".schedule-area").sortable({
			axis : 'y',
			opacity : 0.7,
			placeholder: "ui-state-highlight",
			handle: ".order-control",
	        stop: function (event, ui) {
	        	var date = $(this).parent().attr("id");
	        	reOrder(date);
	        	reOrderDB(date);
	        }
		});
		
		//hover event
		$(".order-control").hover(function() {
			$(this).parent().css("color", "#1dcad3");
			$(this).css("cursor", "pointer");
		}, function() {
			$(this).parent().css("color", "black");
		})
		//
		
	});
	
	$(document).on("hover", ".content-box", function() {
		$(".content-box").hover(function() {
			$(this).children(".input-budget-after").css("display","inline");
			$(this).children(".delete-btn").css("display", "inline-block");
		}, function() {
			$(this).children(".input-budget-after").css("display", "none");
			$(this).children(".delete-btn").css("display", "none");
		})
	});
</script>
<!-- google Map API -->
<script src="https://maps.googleapis.com/maps/api/js?libraries=places&key=AIzaSyDK3h87HvHsFJIOBZ7Vuo-9V6lqognoY2M&callback=initMap"></script>
</head>
<body>

	<!-- Header -->
	<%@ include file="/WEB-INF/views/includes/header.jsp"%>
	
	<div class="container-fluid gada-headline">
		<!-- headline -->
		<h1>Schedule</h1>
		<span class="bar">|</span><span class="introduction"> 가다와 함께 여행을 계획해 보세요!</span><br /><br />
	</div>
	<div class="container-fluid">
		<hr>
		<!-- date button -->
		<div class="col-md-12">
			<div class="date-group">
				<c:forEach var="date" items="${dateList }">
					<button class="btn btn-secondary btn-lg date-btn" onclick="moveTo('${date}')">
						${date}
					</button>
				</c:forEach>
			</div>
		</div>
		<!-- end date button -->
		<!-- schedule table -->
		<div class="col-md-12">
			<div class="planner-area">
				<table class="table" id="table-schedule">
					<colgroup>
						<col width="10%" />
						<col width="10%" />
						<col width="15%" />
						<col width="25%" />
						<col width="20%" />
						<col width="10%" />
					</colgroup>
					<thead>
						<tr class="table-schedule-hr">
							<th><i class="far fa-calendar-alt"></i> 날짜</th>
							<th><i class="fas fa-city"></i> 도시</th>
							<th><i class="fas fa-bus"></i> 교통</th>
							<th><i class="fas fa-map-marked"></i> 일정</th>
							<th><i class="fas fa-bed"></i> 숙소</th>
							<th><i class="fas fa-money-check-alt"></i> 비용</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="date" items="${dateList}" varStatus="idx">
							<tr id="${date }">
								<td class="date-area">
									<p class="date-area-date">${date}</p>
									<p class="date-area-day">DAY &nbsp;${idx.count }</p>
									<c:forEach var="country" items="${countryList }">
										<c:if test="${country.schedule_date eq date}">											
											<p class="date-area-country">${country.schedule_content }</p>
											<span class='latitude' style='display:none'>${country.latitude }</span>
											<span class='longitude' style='display:none'>${country.longitude }</span>
											<span class='this_planner_id' style='display:none'>${country.planner_id }</span>
										</c:if>
									</c:forEach>
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
									<div class="insert-btn" onclick="insertSchedule('city', '${date}', '${idx.count }')"><i class="fas fa-plus-circle"></i></div>
								</td>
								<td class="vehicle-area">
									<c:forEach var="vehicle" items="${vehicleList }">
										<c:if test="${vehicle.schedule_date eq date }">
											<div class="content-box">
												<span class="content">${vehicle.schedule_content }</span>
												<c:if test="${vehicle.budget ne 0 }"><span class="budget" onclick="modifyBudget(this)">(${vehicle.budget }₩)</span></c:if>
												<c:if test="${vehicle.budget eq 0 }"><span class="input-budget-after" onclick="inputBudget(this)">예산 추가하기</span></c:if>
												<span class="delete-btn" id="${vehicle.schedule_id }" onclick="deleteSchedule(this)"><i class="far fa-trash-alt"></i></span>
											</div>
										</c:if>
									</c:forEach>
									<div class="insert-btn" onclick="insertSchedule('vehicle', '${date}', '${idx.count }')"><i class="fas fa-plus-circle"></i></div>
								</td>
								<td class="schedule-area">
									<c:forEach var="schedule" items="${scheduleList }">
										<c:if test="${schedule.schedule_date eq date }">
											<div class="sortable-order content-box">
												<span class="order">${schedule.schedule_order}. </span><span class="content">${schedule.schedule_content }</span>
												<c:if test="${schedule.budget ne 0 }"><span class="budget" onclick="modifyBudget(this)">(${schedule.budget }₩)</span></c:if>
												<c:if test="${schedule.budget eq 0 }"><span class="input-budget-after" onclick="inputBudget(this)">예산 추가하기</span></c:if>
												<span class='order-control'>&nbsp;&nbsp;<i class="fas fa-bars"></i></span>
												<span class="delete-btn" id="${schedule.schedule_id }" onclick="deleteSchedule(this)"><i class="far fa-trash-alt"></i></span>
											</div>
										</c:if>
									</c:forEach>
									<div class="insert-btn ui-state-disabled" onclick="insertSchedule('schedule', '${date}', '${idx.count }')"><i class="fas fa-plus-circle"></i></div>
								</td>
								<td class="hotel-area">
									<c:forEach var="hotel" items="${hotelList }">
										<c:if test="${hotel.schedule_date eq date }">
											<div class="content-box">
												<span class="content">${hotel.schedule_content }</span>
												<c:if test="${hotel.budget ne 0 }"><span class="budget" onclick="modifyBudget(this)">(${hotel.budget }₩)</span></c:if>
												<c:if test="${hotel.budget eq 0 }"><span class="input-budget-after" onclick="inputBudget(this)">예산 추가하기</span></c:if>
												<span class="delete-btn" id="${hotel.schedule_id }" onclick="deleteSchedule(this)"><i class="far fa-trash-alt"></i></span>
											</div>
										</c:if>
									</c:forEach>
									<div class="insert-btn" onclick="insertSchedule('hotel', '${date}', '${idx.count }')"><i class="fas fa-plus-circle"></i></div>
								</td>
								<td class="budget-area">
									<span class="budget-total"><c:out value="${dayBudget[date] }"></c:out></span>
									<span>₩</span>
								</td>
							</tr>
						</c:forEach>
						<tr class="insert-date-area">
							<td colspan="7">
								<a onclick="" class="btn gada-btn-reverse">날짜 추가하기</a>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	
	<!-- Footer -->
	<%@ include file="/WEB-INF/views/includes/footer.jsp"%>
</body>
</html>