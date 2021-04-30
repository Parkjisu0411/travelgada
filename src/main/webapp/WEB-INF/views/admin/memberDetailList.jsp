<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>

	<meta charset="UTF-8">
	<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
	<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>

	<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
  
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-date-range-picker/0.21.1/daterangepicker.min.css"
		integrity="sha512-nmvKZG8E3dANbZAsJXpdK6IqpfEXbPNbpe3M3Us1qTipq74IpTRShbpCf8lJFapB7e0MkDbNDKxLjS1VWt2vVg=="
		crossorigin="anonymous" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-date-range-picker/0.21.1/jquery.daterangepicker.min.js"
    	integrity="sha512-jM36zj/2doNDqDlSIJ+OAslGvZXkT+HrtMM+MMgVxCqax1AIm1XAfLuUFP7uMSavUxow+z/T2CRnSu7PDaYu2A=="
    	crossorigin="anonymous"></script>
    	
	<!-- simplebar CSS-->
 	<link href="/resources/assets/plugins/simplebar/css/simplebar.css" rel="stylesheet"/>
	<!-- Bootstrap core CSS-->
	<link href="/resources/assets/css/bootstrap.min.css" rel="stylesheet"/>
	<!-- Icons CSS-->
	<link href="/resources/assets/css/icons.css" rel="stylesheet" type="text/css"/>
	<!-- Sidebar CSS-->
	<link href="/resources/assets/css/sidebar-menu.css" rel="stylesheet"/>
	<!-- Custom Style-->
	<link href="/resources/assets/css/app-style.css" rel="stylesheet"/>
  
  	<link rel="stylesheet" href="${contextPath}/resources/css/font.css">
	<link rel="stylesheet" href="${contextPath}/resources/css/footer.css">
	
	<!-- Bootstrap core JavaScript-->
	<script src="/resources/assets/js/jquery.min.js"></script>
	<script src="/resources/assets/js/popper.min.js"></script>
	<script src="/resources/assets/js/bootstrap.min.js"></script>
	
	<link rel="shortcut icon" type="image/x-icon" href="/resources/img/main/logo.png">

	<title>${member.member_id} 회원</title>
	
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

.member-img {
	height: 100px;
	width: 100px;
	display: block;
	vertical-align: middle;
	margin-top: 50px;
	margin-bottom: 30px;
	margin-left: auto;
	margin-right: auto;
}

.headline{
	font-size: 40px;
	font-family: 'yg-jalnan';
	color: white;
	margin: 60px 20px 30px 20px;
}

/* 탈퇴된 경우 */
.selected {
	text-decoration: line-through grey;
	color: red;
}
/* 검색 창 */
#searchMember {
	text-align: right;
}
/* 모달 색깔 */
.bg-modal {
	background-color: black;
}

/* 검색 글자 색*/
#memberKeyword {
	color: white;
}
</style>

</head>

<body class="bg-theme bg-theme9">
	
	<!-- Start wrapper-->
 	<div id="wrapper">
		
		<!--Start sidebar-wrapper-->
		<div id="sidebar-wrapper" data-simplebar="" data-simplebar-auto-hide="true">
			<div class="brand-logo">
				<a href="/" style="font-family:yg-jalnan"><img src="/resources/img/main/logo.png" class="logo-icon" alt="logo icon">가다</a>
			</div>
   				<ul class="sidebar-menu do-nicescrol">
      				<li>
        				<a href="/admin/member">
          					<i class="zmdi zmdi-view-dashboard"></i> <span>회원 관리</span>
        				</a>
      				</li>
					<li>
						<a href="/visitor"> <i class="zmdi zmdi-invert-colors"></i>
							<span>방문자 통계</span>
						</a>
					</li>
					<li>
						<a href="/statistic/sales">
							<i class="zmdi zmdi-format-list-bulleted"></i> <span>매출 통계</span>
						</a>
					</li>
					<li>
						<a href="/statistic/destination">
							<i class="zmdi zmdi-grid"></i> <span>여행지 통계</span>
						</a>
					</li>
				</ul>
		</div>
		<!--End sidebar-wrapper-->
	
		<div class="content-wrapper">
			<div class="container container-fluid">
				
				<div class="headline">${member.member_id }</div>

				<hr />
				<p class="view-more-p"></p>
	
				<div class="row">
					<div class="col-md-4 member-profile member-profile">
						<img class="rounded-circle member-img"
							src="/resources/img/profile/${member.profile_img_path }"
							onerror="this.src='/resources/img/profile/default_profile_img.jpg'">
						<p><span style="color:white;">${member.member_name }</span></p>
					</div>
					<div class="col-md-8 member-detail">
						<table class="table">
							<tr>
								<th>포인트</th>
								<td>${point }</td>

							</tr>
							<tr>
								<th>이메일</th>
								<td>${member.email }</td>
								<td></td>
							</tr>
							<tr>
								<th>배송지 목록</th>
								<td><c:forEach var="shipping_loc" items="${shippingList }">
										<p>${shipping_loc.shipping_loc_name }(${shipping_loc.address })</p>
									</c:forEach></td>
								<td></td>
							</tr>
						</table>
					</div>
				</div>
				<hr />
			</div>
		</div>
	</div>

</body>
</html>