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

	//Get the modal
	var modal = document.getElementById('enroll-form');
	
	// When the user clicks anywhere outside of the modal, close it
	window.onclick = function(event) {
	    if (event.target == modal) {
	        modal.style.display = "none";
	    }
	}
	
	$(document).ready(function() {
		
		$(".delete").click(function(event) {
			event.preventDefault();
			console.log("delete click");
			var trObj = $(this).parent().parent();//자바스크립트 클로저

			$.ajax({
				type : 'DELETE', //method
				url : $(this).attr("href"), //주소를 받아오는 것이 포인트.
				cache : false,
				success : function(result) {
					console.log("result: " + result);
					if (result == "SUCCESS") {
						$(trObj).remove();
					}
				},
				errer : function(e) {
					console.log(e);
				}
			}); //end of ajax
		});
	});
</script>
</head>
<body>
	<!-- Header -->
	<%@ include file="/WEB-INF/views/includes/header.jsp"%>
	<!--Content -->
	<div class="divider-header-blank"></div>
	<div id="wrap">
		<div class="container">
			<h2 class="headline" style="font-family: 'yg-jalnan'">배송지 목록</h2>
			<p class="view-more-p">
				<button type="button" class="btn btn-secondary" data-toggle="modal"
					data-target="#enroll-modal">배송지 등록</button>
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
										<p style="font-weight: bold;">${shipping_loc.shipping_loc_name }</p>
										<p>${shipping_loc.receiver }</p>
									</td>
									<td>${shipping_loc.address }</td>
									<td>${shipping_loc.receiver_phone_num }</td>
									<td>
										<div class="btn-aroup">
											<button type="button" class="btn btn-light">수정</button>
											<button type="button" class="btn btn-light delete"
												onclick="delete();">삭제</button>
										</div>
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
	<!-- The Modal (contains the 배송지 등록) -->
	<div id="enroll-modal" class="modal">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title" style="font-family: 'yg-jalnan'">배송지 등록</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<form action="" method="POST">
						<div class="form-group">
							<label for="shipping_loc_name">배송지 이름</label>
							<input type="text" class="form-control" placeholder="배송지 이름" id="shipping_loc_name" />
						</div>
						<div class="form-group">
							<label for="receiver_name">수령인</label>
							<input type="text" class="form-control" placeholder="수령인" id="receiver_name" />
						</div>
						<div class="form-group">
							<label for="address">주소</label>
							<input type="text" class="form-control" id="address" />
						</div>
						<div class="form-group row">
							<div class="col">
								<label for="receiver_phone_num">연락처</label>
							</div>
							<div class="col">
								<input type="tel" class="form-control" id="receiver_phone_num" />
							</div><div class="col">
								<input type="tel" class="form-control" id="receiver_phone_num" />
							</div><div class="col">
								<input type="tel" class="form-control" id="receiver_phone_num" />
							</div>
						</div>
					</form>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" onclick="">등록</button>
					<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
				</div>

			</div>
		</div>
	</div>
	<!-- Footer -->
	<%@ include file="/WEB-INF/views/includes/footer.jsp"%>
</body>
</html>