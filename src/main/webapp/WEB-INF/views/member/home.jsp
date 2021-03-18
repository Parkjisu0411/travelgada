<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Home</title>
</head>

<body>
	<div class="container">
		<h1>Home</h1>
		<sec:authorize access="isAnonymous()">
			<a href="/member/login">로그인</a>
			<a href="/member">회원가입</a>
		</sec:authorize>
		<sec:authorize access="isAuthenticated()">
			<%-- <sec:authentication property="principal.username" var="member_id"/> --%>
			<form action="/member/logout" method="POST">
				<%-- <h3>${member_id }님 환영합니다.</h3> --%>
				<input name="${_csrf.parameterName}" type="hidden"
					value="${_csrf.token}" /> <input type="submit" value="로그아웃" />
			</form>
			<p>
				<a href="">유저정보</a>
			</p>
		</sec:authorize>


	</div>
</body>
</html>