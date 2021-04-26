<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
  <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
  <meta charset="utf-8">

  <!-- Icon -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />

  <!-- Font -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font.css">

  <!-- Ajax -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

  <!-- Google Map -->
  <script
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDK3h87HvHsFJIOBZ7Vuo-9V6lqognoY2M&callback=initMap"></script>

  <title>Marker</title>
  <style>
    #map {
      height: 100%;
    }
    
    html,
    body {
      height: 100%;
      margin: 0;
      padding: 0;
      font-family: 'Gothic A1', sans-serif;
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
      font-weight: 400;
    }

    /* Button */
    #weather {
      width: 180px;
      border: none;
      background-color: #ffffff;
      padding-bottom: 25px;
      padding-top: 25px;
      box-shadow: rgb(0 0 0 / 12%) 0px 6px 16px;
      border-radius: 8px;
      margin: 10px;
      font-size: 14px;
      text-align-last: center;
      font-weight: 600;
    }
    
    #sidePanel {
      width: 18%;
      height: 100%;
      overflow: scroll;
      float: right;
      background-color: #ffffff;
      overflow-x: hidden;
    }
    
    .schedule-area {
      height: 4%;
      padding: 30px;
      border-bottom: 1px solid #111111;
      line-height: 48px;
      font-weight: 600;
      background-color: #ffffff;
      color: #000000;
    }
    
    .schedule-area:hover {
      cursor: pointer;
      filter: invert(100%);
    }
    
    .d-day {
      font-size: 33px;
      font-weight: 500;
    }
    
    .date {
      float: right;
      font-size: 18px;
      font-weight: 400;
    }
    
    .city {
      font-size: 17px;
      font-weight: 700;
    }
    
    /* ������ �ε� ȭ�� */
    #preloder {
	   position: fixed;
	   width: 100%;
	   height: 100%;
	   top: 0;
	   left: 0;
	   z-index: 999999;
	   background: #000;
	}
	
	.loader {
	   width: 40px;
	   height: 40px;
	   position: absolute;
	   top: 50%;
	   left: 50%;
	   margin-top: -13px;
	   margin-left: -13px;
	   border-radius: 60px;
	   animation: loader 0.8s linear infinite;
	   -webkit-animation: loader 0.8s linear infinite;
	}
	
	@keyframes loader {
	   0% {
	      -webkit-transform: rotate(0deg);
	      transform: rotate(0deg);
	      border: 4px solid #ffffff;
	      border-left-color: transparent;
	   }
	   50% {
	      -webkit-transform: rotate(180deg);
	      transform: rotate(180deg);
	      border: 4px solid #ffffff;
	      border-left-color: transparent;
	   }
	   100% {
	      -webkit-transform: rotate(360deg);
	      transform: rotate(360deg);
	      border: 4px solid #ffffff;
	      border-left-color: transparent;
	   }
	}
	
	@-webkit-keyframes loader {
	   0% {
	      -webkit-transform: rotate(0deg);
	      border: 4px solid #ffffff;
	      border-left-color: transparent;
	   }
	   50% {
	      -webkit-transform: rotate(180deg);
	      border: 4px solid #ffffff;
	      border-left-color: transparent;
	   }
	   100% {
	      -webkit-transform: rotate(360deg);
	      border: 4px solid #ffffff;
	      border-left-color: transparent;
	   }
	}
	
	#goToMain {
	  height: 41px;
	  width: 180px;
      border: none;
      background-color: #ffffff;
      box-shadow: rgb(0 0 0 / 12%) 0px 6px 16px;
      border-radius: 8px;
      margin: 10px;
      font-size: 16px;
      text-align-last: center;
      font-weight: 600;
      padding: 5px;
      line-height: 41px;
	}
	
	#goToMain:hover {
	  cursor: pointer;
	}
  </style>
</head>

