<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  

<html>
  <head>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
	        ['월별 여행지 통계', '경주', '안동', '속초시', '단양군', '부산광역시', '런던', { role: 'annotation' } ],
	        ['1월', 10, 24, 20, 32, 18, 5, ''],
	        ['2월', 16, 22, 23, 30, 16, 9, ''],
	        ['3월', 28, 19, 29, 30, 12, 13, ''],
	        ['4월', 28, 19, 29, 30, 12, 13, ''],
	        ['5월', 28, 19, 29, 30, 12, 13, ''],
	        ['6월', 28, 19, 29, 30, 12, 13, ''],
	        ['7월', 10, 24, 20, 32, 18, 5, ''],
	        ['8월', 16, 22, 23, 30, 16, 9, ''],
	        ['9월', 28, 19, 29, 30, 12, 13, ''],
	        ['10월', 28, 19, 29, 30, 12, 13, ''],
	        ['11월', 28, 19, 29, 30, 12, 13, ''],
	        ['12월', 28, 19, 29, 30, 12, 13, '']
      ]);

     	 var options = {
	        width: 600,
	        height: 400,
	        legend: { position: 'top', maxLines: 3 },
	        bar: { groupWidth: '75%' },
	        isStacked: true,
      };

        var chart = new google.charts.Bar(document.getElementById('columnchart_material'));

        chart.draw(data, google.charts.Bar.convertOptions(options));
      }
    </script>
  </head>
  <body>
    <div id="columnchart_material" style="width: 800px; height: 500px;"></div>
  </body>
</html>