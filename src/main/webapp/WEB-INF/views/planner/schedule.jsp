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
<!-- jquery UI -->
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js" type="text/javascript"></script>
<meta charset="UTF-8">
<title>Schedule</title>
<style>
.slick-arrow {
	background-color: grey;;
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

.date-btn {
	height: 50px !important;
	margin: 10px;
}

.delete-btn {
	display: inline-block;
	float: right;
	color: #A2A2A2;
}

.input-budget-after {
	color: #A2A2A2;
	display: none;
}

.input-budget-area {
	width: 70px;
	border: none;
	border-bottom: 2px solid gray;
}

#map {
  width: 300px;
  height: 300px;
  display: none;
  overflow: hidden;
  float: right;
}

.ui-state-highlight{
  width:200px;
  height: 2px;
  background-color:grey;
}

.insert-btn {
	text-align: center;
	color: #A2A2A2;
}

thead {
	text-align: center;
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
				$(obj).html("<i class='fas fa-plus'></i>");				
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
							$(obj).replaceWith($("<span class='input-budget-after' onclick='inputBudget(this)'><i class='fas fa-plus'></i></span>"));
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
		$("html, body").animate({scrollTop : offset.top - 52}, 400);
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
								content += "	<span class='input-budget-after' onclick='inputBudget(this)'><i class='fas fa-plus'></i></span>";
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
								content += "	<span class='input-budget-after' onclick='inputBudget(this)'><i class='fas fa-plus'></i></span>";
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
								content += "	<span class='input-budget-after' onclick='inputBudget(this)'><i class='fas fa-plus'></i></span>";
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
	$(document).ready(function () {
		//slick
		$('.date-group').slick({
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
	        	var date = $(this).parent().attr("id");
	        	reOrder(date);
	        	reOrderDB(date);
	        }
		});
		//
		//hover event
	/* 	$(".content-box").hover(function() {
			$(this).children(".input-budget-after").css("display","inline");
		}, function() {
			$(this).children(".input-budget-after").css("display", "none");
		}) */
		//
		
	});
	
	$(document).on("hover", ".content-box", function() {
		$(".content-box").hover(function() {
			$(this).children(".input-budget-after").css("display","inline");
		}, function() {
			$(this).children(".input-budget-after").css("display", "none");
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
			<div class="date-group">
				<c:forEach var="date" items="${dateList }">
					<button class="btn btn-secondary btn-lg date-btn" onclick="moveTo('${date}')">
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
							<td style="font-family: yg-jalnan;" class="date-area">${date}</td>
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
					<tr class="insert-date-area">
						<td colspan="7">
							<a onclick="">날짜 추가하기</a>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	
	<!-- Footer -->
	<%@ include file="/WEB-INF/views/includes/footer.jsp"%>
</body>
</html>