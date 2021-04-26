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
<link rel="stylesheet" href="${contextPath}/resources/css/utils.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="csrf-token" content="{{ csrf_token() }}">
<title>Login Form</title>
<style>
	
	.table {
		font-family: 'IBMPlexSansKR-Light';
	}
	
	hr {
		background-color: #1DCAD3;
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
	
	.cart-empty {
		text-align: center;
		height: 100px;
		line-height: 100px;
		color: gray;
	}
	
	.gada-btn-group {
		text-align: right;
	}
	
	.gada-link:hover {
		color: #1DCAD3;
		cursor: pointer;
	}
	
	.quantity {
		width: 50px;
		text-align: center;
	}
	
	.product-option a {
		color: #1DCAD3;
	}
</style>
<script type="text/javascript">
	function viewDetail(product_id) {
		location.href = "/shopping/" + product_id;
	}

	function countUp(product_id) {
		$("#" + product_id + " .quantity").val(parseInt($("#" + product_id + " .quantity").val()) + parseInt(1));
		getMul(product_id);
		getTotal();
	}
	
	function countDown(product_id) {
		if(parseInt($("#" + product_id + " .quantity").val()) > 1) {			
			$("#" + product_id + " .quantity").val(parseInt($("#" + product_id + " .quantity").val()) - parseInt(1));
			getMul(product_id);
			getTotal();
		}
	}

	//삭제
	function removeSelected() {
		$("input:checkbox[name=select-product]").each(function() {
			if($(this).is(":checked")) {
				var product_id = $(this).parent().parent().parent().attr("id");
				remove(product_id);
			}
		})
	}
	
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
	//상품 가격 구하기
	function getMul(product_id) {
		if($("#" + product_id + " .quantity").val() < 1) {
			$("#" + product_id + " .quantity").val(1); 
		}
		var price = $("#" + product_id + " .price").text();
		var quantity = $("#" + product_id + " .quantity").val();
		var mulPrice = price * quantity;
		$("#" + product_id + " .mul-price").html(mulPrice);
	}
	//
	//주문하기
	function buy() {
		console.log("buy");

		var product_id_arr = [];
		var quantity_arr = [];
		var price_arr = [];
		var name_arr = [];
		var product_img_src_arr = [];
		
		$("input:checkbox[name=select-product]").each(function() {
			if($(this).is(":checked")) {
	            var product_id = $(this).parent().parent().parent().attr("id");
	            var quantity = $("#" + product_id + " .quantity").val();
	            var price = $("#" + product_id + " .price").text();
	            var product_name = $("#" + product_id + " .product_name").text();
	            var product_img_src = $("#" + product_id + " .product-img").attr("src");
	            
	            product_id_arr.push(product_id);
	            quantity_arr.push(quantity);
	            price_arr.push(price);
	            name_arr.push(product_name);
	            product_img_src_arr.push(product_img_src);
			};
		});
		if(!product_id_arr.length) {
			return alert("선택된 상품이 없습니다.");
		}
		var form = document.createElement("form");
		form.method = "post";
		form.action = "/shopping/order/cart";
		
		var inputId = document.createElement("input");
        inputId.setAttribute("type","hidden");
		inputId.setAttribute("name", "product_id");
		inputId.setAttribute("value", product_id_arr);
		
		var inputQuantity = document.createElement("input");
        inputQuantity.setAttribute("type","hidden");
		inputQuantity.setAttribute("name", "quantity");
		inputQuantity.setAttribute("value", quantity_arr);
		
		var inputPrice = document.createElement("input");
        inputPrice.setAttribute("type","hidden");
		inputPrice.setAttribute("name", "price");
		inputPrice.setAttribute("value", price_arr);
		
		var inputName = document.createElement("input");
        inputName.setAttribute("type","hidden");
		inputName.setAttribute("name", "product_name");
		inputName.setAttribute("value", name_arr);
		
		var inputProductImgSrc = document.createElement("input");
		inputProductImgSrc.setAttribute("type","hidden");
		inputProductImgSrc.setAttribute("name", "product_img_src");
		inputProductImgSrc.setAttribute("value", product_img_src_arr);
		
		var inputCsrfToken = document.createElement("input");
		inputCsrfToken.setAttribute("type","hidden");
		inputCsrfToken.setAttribute("name", "${_csrf.parameterName}");
		inputCsrfToken.setAttribute("value", "${_csrf.token}");
		
		form.appendChild(inputId);
		form.appendChild(inputQuantity);
		form.appendChild(inputPrice);
		form.appendChild(inputName);
		form.appendChild(inputProductImgSrc);
		form.appendChild(inputCsrfToken);
		
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
			var product_id = $(this).parent().parent().parent().attr("id");
			getMul(product_id);
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
		$(".select-product").prop("checked", true);
		getTotal();
		
		if($("tbody").children("tr").length == 1) {
			var content = ""
			content += "<tr>";
			content += "<td colspan='4'>";
			content += "<p class='cart-empty'>장바구니가 비어있습니다.</p";
			content += "</td>";
			content += "</tr>";
			$("tbody").children("tr").before(content);
		}
	})
	
</script>
</head>
<body>
	<!-- Header -->
	<%@ include file="/WEB-INF/views/includes/header.jsp"%>
	<!--Content -->
	<div class="container">
	<h2 class="gada-headline"><i class="fas fa-shopping-cart"></i> CART</h2>
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
								<p class="product_name gada-link" onclick="viewDetail(${product.key.product_id})">${product.key.product_name }</p>
								<p class="price">${product.key.price }</p>
							</div>
							<span class="product-option">
								<a href="javascript:;"  onclick="countDown(${product.key.product_id})">
									<i class="fas fa-minus"></i>
								</a>
								<input class="quantity" type="text" name="quantity" value="${product.value }" autocomplete="off"/>
								<a href="javascript:;"  onclick="countUp(${product.key.product_id})">
									<i class="fas fa-plus"></i>
								</a>
							</span>
							<div class="delete-btn-area"><button class="btn gada-btn delete-btn" onclick="remove(${product.key.product_id})">삭제</button></div>
						</td>
						<td>
							<p class="mul-price"></p>
						</td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="3">
						<button class="btn gada-btn-reverse delete-btn-selected" onclick="removeSelected()" >선택삭제</button>
					</td>
					<td>
						<span>총 상품가격</span>
						<span id="total-price"></span>
					</td>
				</tr>
			</tbody>
		</table>
		<div class="gada-btn-group">
			<button type="button" class="btn gada-btn" onclick="buy()">주문하기</button>
		</div>
	</div>
	<!-- Footer -->
	<%@ include file="/WEB-INF/views/includes/footer.jsp"%>
</body>
</html>