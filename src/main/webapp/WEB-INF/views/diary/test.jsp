<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>달력</title>

  <link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/jquery-date-range-picker/0.21.1/daterangepicker.min.css"
    integrity="sha512-nmvKZG8E3dANbZAsJXpdK6IqpfEXbPNbpe3M3Us1qTipq74IpTRShbpCf8lJFapB7e0MkDbNDKxLjS1VWt2vVg=="
    crossorigin="anonymous" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-date-range-picker/0.21.1/jquery.daterangepicker.min.js"
    integrity="sha512-jM36zj/2doNDqDlSIJ+OAslGvZXkT+HrtMM+MMgVxCqax1AIm1XAfLuUFP7uMSavUxow+z/T2CRnSu7PDaYu2A=="
    crossorigin="anonymous"></script>
	
	
	<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@700;800&display=swap"
	rel="stylesheet">
	

<link rel="stylesheet" href="${contextPath}/resources/css/font.css">
<link rel="stylesheet" href="${contextPath}/resources/css/header.css">
<link rel="stylesheet" href="${contextPath}/resources/css/footer.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- 여기 새로운 달력 부분이다. -->
 <!-- 옆으로 가는 버튼이 여기에 있다. -->
   <!--  <link href="resources/calendar/vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all"> -->
    <link href="resources/calendar/vendor/datepicker/daterangepicker.css" rel="stylesheet" media="all">

    <!-- Main CSS-->
  <link href="resources/calendar/css/datepicker.css" rel="stylesheet" media="all">
    

	
</head>
<body>

	<!-- Header -->
	<%@ include file="/WEB-INF/views/includes/header.jsp"%>

	<!--Content -->
	

<div class= "container">
	<div class="row">
                        <div class= "col-sm-2">
                            <label class="label" style="font-family: 'yg-jalnan'">플래너 이름</label>
                            <input name="planner_name"  type="text" placeholder="가다랑 함께 즐거운 여행!" name="going">
                        </div>
                        <div class="col-sm-2"">
                         <label class="label" style="font-family: 'yg-jalnan'">여행시작</label>
                            <input name="start_date"  type="text"  placeholder="YYYY/MM/DD" id="input-start">
                        </div>
                        <div class="col-sm-2">
                            <label class="label" style="font-family: 'yg-jalnan'">여행종료</label>
                            <input name="end_date"  type="text"  placeholder="YYYY/MM/DD" id="input-end">
                        </div>
                        <div class="col-sm-2">
                            <label class="label" style="font-family: 'yg-jalnan'">나라</label>
                            <input name="schedule_content" type="text" placeholder="어디로 여행 갈까요?" name="going">
                        </div>
<div class="col-sm-2">
                        <button class="btn-submit" type="submit">작성</button>
                        </div>
	</div>

	</div>

	
	        <!-- Jquery JS-->
     <script src="resources/calendar/vendor/jquery/jquery.min.js"></script>
    <script src="resources/calendar/vendor/datepicker/moment.min.js"></script>
    <script src="resources/calendar/vendor/datepicker/daterangepicker.js"></script>

    <!-- Main JS-->
    <script src="resources/calendar/js/global.js"></script>
	
	
	

	<!-- Footer -->
	<%@ include file="/WEB-INF/views/includes/footer.jsp"%>

</body>
</html>