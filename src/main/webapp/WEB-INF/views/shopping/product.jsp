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
<link rel="stylesheet" href="${contextPath}/resources/css/utils.css">
<meta charset="UTF-8">
<title>Product</title>
<style>

	body {
		font-family: 'IBMPlexSansKR-Light';
	}
	
	hr {
		background-color: #1DCAD3;
	}
	
	.product-img-area > img {
		object-fit: cover;
		width: 100%;
	}
	
	.product-info-name {
		font-size: 24px;
		font-weight: bold;
	}
	
	.product-info-price {
		font-size: 30px;
	}
	
	.product-info-option {
		margin: 20px;
	}
	
	.product-info-option a {
		color: #1DCAD3;
	}
	
	.product-info-option-btn {
	}
	
	.product-info-total {
		float: right;
	}
	
	.quantity {
		width: 50px;
		text-align: center;
	}
	
	.gada-btn-group {
		text-align: right;
	}
	
	.btn {
		width: 150px;
		height: 80px;
		font-family: 'Montserrat', sans-serif;
		font-weight: bold;
		font-size: 20px;
	}
	
	.go-top{
	  width: 60px;
	  height: 60px;
	  position: fixed;
	  bottom:calc(10% - 35px);
	  right: calc((100% - 1200px)/ 2 - 80px);
	  display: inline-block;
	  border: none;
	  display: none;
	  background-color: #1DCAD3;
	  border-radius: 10px;
	  color: white;
	}
	
	.gada-card {
		min-height: 540px;
	}
	
</style>
<script>

	function countUp() {
		$("#quantity").val(parseInt($("#quantity").val()) + parseInt(1));
		getTotal();
	}
	
	function countDown() {
		if(parseInt($("#quantity").val()) > 1) {			
			$("#quantity").val(parseInt($("#quantity").val()) - parseInt(1));
			getTotal();
		}
	}
	
	function insertIntoCart() {
		var product_id = $("input:hidden[name=product_id]").val();
		var quantity = $(".quantity").val();
		data = {
			product_id : product_id,
			quantity : quantity
		};
		
		$.ajax({
			type : "POST",
			url : "/shopping/cart",
			data : JSON.stringify(data),
			contentType : "application/json",
			cache : false,
			beforeSend : function(xhr){
  	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(result) {
				if(result == "SUCCESS") {
					if(confirm("장바구니에 상품을 담았습니다.\n장바구니로 이동하시겠습니까?")) {
						location.href="/shopping/cart";
					}
				}
			},
			error : function(e) {
				console.log(e);
				alert("에러가 발생했습니다.");
			}
		});
	}

	function getTotal() {
		var quantity = $("#quantity").val();
		if(parseInt(quantity) < 1) {
			quantity = 1;
			$("#quantity").val(quantity);
		}
		var price = $("input:hidden[name=price]").val();
		total = parseInt(quantity) * parseInt(price);
		$("#total-price").html(total);
	}
	
	$(document).ready(function() {
		// total 가격 계산
		getTotal();
		$(".quantity").change(function() {
			getTotal();	
		})
		//
		//위로가기 버튼
		$(window).scroll(function() {
			var quickHeight=$(document).scrollTop();
			if (500 <= quickHeight ) {
					$('.go-top').css('display','block');
				}else {
					$('.go-top').css('display','none');
				}
			});

		$('.go-top').click(function(){
			console.log("up")
			$('html, body').animate({
				scrollTop:0
				}, 500);
		});
		//
	})
</script>
</head>
<body>

	<!-- Header -->
	<%@ include file="/WEB-INF/views/includes/header.jsp"%>
	
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<div class="gada-card">
					<div class="product-img-area">
						<img class="rounded" src="/resources/img/product/${product.img_path }">
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="gada-card">
					<form id="buy-now" action="/shopping/order-single" method="POST">
						<input type="hidden" name="product_img_src" value="${product.img_path}">
						<input type="hidden" name="product_name" value="${product.product_name }" />
						<input type="hidden" name="product_id" value="${product.product_id }" />
						<input type="hidden" name="price" value="${product.price }" />
						<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
						<div class="product-info-area">
							<br>
							<p class="product-info-name">${product.product_name }</p>
							<br><br>
							<p class="product-info-price">₩ ${product.price } 원</p>
							<br><br><br><br><br>
							<div class="product-info-option">
								<label for="quantity">수량</label><br>
								<div class="product-info-option-btn">
									<a href="javascript:;"  onclick="countDown()">
										<i class="fas fa-minus"></i>
									</a>
									<input id="quantity" class="quantity" type="text" name="quantity" value="1" autocomplete="off"/>
									<a href="javascript:;"  onclick="countUp()">
										<i class="fas fa-plus"></i>
									</a>
									<div class="product-info-total">
										<span>TOTAL ₩</span>
										<span id="total-price"></span>
									</div>
								</div>
								<br>
							</div>
						</div>					
						<div class="gada-btn-group">
							<button type="button" class="btn gada-btn-reverse" onclick="insertIntoCart()">CART</button>
							<button type="submit" class="btn gada-btn">BUY NOW</button>
						</div>
					</form>
				</div>
				</div>
		</div>
		<hr />
		<div class="row">
			<div class="col-md-12">
				<div class="product-detail">
					<img src="/resources/img/product/detail/detail_1.jpg" />
					<img src="/resources/img/product/detail/detail_2.jpg" />
					<img src="/resources/img/product/detail/detail_3.jpg" />
					<img src="/resources/img/product/detail/detail_4.jpg" />
					<img src="/resources/img/product/detail/detail_5.jpg" />
					<img src="/resources/img/product/detail/detail_6.jpg" />
					<img src="/resources/img/product/detail/detail_7.jpg" />
					<img src="/resources/img/product/detail/detail_8.jpg" />
					<img src="/resources/img/product/detail/detail_9.jpg" />
					<img src="/resources/img/product/detail/detail_10.jpg" />
					<img src="/resources/img/product/detail/detail_11.jpg" />
					<img src="/resources/img/product/detail/detail_12.jpg" />
					<img src="/resources/img/product/detail/detail_13.jpg" />
					<img src="/resources/img/product/detail/detail_14.jpg" />
				</div>
			</div>
		</div>
	</div>
	
	<button type="button" name="button" class="go-top"><i class="fas fa-arrow-up"></i></button>
	<!-- Footer -->
	<%@ include file="/WEB-INF/views/includes/footer.jsp"%>
</body>
</html>