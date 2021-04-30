<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- font -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@700;800&display=swap" rel="stylesheet">
<!-- GADA CSS -->
<link rel="stylesheet" href="${contextPath}/resources/css/main.css">
<link rel="stylesheet" href="${contextPath}/resources/css/font.css">
<link rel="stylesheet" href="${contextPath}/resources/css/header.css">
<link rel="stylesheet" href="${contextPath}/resources/css/footer.css">
<link rel="stylesheet" href="${contextPath}/resources/css/utils.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Shipping List</title>
<style>
	body {
		font-family: 'IBMPlexSansKR-Light';
	}

	hr {
		background-color: #1DCAD3;
	}
	
	.more-view {
		float: right;
		cursor: pointer;
	}
	
	thead {
		text-align: center;
	}
	
	thead tr {
		font-size: 20px;
		height: 60px;
	}
	
	table {
		width: 100%;
	}
	
	tbody tr:hover {
		color: #1DCAD3;
		cursor: pointer;
	}
	
	.row {
		min-height: 800px;
	}
	
	.gada-btn-group {
		text-align: center;
	}
	
</style>
<script type="text/javascript">

	//팝업
	function enroll() {
		var pop = window.open("/shipping_write", 'pop', "width=630,height=500, scrollbars=yes, resizable=yes");
	}
	//
	//배송지 수정 팝업
	function modify(obj) {
		var name = $(obj).children().children("form").children(".name").val();
		enroll();
		document.forms[name].submit();
	}
	//
	$(document).ready(function() {
		
		//배송지 삭제	
		$(".delete").click(function(e) {
			e.preventDefault();
			if(confirm("배송지를 삭제하시겠습니까?")) {
				var trObj = $(this).parent().parent().parent();//자바스크립트 클로저
				var form = {
						member_id : $("#id").text(),
						shipping_loc_name : trObj.children().children("strong").text()
				};
				$.ajax({
					type : 'DELETE',
					url : "/shipping",
					data : JSON.stringify(form),
					contentType : "application/json",
					cache : false,
					beforeSend : function(xhr) {
						xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
					},
					success : function(result) {
						console.log("result: " + result);
						if (result == "SUCCESS") {
							$(trObj).remove();
						}
					},
					error : function(e) {
						console.log(e);
					}
				}); //end of ajax
			}
		});
		//
	});
</script>
</head>
<body>
	<!-- Header -->
	<%@ include file="/WEB-INF/views/includes/header.jsp"%>
	<!--Content -->
	<p id="id" style="display: none"><sec:authentication property="principal.username"/></p>
	<div class="container">
		<a class="more-view" onclick="enroll()">배송지 등록</a>
		<h2 class="gada-headline">SHIPPING LIST</h2>
		<hr />
		<div class="row">
			<div class="col-md-12">
				<div class="gada-card">
					<table class="table-borderless">
						<colgroup>
							<col width=15%>
							<col width=15%>
							<col width=50%>
							<col width=15%>
							<col width=5%>
						</colgroup>
						<thead>
							<tr>
								<th>배송지</th>
								<th>수령인</th>
								<th>주소</th>
								<th>연락처</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="shipping_loc" items="${shippingList }">
								<tr onclick="modify(this)">
									<td>
										<strong class="shipping_name" id="shipping_name">${shipping_loc.shipping_loc_name }</strong>
									</td>
									<td id="receiver">${shipping_loc.receiver }</td>
									<td>
										<span id="zipcode">${shipping_loc.zip_code}</span>
										<span id="address">${shipping_loc.address }</span>
										<span id="address_detail">${shipping_loc.address_detail }</span>
										
									</td>
									<td id="phone">${shipping_loc.receiver_phone_num }</td>
									<td>
										<div class="btn-aroup">
											<button type="button" class="btn btn-light delete" onclick="delete();"><i class="fas fa-times"></i></button>
										</div>
										<form name="${shipping_loc.shipping_loc_name }" action="/shipping_write" method="post" target="pop">
											<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
											<input type="hidden" class="name" name="shipping_loc_name" value="${shipping_loc.shipping_loc_name }" />
											<input type="hidden" name="receiver" value="${shipping_loc.receiver }" />
											<input type="hidden" name="zip_code" value="${shipping_loc.zip_code }" />
											<input type="hidden" name="address" value="${shipping_loc.address }" />
											<input type="hidden" name="address_detail" value="${shipping_loc.address_detail }" />
											<input type="hidden" name="receiver_phone_num" value="${shipping_loc.receiver_phone_num }" />
										</form>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="gada-btn-group">
						<button type="button" class="btn gada-btn-reverse" onclick="window.history.back();">돌아가기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Footer -->
	<%@ include file="/WEB-INF/views/includes/footer.jsp"%>
</body>
</html>