<body>

   <div id="preloder">
      <div class="loader"></div>
   </div>

  <div id="weather"></div>
  <div id="goToMain" onclick="location.href='http://localhost:8282/planner'"><i class="fas fa-chevron-left" style="margin-right: 15px;"></i>�÷��ʷ� ���ư���</div>
  
  <div id="sidePanel">
      <c:forEach var="date" items="${dateList}">
      <c:set var="dayIndex" value="${dayIndex + 1}" />
      <div class="schedule-area" onclick="location.href='http://localhost:8282/map/${planner_id}?schedule_date=${date}';"><span class="d-day">DAY&nbsp;<c:out value="${dayIndex}" /></span><span class="date">${date}</span></div>
    </c:forEach>
  </div>
  <div id="map"></div>

  <script>
  
    $.ajax({
      url: "${pageContext.request.contextPath}/paths/${planner_id}?schedule_date=${schedule_date}",
      method: 'GET',
      cache: false,
      contentType: "application/json; charset=utf-8",
      success: function initMap(result) {
        var paths = result;
        var pathsArray = [];
        var markerIndex = 1;

        var map = new google.maps.Map(document.getElementById('map'), {
          mapTypeControl: false,
          fullscreenControl: false
        });
        /* map.setOptions({draggable: false}); */
        map.controls[google.maps.ControlPosition.TOP_LEFT].push(weather);
        map.controls[google.maps.ControlPosition.TOP_CENTER].push(goToMain);
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

          var markerType = paths[index].schedule_type_id == 4 ? markerIndex++ : '<i class="fas fa-bed"></i>';
          if (paths[index].schedule_type_id == 4) {
              pathsArray.push({ lat: latitude, lng: longitude });
          }
          
          var markerContent = '<div class="schedule-content">' + '<strong>' + markerType + '</strong>&nbsp;&nbsp;|&nbsp;&nbsp;' + paths[index].schedule_content + '</div>';
          marker.info = new google.maps.InfoWindow({
            content: markerContent,
            pixelOffset: new google.maps.Size(0, 45),
          });

          google.maps.event.addListener(marker, 'click', function () {
            this.info.open(this.getMap(), this);
          });
          marker.info.open(marker.getMap(), marker);

          bounds.extend(new google.maps.LatLng(latitude, longitude));
        };
        new google.maps.Polyline({
          path: pathsArray,
          geodesic: true,
          strokeColor: '#000000',
          strokeOpacity: 1,
          strokeWeight: 2,
          map: map,
          icons: [{
            icon: { path: google.maps.SymbolPath.FORWARD_CLOSED_ARROW },
            offset: '100%',
            repeat: '150px',
          }]
        });
        map.fitBounds(bounds);
      },
      error: function (e) {
        console.log(e);
      }
    });
    
    function getWeather() {
	    $.ajax({
	        url: "https://api.openweathermap.org/data/2.5/weather?lat=${scheduleList[0].latitude}&lon=${scheduleList[0].longitude}&units=metric&appid=5d63c0019aba9653c40f9cef45c832b9",
	        method: 'GET',
	        cache: false,
	        dataType: 'jsonp',
	        contentType: "application/json; charset=utf-8",
	        success: function result(result) {
	        	var weatherId = result.weather[0].id;
	        	var icon = result.weather[0].icon;
	        	var iconUrl = 'http://openweathermap.org/img/wn/' + icon + "@2x.png";
	        	
	        	$("#weather").prepend('<div class="city">' + result.name + ', ' + result.sys.country + '</div>' + '<img src=' + iconUrl + '><br>' + weatherEnglishToKorean(weatherId) + '<br><br>' + '<span style="font-size: 15px !important; font-weight: 500;">���� ���: ' + result.main.temp_min + '&#8451;' + '<br>' + '�ְ� ���: ' + result.main.temp_max + '&#8451;' + '<br>' + 'ü�� ���: ' + result.main.feels_like + '&#8451;' + '</span></span>');
			}
		})
    }
    
    function weatherEnglishToKorean(weatherId) {
	    	var weatherIdArray = [201,200,202,210,211,212,221,230,231,232,
	    	300,301,302,310,311,312,313,314,321,500,
	    	501,502,503,504,511,520,521,522,531,600,
	    	601,602,611,612,615,616,620,621,622,701,
	    	711,721,731,741,751,761,762,771,781,800,
	    	801,802,803,804,900,901,902,903,904,905,
	    	906,951,952,953,954,955,956,957,958,959,
	    	960,961,962];
	    	var weatherKoreanArr = ["������ �� ������ õ�ձ���","�� ������ õ�ձ���","���츦 ������ õ�ձ���","���� õ�ձ���",
	    	"õ�ձ���","���� õ�ձ���","�ұ�Ģ�� õ�ձ���","���� ������ ������ õ�ձ���","������ ������ õ�ձ���",
	    	"���� �Ȱ��� ������ õ�ձ���","������ �Ȱ���","�Ȱ���","���� �Ȱ���","������ ������","������",
	    	"���� ������","�ҳ���� �Ȱ���","���� �ҳ���� �Ȱ���","�ҳ���","���� ��","�߰� ��","���� ��",
	    	"�ſ� ���� ��","�ؽ��� ��","���","���� �ҳ��� ��","�ҳ��� ��","���� �ҳ��� ��","�ұ�Ģ�� �ҳ��� ��",
	    	"������ ��","��","���� ��","��������","�ҳ��� ��������","���� ��� ��","��� ��","���� �ҳ��� ��",
	    	"�ҳ��� ��","���� �ҳ��� ��","�ڹ�","����","����","�� ����","�Ȱ�","��","����","ȭ����","��ǳ",
	    	"����̵�","���� �� �� ���� ���� �ϴ�","�ణ�� ������ �� �ϴ�","�幮�幮 ������ �� �ϴ�","������ ���� ���� �ϴ�",
	    	"�������� �ڵ��� �帰 �ϴ�","����̵�","��ǳ","�㸮����","�ѷ�","���","�ٶ��δ�","���","�ٶ��� ���� ����",
	    	"���� �ٶ�","�ε巯�� �ٶ�","�߰� ���� �ٶ�","�ż��� �ٶ�","�� �ٶ�","��ǳ�� ����� �� �ٶ�","��ǳ",
	    	"�ɰ��� ��ǳ","��ǳ","���� ��ǳ","�㸮����"];
	    	
	    	for (var i = 0; i < weatherIdArray.length; i++) {
		    	if (weatherIdArray[i] == weatherId) {
		    		return weatherKoreanArr[i];
	    	}
	    }
    }
    
    $(window).on('load', function () {
        $(".loader").fadeOut();
        $("#preloder").delay(200).fadeOut("slow");
    });
    
	getWeather();
    
  </script>
</body>

</html>