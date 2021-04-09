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
<title>Insert title here</title>
<style>
	body {
		padding: 0;
	}
	
	#chating .me{
		text-align: right;
	}
	
	#chating .others{
		text-align: left;
	}
	
	#chating {
		height: 500px;
		overflow: scroll;
	}
</style>
<script type="text/javascript">
	var ws;
	var username = "${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}";
	
	function wsOpen() {
		ws = new WebSocket("ws://" + location.host + "/chatting/" + username);
		wsEvt();
	}
	
	function wsEvt() {
		ws.onopen = function(data) {
			//소켓이 열리면 초기화 세팅하기
			$("#chating").append("<p class='others'>안녕하세요 고객님!</p>");
			$("#chating").append("<p class='others'>저는 고객님의 궁금증을 해결해 드릴 챗봇입니다.</p>");
			$("#chating").append("<p class='others'>▶상담운영시간</p>");
			$("#chating").append("<p class='others'>평일/ 10:00~17:00</p>");
			$("#chating").append("<p class='others'>점심/ 12:00~13:00</p>");
			$("#chating").append("<p class='others'>휴무/ 토,일,공휴일</p>");
			$("#chating").append("<p class='others'>문의사항을 선택하시거나 번호를 입력해주세요.</p>");
			$("#chating").append("<button type='button' onclick='typing(this)'>1.여행 문의</button>");
			$("#chating").append("<button type='button' onclick='typing(this)'>2.상품 문의</button>");
			$("#chating").append("<button type='button' onclick='typing(this);connect();'>3.상담원 연결</button>");
		}
	
		ws.onmessage = function(data) {
			//메시지를 받으면 동작
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
						$("#chating").append("<p class='me'>나 :" + d.msg + "</p>");	
					}else{
						$("#chating").append("<p class='others'>관리자 :" + d.msg + "</p>");
					}
						
				}else{
					console.warn("unknown type!")
				}
				$("#chating").scrollTop($("#chating")[0].scrollHeight);
			}
		}
	
		document.addEventListener("keypress", function(e) {
			if (e.keyCode == 13) { //enter press
				send();
			}
		});
	}
	
	function send() {
		var option ={
			type: "message",
			sessionId : $("#sessionId").val(),
			username : username,
			msg : $("#chatting").val()
		}
		ws.send(JSON.stringify(option))
		$('#chatting').val("");
	}
	
	function connect() {
		$.ajax({
			url: "/room",
			type: "POST",
			cache: false,
			beforeSend : function(xhr){
		            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(result) {
				
			},
			error : function(e) {
				console.log(e);
			}
		});
		
		var data = {
				type : "alert",
				sessionId : $("#sessionId").val(),
				username : username,
				msg : "enter"
		}
		ws.send(JSON.stringify(data));
	}
	
	function typing(obj) {
		var text = $(obj).text();
		var option = {
				type : "message",
				sessionId : $("#sessionId").val(),
				username : username,
				msg : text
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
	<div class="container">
		<input type="hidden" id="sessionId" value="">
		<input type="hidden" id="username" value="${username}">
		<div class="row">
			<div class="col-md-12 header">
				<img class="nav-logo-img" src="/resources/img/main/logo.png">
				<h5 class="" style="font-family:yg-jalnan;">가다</h5>
				<button type="button"><i class="fas fa-times"></i></button>
			</div>
			<div class="col-md-12" id="chating">
			</div>
			<div class="col-md-12" id="yourMsg">
				<table class="inputTable">
					<tr>
						<th>메시지</th>
						<th><input id="chatting" placeholder="보내실 메시지를 입력하세요."></th>
						<th><button onclick="send()" id="sendBtn">보내기</button></th>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>