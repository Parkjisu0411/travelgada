<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@700;800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${contextPath}/resources/css/main.css">
<link rel="stylesheet" href="${contextPath}/resources/css/font.css">
<link rel="stylesheet" href="${contextPath}/resources/css/header.css">
<link rel="stylesheet" href="${contextPath}/resources/css/footer.css">
<link rel="stylesheet" href="${contextPath}/resources/css/utils.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login Form</title>
<style>
	body {
		font-family: 'IBMPlexSansKR-Light';
	}
	
	hr {
		background-color: #1DCAD3;
	}
	
	.buy-list-area {
		margin-bottom: 20px;
	}
	
	.buy-info-area {
		margin-bottom: 10px;
	}
	
	.buy-info-area strong {
		color: #1DCAD3;
	}
		
	.product-img {
		height: 100px;
		width: 100px;
		display: inline-block;
		vertical-align: middle;
		margin-right: auto;
	}
	
	.product-info {
		display: inline-block;
	}
	
	iframe {
		height: 600px;
	}
	
	.info {
		color: gray;
		margin: 0;
		padding: 0;
	}
	
	table {
		width: 100%;
	}
	
	table thead {
		text-align: center;
	}
	
	.gada-link:hover {
		color: #1DCAD3;
		cursor: pointer;
	}
	
</style>
<script type="text/javascript">
	$(document).ready(function() {
		var totalProduct = 0;
		var totalDiscount = 0;
		var totalPayment = 0;
		
		$(".product-price").each(function() {
			totalProduct += parseInt($(this).text().substr(2, $(this).text().length));
		})
		totalDiscount = (totalProduct - ${buy.paid_amount});
		totalPayment = ${buy.paid_amount};
		
		$(".total-product").html(totalProduct);
		$(".total-discount").html("- " + totalDiscount);
		$(".total-payment").html(totalPayment);
	})
	
	function viewDetail(product_id) {
		location.href = "/shopping/" + product_id;
	}
</script>
</head>
<body>
	<!-- Header -->
	<%@ include file="/WEB-INF/views/includes/header.jsp"%>
	<!--Content -->
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h3 class="gada-headline">BUY DETAIL</h3>
				<hr />
				<div class="buy-list-area gada-card">
					<div class="buy-info-area">
						<span>????????????</span>&nbsp;
						<strong>${buy.buy_id }</strong>&nbsp;&nbsp;&nbsp;&nbsp;
						<span>????????????</span>&nbsp;
						<strong><fmt:formatDate value="${buy.buy_date }" pattern="yyyy.MM.dd"/></strong>
					</div>
					<table class="table-borderless">
						<thead>
							<tr>
								<th>????????????</th>
								<th>?????????</th>
								<th>????????????</th>
								<th>????????????</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="buyDetail" items="${buyDetailList }">
								<tr>
									<td>
										<img class="product-img rounded" src="/resources/img/product/${productMap[buyDetail.buy_detail_id].img_path }" />
										<div class="product-info">
											<strong class="gada-link" onclick="viewDetail(${productMap[buyDetail.buy_detail_id].product_id})">${buyDetail.product_name }</strong>
											<p class="product-price">??? ${productMap[buyDetail.buy_detail_id].price }</p>
										</div>
									</td>
									<fmt:parseNumber var="accumulatePoint" value="${buyDetail.price / 20 }" integerOnly="true"/>
									<td>${accumulatePoint}</td>
									<td class="payment-price">${buyDetail.price }</td>
									<td style="text-align: center;">
										<button type="button" class="btn gada-btn" data-toggle="modal" data-target="#shipping-check">????????????</button>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<br />
					<p class="info">????????? ?????????????????? 2??? ????????? ??????????????? ???????????? ?????? ????????? ????????? ?????? ?????? ???????????????. (?????? ????????? 2??? ?????? ?????? ??????)</p>
					<p class="info">?????? ?????? ?????? ?????? / ?????? ????????? ???????????? ????????? ???????????? ??? ?????? ????????? ?????? ??????????????? ?????? ???????????????.</p>
				</div>
			</div>
			<div class="col-md-6">
				<div class="gada-card">
					<table class="table-borderless">
						<colgroup>
							<col width="30%" />
							<col width="70%" />
						</colgroup>
						<thead>
							<tr><th colspan="2">????????? ??????</th></tr>
						</thead>
						<tbody>
							<tr>
								<th>??????</th>
								<td>${shoppingLoc.receiver }</td>
							</tr>
							<tr>
								<th>?????????</th>
								<td>${shoppingLoc.receiver_phone_num }</td>
							</tr>
							<tr>
								<th>????????? ??????</th>
								<td>(${shoppingLoc.zip_code}) ${shoppingLoc.address } ${shoppingLoc.address_detail }</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="col-md-6">
				<div class="gada-card">
					<table class="table-borderless">
						<colgroup>
							<col width="30%" />
							<col width="70%" />
						</colgroup>
						<thead>
							<tr><th colspan="2">?????? ?????? ??????</th></tr>
						</thead>
						<tbody>
							<tr>
								<th>?????? ??????</th>
								<td class="total-product"></td>
							</tr>
							<tr>
								<th>????????? ??????</th>
								<td class="total-discount"></td>
							</tr>
							<tr>
								<th>?????? ????????????</th>
								<td class="total-payment"></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<!-- Footer -->
	<%@ include file="/WEB-INF/views/includes/footer.jsp"%>
	
	<!-- ???????????? ?????? -->
	<div class="modal fade" id="shipping-check">
    	<div class="modal-dialog">
			<div class="modal-content">
				<iframe src="https://tracker.delivery/#/kr.hanjin/${buy.waybill_num }"></iframe>
			</div>
		</div>
	</div>
</body>
</html>