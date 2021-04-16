<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 완료</title>

	<!-- CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footer.css">
	
	<!-- Bootstrap -->
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"></script>
	
	<!-- Font Awesome -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
	
	<style>
	  .headline-order-complete {
	    font-size: 25px;
	    font-weight: 700;
	    color: #39B54A;
	  }
	  
	  html, body {
		background-color: #f5f5f5 !important; 
	  }
	  
	  .order-complete-area {
	      min-height: 813px;
	      background-color: #ffffff;
		  border-radius: 10px;
		  padding: 20px;
	  }
	  
	  .order-product {
	    text-align: center;
	    width: 100%;
	    border-spacing: 2px;
   		border-color: grey;
	  }
	  
	  .view-detail {
	    float: right; 
	    text-decoration: underline;
	  }
	  
	  .view-detail:hover {
	    cursor: pointer;
	  }
	  
	  .product-img {
	    width: 100px;
	    height: 100px;
	  }
	  
	</style>
</head>
<body>

	<%@ include file="/WEB-INF/views/includes/header.jsp" %>

	<div class="container order-complete-area">
	<h1 class="headline-order-complete"><i class="fas fa-check-circle fa-lg"></i>&nbsp;결제가 완료되었습니다</h1>
	<br>
	<p>주문 번호: ${buy_id}</p>
	<jsp:useBean id="now" class="java.util.Date"/>
	<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today"/>
	<p>주문 일자: ${today}</p>
	<p>결제 방법: 카드</p>
	<p class="view-detail" onclick="location.href='/shopping/buy_list/${buy_id}'">상세 보기</p>
	<table class="table order-product">
	<thead>
	  <tr>
	    <th>상품명</th>
	    <th>수량</th>
	    <th>상품금액</th>
	    <th>배송비</th>
	  </tr>
	</thead>
	<c:set var="totalPrice" value="0"/>
	<c:forEach items="${payResultInformation}" var="info">
	<tbody>
	  <tr>
	    <td>${info.product_name}</td>
	    <td>${info.quantity}</td>
	    <td>${info.price}</td>
	    <td>0</td>
	  </tr>
	</tbody>
	<c:set var="totalPrice" value="${totalPrice + (info.price * info.quantity)}"/>
	</c:forEach>
	<tr>
	<td>총 금액</td>
	<td><c:out value="${totalPirce}"/></td>
	</tr>
	</table>
	</div>
	
	<%@ include file="/WEB-INF/views/includes/footer.jsp"%>
	
</body>
</html>