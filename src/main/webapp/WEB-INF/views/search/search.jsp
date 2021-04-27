<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}" />

<title>검색</title>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-date-range-picker/0.21.1/jquery.daterangepicker.min.js"
		integrity="sha512-jM36zj/2doNDqDlSIJ+OAslGvZXkT+HrtMM+MMgVxCqax1AIm1XAfLuUFP7uMSavUxow+z/T2CRnSu7PDaYu2A=="
		crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-date-range-picker/0.21.1/daterangepicker.min.css"
		integrity="sha512-nmvKZG8E3dANbZAsJXpdK6IqpfEXbPNbpe3M3Us1qTipq74IpTRShbpCf8lJFapB7e0MkDbNDKxLjS1VWt2vVg=="
		crossorigin="anonymous" />
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@700;800&display=swap" rel="stylesheet">
	
	<link rel="stylesheet" href="${contextPath}/resources/css/font.css">
	<link rel="stylesheet" href="${contextPath}/resources/css/header.css">
	<link rel="stylesheet" href="${contextPath}/resources/css/footer.css">
	<link rel="stylesheet" href="${contextPath}/resources/css/main.css">
	
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

/* 도시, 국가 */
.box {
	width: 310px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	margin: 10px;
	float: left;
}

.plBox {
	background-color: #f5f5f5;
}

.diHover {
	background-color: #f5f5f5;
}

.diHover:hover, .plBox:hover {
	box-shadow: 5px 5px 5px rgba(0, 0, 0, 0.4);
	transform: scale(1.02);
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

.plBox {
	border-radius: 15px;
}

.searchBtn {
	border-radius: 15px;
	font-weight: bold;
	width: 100px;
}

#keyword_search {
	height: 45px;
	line-height: 70px;
	background-color: transparent;
	color: black;
	font-size: 20px;
	border-radius: 50px;
	border: 2px solid #303E57;
	font-family: 'GongGothicMedium';
	outline: none;
}

.search_icon {
	background-color: #303E57;
	border-radius: 50px;
	border: none;
	outline: none;
	padding-top: 10px;
	padding-bottom: 9px;
	text-align: center;
	width: 45px;
	height: 45px;
	margin-left: 10px;
	font-family: 'GongGothicMedium';
	font-size: 20px;
	color: white;
}

.search_icon:hover {
	border: none !important;
	outline: none !important;
	color: #1dcad3;
	text-decoration: none;
}

.wrap_search {
	font-family: 'IBMPlexSansKR-Light';
}

.search_menu {
	font-family: 'GongGothicMedium';
	color: #303E57;
	font-size: 20px;
}

.font_h {
	font-family: 'GongGothicMedium';
	color: #1dcad3;
	font-size: 30px;
}

.memu {
	border: solid 1px;
	border-radius: 15px 15px 0 0;
	font-family: 'GongGothicMedium';
	color: white;
	font-size: 20px;
	background-color: #1dcad3;
	width: 100px;
	margin-left: -13px;
}

.memu:hover {
	border: none !important;
	outline: none !important;
	color: #CFD2D3;
	text-decoration: none;
}

.hr_search {
	border: 0.5px solid #1dcad3;
}

.line {
	border: none;
	outline: none;
	border-bottom: 2px solid #1dcad3;
}

.more {
	float: right;
	color: #1dcad3;
	font-size: 15px;
	font-family: 'GongGothicMedium';
}

.search_keyword {
	color: #303E57;
	font-size: 15px;
	font-family: 'GongGothicMedium';
	text-align: center;
}

.hash_color {
	color: #303E57;
}
/* 모달 스타일 */
.Mcontent {
	width: 800px;
}

.dialogtext {
	width: 100%;
	height: 240px;
	font-weight: bold;
	overflow: auto;
	padding-right: 20px;
	float: left;
	padding-left: 10px;
}

pre {
	font-family: 'IBMPlexSansKR-Light';
	font-weight: bold;
	font-size: 16px;
}

.dialogtext::-webkit-scrollbar {
	width: 10px;
}

