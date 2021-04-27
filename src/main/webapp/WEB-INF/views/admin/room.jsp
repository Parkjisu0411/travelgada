<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="en">
<head>

	<meta charset="utf-8"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>

	<meta charset="UTF-8">
	<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
	<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>
  
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-date-range-picker/0.21.1/daterangepicker.min.css" integrity="sha512-nmvKZG8E3dANbZAsJXpdK6IqpfEXbPNbpe3M3Us1qTipq74IpTRShbpCf8lJFapB7e0MkDbNDKxLjS1VWt2vVg==" crossorigin="anonymous" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-date-range-picker/0.21.1/jquery.daterangepicker.min.js" integrity="sha512-jM36zj/2doNDqDlSIJ+OAslGvZXkT+HrtMM+MMgVxCqax1AIm1XAfLuUFP7uMSavUxow+z/T2CRnSu7PDaYu2A==" crossorigin="anonymous"></script>
    	
	<!-- simplebar CSS-->
 	<link href="/resources/assets/plugins/simplebar/css/simplebar.css" rel="stylesheet"/>
	<!-- Bootstrap core CSS-->
	<link href="/resources/assets/css/bootstrap.min.css" rel="stylesheet"/>
	<!-- Icons CSS-->
	<link href="/resources/assets/css/icons.css" rel="stylesheet" type="text/css"/>
	<!-- Sidebar CSS-->
	<link href="/resources/assets/css/sidebar-menu.css" rel="stylesheet"/>
	<!-- Custom Style-->
	<link href="/resources/assets/css/app-style.css" rel="stylesheet"/>
  
  	<link rel="stylesheet" href="${contextPath}/resources/css/font.css">
	<link rel="stylesheet" href="${contextPath}/resources/css/footer.css">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	<!-- Bootstrap core JavaScript-->
	<script src="/resources/assets/js/jquery.min.js"></script>
	<script src="/resources/assets/js/popper.min.js"></script>
	<script src="/resources/assets/js/bootstrap.min.js"></script>
	
	<!-- Font Awesome -->
	<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
	
	<link rel="shortcut icon" type="image/x-icon" href="/resources/img/main/logo.png">
  
	<title>회원 관리</title>
  
<style>
/* 탈퇴된 경우 */
  	.selected {
	  	text-decoration:line-through grey;
	  	color: red;
  	}
/* 검색 창 */
 	#searchMember{
		text-align: right;
	}
/* 모달 색깔 */
	.bg-modal{
		background-color : black;
	}

/* 검색 글자 색*/
	#memberKeyword{
		color : white;
	}
</style>
<script type="text/javascript">
	var ws;
	
	$(document).ready(function() {
		getRoom();
		wsOpen();
	})
	
	function chatCount() {
		$("#chat-count").html($("#chat-table tr").size() - 1);
	}
	
	function getRoom(){
		$.ajax({
			url: "/room/list",
			type: "get",
			success: function(result) {
				if($(result).length) {
					var content = "<tr><th class='room'>유저 아이디</th><th class='go'></th></tr>";
					$(result).each(function() {
						content += "<tr id='" + this + "'>";
						content += "	<td class='room'>" + this + "</td>";
						content += "	<td class='go'><button type='button' class='btn-light btn-round px-5' onclick='join(\"" + String(this) + "\")'>참여</button></td>";
						content += "</tr>";
					})
					$("#chat-table").empty().append(content);
					chatCount();
				}
			},
			error: function(e) {
				console.log(e);
			}
		});
	}
	
	function wsOpen() {
		ws = new WebSocket("ws://" + location.host + "/chatting/admin");
		wsEvt();
	}
	
	function wsEvt() {
		ws.onopen = function(data) {
		}
	
		ws.onmessage = function(data) {
			//메시지를 받으면 동작
			var msg = data.data;
			console.log(msg);
			if(msg != null && msg.trim() != ''){
				var d = JSON.parse(msg);
				if(d.type == "getId"){
					var si = d.sessionId != null ? d.sessionId : "";
					if(si != ''){
						$("#sessionId").val(si); 
					}
				}else if(d.type == "alert"){
					if(d.msg == "enter") {
						if(d.sessionId == $("#sessionId").val()){
						}else{
							var content = "";
							content += "<tr id=" + d.username + ">";
							content += "	<td class='room'>" + d.username + "</td>";
							content += "	<td class='go'><button type='button' class='btn-light btn-round px-5' onclick='join(\"" + d.username + "\")'>참여</button></td>";
							content += "</tr>";
							$("#chat-table").append(content);
							chatCount();
						}
					} else {
						$("#" + d.username).remove();
						chatCount();
					}
					
						
				}else{
					console.warn("unknown type!")
				}
			}
		}
	}
	
	function join(username){
		window.open("/chat/" + username, username, "width=400px, height=600px");
	}
