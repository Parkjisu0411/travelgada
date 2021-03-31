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

    /* Button */
    #centerControlDiv {
      width: 180px;
      height: 40px;
      border: none;
      box-shadow: rgb(0 0 0 / 12%) 0px 6px 16px;
      border-radius: 8px;
      margin: 10px;
      font-size: 14px;
      text-align-last: center;
      font-family: 'Gothic A1', sans-serif;
      font-weight: 600;
    }
  </style>
</head>

<body>

  <div id="map"></div>

  <select id="centerControlDiv" onchange="location.href=this.value">
    <c:forEach var="date" items="${dateList}">
      <c:set var="dayIndex" value="${dayIndex + 1}" />
      <option value="" hidden selected>${schedule_date}&nbsp;жн&nbsp;DAY&nbsp;<c:out value="${dayIndex}" />
      </option>
      <option value="${planner_id}?schedule_date=${date}">${date}&nbsp;жн&nbsp;DAY&nbsp;<c:out value="${dayIndex}" />
      </option>
    </c:forEach>
  </select>

  <script>

    $.ajax({
      url: "${pageContext.request.contextPath}/paths/${planner_id}?schedule_date=${schedule_date}",
      method: 'GET',
      cache: false,
      contentType: "application/json; charset=utf-8",
      success: function initMap(result) {
        var paths = result;
        var pathsArray = [];
        var markerIndex = 0;

        var map = new google.maps.Map(document.getElementById('map'), {
          mapTypeControl: false,
        });
        /* map.setOptions({draggable: false}); */
        map.controls[google.maps.ControlPosition.TOP_RIGHT].push(centerControlDiv);
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

          var markerContent = '<div id="schedule-content">' + '<strong>' + markerIndex++ + '</strong>&nbsp;&nbsp;|&nbsp;&nbsp;' + paths[index].schedule_content + '</div>';
          marker.info = new google.maps.InfoWindow({
            content: markerContent.replace(0, '<i class="fas fa-bed"></i>'),
            pixelOffset: new google.maps.Size(0, 45),
          });

          google.maps.event.addListener(marker, 'click', function () {
            this.info.open(this.getMap(), this);
          });
          marker.info.open(marker.getMap(), marker);

          pathsArray.push({ lat: latitude, lng: longitude });
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
  </script>
</body>

</html>