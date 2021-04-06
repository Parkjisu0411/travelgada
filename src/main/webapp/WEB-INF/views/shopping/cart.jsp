<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link
	href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@700;800&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="${contextPath}/resources/css/main.css">
<link rel="stylesheet" href="${contextPath}/resources/css/font.css">
<link rel="stylesheet" href="${contextPath}/resources/css/header.css">
<link rel="stylesheet" href="${contextPath}/resources/css/footer.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login Form</title>
<style>
html, body {
	width: 100%;
	height: 100%;
	margins: 0;
	padding: 0;
}

#wrap {
	min-heigth: 100%;
}

.member-profile {
	text-align: center;
}

.product-img {
	height: 100px;
	width: 100px;
	display: block;
	vertical-align: middle;
	margin-right: auto;
}

.delete-btn-area {
	float: right;
}
</style>
<script type="text/javascript">
	//삭제
	function remove(product_id) {
		var data = {
			product_id : product_id
		}
		$.ajax({
			type : "DELETE",
			url : "/shopping/cart",
			data : JSON.stringify(data),
			contentType : "application/json",
			cache : false,
			beforeSend : function(xhr){
  	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(result) {
				if(result == "SUCCESS") {
					$("#" + product_id).remove();
					getTotal();
				}
			},
			error : function(e) {
				console.log(e);
				alert("에러가 발생했습니다.");
			}
		});
	}
	//
	//선택된 상품 금액 총 합 구하기
	function getTotal() {
		var totalPrice = 0
		$("input:checkbox[name=select-product]").each(function() {
			if($(this).is(":checked")) {
				var product_id = $(this).parent().parent().parent().attr("id");
				var price = $("#" + product_id + " .price").text();
				var quantity = $("#" + product_id + " .quantity").val();
				totalPrice += price * quantity;
			}
		})
		$("#total-price").html(totalPrice);
	}
	//
	//주문하기
	function buy() {
		console.log("buy");
		
		var product_id_arr = [];
		var quantity_arr = [];
		var price_arr = [];
		var name_arr = [];
		
		$("input:checkbox[name=select-product]").each(function() {
			if($(this).is(":checked")) {
	            var product_id = $(this).parent().parent().parent().attr("id");
	            var quantity = $("#" + product_id + " .quantity").val();
	            var price = $("#" + product_id + " .price").text();
	            var product_name = $("#" + product_id + " .product_name").text();
	            
	            product_id_arr.push(product_id);
	            quantity_arr.push(quantity);
	            price_arr.push(price);
	            name_arr.push(product_name);
			};
		});
		if(!product_id_arr.length) {
			return alert("선택된 상품이 없습니다.");
		}
		var form = document.createElement("form");
		form.method = "get";
		form.action = "/shopping/order";
		
		var inputId = document.createElement("input");
		inputId.setAttribute("name", "product_id");
		inputId.setAttribute("value", product_id_arr);
		
		var inputQuantity = document.createElement("input");
		inputQuantity.setAttribute("name", "quantity");
		inputQuantity.setAttribute("value", quantity_arr);
		
		var inputPrice = document.createElement("input");
		inputPrice.setAttribute("name", "price");
		inputPrice.setAttribute("value", price_arr);
		
		var inputName = document.createElement("input");
		inputName.setAttribute("name", "product_name");
		inputName.setAttribute("value", name_arr);
		
		form.appendChild(inputId);
		form.appendChild(inputQuantity);
		form.appendChild(inputPrice);
		form.appendChild(inputName);
		
		document.body.appendChild(form);
		form.submit();
	}
	//
	$(document).ready(function() {
		//상품 금액 표시
		$(".product").each(function() {
			var product_id = $(this).attr("id");
			var price = $("#" + product_id + " .price").text();
			var quantity = $("#" + product_id + " .quantity").val();
			var mulPrice = price * quantity;
			$("#" + product_id + " .mul-price").html(mulPrice);
		});
		//
		//상품 갯수 변경 금액 표시
		$(".quantity").change(function () {
			var product_id = $(this).parent().parent().parent().parent().attr("id");
			var price = $("#" + product_id + " .price").text();
			var quantity = $("#" + product_id + " .quantity").val();
			var mulPrice = price * quantity;
			$("#" + product_id + " .mul-price").html(mulPrice);
		})
		//
		//전체 선택
		$("#select-whole-product").change(function() {
			if($("#select-whole-product").is(":checked")) {
				$(".select-product").prop("checked", true);
				getTotal();
			} else {
				$(".select-product").prop("checked", false);
				getTotal();
			}
		});
		//
		//선택시 전체 가격 변경
		$(".select-product").change(function() {
			
			$("input:checkbox[name=select-product]").each(function() {
				if(!$(this).is(":checked")) {
					$("#select-whole-product").prop("checked", false);
				}
			});
			getTotal();
		});
		//개수 변경시 전체 가격 변경
		$(".quantity").change(function() {
			getTotal();
		})
		//
	})
	
</script>
</head>
<body>
	<!-- Header -->
	<%@ include file="/WEB-INF/views/includes/header.jsp"%>
	<!--Content -->
	<div class="container">
	<h2 style="font-family: 'yg-jalnan'"><i class="fas fa-shopping-cart"></i> 장바구니</h2>
	<hr />		
		<table class="table">
			<colgroup>
				<col width="5%">
				<col width="20%">
				<col width="60%">
				<col width="15%">
			</colgroup>
			<thead>
				<tr>
					<th colspan="2">
						<label>
							<input type="checkbox" id="select-whole-product"/> 전체선택
						</label>
					</th>
					<th>상품정보</th>
					<th>상품금액</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="product" items="${cart }">
					<tr id="${product.key.product_id }" class="product">
						<td>
							<label>
								<input type="checkbox" class="select-product" name="select-product" value="${product.key.price }" />
							</label>
						</td>
						<td>
							<img class="rounded product-img" src="/resources/img/product/${product.key.img_path }">
						</td>
						<td class="product-status">
							<div>
								<p class="product_name">${product.key.product_name }</p>
								<p class="price">${product.key.price }</p>
							</div>
							<span>
								<label>
									<input type="number" name="quantity" class="quantity" min="1" value="${product.value }"/>
								</label>
							</span>
							<div class="delete-btn-area"><button class="btn btn-secondary delete-btn" onclick="remove(${product.key.product_id})">삭제</button></div>
						</td>
						<td>
							<p class="mul-price"></p>
						</td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="3">
					</td>
					<td>
						<span>총 상품가격</span>
						<span id="total-price"></span>
					</td>
				</tr>
			</tbody>
		</table>
		<button type="button" class="btn btn-lg btn-primary" onclick="buy()">구매하기</button>
		<hr />
	</div>
	<!-- Footer -->
	<%@ include file="/WEB-INF/views/includes/footer.jsp"%>
</body>
</html>