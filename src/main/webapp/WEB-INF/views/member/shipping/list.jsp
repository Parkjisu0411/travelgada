<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
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
<title>Shipping List</title>
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

.member-img {
	margin: 30px;
	height: 100px;
	display: block;
}

.btn {
	width : 10%;
}
</style>
<script type="text/javascript">

	//팝업
	function enroll() {
		var pop = window.open("/shipping/enroll", 'pop', "width=570,height=520, scrollbars=yes, resizable=yes");
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
					type : 'DELETE', //method
					url : "/member/shipping", //주소를 받아오는 것이 포인트.
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
		//배송지 수정
		$(".modify").click(function(e) {
			e.preventDefault();
			var trObj = $(this).parent().parent().parent();
			var name = trObj.children().children("form").children(".name").val();
			enroll();
			document.forms[name].submit();
		})
		//
	});
</script>
</head>
<body>
	<!-- Header -->
	<%@ include file="/WEB-INF/views/includes/header.jsp"%>
	<!--Content -->
	<div class="divider-header-blank"></div>
	<p id="id" style="display: none"><sec:authentication property="principal.username"/></p>
	<div id="wrap">
		<div class="container">
			<h2 class="headline" style="font-family: 'yg-jalnan'">배송지 목록</h2>
			<p class="view-more-p">
				<button type="button" class="btn btn-secondary" onclick="enroll();">배송지 등록</button>
			</p>
			<div class="row">
				<div class="col-md-12 member-detail">
					<table class="table">
						<thead>
							<tr>
								<th>배송</th>
								<th>주소</th>
								<th>연락처</th>
								<th>수정 삭제</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="shipping_loc" items="${shippingList }">
								<tr>
									<td>
										<strong class="shipping_name" id="shipping_name">${shipping_loc.shipping_loc_name }</strong>
										<p id="receiver">${shipping_loc.receiver }</p>
									</td>
									<td>
										<span id="zipcode">${shipping_loc.zip_code}</span>
										<span id="address">${shipping_loc.address }</span>
										<span id="address_detail">${shipping_loc.address_detail }</span>
										
									</td>
									<td id="phone">${shipping_loc.receiver_phone_num }</td>
									<td>
										<div class="btn-aroup">
											<button type="button" class="btn btn-light modify">수정</button>
											<button type="button" class="btn btn-light delete" onclick="delete();">삭제</button>
										</div>
										<form name="${shipping_loc.shipping_loc_name }" action="/shipping/enroll" method="post" target="pop">
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
					<button type="button" class="btn btn-secondary"
						onclick="window.history.back();">돌아가기</button>
				</div>
			</div>
		</div>
	</div>
	<!-- Footer -->
	<%@ include file="/WEB-INF/views/includes/footer.jsp"%>
</body>
</html>