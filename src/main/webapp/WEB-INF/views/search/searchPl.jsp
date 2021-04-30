<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>

<title>일정 검색</title>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-date-range-picker/0.21.1/jquery.daterangepicker.min.js"
    	integrity="sha512-jM36zj/2doNDqDlSIJ+OAslGvZXkT+HrtMM+MMgVxCqax1AIm1XAfLuUFP7uMSavUxow+z/T2CRnSu7PDaYu2A=="
    	crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-date-range-picker/0.21.1/daterangepicker.min.css"
		integrity="sha512-nmvKZG8E3dANbZAsJXpdK6IqpfEXbPNbpe3M3Us1qTipq74IpTRShbpCf8lJFapB7e0MkDbNDKxLjS1VWt2vVg=="
		crossorigin="anonymous" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@700;800&display=swap" rel="stylesheet">
	
	<link rel="stylesheet" href="${contextPath}/resources/css/font.css">
	<link rel="stylesheet" href="${contextPath}/resources/css/header.css">
	<link rel="stylesheet" href="${contextPath}/resources/css/footer.css">
	
	<link rel="shortcut icon" type="image/x-icon" href="/resources/img/main/logo.png">

<style>
html, body {
	width: 100%;
	height: 100%;
	margins: 0;
	padding: 0;
	font-family: 'IBMPlexSansKR-Light';
	font-weight: bold;
}

/* 다이어리 이미지 */
.diary_img {
	width: 240px;
	height: 240px;
	object-fit: cover;
	display: block;
	margin: 0px auto;
	padding-bottom: 20px;
}

/* 모달 스타일 */
.dialogDi {
	width: 300px;
	height: 50px;
	float: left;
	margin-left: 30px;
	margin-botton: 10px;
}

.mainImg {
	float: left;
}

/* 도시, 국가 ... */
.box {
	width: 310px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	margin: 10px;
	float: left;
}

.plBox:hover {
	box-shadow: 5px 5px 5px rgba(0, 0, 0, 0.4);
	transform:scale(1.02);
}

.plBox {
	background-color: #f5f5f5;
	border-radius: 15px;
}
</style>

<style>
#keyword_search{
	height: 45px;
	line-height: 70px;
	background-color: transparent;
	color: black;
	font-size: 20px;
	border-radius: 50px;
	border: 2px solid #303E57;
	font-family: 'GongGothicMedium';
	outline:none;
}

.search_icon{
	background-color: #303E57;
	border-radius: 50px;
 	border: none;
	padding-top: 10px;
	padding-bottom: 9px;
	text-align: center; 
	width: 45px;
	height: 45px;
	margin-left:10px;
	font-family: 'GongGothicMedium';  
	font-size:20px; 
	color:white;
	outline:none;
}

.search_icon:hover{
	border: none !important;
	outline: none !important;
	color: #1dcad3;
	text-decoration: none;
}

.wrap_search{
	font-family: 'IBMPlexSansKR-Light';
}

.search_menu{
	font-family: 'GongGothicMedium';
	color:#303E57;
	font-size:20px;
}

.font_h{
	font-family: 'GongGothicMedium';
	color:#1dcad3;
	font-size:30px;
}

.memu{
	border: solid 1px;
	border-radius: 15px 15px 0 0;
	font-family: 'GongGothicMedium';
	color: white;
	font-size:20px;
	background-color: #1dcad3;
	width:100px;
	margin-left:-13px;
}

.memu:hover {
	border: none !important;
	outline: none !important;
	color: #CFD2D3;
	text-decoration: none;
}

.hr_search{
	border: 0.5px solid #1dcad3;
}

.line{
	border: none;
	outline: none;
	border-bottom: 2px solid #1dcad3;
}

.more{
	float:right;
	color:#1dcad3;
	font-size:15px;
	font-family: 'GongGothicMedium';
}

.search_keyword{
	color:#303E57;
	font-size:15px;
	font-family: 'GongGothicMedium';
	text-align:center;
}

.hash_color{
	color:#303E57;
}

.searchDrop{
	color:#303E57;
	font-family: 'GongGothicMedium';
	 
}

.drop{
	border:none;
	float: right;
	background-color: #CFD2D3;
}

