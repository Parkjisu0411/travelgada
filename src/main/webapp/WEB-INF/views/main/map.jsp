<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
  <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
  <meta charset="utf-8">

  <!-- Ajax -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

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
  </style>
</head>

<body>

  <div id="map"></div>

  <!-- Google Map -->
  <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDK3h87HvHsFJIOBZ7Vuo-9V6lqognoY2M&callback=initMap"></script>

  <script>

    $.ajax({
      url: "${pageContext.request.contextPath}/paths/${schedule_date}",
      method: 'GET',
      cache: false,
      contentType: "application/json; charset=utf-8",
      success: function initMap(result) {
        var paths = result;
        var pathsArray = [];

        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 8,
          center: { lat: 36.117223849684194, lng: 127.77243924839905 }
        });

        for (var index = 0; index < paths.length; index++) {
          if ((paths[index].latitude && paths[index].longitude) == '' || null || undefined || 0 || NaN) {
              continue;
          }
          var latitude = paths[index].latitude;
          var longitude = paths[index].longitude;

          var marker = new google.maps.Marker({
            position: { lat: latitude, lng: longitude },
            label: "" + paths[index].schedule_order,
            map: map
          });

          marker.info = new google.maps.InfoWindow({
            content: '<div class="schedule-content">' + paths[index].schedule_content + '</div>',
            anchorPoint: new google.maps.Point(0, -29),
          });

          google.maps.event.addListener(marker, 'click', function () {
            var marker_map = this.getMap();
            this.info.open(marker_map, this);
          });
          
          if ((paths[index].schedule_type_id) != 4) {
        	  continue;
          }
          pathsArray.push({ lat: latitude, lng: longitude });
        };

        new google.maps.Polyline({
          path: pathsArray,
          geodesic: true,
          strokeColor: '#000000',
          strokeOpacity: 1,
          strokeWeight: 2,
          map: map
        });
      },
      error: function (e) {
        console.log(e);
      }
    });
  </script>
</body>

</html>