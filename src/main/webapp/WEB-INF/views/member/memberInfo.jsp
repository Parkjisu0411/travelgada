<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Member Info</title>
</head>
<body>
<div class="container">
	<h1>Member Info</h1>
	<table class="table">
		<thead class="thead-dark">
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>이메일</th>
				<th>휴대폰</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>${memberInfo.member_id}</td>
				<td>${memberInfo.member_name}</td>
				<td>${memberInfo.email}</td>
				<td>${memberInfo.phone_num}</td>
			</tr>
		</tbody>
	</table>
</div>
</body>
</html>