<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login Form</title>
</head>
<body>
<div class="container">
	<h1>Login Form</h1>
		<form action="/member/login" method="POST">
			<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
			<div class="form-group">
				<label for="id">아이디:</label>
				<input type="text" class="form-control" placeholder="ID" id="id" name="username"/>
			</div>
			<div class="form-group">
				<label for="pw">비밀번호:</label>
				<input type="password" class="form-control" placeholder="Password" id="pw" name="password"/>
			</div>
			<button type="submit" class="btn btn-primary" id="btnSubmit">로그인</button>
		</form>
</div>
</body>
</html>