.paging{
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

/* 일정 이미지 */
.card-pl-img{
	width: 90%;
	height: 300px;
	margin: 20px;
	object-fit: cover;
	border-radius: 15px;
}

.city, .country, .date{
	font-family: 'GongGothicLight';
}
</style>

<script>
/* 검색어를 입력하지 않을 경우 */
$(document).ready(function() {
		$(".search_icon").click(function() {
			var keyword = $("#keyword_search").val();
			
			if(keyword.length == 0){
				alert("검색어를 입력해주세요!");
				$("#keyword_search").focus();
				return false;
			}
		});
});
</script>

</head>
<body>

	<!-- Header -->
	<%@ include file="/WEB-INF/views/includes/header.jsp"%>

	<!--Content -->
	<div class="container wrap_search">
	
		<!-- 검색 바 -->
		<form action="${pageContext.request.contextPath}/search" method="get">			
			<input id="keyword_search" class="col-sm-11" type="text" name="keyword" placeholder="검색어를 입력하세요."/>
			<button class="search_icon" type="submit"><i class="fa fa-search"></i></button>
		</form>	
		<br/>
		<div class="search_keyword"><span style="font-size:22px">" ${keyword} "</span> 에 관한 검색입니다.</div>
		<br/>
		
		<!-- 검색 메뉴 -->
		<div class=" line col-12">
			<button type="button" class="memu btn"
				onclick="window.location.href='${pageContext.request.contextPath}/search?keyword=${keyword}'">통합</button>
			<button type="button" class="memu btn "
				onclick="window.location.href='${pageContext.request.contextPath}/search/planner?keyword=${keyword}&sorter=basic'">일정</button>
			<button type="button" class="memu btn "
				onclick="window.location.href='${pageContext.request.contextPath}/search/diary?keyword=${keyword}&sorter=basic'">다이어리</button>
		</div>
		
		<br/><br/>
		
		<!-- 일정  --> 
		<span class="font_h">일정&nbsp;&nbsp;&nbsp;</span>
		
		<span class="dropdown">
			<button class="searchDrop dropdown-toggle drop" data-toggle="dropdown">정렬</button>
			<span class="dropdown-menu">
   	  			<a class="dropdown-item" href="${pageContext.request.contextPath}/search/planner?keyword=${keyword}&sorter=startDate">최신순</a>
   			</span>		
		</span>
		 &nbsp;
		 
		<span class="dropdown">
			<button class="searchDrop dropdown-toggle drop" data-toggle="dropdown">기간</button>
				<span class="dropdown-menu">
     		 		<a class="dropdown-item" 
     		 			href="${pageContext.request.contextPath}/search/planner?keyword=${keyword}&sorter=day">1일</a>
    	  			<a class="dropdown-item" 
    	  				href="${pageContext.request.contextPath}/search/planner?keyword=${keyword}&sorter=week">1주</a>
    	  			<a class="dropdown-item" 
    	  				href="${pageContext.request.contextPath}/search/planner?keyword=${keyword}&sorter=month">1개월</a>
    	  			<a class="dropdown-item" 
    	  				href="${pageContext.request.contextPath}/search/planner?keyword=${keyword}&sorter=year">1년</a>
    			</span>		
		</span>
		<br/><br/>
		
		<c:if test="${empty plMore}">
			<span style="font-size: 22px">" ${keyword} "</span> 에 관한 일정이 없습니다.
		</c:if>
		
		<!-- 반복 -->
		<c:forEach items="${plMore}" var="pl"> 
			<div class="row plBox" onclick="location.href='/search/planner/${pl.member_id}/${pl.planner_id}';">
				<div class="col-sm-6">
					<img class="card-pl-img" src="/resources/img/planner/${ pl.planner_img_path}" onerror="this.src='/resources/img/profile/gada'">
					<%-- <a href="/search/${pl.member_id}/${pl.planner_id}">일정사진</a> --%>
				</div>
				<div class="col-sm-6">
					<div class="box">
						<br> 
						<span class="date">${pl.start_date}&nbsp; ~ &nbsp;${pl.end_date}</span> 
						<br /><br />
						
						<span class="country">국가 : &nbsp;</span>
						<c:forEach items="${pl.scheduleVO}" var="sc">
							<c:if test="${sc.schedule_type_id eq 5}">
								${sc.schedule_content}
							</c:if>
						</c:forEach>
					</div>
				
					<div class="box">
						<span class="city">도시 : &nbsp;</span>
						<c:forEach items="${pl.scheduleVO}" var="sc">
							<c:if test="${sc.schedule_type_id eq 1}">
								${sc.schedule_content}
							  </c:if>
						</c:forEach>
					</div>
					<br/>
				</div>
			</div>
			<br/>
		</c:forEach><!-- 반복 끝 -->
	
		<br/><br/>

		<div class="row">
			<div class="paging">
				<ul class="pagination">
					<c:if test="${pageMaker.prev}">
						<li class="page-item"><a class="page-link"
							href="/search/planner?keyword=${keyword}&sorter=${sorter}&nowPage=${pageMaker.startPage-1}">◀</a></li>
					</c:if>
					<c:forEach begin="${pageMaker.startPage }"
						end="${pageMaker.endPage }" var="idx">
						<li class="page-item"><a class="page-link"
							href="/search/planner?keyword=${keyword}&sorter=${sorter}&nowPage=${idx}">${idx}</a></li>
					</c:forEach>
					<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						<li class="page-item"><a class="page-link"
							href="/search/planner?keyword=${keyword}&sorter=${sorter}&nowPage=${pageMaker.endPage+1}">▶</a></li>
					</c:if>
				</ul>
			</div>
		</div><br/>
	</div>
	<!-- container end -->
	
	<%@ include file="/WEB-INF/views/includes/chat_icon.jsp" %>

	<!-- Footer -->
	<%@ include file="/WEB-INF/views/includes/footer.jsp"%>

</body>
</html>