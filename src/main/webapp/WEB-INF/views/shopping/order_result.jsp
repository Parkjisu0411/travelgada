<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 완료</title>
</head>
<body>
	<h1>결제가 완료되었습니다.</h1><br>
	
	<table>
	<thead>
	  <tr>
	    <th>상품명</th>
	    <th>수량</th>
	    <th>상품금액</th>
	    <th>배송비</th>
	  </tr>
	</thead>
	<c:forEach items="${payResultInformation}" var="info">
	<tbody>
	  <tr>
	    <td>${info.product_name}</td>
	    <td>${info.quantity}</td>
	    <td>${info.price}</td>
	    <td>0</td>
	  </tr>
	</tbody>
	</c:forEach>
	</table>
</body>
</html>