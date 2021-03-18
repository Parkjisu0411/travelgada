<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#plus {
	width: 200px;
	height: 100px;
	text-align: center;
	line-height: 100px;
	border: 1px solid #cccccc;
	border-radius: 20px;
}

#first {
	width: 200px;
	height: 100px;
	text-align: center;
}

#sec {
	width: 200px;
	height: 100px;
	text-align: center;
}

#three {
	width: 200px;
	height: 100px;
	text-align: center;
}
</style>

<script>
	$('.slide').slick({
		infinite : true,
		slidesToShow : 3,
		slidesToScroll : 3
	});
</script>

</head>
<body>


	<select class="form-control" name="schedule_id">
		<c:forEach var="planner" items="${plannerList}">
			<option value='${planner.planner_name}'>${planner.planner_name}</option>
		</c:forEach>
	</select>

	<button style="background: yellow;">일정</button>
	<button>지도</button>
	<button>준비물</button>
	<button>다이어리</button>


	<div style="display: flex; justify-content: space-around;">
		<button>
			<div id="plus">+</div>
		</button>

		<div class="slide">
		<c:forEach var="date" items="${dateList }">
			<button>
				${date }
			</button>
		</c:forEach>
		</div>
	</div>

	<table border="1" width="1000px" height="300px">
		<thead>

			<tr>
				<th>날짜</th>
				<th>도시</th>
				<th>교통</th>
				<th>일정</th>
				<th>숙소</th>
				<th>비용</th>
			</tr>

		</thead>

		<tbody>
			<c:forEach var="date" items="${dateList}">
				<tr>
					<td>${date}</td>
					<td>
						<c:forEach var="city" items="${cityList }">
							<c:if test="${city.schedule_date eq date }">
								<p>${city.schedule_content }</p>
							</c:if>
						</c:forEach>
					</td>
					<td>
						<c:forEach var="vehicle" items="${vehicleList }">
							<c:if test="${vehicle.schedule_date eq date }">
								<p>${vehicle.schedule_content }</p>
							</c:if>
						</c:forEach>
					</td>
					<td>
						<c:forEach var="schedule" items="${scheduleList }">
							<c:if test="${schedule.schedule_date eq date }">
								<p>${schedule.schedule_content }</p>
							</c:if>
						</c:forEach>
					</td>
					<td>
						<c:forEach var="hotel" items="${hotelList }">
							<c:if test="${hotel.schedule_date eq date }">
								<p>${hotel.schedule_content }</p>
							</c:if>
						</c:forEach>
					</td>
					<td></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

</body>
</html>