.dialogtext::-webkit-scrollbar-thumb {
	background-color: #a1eef2; /*  연한 민트 */
	border-radius: 10px;
	background-clip: padding-box;
	border: 2px solid transparent;
}

.dialogtext::-webkit-scrollbar-track {
	background-color: white;
	border-radius: 10px;
	box-shadow: inset 0px 0px 5px white;
}

.dialog-hashtag {
	margin-top: 10px;
	text-align: right;
	overflow: auto;
	width: 100%;
	padding-right: 20px;
	float: left;
	height: 50px;
}

.dialog-hashtag::-webkit-scrollbar {
	width: 10px;
}

.dialog-hashtag::-webkit-scrollbar-thumb {
	background-color: #a1eef2;
	border-radius: 10px;
	background-clip: padding-box;
	border: 2px solid transparent;
}

.dialog-hashtag::-webkit-scrollbar-track {
	background-color: white;
	border-radius: 10px;
	box-shadow: inset 0px 0px 5px white;
}

.dialog-date {
	width: 100%;
	height: 40px;
	margin-top: 10px;
	padding-right: 20px;
	text-align: right;
	float: left;
}

.popup_img {
	width: 100%;
	height: 400px;
	object-fit: cover;
	border-radius: 4px;
	padding: 0;
}

.close {
	margin: 10px 20px 10px 0;
	text-align: right;
	outline: none;
}

.close:hover {
	color: #1dcad3;
}

.dialog-profile {
	margin-top: 15px;
	padding-left: 10px;
}

.dialog-wrap {
	width: 100%;
	float: left;
}
/* 모달 스타일 끝 */

/* 일정 이미지 */
.card-pl-img {
	width: 90%;
	height: 300px;
	margin: 20px;
	object-fit: cover;
	border-radius: 15px;
	float: left;
}

.city, .country, .date {
	font-family: 'GongGothicLight';
}
</style>

<script>
/* 해시태그 & 링크 */
$(document).ready(
	function() {

		var content; //내용
		var splitedArray; //배열
		var linkedContent; //주소

		//jstl
		<c:forEach items="${member}" var="member">
			<c:forEach items="${member.plannerVO}" var="pl">
				<c:forEach items="${pl.diaryVO}" var="di">
					console.log("${di.hashtag}")
		
					content = "${di.hashtag}";
					splitedArray = content.split('#');//#으로 구분
					console.log(splitedArray);
					linkedContent = '';
					splitedArray.shift();//첫번째 지워주는 함수
		
					for ( var word in splitedArray) {
						word = splitedArray[word];
						if (word.indexOf("") == 0) {
							var word2 = "#" + word;
							word = '<a class="hash_color" href="${pageContext.request.contextPath}/search?keyword='+ word + '">' + word2 + '</a>'
							console.log(word);
							console.log(word2);
						}
						linkedContent += word + ' ';
					}
		
					$("#${di.diary_id}").append(linkedContent);
					$("#modal${di.diary_id}").append(linkedContent);
				</c:forEach>
			</c:forEach>
		</c:forEach>

	});
