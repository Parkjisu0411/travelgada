<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>

  <!-- JQuery -->
  <link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/jquery-date-range-picker/0.21.1/daterangepicker.min.css"
    integrity="sha512-nmvKZG8E3dANbZAsJXpdK6IqpfEXbPNbpe3M3Us1qTipq74IpTRShbpCf8lJFapB7e0MkDbNDKxLjS1VWt2vVg=="
    crossorigin="anonymous" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-date-range-picker/0.21.1/jquery.daterangepicker.min.js"
    integrity="sha512-jM36zj/2doNDqDlSIJ+OAslGvZXkT+HrtMM+MMgVxCqax1AIm1XAfLuUFP7uMSavUxow+z/T2CRnSu7PDaYu2A=="
    crossorigin="anonymous"></script>

  <style>
    .controls {
      width: 200px;
      height: 10px;
      border: 0px;
      padding: 20px;
      border-radius: 50px;
      outline: none;
      box-shadow: rgb(0 0 0 / 15%) 0px 16px 32px, rgb(0 0 0 / 10%) 0px 3px 8px !important;
      font-size: 14px;
    }

    .pac-container {
      width: 500px !important;
    }

    .pac-container:after {
      background-image: none !important;
      height: 0px;
    }

    .pac-item-query {
      font-size: 14px;
    }

    .pac-matched {
      font-size: 17px;
    }

    #date-range200 {
      width: 200px;
      height: 10px;
      border: 0px;
      padding: 20px;
      border-radius: 50px;
      outline: none;
      box-shadow: rgb(0 0 0 / 15%) 0px 16px 32px, rgb(0 0 0 / 10%) 0px 3px 8px !important;
      font-size: 14px;
    }

    #date-range201 {
      width: 200px;
      height: 10px;
      border: 0px;
      padding: 20px;
      border-radius: 50px;
      outline: none;
      box-shadow: rgb(0 0 0 / 15%) 0px 16px 32px, rgb(0 0 0 / 10%) 0px 3px 8px !important;
      font-size: 14px;
    }
  </style>
  
  <meta name="_csrf" content="${_csrf.token}"/>
  <meta name="_csrf_header" content="${_csrf.headerName}"/>
  
  <script>
  	$('#input-info').submit(function(event) {
  		
  		event.preventDefault();
  		
  		var header = $("meta[name='_csrf_header']").attr("content");
		var token = $("meta[name='_csrf']").attr("content");
  		
  		var latitude = $("#latitude").val();
  		var longitude = $("#longitude").val();
  		var start = $('#date-range200').val();
  		var end = $('#date-range201').val();
  		
  		var data = {
  				latitude: latitude,
  				longitude: longitude,
  				start: start,
  				end: end
  		};
  		
  		$.ajax({
  			type: 'POST',
  			url: '/map/callback',
  			cache: false,
  			contentType: 'application/json; charset=utf-8',
  			data: JSON.stringify(data),
			beforeSend: function(xhr) {
				xhr.setRequestHeader(header, token);
			},
  			success: function(result) {
  					console.log('전송 완료: ' + result);
  			},
			error: function(e) {
				console.log("ERROR: " + e);
			}
  		})
  	})
  </script>
  
</head>

<body>

  <form id="input-info" action="${pageContext.request.contextPath}/map/callback">
    <!-- Search Box -->
    <input id="search-box" class="controls" type="text" placeholder="여행지를 입력해 주세요" />
    <input type="hidden" id="latitude" value="">
    <input type="hidden" id="longitude" value="">
    
    <!-- Date Picker -->
    <span id="two-inputs">
      <input id="date-range200" size="20" value="" placeholder="출발일">
      <input id="date-range201" size="20" value="" placeholder="도착일">
    </span>
    <!-- <pre id="placeInfo"></pre> -->
    <input type="submit" value="확인">
  </form>

  <!-- Google Map -->
  <script
    src="https://maps.googleapis.com/maps/api/js?libraries=places&key=AIzaSyDK3h87HvHsFJIOBZ7Vuo-9V6lqognoY2M&callback=initMap"
    async defer></script>

  <!-- Map -->
  <script>
    function initMap() {
      var input = document.getElementById('search-box');

      var options = {
        types: ['(cities)']
      };

      var autocomplete = new google.maps.places.Autocomplete(input, options);

      autocomplete.addListener('place_changed', function () {
        var place = autocomplete.getPlace();
        if (!place.geometry) {
          window.alert("도시를 선택해 주세요.");
          return;
        }

        var address = '';
        if (place.address_components) {
          address = [
            (place.address_components[0] && place.address_components[0].short_name || ''),
            (place.address_components[1] && place.address_components[1].short_name || ''),
            (place.address_components[2] && place.address_components[2].short_name || '')
          ].join(' ');
        }

        document.getElementById('latitude').value = place.geometry.location.lat();
        document.getElementById('longitude').value = place.geometry.location.lng();

        // document.getElementById('placeInfo').innerHTML = '<div><strong>' + place.name + '</strong><br>' + address;    
      });
    }
  </script>

  <!-- Date Picker -->
  <script>
    $(document).ready(function () {
      $('#two-inputs').dateRangePicker(
        {
          language: 'ko',
          minDays: 1,
          separator: ' to ',
          selectForward: true,
          getValue: function () {
            if ($('#date-range200').val() && $('#date-range201').val())
              return $('#date-range200').val() + ' to ' + $('#date-range201').val();
            else
              return '';
          },
          setValue: function (s, s1, s2) {
            $('#date-range200').val(s1);
            $('#date-range201').val(s2);
          }
        });
    });
  </script>

</body>

</html>