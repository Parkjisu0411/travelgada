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
<title>Product</title>
<style>
.product-img-area > img {
	object-fit: cover;
	width: 100%;
}

.product-img-area {
	border: 1px solid black;
	padding-left: 30px;
	padding-right: 30px;
	margin-right: 30px;
}

.product-info-area {
	border: 1px solid black;
}

.quantity {
	width: 50px;
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
}

</style>
<script>
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
		var quantity = $(".quantity").val();
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
				<div class="product-img-area">
					<img class="rounded" src="/resources/img/product/${product.img_path }">
				</div>
			</div>
			<div class="col-md-6">
				<form action="#" method="POST">
					<input type="hidden" name="product_name" value="${product.product_name }" />
					<input type="hidden" name="product_id" value="${product.product_id }" />
					<input type="hidden" name="price" value="${product.price }" />
					<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
					<div class="product-info-area">
						<p class="product-info-name">${product.product_name }</p>
						<p class="product-info-price">₩ ${product.price }</p>
						<label for="quantity">수량</label>
						<input class="quantity" type="number" name="quantity" value="1"/>
						<div class="product-info-total">
							<span>TOTAL ₩</span>
							<span id="total-price"></span>
						</div>
					</div>					
					<div class="product-btn">
						<button type="button" class="btn btn-primary" onclick="insertIntoCart()">장바구니</button>
						<input type="submit" class="btn btn-primary" value="구매하기"/>
					</div>
				</form>
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