/* 해시태그 & 링크 끝 */
</script>

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
			<input id="keyword_search" class="col-sm-11" type="text"
				name="keyword" placeholder="검색어를 입력하세요." />
			<button class="search_icon" type="submit" >
				<i class="fa fa-search search-icon-in"></i>
			</button>
		</form>

		<br />
		<div class="search_keyword">
			<span style="font-size: 22px">" ${keyword} "</span> 에 관한 검색입니다.
		</div>
		<br />

		<!-- 검색 메뉴 -->
		<div class=" line col-12">
			<button type="button" class="memu btn"
				onclick="window.location.href='${pageContext.request.contextPath}/search?keyword=${keyword}'">통합</button>
			<button type="button" class="memu btn "
				onclick="window.location.href='${pageContext.request.contextPath}/searchPl?keyword=${keyword}&sorter=basic'">일정</button>
			<button type="button" class="memu btn "
				onclick="window.location.href='${pageContext.request.contextPath}/searchDi?keyword=${keyword}&sorter=basic'">다이어리</button>
		</div>

		<br />
		<br />
		
		<!-- 일정 searchPl -->
		<span class="font_h">일정</span> 
		<br /> 
		<a class="more" href="${pageContext.request.contextPath}/searchPl?keyword=${keyword}"> 더보기 </a> <br />
			
		<c:if test="${empty searchPl}">
			<span style="font-size: 22px">" ${keyword} "</span> 에 관한 일정이 없습니다.
		</c:if>
			
		<c:forEach items="${searchPl}" var="pl">
			
			<div class="row plBox" onclick="location.href='/search/${pl.member_id}/${pl.planner_id}';">
				<div class="col-sm-6">
					<img class="card-pl-img" src="/resources/img/planner/${ pl.planner_img_path}" onerror="this.src='/resources/img/profile/gada'">
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
						<br /> <br />
					</div>
					<br />
				</div>
			</div><!-- 일정 검색 -->
			<br />
		</c:forEach>
		<!-- 반복 끝 -->
		<!-- 일정 더보기 버튼 -->

		<br /><br />
		<!-- 다이어리 searchDi -->
		<hr class="hr_search">
		<br />
		<br />
		<h5 class="font_h">다이어리</h5>

		<br /> 
		<a class="more" href="${pageContext.request.contextPath}/searchDi?keyword=${keyword}"> 더보기 </a> 
		<br />

		<!-- 다이어리 반복 -->
		<c:if test="${empty member}">
			<span style="font-size: 22px">" ${keyword} "</span> 에 관한 다이어리가 없습니다.
		</c:if>

		<div class="row">
			<c:forEach items="${member}" var="member">
				<c:forEach items="${member.plannerVO}" var="pl">
					<c:forEach items="${pl.diaryVO}" var="di">
						<div class="col-md-3 ">
							<div class="main-card-diary-area diHover">
								<img src="resources/diary/${di.img_path}"
									class="main-card-diary-img" loading="lazy" data-toggle="modal"
									data-target="#myModal${di.diary_id}"
									onerror="this.src='/resources/img/main/logo3.png'">
								<div class="main-card-diary-content">
									<div class="main-card-diary-profile">
										<img class="nav-profile-img"
											src='/resources/img/profile/${member.profile_img_path }'
											onerror="this.src='/resources/img/profile/default_profile_img.jpg'">
										<a class="main-card-diary-profile-id" href="#">${member.member_id}</a>
									</div>
									<div class="main-card-diary-hashtag-area">
										<span class="main-card-diary-hashtag" id="${di.diary_id }"></span>
									</div>
								</div>
							</div>
						</div>
						<!-- 다이어리 끝 -->

						<!-- Modal -->
						<div class="modal fade" id="myModal${di.diary_id}" role="dialog">
							<div class="modal-dialog modal-lg modal-dialog-centered">
								<div class="modal-content">
									<div class="row  ">
										<div class="col-sm-6">
											<img class="popup_img" src='resources/diary/${di.img_path}' onerror="this.src='/resources/img/main/logo3.png'"/>
										</div>
										<div class="dialog-wrap col-sm-6">
											<button type="button" class="close" data-dismiss="modal">&times;</button>
											<div class="dialogDi dialog-profile">
												<img class="nav-profile-img"
													src='/resources/img/profile/${member.profile_img_path }'
													onerror="this.src='/resources/img/profile/default_profile_img.jpg'">
												${member.member_id}
											</div>
											<div class="dialogDi dialog-date">${di.diary_date}</div>
											<div class="dialogtext" style="white-space:pre-wrap;">${di.text}</div>
											<div class="dialogDi dialog-hashtag">
												<span id="modal${di.diary_id}"></span>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</c:forEach>
			</c:forEach>
		</div>
		<br />
	</div>
	<!-- container end -->
	
	<%@ include file="/WEB-INF/views/includes/chat_icon.jsp" %>

	<!-- Footer -->
	<%@ include file="/WEB-INF/views/includes/footer.jsp"%>

</body>
</html>
