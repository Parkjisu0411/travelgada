<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>chat-icon</title>
<style>
	#chat-icon {
		position: fixed;
		bottom:20px;
		right: 20px;
	}
	
	#chat-icon:hover {
		cursor: pointer;
	}
	
	#chat-icon:hover > #arrow-box {
		opacity: 1;
	}
	
	#arrow-box {
		opacity: 0;
		width: 100%;
		height: 30px;
		line-height: 30px;
		position: relative;
		background: #000000;
		color: #ffffff;
		text-align: center;
		border-radius: 5px;
		font-size: 15px;
		margin-bottom: 6px;
	}
	
	#arrow-box:after {
		top: 100%;
		left: 50%;
		border: solid transparent;
		content: "";
		height: 0;
		width: 0;
		position: absolute;
		pointer-events: none;
		border-top-color: #000000;
		border-width: 5px;
		margin-left: -5px;
	}
	
</style>
<script type="text/javascript">
	function openChat() { 
		window.open("/chat", "${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}", "width=400px, height=435px");
	}
</script>
</head>
<body>
	<div id="chat-icon" onclick="openChat()">
	<div id="arrow-box">챗봇</div>
		<img src="/resources/img/icon/Red.png" style="height:60px;">
	</div>
</body>
</html>