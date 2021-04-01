<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
  <!-- jquery -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
  
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
  <link rel="stylesheet" type="text/css" href="/resources/slick/slick.css" />
  <link rel="stylesheet" type="text/css" href="/resources/slick/slick-theme.css" />
  <script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
  <script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
  <script type="text/javascript" src="/resources/slick/slick.min.js"></script>
  <meta charset="UTF-8">
  <title>Schedule</title>
  <style>
  
    .slick-arrow {
      background-color: grey;
    }

    .content {}

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
      width: 300px;
      height: 300px;
      float: right;
      display: none; 
      overflow: hidden
    }
    
  </style>
  
  <script type="text/javascript">
    //text parsing to json object
    $.fn.serializeObject = function () {
      var o = {};
      var a = this.serializeArray();
      $.each(a, function () {
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
      $("html, body").animate({ scrollTop: offset.top - 52 }, 400);
    }
    //
    //일정 추가 테이블 삭제
    function remove(obj) {
      $(obj).parent().parent().parent().slideUp(400);
      setTimeout(function () {
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
      var now = text.substr(1, text.length - 3);
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

      if (confirm("저장하시겠습니까?")) {
        $.ajax({
          type: "POST",
          url: "/planner/schedule2",
          data: jsonForm,
          contentType: "application/json",
          cache: false,
          beforeSend: function (xhr) {
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
          },
          success: function (result) {
            remove(obj);
            switch (schedule_type_id) {
              case "1":
                $("#" + schedule_date).children(".city-area").children("a.insert-btn").before("<span>" + result + "</span><span class='delete' id='${hotel.schedule_id }' onclick='deleteSchedule()'><i class='far fa-trash-alt'></i></span><br />");
                break
              case "2":
                if (budget == 0) {
                  $("#" + schedule_date).children(".hotel-area").children("a.insert-btn").before("<span>" + result + "</span><br />");
                } else {
                  $("#" + schedule_date).children(".hotel-area").children("a.insert-btn").before("<span>" + result + "</span><span class='budget'> (" + budget + "₩)</span><br />");
                  var curr = $("#" + schedule_date).children(".budget-area").children(".budget-total").text();
                  var next = parseInt(curr) + parseInt(budget);
                  $("#" + schedule_date).children(".budget-area").children(".budget-total").html(next);
                }
                break
              case "3":
                if (budget == 0) {
                  $("#" + schedule_date).children(".vehicle-area").children("a.insert-btn").before("<span>" + result + "</span><br />");
                } else {
                  $("#" + schedule_date).children(".vehicle-area").children("a.insert-btn").before("<span>" + result + "</span><span class='budget'> (" + budget + "₩)</span><br />");
                  var curr = $("#" + schedule_date).children(".budget-area").children(".budget-total").text();
                  var next = parseInt(curr) + parseInt(budget);
                  $("#" + schedule_date).children(".budget-area").children(".budget-total").html(next);
                }
                break
              case "4":
                if (budget == 0) {
                  $("#" + schedule_date).children(".schedule-area").children("a.insert-btn").before("<span>" + result + "</span><i class='fas fa-bars'></i><br />");
                } else {
                  $("#" + schedule_date).children(".schedule-area").children("a.insert-btn").before("<span>" + result + "</span><span class='budget'> (" + budget + "₩)</span><i class='fas fa-bars'></i><br />");
                  var curr = $("#" + schedule_date).children(".budget-area").children(".budget-total").text();
                  var next = parseInt(curr) + parseInt(budget);
                  $("#" + schedule_date).children(".budget-area").children(".budget-total").html(next);
                }
                break
              case "5":
                $("#" + schedule_date).children(".country-area").children("a.insert-btn").before("<span>" + result + "</span><br />");
                break
            }
          },
          error: function (e) {
            alert("오류가 발생했습니다.");
            console.log(e);
          }
        });
      }
    }
    //
    $(document).ready(function () {
      $("#insert-country-btn").click(function (e) {
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
              slidesToShow: 3,
              slidesToScroll: 3
            }
          },
          {
            breakpoint: 768, //화면 사이즈 768px
            settings: {
              //위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
              slidesToShow: 2,
              slidesToScroll: 2
            }
          }
        ]
      });

      //추가하기 버튼 클릭 이벤트
      $(".insert-btn").click(function (e) {
        e.preventDefault();
        var date = $(this).parent().parent().attr("id");
        var schedule_type = $(this).parent().attr("class");
        var schedule_type_id;
        if (schedule_type == "country-area") {
          schedule_type_id = 5;
        } else if (schedule_type == "city-area") {
          schedule_type_id = 1;
        } else if (schedule_type == "vehicle-area") {
          schedule_type_id = 3;
        } else if (schedule_type == "schedule-area") {
          schedule_type_id = 4;
        } else if (schedule_type == "hotel-area") {
          schedule_type_id = 2;
        }
        
        var insertForm = "";
        insertForm += "<tr class='insert-area'>";
        insertForm += "<td colspan='7'>";
        insertForm += "<div style='display:inline'>";
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
        insertForm += "<div id='map'></div>";
        insertForm += "</td>";
        insertForm += "</tr>";

        $(this).parent().parent().after(insertForm);
        $(this).parent().parent().parent().children('.insert-area').children('td').children('div').slideDown(400);
        //
        initMap();
        
        function initMap() {
            var map = new google.maps.Map(document.getElementById('map'), {
              center: {lat: 36.56491, lng: 128.72389},
              zoom: 10
            });

            var input = document.getElementById('search-area');
            var options = {
                    types: ['(cities)']
            		/* componentRestrictions: {country: "국가 코드"} */
                    };
            if (schedule_type_id == 1) {
            	var autocomplete = new google.maps.places.Autocomplete(input, options);
            } else {
            	var autocomplete = new google.maps.places.Autocomplete(input);
            }
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

              infowindow.setContent('<div><strong>' + place.name + '</strong><br>' + address + '</div>');
              infowindow.open(map, marker);
            });
          }
      })
        
      //Planner-select
      $("#select-planner").on('change', function () {
        var planner_id = this.value;

        $.ajax({
          type: "GET",
          url: "/planner/schedule2?planner_id=" + planner_id,
          cache: false,
          success: function (result) {
            console.log(planner_id);
            $("tbody").remove();
            //html방식으로 return 받는 것 알아보기.
            //또는 ModelAndView 로 return 받는 것 알아보기.
          },
          error: function (e) {
            console.log(e);
            alert("에러가 발생했습니다.");
          }
        });
      })
      //
      //delete event
      $(".delete").click(function (e) {
        e.preventDefault();
        console.log("delete");
        var schedule = $(this).parent();
        var budget = $(this).parent().parent().parent().children('.budget-area').children('.budget-total');
        var text = $(this).siblings('.budget').text();
        var now = text.substr(1, text.length - 3);
        var total = $(this).parent().parent().parent().children('.budget-area').children('.budget-total').text();
        var next = parseInt(total) - parseInt(now);

        $.ajax({
          type: "DELETE",
          url: "/planner/schedule/" + $(this).attr('id'),
          cache: false,
          beforeSend: function (xhr) {
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
          },
          success: function (result) {
            console.log(result);
            schedule.remove();
            budget.html(next);
          },
          error: function (e) {
            console.log(e);
            alert("에러가 발생했습니다.");
          }
        });
      })
      //
    });
  </script>
  <script src="https://maps.googleapis.com/maps/api/js?libraries=places&key=AIzaSyDK3h87HvHsFJIOBZ7Vuo-9V6lqognoY2M&callback=initMap"></script>
</head>

<body>

  <!-- Header -->
  <%@ include file="/WEB-INF/views/includes/header.jsp" %>

    <div class="container">
      <!-- headline -->
      <h2 class="headline" style="font-family: 'yg-jalnan'">Schedule</h2>
      <!-- planner option -->
      <form action="/planner/schedule2" method="get">
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
                      <div class="sortable-schedule-area">
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
                  <span class="budget-total">
                    <c:out value="${dayBudget[date] }"></c:out>
                  </span>
                  <span>₩</span>
                </td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>
    </div>

    <!-- Footer -->
    <%@ include file="/WEB-INF/views/includes/footer.jsp" %>
</body>

</html>