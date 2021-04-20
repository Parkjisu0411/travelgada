<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<!-- jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- bootstrap -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- font -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@700;800&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@800;900&display=swap" rel="stylesheet"><!-- 큰 영어 -->
<!-- GADA CSS -->
<link rel="stylesheet" href="${contextPath}/resources/css/main.css">
<link rel="stylesheet" href="${contextPath}/resources/css/font.css">
<link rel="stylesheet" href="${contextPath}/resources/css/header.css">
<link rel="stylesheet" href="${contextPath}/resources/css/footer.css">
<link rel="stylesheet" href="${contextPath}/resources/css/utils.css">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-date-range-picker/0.21.1/daterangepicker.min.css" integrity="sha512-nmvKZG8E3dANbZAsJXpdK6IqpfEXbPNbpe3M3Us1qTipq74IpTRShbpCf8lJFapB7e0MkDbNDKxLjS1VWt2vVg==" crossorigin="anonymous" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-date-range-picker/0.21.1/jquery.daterangepicker.min.js" integrity="sha512-jM36zj/2doNDqDlSIJ+OAslGvZXkT+HrtMM+MMgVxCqax1AIm1XAfLuUFP7uMSavUxow+z/T2CRnSu7PDaYu2A==" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<link href="resources/calendar/datepicker/daterangepicker.css" rel="stylesheet" media="all">
<link href="resources/calendar/css/datepicker.css" rel="stylesheet" media="all">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login Form</title>
<style>
	
	/* 플래너 text */
	.planner-text-area{
		padding:15px;
		font-family: 'IBMPlexSansKR-Light';
	}
	
	.planner-modify-area{
		padding:15px;
		font-family: 'IBMPlexSansKR-Light';
	}
	
	.planner-modify-input-name {
		border: none;
		background-color: #f5f5f5;
		font-weight: bold;
	}
	
	.planner-modify-input-name:focus {
		outline: none;
		background-color: #f5f5f5;
		border-bottom: 1px solid #1DCAD3;
	}
	
	.planner-modify-input-cal {
		border: none;
		background-color: #f5f5f5;
		display: inline;
		width: 95px;
	}
	
	.planner-modify-input-cal:focus {
		outline: none;
		background-color: #f5f5f5;
		border-bottom: 1px solid #1DCAD3;
	}
	
	
	/* 플래너 */
	.planner-area{
		border-radius: 10px;
		margin: 0px 0px 30px 0px;
		height: 460;
		background-color: #f5f5f5;
	}
	
	/* 플래너 이미지 */
	.card-pl-img {
		width: 100%;
		height: 350px;
		border-radius: 10px 10px 0px 0px;
		object-fit: cover;
	}
	
	.card-pl-img:hover {
		cursor: pointer;
	}
	
	/* 디데이 */
	.dday{
		background-color:#fcd581; 
		font-family: 'GongGothicLight';
	}
	
	/* 해드라인 */
	.headline{
		font-family: 'Montserrat', sans-serif;  
		color: #1dcad3; 
		font-size:40px; 
		font-weight:bold;
	}
	
	.gada-btn-group {
		text-align: right;
	}
	
	.cal {
		display: inline;
	}

</style>

