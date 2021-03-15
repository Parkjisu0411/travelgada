<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	<button type="button" class="btn btn-info">일정</button>
	<div class="container">
    <table class="table table-hover"  width="100%" cellspacing="0">
    	<tr>
			<td>준비물</td>
			<td>완료 상태</td>
			<td>카테고리</td>				
		</tr>
    
		<c:forEach items="${todolist }" var="todo">
			<tr>
				<td>${todo.todo_name }</td>
				<td>${todo.complete_flag }</td>
				<%-- <td>${todo.todo_title }</td> --%>
						
			</tr>	
		</c:forEach>
	</table>
</body>
</html>