<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@700;800&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="${contextPath}/resources/css/main.css">
<link rel="stylesheet" href="${contextPath}/resources/css/font.css">
<link rel="stylesheet" href="${contextPath}/resources/css/header.css">
<link rel="stylesheet" href="${contextPath}/resources/css/footer.css">
<link rel="stylesheet" href="${contextPath}/resources/css/utils.css">
<title>Insert title here</title>
<style>
	body {
		padding: 0;
		background-color: #f5f5f5;
		overflow-y: hidden;
		font-family: 'Noto Sans KR', sans-serif;
	}
	
	.header {
		background: linear-gradient(103deg, rgb(29, 202, 211) 0%, rgb(29, 202, 211) 50%, rgb(29, 160, 211)) 100% center;
		box-shadow: rgb(0 0 0 / 10%) 0px 4px 6px 0px;
		color: #ffffff;
		font-size: 30px;
		height: 60px;
		line-height: 50px;
		position: fixed;
		z-index: 1;
	}
	
	#chatting {
		border: 0 !important;
	}
	
	#yourMsg {
		height: 55px;
		line-height: 55px;
		background: #ffffff;
		border-top: 1px solid #E8EBED;
	}
	
	#notice {
	  	position: relative;
		background: #ffffff;
		padding: 10px;
		border-radius: 10px;
		margin-bottom: 20px;
	}
	
	#notice:after {
		top: 100%;
		left: 50%;
		border: solid transparent;
		content: "";
		height: 0;
		width: 0;
		position: absolute;
		pointer-events: none;
		border-top-color: #ffffff;
		border-width: 15px;
		margin-left: -15px;
	}
	
	#chating .me {
		text-align: right;
		position: relative;
		background: #1DCAD3;
		padding: 6px;
		color: #ffffff;
	}
	
	#chating .me:after {
		left: 100%;
		top: 50%;
		border: solid transparent;
		content: "";
		height: 0;
		width: 0;
		position: absolute;
		pointer-events: none;
		border-left-color: #1DCAD3;
		border-width: 7px;
		margin-top: -7px;
	}
	
	#chating .others {
		text-align: left;
		position: relative;
		background: #ffffff;
		padding: 6px;
		color: #000000;
	}
	
	#chating .others:after {
		right: 100%;
		top: 50%;
		border: solid transparent;
		content: "";
		height: 0;
		width: 0;
		position: absolute;
		pointer-events: none;
		border-right-color: #ffffff;
		border-width: 7px;
		margin-top: -7px;
	}
	
	#chating {
		height: 500px;
		overflow: scroll;
		overflow-x: hidden;
	}
	
	.button-group {
		margin-top: 7px;
		text-align: center;
	}
	
</style>
<script type="text/javascript">
	var ws;
	
	function wsOpen(){
		//????????? ????????? ?????? ?????? ????????? ????????? ?????????.
		ws = new WebSocket("ws://" + location.host + "/chatting/"+$("#username").val());
		wsEvt();
	}
		
	function wsEvt() {
		ws.onopen = function(data){
			//????????? ????????? ??????
			$("#chating").append("<br><br><br><div id='notice'><em style='font-size: 17px;'>??????????????? ?????????!<br>"
					+ "?????? ???????????? ???????????? ????????? ?????? ???????????????.</em><br>"
					+ "<hr><strong>??????????????????</strong><br>?????? 10:00~17:00<br>?????? 12:00~13:00<br>?????? ???, ???, ?????????<hr>"
					+ "??????????????? ?????????????????? ????????? ??????????????????.<br>"
					+ "<div class='button-group'><button type='button' class='btn gada-btn' onclick='typing(this)'>1.?????? ??????</button>&nbsp;"
					+ "<button type='button' class='btn gada-btn' onclick='typing(this)'>2.?????? ??????</button>&nbsp;"
					+ "<button type='button' class='btn gada-btn' onclick='typing(this);connect();'>3.????????? ??????</button></div>"
					+ "</div><img src='/resources/img/icon/chatting.png' style='margin-bottom: 10px;'>");
		}
		
		ws.onmessage = function(data) {
			//???????????? ????????? ??????
			var msg = data.data;
			if(msg != null && msg.trim() != ''){
				var d = JSON.parse(msg);
				if(d.type == "getId"){
					var si = d.sessionId != null ? d.sessionId : "";
					if(si != ''){
						$("#sessionId").val(si); 
					}
				}else if(d.type == "message"){
					if(d.sessionId == $("#sessionId").val()){
						$("#chating").append("<p class='me'>??? :" + d.msg + "</p>");	
					}else{
						$("#chating").append("<p class='others'>" + d.username + " :" + d.msg + "</p>");
					}
						
				}else{
					console.warn("unknown type!")
				}
			}
		}
	
		document.addEventListener("keypress", function(e){
			if(e.keyCode == 13){ //enter press
				send();
			}
		});
	}
	
	function send() {
		var option ={
			type: "message",
			sessionId : $("#sessionId").val(),
			username : "${username}",
			msg : $("#chatting").val()
		}
		ws.send(JSON.stringify(option))
		$('#chatting').val("");
	}
	
	$(document).ready(function() {
		wsOpen();
	})
</script>
</head>
<body>
	<div id="container" class="container">
		
		<input type="hidden" id="sessionId" value="">
		<input type="hidden" id="username" value="${username}">
		
		<div class="row">
			<div class="col-md-12 header">
				<img class="nav-logo-img" src="/resources/img/main/logo.png" style="height: 25px;">
				<h5 style="font-family:yg-jalnan; display: inline;">??????</h5>
			</div>
			<div class="col-md-12" id="chating">
			</div>
			<div class="col-md-12" id="yourMsg">
				<table class="inputTable">
					<tr>
						<th style="color: #242428;">?????????&nbsp;</th>
						<th style="width: 345px;"><input id="chatting" class="form-control" placeholder="????????? ???????????? ???????????????."></th>
						<th>&nbsp;<button onclick="send()" class="btn gada-btn-reverse" id="sendBtn" style="margin-bottom: 4px;">?????????</button></th>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>