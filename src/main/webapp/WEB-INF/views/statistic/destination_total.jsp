<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  

<html>
  <head>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.js"></script>
    <script type="text/javascript">
    
    $.ajax({
        url: "${pageContext.request.contextPath}/destination/json/total",
        method: 'GET',
        cache: false,
        contentType: "application/json; charset=utf-8",
        success: function(result) {
          var destination = result;
          var dataArray = [];
          var header = ['Total', 'City'];
          
          dataArray.push(header);
          
          for (var index = 0; index < destination.length; index++) {
        	  var temp = [];
        	  temp.push(destination[index].city);
        	  temp.push(destination[index].total);
        	  
        	  dataArray.push(temp);
          }
          
          console.log(dataArray);
          
	      google.charts.load("current", {packages:["corechart"]});
	      google.charts.setOnLoadCallback(drawChart);
	      function drawChart() {
	        var data = google.visualization.arrayToDataTable(dataArray);
	 		
	        var options = {
	          title: '전체 여행지 통계',
	          pieHole: 0.4,
	        };
	
	        var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
	        chart.draw(data, options);
	      }
	    }
	  });
    </script>
  </head>
  <body>
    <div id="donutchart" style="width: 900px; height: 500px;"></div>
  </body>
</html>