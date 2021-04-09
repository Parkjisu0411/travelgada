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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login Form</title>
<style>
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
</style>
<script type="text/javascript">
	$(document).ready(function() {
		var totalProduct = 0;
		var totalDiscount = 0;
		var totalPayment = 0;
		
		$(".product-price").each(function() {
			totalProduct += parseInt($(this).text().substr(2, $(this).text().length));
		})
		
		$(".point-amount").each(function() {
			if($(this).text()) {
				totalDiscount += parseInt($(this).text());				
			}
		})
		
		$(".payment-price").each(function() {
			totalPayment += parseInt($(this).text());
		})
		$(".total-product").html(totalProduct);
		$(".total-discount").html("- " + totalDiscount);
		$(".total-payment").html(totalPayment);
	})
</script>
</head>
<body>
	<!-- Header -->
	<%@ include file="/WEB-INF/views/includes/header.jsp"%>
	<!--Content -->
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="buy-header-area">
					<h3 style="font-family:'yg-jalnan'">주문 상세 내역</h3>
				</div>
				<div class="divider-header-blank"></div>
				<div class="buy-list-area">
					<div class="buy-info-area">
						<span>주문번호</span>&nbsp;
						<strong>${buy.buy_id }</strong>&nbsp;&nbsp;
						<span>주문일자</span>&nbsp;
						<strong><fmt:formatDate value="${buy.buy_date }" pattern="yyyy.MM.dd"/></strong>
					</div>
					<table class="table">
						<thead>
							<tr>
								<th>상품정보</th>
								<th>적립금</th>
								<th>포인트 사용</th>
								<th>주문금액</th>
								<th>주문상태</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="buyDetail" items="${buyDetailList }">
								<tr>
									<td>
										<img class="product-img rounded" src="/resources/img/product/${productMap[buyDetail.buy_detail_id].img_path }" />
										<div class="product-info">
											<strong>${buyDetail.product_name }</strong>
											<p class="product-price">₩ ${productMap[buyDetail.buy_detail_id].price }</p>
										</div>
									</td>
									<td>${buyDetail.price / 20 }</td>
									<td class="point-amount"></td>
									<td class="payment-price">${buyDetail.price }</td>
									<td>
										<p>구매 확정</p>
										<button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#shipping-check">배송조회</button>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<hr/>
					<p>동일한 주문번호라도 2개 이상의 브랜드에서 주문하신 경우 출고지 주소가 달라 각각 출고됩니다. (택배 박스를 2개 이상 수령 가능)</p>
					<p>출고 완료 직후 교환 / 환불 요청을 하더라도 상품을 수령하신 후 택배 업체를 통해 보내주셔야 처리 가능합니다.</p>
					<div class="divider-header-blank"></div>
				</div>
			</div>
			<div class="col-md-6">
				<table class="table">
					<thead>
						<tr><th colspan="2">배송지 정보</th></tr>
					</thead>
					<tbody>
						<tr>
							<th>이름</th>
							<td>${shoppingLoc.receiver }</td>
						</tr>
						<tr>
							<th>연락처</th>
							<td>${shoppingLoc.receiver_phone_num }</td>
						</tr>
						<tr>
							<th>배송지 주소</th>
							<td>(${shoppingLoc.zip_code}) ${shoppingLoc.address } ${shoppingLoc.address_detail }</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="col-md-6">
				<table class="table">
					<thead>
						<tr><th colspan="2">최종 결제 정보</th></tr>
					</thead>
					<tbody>
						<tr>
							<th>상품 합계</th>
							<td class="total-product"></td>
						</tr>
						<tr>
							<th>할인 합계</th>
							<td class="total-discount"></td>
						</tr>
						<tr>
							<th>최종 결제금액</th>
							<td class="total-payment"></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<!-- Footer -->
	<%@ include file="/WEB-INF/views/includes/footer.jsp"%>
	
	<!-- 배송조회 모달 -->
	<div class="modal fade" id="shipping-check">
    	<div class="modal-dialog">
			<div class="modal-content">
				<iframe src="https://tracker.delivery/#/kr.hanjin/${buy.waybill_num }"></iframe>
			</div>
		</div>
	</div>
</body>
</html>