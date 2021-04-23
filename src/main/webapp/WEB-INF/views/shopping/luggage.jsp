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
<title>캐리어</title>
<style>

   hr {
      background-color: #1DCAD3;
   }
   
   .product-img-area {
      width: 100%;
      overflow: hidden;
      
   }
   
   .product-area {
      border-radius: 10px;
      margin: 0px 0px 30px 0px;
      height: 460;
      background-color: #f5f5f5;
   }
   
   .card-pl-img {
      width: 100%;
      height: 350px;
      border-radius: 10px 10px 0px 0px;
      object-fit: cover;
   }
   
   .text_box{
      padding:15px;
      font-family: 'IBMPlexSansKR-Light';
   }
   
    .product-img-area > img {
       object-fit: cover;
      width: 100%;
      /* height: 250px; */
      display: block;
      transform: scale(1);
        -webkit-transform: scale(1);
        -moz-transform: scale(1);
        -ms-transform: scale(1);
        -o-transform: scale(1);
        transition: all 0.3s ease-in-out;
   }
   
   .product-img-area > img:hover {
      transform:scale(1.2);
      -webkit-transform: scale(1.2);
        -moz-transform: scale(1.2);
        -ms-transform: scale(1.2);
        -o-transform: scale(1.2);
        
   }
   
   .product-detail-area:hover {
      cursor: pointer;
   }
   
   .product-btn-area {
      padding-left: 20px;
      text-align: center;
   }
   
   .buy {
      font-family: 'Montserrat', sans-serif;
      font-weight: bold;
   }
   
   .gada-btn-group {
      text-align: right;
   }
</style>
<script>
   //제품 상세 페이지로 이동
   function viewDetail(product_id) {
      location.href = "/shopping/" + product_id;
   }
   //
   //url parsing 
   $.urlParam = function(name){
      var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
      if (results==null) {
         return null; }
      else {
         return results[1] || 0; }
   }
   //
   //카트에 담기
   function insertIntoCart(product_id) {
      var data = {
            product_id : product_id,
            quantity : 1
      };
      console.log(data);
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
   //
   //스크롤 시 페이지 불러오기
   var page = 1;
   $(window).scroll(function() {
      if($(window).scrollTop() == $(document).height() - $(window).height()) {
         var product_type_id = $.urlParam("product_type_id");
         var sorter = $.urlParam("sorter");
         var urlQuery = "?product_type_id=" + product_type_id;
         if(!$.urlParam("sorter") == "null") {
            urlQuery += "&sorter=" + $.urlParam(sorter);
         }
         urlQuery += "&page=" + page;
         console.log(urlQuery);
         
         $.ajax({
            type : "GET",
            url : "/shopping/scroll" + urlQuery,
            cache : false,
            dataType : "json",
            success : function(result) {
               page = page + 1;
               
               console.log($(".row").length);
               for(var i = 0; i < result.length; i++) {
                  var content = "";
                  content += "<div class='col-md-4'>";
                  content += "<div class='product-area'>";
                  content += "<div class='product-detail-area' onclick='viewDetail(" + result[i].product_id + ")'>";
                  content += "<div class='product-img-area'><img class='rounded' src='/resources/img/product/" + result[i].img_path  + "'></div>";
                  content += "<div class='text_box'>";
                  content += "<div class='product-info-aread'>";
                  content += "<p>" + result[i].product_name + "</p>";
                  content += "<p>₩ " + result[i].price + "</p>";
                  content += "</div>";
                  content += "<div class='product-btn-area'>";
                  content += "<button type='button' class='btn gada-btn-reverse buy' onclick='insertIntoCart(" + result[i].product_id + ")'>CART</button>";
                  content += "<button type='button' class='btn gada-btn buy'>BUY NOW</button>";
                  content += "</div>";
                  content += "</div>";
                  content += "</div>";
                  content += "</div>";
                  content += "</div>";
                  $(".row").append(content);
               }
            },
            error : function(e) {
               console.log(e);
               alert("에러가 발생했습니다.");
            }
         });
         
      }
   })
   //
</script>
</head>
<body>

	<!-- Header -->
	<%@ include file="/WEB-INF/views/includes/header.jsp"%>
	
	<div class="container">
	
		<!-- headline -->
		<h2 class="gada-headline">LUGGAGE</h2>
		
		<div class="gada-btn-group">
			<a href="/shopping?product_type_id=2&sorter=salePriceAsc" class="btn gada-btn">낮은가격순</a>
			<a href="/shopping?product_type_id=2&sorter=salePriceDesc" class="btn gada-btn">높은가격순</a>
			<a href="#" class="btn gada-btn">판매량순</a>
			<a href="/shopping?product_type_id=2&sorter=latestAsc" class="btn gada-btn">최신순</a>
		</div>
		<hr />
		<div class="divider-header-blank"></div>
		<!-- Product List -->
		<div class="row">
			<c:forEach var="product" items="${productList }">
				<div class="col-md-4">
					<div class="product-area">
					<form action="/shopping/order/single" method="post">
						<div class="product-detail-area">
							<div class="product-img-area" onclick="viewDetail(${product.product_id})"><img class="rounded" src="/resources/img/product/${product.img_path }"></div>
							<div class="text_box">
								<div class="product-info-area">
									<p>${product.product_name }</p>
									<p>₩ ${product.price }</p>
								</div>
								<div class="product-btn-area">
									<button type="button" class="btn gada-btn-reverse buy" onclick="insertIntoCart(${product.product_id})">CART</button>
									<button type="submit" class="btn gada-btn buy">BUY NOW</button>
								</div>
							</div>
						</div>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
						<input type="hidden" name="product_img_src" value="${product.img_path}">
						<input type="hidden" name="product_name" value="${product.product_name}">
						<input type="hidden" name="quantity" value="1">
						<input type="hidden" name="product_id" value="${product.product_id}">
						<input type="hidden" name="price" value="${product.price}">
						</form>
					</div>
				</div>
			</c:forEach>
		</div>
		
	</div>
	
	<!-- Footer -->
	<%@ include file="/WEB-INF/views/includes/footer.jsp"%>

</body>
</html>