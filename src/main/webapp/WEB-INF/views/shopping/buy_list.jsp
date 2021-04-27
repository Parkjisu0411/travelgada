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
	
	.page-area{
		margin:auto;
		text-align:center;
	}
	
	.pagination{
		border-radius: 5px;
	}
	
	.page-link{
		font-family: 'GongGothicMedium';
		color: white;
		font-size:12px;
		background-color: #1dcad3;
		width:50px;
		border-radius: 5px;
	}
	
	.page-link:hover {
		background-color: #189fa6;
		color: white;
	}
	
	.selected {
		background-color: #189fa6;
		color: white;
	}
</style>
<script type="text/javascript">

	function movePage(pageNum, amount, filter) {
		if(filter) {
			var query = '?nowPage=' + pageNum + "&amount=" + amount + "&dateFilter=" + filter;
		} else {
			var query = '?nowPage=' + pageNum + "&amount=" + amount + "&dateFilter=default";			
		}
		$.ajax({
			type : "GET",
			url : "/shopping/buy_list_page" + query,
			cache : false,
			success : function(buyListMap) {
				console.log(buyListMap);
				content = "";
				for(var i = 0; i < buyListMap.buyList.length; i++) {
					var date = new Date(buyListMap.buyList[i].buy.buy_date);
					var year = date.getFullYear();
					var month = date.getMonth() + 1;
					if(month < 10) {
						month = "0" + month;
					} 
					var day = date.getDate();
					if(day < 10) {
						day = "0" + day;
					}
					var dateString = year + "-" + month + "-" + day;
					
					content += "<tr class='row'>";
					content += "	<td class='col-md-6'>";
					content += "		<img class='product-img rounded' src='/resources/img/product/" + buyListMap.buyList[i].product.img_path + "' />";
					content += "		<div class='product-info'>";
					content += "			<strong>" + buyListMap.buyList[i].product_name + "</strong>";
					content += "			<p>₩ " + buyListMap.buyList[i].price + "</p>";
					content += "		</div>";
					content += "	</td>";
					content += "	<td class='col-md-2'>" + dateString + "</td>";
					content += "	<td class='col-md-2'><a href='/shopping/buy_list/" + buyListMap.buyList[i].buy.buy_id + "'>" + buyListMap.buyList[i].buy.buy_id + "</a></td>";
					content += "	<td class='col-md-1'>" + buyListMap.buyList[i].price + "</td>";
					content += "	<td class='col-md-1'>구매확정</td>";
					content += "</tr>";
				}
				var pageContent = "";
				if(buyListMap.pageMaker[0].prev) {
					pageContent += "<li class='page-item'><a class='page-link' onclick='movePage(" + buyListMap.pageMaker[0].startPage - 1 + ", 10, \"" + buyListMap.pageMaker[0].cri.dateFilter + "\")'>prev</a></li>";
				}
				for(var i = buyListMap.pageMaker[0].startPage; i <= buyListMap.pageMaker[0].endPage; i++) {
					if(i == buyListMap.pageMaker[0].cri.nowPage) {
						pageContent += "<li class='page-item'><a class='page-link selected' onclick='movePage(" + i + ", 10, \"" + buyListMap.pageMaker[0].cri.dateFilter + "\")'>" + i + "</a></li>";
					} else {
						pageContent += "<li class='page-item'><a class='page-link' onclick='movePage(" + i + ", 10, \"" + buyListMap.pageMaker[0].cri.dateFilter + "\")'>" + i + "</a></li>";						
					}
				}
				if(buyListMap.pageMaker[0].next) {
					pageContent += "<li class='page-item'><a class='page-link' onclick='movePage(" + parseInt(buyListMap.pageMaker[0].endPage) + parseInt(1) + ", 10, \"" + buyListMap.pageMaker[0].cri.dateFilter + "\")'>next</a></li>";
				}
				$("tbody").html(content);
				$("#pagination").html(pageContent);
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
								<button onclick="movePage(1, 10, 'week')" class="btn gada-btn">1주일</button>
								<button onclick="movePage(1, 10, 'month')" class="btn gada-btn">1개월</button>
								<button onclick="movePage(1, 10, '3month')" class="btn gada-btn">3개월</button>
								<button onclick="movePage(1, 10, 'default')" class="btn gada-btn">전체</button>
							</div>
						</div>
						<table class="table">
							<thead>
								<tr class="row">
									<th class="col-md-8">상품정보</th>
									<th class="col-md-1">주문일자</th>
									<th class="col-md-1">주문번호</th>
									<th class="col-md-1">주문금액</th>
									<th class="col-md-1">주문상태</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="buyDetail" items="${buyListMap['buyList'] }">
									<tr class="row">
										<td class="col-md-6">
											<img class="product-img rounded" src="/resources/img/product/${buyDetail.product.img_path}" />
											<div class="product-info">
												<strong>${buyDetail.product_name }</strong>
												<p>₩ ${buyDetail.product.price}</p>
											</div>
										</td>
										<td class="col-md-2"><fmt:formatDate value="${buyDetail.buy.buy_date}" pattern="yyyy.MM.dd"/></td>
										<td class="col-md-2"><a href="/shopping/buy_list/${buyDetail.buy.buy_id}">${buyDetail.buy.buy_id}</a></td>
										<td class="col-md-1">${buyDetail.price }</td>
										<td class="col-md-1">구매확정</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="page-area">
						<c:forEach var="pageMaker" items="${buyListMap['pageMaker'] }">
							<ul id="pagination" class="pagination" style="padding:80px 350px;">	
						  		<c:if test="${pageMaker.prev}">
					       			<li class="page-item"><a class="page-link" onclick="movePage(${pageMaker.startPage - 1}, 10)">prev</a></li>
					     		</c:if>
				
					      		<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
					      			<c:if test="${idx eq pageMaker.cri.nowPage }">
					      				<li class="page-item"><a class="page-link selected" onclick="movePage(${idx}, 10)">${idx}</a></li>
					      			</c:if>
					      			<c:if test="${idx ne pageMaker.cri.nowPage }">
					      				<li class="page-item"><a class="page-link" onclick="movePage(${idx}, 10)">${idx}</a></li>
					      			</c:if>
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