</script>
</head>

<body class="bg-theme bg-theme9">

	<!-- Start wrapper-->
 	<div id="wrapper">
		
		<!--Start sidebar-wrapper-->
		<div id="sidebar-wrapper" data-simplebar="" data-simplebar-auto-hide="true">
			<div class="brand-logo">
				<a href="/" style="font-family:yg-jalnan"><img src="/resources/img/main/logo.png" class="logo-icon" alt="logo icon">가다</a>
			</div>
   				<ul class="sidebar-menu do-nicescrol">
      				<li>
        				<a href="/admin">
          					<i class="fas fa-user-cog"></i> <span>회원 관리</span>
        				</a>
      				</li>
      				<li>
        				<a href="/admin/room">
          					<i class="fas fa-comment-dots"></i> <span>1:1 채팅 문의</span>
        				</a>
      				</li>
					<li>
						<a href="/visitor">
							<i class="fas fa-chart-line"></i> <span>방문자 통계</span>
						</a>
					</li>
					<li>
						<a href="/statistic/sales">
							<i class="fas fa-hand-holding-usd"></i> <span>매출 통계</span>
						</a>
					</li>
					<li>
						<a href="/statistic/destination">
							<i class="fas fa-globe-americas"></i> <span>여행지 통계</span>
						</a>
					</li>
				</ul>
		</div>
		<!--End sidebar-wrapper-->
	
		<div class="content-wrapper">
			<div class="container-fluid">
			
			<span class="headline" style="font-family: 'yg-jalnan'; font-size:30px;">
				<a href="/admin/room">1:1 채팅 문의</a>
			</span> &nbsp; 
	
				<!-- chat list 테이블 -->
				<div class="row mt-3">
					<div class="col-lg-12">
						<div class="card">
							<div class="card-body">
              					<div class="table-responsive">
              						<span style="color:white;">채팅방 수 : </span>
              						<span style="color:white" id="chat-count"></span>
									<table class="table" id="chat-table">
									</table>
			     				</div>
            				</div>
          				</div>
          			</div>
          		</div>	
				<!-- chat list 테이블 end -->
			</div><!-- content-wrapper end -->
		</div><!-- container-fluid end-->

	<!--start color switcher - 색깔 바꾸기 -->
	<div class="right-sidebar">
		<div class="switcher-icon">
			<i class="zmdi zmdi-settings zmdi-hc-spin"></i>
		</div>
		<div class="right-sidebar-content">
	
			<p class="mb-0">Gaussion Texture</p>
			<hr>
	      
			<ul class="switcher">
				<li id="theme1"></li>
				<li id="theme2"></li>
				<li id="theme3"></li>
				<li id="theme4"></li>
				<li id="theme5"></li>
				<li id="theme6"></li>
			</ul>
	
			<p class="mb-0">Gradient Background</p>
			<hr>
		
			<ul class="switcher">
				<li id="theme7"></li>
				<li id="theme8"></li>
				<li id="theme9"></li>
				<li id="theme10"></li>
				<li id="theme11"></li>
				<li id="theme12"></li>
				<li id="theme13"></li>
				<li id="theme14"></li>
				<li id="theme15"></li>
			</ul>
		</div>
	</div>
	<!--end color switcher - 색깔 바꾸기 -->
	
	</div><!--End wrapper-->
  
</body>

</html>
