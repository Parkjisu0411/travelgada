<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 

<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<title>결제</title>

	<style>
	
		html, body {
			background-color: #f5f5f5 !important; 
		}
		
		.order-area {
		  background-color: #ffffff;
		  border-radius: 10px;
		  padding-left: 30px;
		}

		/* Common */
		.information-headline {
			font-size: 25px;
			margin: 0px;
			font-weight: 700;
		}

		/* Content */
		.select-shipping-loc {
		  text-decoration: underline !important;
		}
		
		.input-information {
		    border-radius: 30px !important;
		    height: 40px !important;
		    width: 510px !important;
		}
		
		.col-md-8.content {
		  padding: 20px !important;
		}
		
		.product-img {
			width: 100%;
			height: 127px;
			border-radius: 8px;
			object-fit: cover;
		}

		.price {
			text-align: right;
		}

		.tab-content {
			margin-top: 20px;
		}

		label {
			margin: 0px !important;
		}

		.shipping-loc-area {
			margin-bottom: 5px;
		}

		.shipping-loc-list {
			text-align: center;
			width: 100%;
			height: 100%;
		}

		/* Widget */
		.widget {
			border: 1px solid rgb(221, 221, 221);
			border-radius: 12px;
			padding: 24px !important;
		}

		.widget-product-information {
			margin: 20px;
		}

		.product-name {
			width: 100%;
			height: 100%;
		}

		.product-area {
			height: 400px;
			overflow: scroll;
			overflow-x: hidden;
		}

		.total-price {
			float: right;
		}

		.use-point {
			float: right;
		}

		.payment-amount {
			float: right;
		}

		.shipping-fee {
			float: right;
		}

		.pay-button {
			font-size: 20px;
			width: 100%;
			height: 50px;
			margin-top: 10px;
			border: none;
			outline: none;
			background-color: #1DCAD3 !important;
			color: white !important;
			border-radius: 50px !important;
			font-family: 'Noto Sans KR', sans-serif !important;
		}
		
		.pay-button:hover {
		  	background-color: #189fa6 !important;
		}
		
		.gada-btn-white {
		  border: 1px solid #1DCAD3 !important;
		  color: #1DCAD3 !important;
		  background-color: #ffffff;
		  border-radius: 50px !important;
		  font-family: 'Noto Sans KR', sans-serif !important;
		  font-size: 15px !important;
		}

		.col-md-5 {
			padding-right: 0px !important;
		}

		.product-name {
			font-size: 16px;
			font-weight: 600;
		}
		
	</style>
	
	<!-- CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footer.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/utils.css">

	<!-- Bootstrap -->
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"></script>

	<!-- Iamport Payment -->
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

</head>

<body>

