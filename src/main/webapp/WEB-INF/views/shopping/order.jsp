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
		/* Common */
		.information-headline {
			font-size: 22px;
			margin: 0px;
		}

		/* Content */
		.product-img {
			width: 100%;
			height: 127px;
			border-radius: 8px;
			object-fit: cover;
		}

		.price {
			text-align: right;
		}

		.nav-link {
			color: #000000;
		}

		.nav-link:hover {
			color: #000000;
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

		.btn.btn-primary {
			float: right;
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
			background-color: #FE5000;
			color: #FFFFFF;
			font-size: 20px;
			width: 100%;
			height: 50px;
			margin-top: 10px;
			border-radius: 32px;
			border: none;
			outline: none;
		}

		.col-md-5 {
			padding-right: 0px !important;
		}

		.product-name {
			font-size: 14px;
		}
	</style>

	<!-- Bootstrap -->
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"></script>

	<!-- Iamport Payment -->
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

</head>

<body>
	<div class="container">
		<div class="row">
			<div class="col-md-8 content">
				<hr>
				<h2 class="information-headline">주문자 정보</h2>
				<br>
				<span>${member.member_name}</span><br>
				<span>${member.phone_num}</span><br>
				<span>${member.email}</span>
				<hr>
				<h2 class="information-headline">수령인 정보</h2>
				<br>

				<!-- 주소록 -->
				<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
					주소록
				</button>
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
												<td><button class="select-shipping-loc">선택</button></td>
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
					<input type="text" id="address-name" maxlength="13" placeholder="배송지명"><br>
					<input type="text" id="recipient" maxlength="13" placeholder="수령인"><br>
					<input type="text" id="postcode" placeholder="우편번호" readonly="readonly">
					<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
					<div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
						<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap"
							style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()"
							alt="접기 버튼">
					</div>
					<input type="text" id="address" placeholder="주소" readonly="readonly"><br>
					<input type="text" id="detailAddress" maxlength="33" placeholder="상세주소"><br>
					<input type="text" id="tel" maxlength="11" placeholder="연락처"
						onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" />
					<p>-없이 입력해 주세요.</p>
				</div>
				<hr>
				<h2 class="information-headline">포인트 사용</h2>
				<br>
				<input type="number" id="point" onchange='printPoint()' placeholder="포인트">
				<input type="button" onclick='useAllPoint()' value="모두 사용" />&nbsp;보유 포인트 ${point}p<br>
				<hr>
			</div>

			<!-- 결제 정보 -->
			<div class="col-md-4 widget">
				<div class="product-area">
				<form id="form" action="${pageContext.request.contextPath}/shopping/order/result" method="post">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					<c:forEach items="${buyDetailList}" var="productInformation">
						<div class="row widget-product-information">
							<div class="col-md-5">
								<img src="#" class="product-img">
							</div>
							<div class="col-md-7">
								<a href="#">물품 항목</a><br>
								<span class="product-name">${productInformation.product_name}</span><br>
								<span>₩${productInformation.price}&nbsp;/&nbsp;${productInformation.quantity}개</span>
								
								<input type="hidden" name="product_id" value="${productInformation.product_id}"/>
								<input type="hidden" name="product_name" value="${productInformation.product_name}"/>
								<input type="hidden" name="price" value="${productInformation.price}"/>
								<input type="hidden" name="quantity" value="${productInformation.quantity}"/>
							</div>
						</div>
					</c:forEach>
					</form>
				</div>
				<hr>
				<h2 class="information-headline">결제 세부정보</h2>
				<span class="total-price-title">총 상품 금액</span>
				<c:set var="totalPrice" value="0" />
				<c:forEach items="${buyDetailList}" var="productPrice">
					<c:set var="totalPrice" value="${totalPrice + (productPrice.price * productPrice.quantity)}" />
				</c:forEach>
				<span class="total-price">₩
					<c:out value="${totalPrice}" />
				</span><br>
				<span class="use-point-title">포인트 사용</span>
				<span id="use-point" class="use-point">0</span><br>
				<span class="shipping-fee-title">배송비</span>
				<span class="shipping-fee">₩&nbsp;0</span><br>
				<hr>
				<fmt:parseNumber var="accumulatePoint" value="${totalPrice * 0.01}" integerOnly="true"/>
				<strong class="payment-amount-title">총 결제 금액</strong>
				<strong class="krw">₩</strong><strong id="payment-amount" class="payment-amount">${totalPrice}</strong><br>
				<span>적립 포인트</span>
				<c:out value="${accumulatePoint}"/>
				<hr>
				<input type="checkbox" id="accept">
				<span>(필수) 상품 및 결제 정보를 확인하였으며, 이에 동의합니다.</span>
				<button onclick='checkValidation()' class="pay-button">결제하기</button>
			</div>
		</div>
	</div>

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
			
			var totalPrice = ${ totalPrice };
			var usedPoint = document.getElementById('point').value;
			var resultPrice = totalPrice - usedPoint;
			
			IMP.init('imp06631679');

			IMP.request_pay({
				pg: "html5_inicis",
				pay_method: "card",
				merchant_uid: 'merchant_' + new Date().getTime(),
				name: payProductName(),
				amount: resultPrice,
				buyer_name: buyerName,
				buyer_tel: buyerTel,
				buyer_email: buyerEmail,
				buyer_addr: buyerAddr,
				buyer_postcode: buyerPostCode
			}, function (rsp) {
				if (rsp.success) {
					var msg = '결제가 완료되었습니다.\n';
					msg += '결제 금액 : ' + rsp.paid_amount + '\n';
					msg += '카드 승인번호 : ' + rsp.apply_num + '\n';
					msg += '고유 ID: ' + rsp.imp_uid;
					
					var impUid = rsp.imp_uid;
					sendPaymentInformation(impUid);
				} else {
					var msg = '결제에 실패하였습니다.\n';
					msg += rsp.error_msg;
				}
				alert(msg);
			});
		}
		
		// 결제 페이지로 결제 정보 전송
		function sendPaymentInformation(impUid) {
			var shippingLocName = document.getElementById("address-name").value;
			var totalPrice = ${totalPrice};
			var usedPoint = document.getElementById('point').value;
			var accumulatePoint = ${accumulatePoint};
			
			var sendBuyId = document.createElement("input");
			sendBuyId.setAttribute("type","hidden");
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
			
			document.getElementById("form").submit();
		}
		
		// 결제 모듈 - '상품명'에 출력
		function payProductName() {
			var payProductName = "";
			var productName = '<c:out value="${buyDetailList[0].product_name}"/>';
			var productAmount = '${fn:length(buyDetailList)}';
			
			if (productAmount == 1) {
				payProductName += productName
			} else {
				payProductName += productName + ' 외 ' + (productAmount - 1);
			}
			return payProductName;
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