<script>
	function selectPlanner(planner_id) {
		$.ajax({
			type : "GET",
			url : "/planner/" + planner_id,
			cache : false,
			success : function(result) {
				location.href="/planner/schedule";
			},
			error : function(e) {
				console.log(e);
				alert("에러가 발생했습니다.");
			}
		});
	} 
	
	function deletePlanner(planner_id) {
		if(confirm("주의!\n플래너의 모든 데이터가 삭제됩니다.")) {
			var data = {
				planner_id : planner_id		
			};
			$.ajax({
				type : "DELETE",
				url : "/planner/" + planner_id,
				cahce : false,
				data : JSON.stringify(data),
				contentType : "application/json",
				beforeSend : function(xhr){
	  	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				},
				success : function(result) {
					console.log(result);
					$("#" + planner_id).remove();
				},
				error : function(e) {
					console.log(e);
				}
			})
		}
	}
	
	function modifyPlanner(planner_id) {
		$("#" + planner_id + " div .planner-text-area").css("display", "none");
		$("#" + planner_id + " div .planner-modify-area").css("display", "");
		$("#" + planner_id + " input[name=planner_name]").val($("#" + planner_id + " .planner_name").text());
		$("#" + planner_id + " .input-start").val($("#" + planner_id + " .start_date").text());
		$("#" + planner_id + " .input-end").val($("#" + planner_id + " .end_date").text());
		$("#" + planner_id + " input[name=planner_name]").focus();
	}
	
	function cancelModify(planner_id) {
		$("#" + planner_id + " div .planner-text-area").css("display", "");
		$("#" + planner_id + " div .planner-modify-area").css("display", "none");
	}
	
	function submitModify(planner_id) {
		var planner_name = $("#" + planner_id + " input[name=planner_name]").val();
		var start_date = $("#" + planner_id + " input[name=start_date]").val();
		var end_date = $("#" + planner_id + " input[name=end_date]").val();
		
		var data = {
			planner_id : planner_id,
			planner_name : planner_name,
			start_date : start_date,
			end_date : end_date
		};
		
		if(confirm("주의!\n여행 날짜 변경 시 기존의 데이터가 삭제될 수 있습니다.")) {
			$.ajax({
				type : "PUT",
				url : "/planner/" + planner_id,
				data : JSON.stringify(data),
				contentType : "application/json",
				cache : false,
				beforeSend : function(xhr){
	  	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				},
				success : function(result) {
					$("#" + planner_id + " .planner_name").text(planner_name);
					$("#" + planner_id + " .start_date").text(start_date);
					$("#" + planner_id + " .end_date").text(end_date);
					$("#" + planner_id + " div .planner-text-area").css("display", "");
					$("#" + planner_id + " div .planner-modify-area").css("display", "none");
				},
				error : function(e) {
					console.log(e);
					alert("에러가 발생했습니다.");
				}
			});
		}
	}
	
	$(document).ready(function() {
		$(".input-end").click(function() {
			$(this).siblings(".input-start").focus();
		})
	});
	
</script>

</head>
<body>
	<!-- Header -->
	<%@ include file="/WEB-INF/views/includes/header.jsp"%>
	<!--Content -->
	<div id="wrap">
		<div class="container">
			<h2 class="headline">MY PLANNER</h2>
			<br>
			<div class="cal">
				<%@ include file="/WEB-INF/views/calendar/calendar3.jsp"%>
			</div>
			<br><br><br><br>
			
			<div class="row">
				<c:forEach var="planner" items="${plannerList }">
					<div class="col-md-4" id="${planner.planner_id }">
						<div class="planner-area" >
							<img class="card-pl-img" src="/resources/img/planner/${ planner.planner_img_path}"  onclick="selectPlanner(${planner.planner_id})" onerror="this.src='/resources/img/profile/gada'">
							<div class="planner-text-area">
								<strong class="planner_name">${planner.planner_name }</strong>&nbsp; 
								<span class="badge dday">
									D - <c:out value="${DDayMap[planner.planner_id] }" />
								</span>
								<br><br>
								<span class="start_date">${planner.start_date }</span> ~ <span class="end_date">${planner.end_date }</span>
								<div class="gada-btn-group">
									<button type="button" class="btn gada-btn-reverse" onclick="modifyPlanner(${planner.planner_id})">수정</button>
									<button type="button" class="btn gada-btn" onclick="deletePlanner(${planner.planner_id})">삭제</button>
								</div>
							</div>
							<div class="planner-modify-area" style="display:none">
								<form>
									<input name="planner_name" type="text" value="${planner.planner_name }" class="planner-modify-input-name"/>
									<br><br>
									<input name="start_date" type="text" placeholder="YYYY/MM/DD" class="planner-modify-input-cal input-start" autocomplete="off"/> ~ 
									<input name="end_date" type="text" placeholder="YYYY/MM/DD" class="planner-modify-input-cal input-end" autocomplete="off"/>
									<div class="gada-btn-group">
										<button type="button" class="btn gada-btn-reverse" onclick="cancelModify(${planner.planner_id})">취소</button>
										<button type="button" class="btn gada-btn" onclick="submitModify(${planner.planner_id})">확인</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<!-- Footer -->
	<%@ include file="/WEB-INF/views/includes/footer.jsp"%>
	
	<script src="resources/calendar/datepicker/moment.min.js"></script>
    <script src="resources/calendar/datepicker/daterangepicker.js"></script>
    <script src="resources/calendar/js/global.js"></script>
</body>
</html>