<%@ include file="/WEB-INF/views/includes/header.jsp" %>

	<div class="container order-area">
		<div class="row">
			<div class="col-md-8 content">
				<h2 class="information-headline">주문자 정보</h2>
				<br>
				<span>${member.member_name}</span><br>
				<span>${member.phone_num}</span><br>
				<span>${member.email}</span>
				<hr>
				<h2 class="information-headline">수령인 정보</h2>
				<br>

				<!-- 주소록 -->
				<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog"
					aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h2 class="information-headline">배송지 정보</h2>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<table class="shipping-loc-list">
								<thead>
									<tr>
										<th>선택</th>
										<th>배송지명</th>
										<th>수령인</th>
										<th>우편번호</th>
										<th>주소</th>
										<th>상세주소</th>
										<th>연락처</th>
									</tr>
								</thead>
								<tr>
									<tbody>
										<c:forEach var="shipping_loc" items="${shippingList}">
											<tr>
												<td><button class="btn select-shipping-loc">선택</button></td>
												<td>${shipping_loc.shipping_loc_name}</td>
												<td>${shipping_loc.receiver}</td>
												<td>${shipping_loc.zip_code}</td>
												<td>${shipping_loc.address}</td>
												<td>${shipping_loc.address_detail}</td>
												<td>${shipping_loc.receiver_phone_num}</td>
											</tr>
										</c:forEach>
									</tbody>
							</table>
						</div>
					</div>
				</div>

				<!-- 배송 정보 입력 -->
				<div class="shipping-loc-area">
				    <label for="address-name" style="display: block;">배송지명</label>
					<input type="text" id="address-name" class="form-control input-information" maxlength="13" placeholder="배송지명" style="display: inline; width: 432px !important;">
				    <button type="button" class="btn gada-btn-white" data-toggle="modal" data-target="#exampleModalCenter">
					주소록
				    </button>
				    <div style="padding: 3px;"></div>
					<label for="recipient" style="display: block;">수령인</label>
					<input type="text" id="recipient" class="form-control input-information" maxlength="13" placeholder="수령인">
					<div style="padding: 3px;"></div>
					<label for="postcode" style="display: block;">주소</label>
					<input type="text" id="postcode" class="form-control input-information" placeholder="우편번호" style="display: inline; width: 390px !important;" readonly="readonly">
					<input type="button" onclick="execDaumPostcode()" class="btn gada-btn-white" value="우편번호 찾기">
					<div id="wrap" style="display:none;border:1px solid;width:510px;height:300px;margin:5px 0;position:relative">
						<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap"
							style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()"
							alt="접기 버튼">
					</div>
					<input type="text" id="address" class="form-control input-information" placeholder="주소" style="display: inline;" readonly="readonly"><br>
					<input type="text" id="detailAddress" class="form-control input-information" maxlength="33" placeholder="상세주소">
					<div style="padding: 3px;"></div>
					<label for="tel">연락처</label>
					<input type="text" id="tel" class="form-control input-information" maxlength="11" placeholder="연락처"
						onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" />
					<p>-없이 입력해 주세요.</p>
				</div>
				<hr>
				<h2 class="information-headline">포인트 사용</h2>
				<br>
				<input type="number" id="point" class="form-control input-information" onchange='printPoint()' min="0" value="0"
					onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" style="display: inline; width: 420px !important;"/>
				<input type="button" class="btn gada-btn-white" onclick='useAllPoint()' value="모두 사용" style="width: 80px;"/>&nbsp;보유 포인트 ${point}p<br>
			</div>

			<!-- 결제 정보 -->
			<div class="col-md-4 widget">
				<div class="product-area">
					<form id="form" action="${pageContext.request.contextPath}/shopping/order/result" method="post">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
							<div class="row widget-product-information">
								<div class="col-md-5">
									<img src="${pageContext.request.contextPath}/resources/img/product/${productImg}" class="product-img">
								</div>
								<div class="col-md-7">
									<span class="product-name">${product.product_name}</span><br>
									<span>₩${product.price}&nbsp;/&nbsp;${product.quantity}개</span>
									
									<input type="hidden" name="product_id" value="${product.product_id}" />
									<input type="hidden" name="product_name" value="${product.product_name}" />
									<input type="hidden" name="price" value="${product.price}" />
									<input type="hidden" name="quantity" value="${product.quantity}" />
								</div>
							</div>
					</form>
				</div>
				<hr>
				<h2 class="information-headline">결제 세부정보</h2>
				<div style="padding: 3px;"></div>
				<span class="total-price-title">총 상품 금액</span>
				<c:set var="totalPrice" value="${totalPrice + (product.price * product.quantity)}"/>
				<span class="total-price">₩
					<c:out value="${totalPrice}"/>
				</span><br>
				<span class="use-point-title">포인트 사용</span>
				<span id="use-point" class="use-point">0</span><br>
				<span class="shipping-fee-title">배송비</span>
				<span class="shipping-fee">₩&nbsp;0</span><br>
				<hr>
				<fmt:parseNumber var="accumulatePoint" value="${totalPrice * 0.05}" integerOnly="true" />
				<strong class="payment-amount-title">총 결제 금액</strong>
				<strong id="payment-amount" class="payment-amount">₩ ${totalPrice}</strong><br>
				<span>적립 포인트</span>
				<span style="float: right;"><c:out value="${accumulatePoint}" /></span>
				<hr>
				<input type="checkbox" id="accept">
				<span>(필수) 상품 및 결제 정보를 확인하였으며, 이에 동의합니다.</span>
				<button onclick='checkValidation()' class="pay-button">결제하기</button>
			</div>
		</div>
	</div>
	
	<%@ include file="/WEB-INF/views/includes/footer.jsp"%>

	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	
		// 우편번호 찾기
		var element_wrap = document.getElementById('wrap');

		function foldDaumPostcode() {
			element_wrap.style.display = 'none';
		}

		function execDaumPostcode() {
			var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
			new daum.Postcode({
				oncomplete: function (data) {

					var addr = '';
					var extraAddr = '';

					if (data.userSelectedType === 'R') {
						addr = data.roadAddress;
					} else {
						addr = data.jibunAddress;
					}

					if (data.userSelectedType === 'R') {
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraAddr += data.bname;
						}
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
						}
						if (extraAddr !== '') {
							extraAddr = ' (' + extraAddr + ')';
						}
					}

					document.getElementById('postcode').value = data.zonecode;
					document.getElementById("address").value = addr;

					document.getElementById("detailAddress").focus();

					element_wrap.style.display = 'none';

					document.body.scrollTop = currentScroll;
				},
				onresize: function (size) {
					element_wrap.style.height = size.height + 'px';
				},
				width: '100%',
				height: '100%'
			}).embed(element_wrap);

			element_wrap.style.display = 'block';
		}

		// 포인트 모두 사용
		function useAllPoint() {
			document.getElementById("point").value = ${ point };
			printPoint();
			resultPrice();
		}

		// 입력한 포인트 값을 '포인트 사용'에 출력
		function printPoint() {
			var point = document.getElementById('point').value;

			if (point == '' || null || undefined || 0 || NaN) {
				document.getElementById("use-point").innerHTML = 0;
			} else {
				document.getElementById("use-point").innerHTML = point;
			}
			pointValidation();
			resultPrice();
		}

		// 총 금액 - 입력한 포인트 값을 '총 결제 금액'에 출력
		function resultPrice() {
			var totalPrice = ${ totalPrice };
			var usedPoint = document.getElementById('point').value;
			var resultPrice = totalPrice - usedPoint;
			document.getElementById("payment-amount").innerHTML = resultPrice;
		}

		// 결제 모듈
		function payCard() {
			var buyerName = document.getElementById("recipient").value;
			var buyerTel = document.getElementById("tel").value;
			var buyerAddr = document.getElementById("address").value + " " + document.getElementById("detailAddress").value;
			var buyerPostCode = document.getElementById("postcode").value;
			var buyerEmail = '<c:out value="${member.email}"/>';
			var productName = '<c:out value="${product.product_name}"/>';
			
			var totalPrice = ${ totalPrice };
			var usedPoint = document.getElementById('point').value;
			var resultPrice = totalPrice - usedPoint;

			IMP.init('imp06631679');

			IMP.request_pay({
				pg: "html5_inicis",
				pay_method: "card",
				merchant_uid: 'merchant_' + new Date().getTime(),
				name: productName,
				amount: resultPrice,
				buyer_name: buyerName,
				buyer_tel: buyerTel,
				buyer_email: buyerEmail,
				buyer_addr: buyerAddr,
				buyer_postcode: buyerPostCode
			}, function (rsp) {
				if (rsp.success) {
					var cardApplyNum = rsp.apply_num;
					var paidAmount = rsp.paid_amount;
					var impUid = rsp.imp_uid;
					sendPaymentInformation(impUid, paidAmount, cardApplyNum);
				} else {
					console.log("결제 실패: " + rsp.error_msg);
				}
			});
		}

		// 결제 페이지로 결제 정보 전송
		function sendPaymentInformation(impUid, paidAmount, cardApplyNum) {
			var shippingLocName = document.getElementById("address-name").value;
			var totalPrice = ${ totalPrice };
			var usedPoint = document.getElementById('point').value;
			var accumulatePoint = ${ accumulatePoint };

			var sendBuyId = document.createElement("input");
			sendBuyId.setAttribute("type", "hidden");
			sendBuyId.setAttribute("name", "buy_id");
			sendBuyId.setAttribute("value", impUid);
			document.getElementById("form").append(sendBuyId);

			var sendShippingLocName = document.createElement("input");
			sendShippingLocName.setAttribute("type", "hidden");
			sendShippingLocName.setAttribute("name", "shipping_loc_name");
			sendShippingLocName.setAttribute("value", shippingLocName);
			document.getElementById("form").append(sendShippingLocName);

			var sendTotalPrice = document.createElement("input");
			sendTotalPrice.setAttribute("type", "hidden");
			sendTotalPrice.setAttribute("name", "total_price");
			sendTotalPrice.setAttribute("value", totalPrice);
			document.getElementById("form").append(sendTotalPrice);

			var sendUsedPoint = document.createElement("input");
			sendUsedPoint.setAttribute("type", "hidden");
			sendUsedPoint.setAttribute("name", "used_point");
			sendUsedPoint.setAttribute("value", usedPoint);
			document.getElementById("form").append(sendUsedPoint);

			var sendAccumulatePoint = document.createElement("input");
			sendAccumulatePoint.setAttribute("type", "hidden");
			sendAccumulatePoint.setAttribute("name", "accumulate_point");
			sendAccumulatePoint.setAttribute("value", accumulatePoint);
			document.getElementById("form").append(sendAccumulatePoint);
			
			var sendPaidAmount = document.createElement("input");
			sendPaidAmount.setAttribute("type", "hidden");
			sendPaidAmount.setAttribute("name", "paid_amount");
			sendPaidAmount.setAttribute("value", paidAmount);
			document.getElementById("form").append(sendPaidAmount);
			
			var sendCardApplyNum = document.createElement("input");
			sendCardApplyNum.setAttribute("type", "hidden");
			sendCardApplyNum.setAttribute("name", "card_apply_num");
			sendCardApplyNum.setAttribute("value", cardApplyNum);
			document.getElementById("form").append(sendCardApplyNum);

			document.getElementById("form").submit();
		}

		// 주소록
		$(".select-shipping-loc").click(function () {
			var selected = $(this);

			var tr = selected.parent().parent();
			var td = tr.children();

			var shippingLocName = td.eq(1).text();
			var recipient = td.eq(2).text();
			var postCode = td.eq(3).text();
			var address = td.eq(4).text();
			var detailAddress = td.eq(5).text();
			var recipientTel = td.eq(6).text();

			$('#address-name').val(shippingLocName);
			$('#recipient').val(recipient);
			$('#postcode').val(postCode);
			$('#address').val(address);
			$('#detailAddress').val(detailAddress);
			$('#tel').val(recipientTel);

			$("#exampleModalCenter").modal('hide');
		});

		// 유효성 검사
		function checkValidation() {
			if (acceptValidation() && shippingLocNameValidation() && recipientValidation() && postCodeValidation() && addressValidation() && telValidation()) {
				return payCard();
			}
		}

		function acceptValidation() {
			if (accept.checked == false) {
				alert("구매 동의에 체크해 주세요.");
				return false;
			} else {
				return true;
			}
		}

		function shippingLocNameValidation() {
			var shippingLocName = document.getElementById("address-name");

			if (!shippingLocName.value) {
				alert("배송지명을 입력해 주세요.");
				shippingLocName.focus();
				return false;
			} else {
				return true;
			}
		}

		function recipientValidation() {
			var recipient = document.getElementById("recipient");

			if (!recipient.value) {
				alert("수령인을 입력해 주세요.");
				recipient.focus();
				return false;
			} else {
				return true;
			}
		}

		function postCodeValidation() {
			var postCode = document.getElementById("postcode");

			if (!postCode.value) {
				alert("우펀번호를 입력해 주세요.");
				postCode.focus();
				return false;
			} else {
				return true;
			}
		}

		function addressValidation() {
			var address = document.getElementById("address");

			if (!address.value) {
				alert("주소를 입력해 주세요.")
				address.focus();
				return false;
			} else {
				return true;
			}
		}

		function telValidation() {
			var tel = document.getElementById("tel");

			if (!tel.value) {
				alert("연락처를 입력해 주세요.");
				tel.focus();
				return false;
			} else {
				return true;
			}
		}

		function pointValidation() {
			var totalPoint = ${ point };
			var point = document.getElementById("point").value;

			if (point > totalPoint) {
				alert("보유 포인트를 초과하여 사용할 수 없습니다.");
				document.getElementById("point").value = totalPoint;
				printPoint();
			}
		}
	</script>

</body>

</html>