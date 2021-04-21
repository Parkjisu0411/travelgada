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
<link
	href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@700;800&display=swap"
	rel="stylesheet">
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
	
	.gada-btn-group {
		text-align: right;
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
</style>
<script type="text/javascript">
	function movePage(pageNum, amount) {
		var query = '?nowPage=' + pageNum + "&amount=" + amount;
		$.ajax({
			type : "GET",
			url : "/shopping/buy_list_page" + query,
			cache : false,
			success : function(buyListMap) {
				console.log(buyListMap);
				content = "";
				for(var i = 0; i < buyListMap.buyList.length; i++) {
					content += "<tr>";
					content += "	<td>";
					content += "		<img class='product-img rounded' src='/resources/img/product/" + buyListMap.buyList[i].product.img_path + "' />";
					content += "		<div class='product-info'>";
					content += "			<strong>" + buyListMap.buyList[i].product_name + "</strong>";
					content += "			<p>₩ " + buyListMap.buyList[i].price + "</p>";
					content += "		</div>";
					content += "	</td>";
					content += "	<td><fmt:formatDate value='' pattern='yyyy.MM.dd'/></td>";
					content += "	<td><a href='/shopping/buy_list/" + buyListMap.buyList[i].buy.buy_id + "'>" + buyListMap.buyList[i].buy.buy_id + "</a></td>";
					content += "	<td>" + buyListMap.buyList[i].price + "</td>";
					content += "	<td>구매확정</td>";
					content += "</tr>";
				}
				$("tbody").html(content);
			},
			error : function(e) {
				console.log(e);
				alert("에러가 발생했습니다.");
			}
		});
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
				<h3 class="gada-headline">SHOPPING LIST</h3>
				<hr>
				<div class="gada-card">
					<div class="buy-list-area">
						<div class="buy-search-area">
							<div class="gada-btn-group">
								<button class="btn gada-btn">1주일</button>
								<button class="btn gada-btn">1개월</button>
								<button class="btn gada-btn">3개월</button>
								<button class="btn gada-btn">전체</button>
							</div>
						</div>
						<table class="table">
							<thead>
								<tr>
									<th>상품정보</th>
									<th>주문일자</th>
									<th>주문번호</th>
									<th>주문금액</th>
									<th>주문상태</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="buyDetail" items="${buyListMap['buyList'] }">
									<tr>
										<td>
											<img class="product-img rounded" src="/resources/img/product/${buyDetail.product.img_path}" />
											<div class="product-info">
												<strong>${buyDetail.product_name }</strong>
												<p>₩ ${buyDetail.product.price}</p>
											</div>
										</td>
										<td><fmt:formatDate value="${buyDetail.buy.buy_date}" pattern="yyyy.MM.dd"/></td>
										<td><a href="/shopping/buy_list/${buyDetail.buy.buy_id}">${buyDetail.buy.buy_id}</a></td>
										<td>${buyDetail.price }</td>
										<td>구매확정</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="page-area">
						<c:forEach var="pageMaker" items="${buyListMap['pageMaker'] }">
							<ul class="pagination" style="padding:80px 350px;">	
						  		<c:if test="${pageMaker.prev}">
					       			<li class="page-item"><a class="page-link" onclick="movePage(${pageMaker.startPage - 1}, 10)">prev</a></li>
					     		</c:if>
				
					      		<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
					         		<li class="page-item"><a class="page-link" onclick="movePage(${idx}, 10)">${idx}</a></li>
					      		</c:forEach>
					      
					      		<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					         		<li class="page-item"><a class="page-link" onclick="movePage(${pageMaker.endPage + 1}, 10)">next</a></li>
					      		</c:if>
						 	</ul>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Footer -->
	<%@ include file="/WEB-INF/views/includes/footer.jsp"%>
</body>
</html>