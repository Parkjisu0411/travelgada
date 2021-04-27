<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-date-range-picker/0.21.1/daterangepicker.min.css" integrity="sha512-nmvKZG8E3dANbZAsJXpdK6IqpfEXbPNbpe3M3Us1qTipq74IpTRShbpCf8lJFapB7e0MkDbNDKxLjS1VWt2vVg==" crossorigin="anonymous" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-date-range-picker/0.21.1/jquery.daterangepicker.min.js" integrity="sha512-jM36zj/2doNDqDlSIJ+OAslGvZXkT+HrtMM+MMgVxCqax1AIm1XAfLuUFP7uMSavUxow+z/T2CRnSu7PDaYu2A==" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	
	<!-- 달력 -->
	<link href="resources/calendar/datepicker/daterangepicker.css" rel="stylesheet" media="all">
	<link href="resources/calendar/css/datepicker.css" rel="stylesheet" media="all">
	
	<!-- 폰트 -->
	<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@800;900&display=swap" rel="stylesheet">
	
	<title>달력</title>

<style>
/* 플래너 생성 스타일*/

@font-face {
    font-family: 'GongGothicMedium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10@1.0/GongGothicMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

/* 작성 버튼 부분 */
.calRow{
	width: 100%;
}

/* 작성 버튼 */
.btn-submit {
	background-color: #1dcad3;
	border-radius: 50px;
 	border: none;
	padding-top: 10px;
	padding-bottom: 9px;
	text-align: center; 
	width: 80px;
	float: left;
	height: 60px;
	margin:10px;
	font-family: 'GongGothicMedium';  
	font-size:20px; 
	color:white
}

/* input */
.input-style{
	border: none;
	font-size: 20px;
	background-color: transparent;
	outline: none;
	height: 55px;
	padding-left:30px;
	margin-bottom:20px;
}
	
/* label */
.calLabel {
	font-size: 16px;
	color: #303E57; ;
	display: block;
	height: 10px;
	margin-top:10px;
	padding-left:30px;
	font-family: 'GongGothicMedium';
}

/* input 전체적으로 감싸는 부분 */
.inputGroup{
	background: #f8f9fa; 
	border-radius: 50px;
	float: left; 
	width: 290px;
	height: 80px;
	color: ##303E57;  
	font-family: 'GongGothicMedium';  
	font-size:22px;
	}
	
	/* 날짜 전체적으로 감싸는 부분 */
.dateGroup{
	background: #f8f9fa; 
	border-radius: 50px;
 	float: left; 
	width: 198px;
	height: 80px;
	color: ##303E57;  
	font-family: 'GongGothicMedium';  
	font-size:22px;
	}

/* 선택 되었을 때 색깔 */    
.inputGroup:hover, .dateGroup:hover/* ,.btn-submit:hover */{
	background: white;
}

#rowGroup{
	background: #f8f9fa;
	border-radius: 50px;
	float: left;
	height: 80px;
	/* border: 2px solid #1C2454; #f8f9fa */
	/* margin-left: 10px; */
	/* border: 2px; */
}

/* 플래너 생성 스타일 end */
</style>

<script>
/* 플래너 생성 경고 */
	$(document).ready(function(){
		$(".btn-submit").click(function(){
			if($("#planner_name").val().length==0){
				alert("플래너 이름을 입력하세요!");
				$("#planner_name").focus();
				return false;
			}//if end
			if($("#input-start").val().length==0){
				alert("여행 기간을 선택해주세요!");
				$("#input-start").focus();
				return false;
			}//if end
			if($("#input-end").val().length==0){
				alert("여행 기간을 선택해주세요!");
				$("#input-start").focus();
				return false;
			}//if end
			if($("#schedule_content").val().length==0){
				alert("나라를 입력하세요!");
				$("#schedule_content").focus();
				return false;
			}//if end
		});//click function end
	});//ready function end
/* 플래너 생성 경고 end */
</script>

<script>
/* 엔드 날짜 클릭시 시작 날짜로 포거스가게 하기 */
	$(document).ready(function(){
		$("#input-end-2").click(function(){
			$("#input-start-2").focus();
		});//click function end
	});//ready function end
/* 날짜 동시에 띄우기 end */
</script>
	
</head>
<body>

	<div class="container">

	<form class="form" action="/planner" method="post">

	<!-- 숨겨서 보내야 하는 정보들 -->
	<input type="hidden" id="_csrf" name="_csrf" value="${_csrf.token}"/>
	<input type="hidden" id="_csrf_header" name="_csrf_header" value="${_csrf.headerName}"/>

		<div class="calRow" >
			<div id="rowGroup">
				<div class="inputGroup">
					<label class="calLabel" >플래너 이름</label>
					<input name="planner_name" class="input-style" type="text" placeholder="가다랑 함께 즐거운 여행!" id="planner_name">
				</div>
				<div class="dateGroup">
					<label class="calLabel">여행시작</label>
					<input name="start_date" class="input-style " type="text"  placeholder="YYYY/MM/DD" id="input-start-2" autocomplete="off">
				</div>
				<div class="dateGroup">
					<label class="calLabel" >여행종료</label>
					<input name="end_date" class="input-style " type="text"  placeholder="YYYY/MM/DD" id="input-end-2" autocomplete="off">
				</div>
				<div class="inputGroup">
					<label class="calLabel" >나라</label>
					<input list="country-list" id="country_name" name="country_name" class="input-style" placeholder="어디로 여행 갈까요?" autocomplete="off"/>
					<datalist id="country-list">
						<c:forEach var="country" items="${countryList }">
							<option value="${country.country_name }">
						</c:forEach>
					</datalist>
				</div>
				<input class="btn-submit" type="submit" value="작성"/>
			</div>
		</div>
	</form>
</div>
	
	<!-- 달력 (아래 추가) -->
    <script src="resources/calendar/datepicker/moment.min.js"></script>
    <script src="resources/calendar/datepicker/daterangepicker.js"></script>
    <script src="resources/calendar/js/global.js"></script>
</body>
</html>