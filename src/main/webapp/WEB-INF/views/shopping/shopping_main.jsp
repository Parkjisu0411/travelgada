<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- bootstrap -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!-- font -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@700;800&display=swap" rel="stylesheet">
<!-- GADA CSS -->
<link rel="stylesheet" href="${contextPath}/resources/css/main.css">
<link rel="stylesheet" href="${contextPath}/resources/css/font.css">
<link rel="stylesheet" href="${contextPath}/resources/css/header.css">
<link rel="stylesheet" href="${contextPath}/resources/css/footer.css">
<meta charset="UTF-8">
<title>Schedule</title>
<style>
	.product-img {
		width: 100%;
		
	}
	
	.product-img:after {
		padding-bottom: 100%;
	}
	
	.product-img > img {
		max-width: 100%;
		height: 250px;
		display: block;
	}
</style>
</head>
<body>

	<!-- Header -->
	<%@ include file="/WEB-INF/views/includes/header.jsp"%>
	
	<div class="container">
	
		<!-- headline -->
		<h2 style="font-family: 'yg-jalnan'">Shopping</h2>
		<!-- Product List -->
		<div class="row">
			<c:forEach var="product" items="${productList }">
				<div class="col-md-3">
					<div class="product-img"><img src="/resources/img/product/${product.img_path }"></div>
					<div class="product-info">
						<strong>${product.product_name }</strong>
						<p>${product.price }</p>
					</div>
				</div>
			</c:forEach>
		</div>
		
	</div>
	
	<!-- Footer -->
	<%@ include file="/WEB-INF/views/includes/footer.jsp"%>
</body>
</html>