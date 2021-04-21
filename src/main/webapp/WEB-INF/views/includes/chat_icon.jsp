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
</style>
<script type="text/javascript">
	function openChat() { 
		window.open("/chat", "${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}", "width=400px, height=430px");
	}
</script>
</head>
<body>
	<div id="chat-icon" onclick="openChat()">
		<img src="/resources/img/icon/Red.png" style="height:60px;">
	</div>
</body>
</html>