<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>

<title>다이어리 검색</title>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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

/* 다이어리 이미지 */
.diary_img {
	width: 240px;
	height: 240px;
	object-fit: cover;
	display: block;
	margin: 0px auto;
	padding-bottom: 20px;
}
</style>

<style>
/* 여기 */
/* 모달 스타일 */
/* .dialogDi{
 	height : 40px;
} */

/* .mainImg{
    float: left;
} */
.Mcontent {
	/* 	padding:0px;
	width:100% */
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
	/* padding-right:20px; */
	/* width: 100%;  */
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
	/* width : 350px; */
	float: left;
}
/* 모달 스타일 끝 */
.main-card-diary-area {
	background-color: #f5f5f5;
}

.diHover:hover {
	box-shadow: 5px 5px 5px rgba(0, 0, 0, 0.4);
	transform: scale(1.02);
}
</style>

<style>
#keyword_search{
	height: 45px;
/* 	width: 50%; */
/* 	min-width: 100%; */
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
/* 	border: 2px solid #303E57;
	background-color: transparent;
	border-radius: 10px; */
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

.searchResult{
	font-family: 'IBMPlexSansKR-Light';
	font-weight: bold;
	font-size: 22px
}

</style>

<script>
/* 해시태그 & 링크 */
	$(document).ready(function(){
			
		var content; //내용
		var splitedArray; //배열
		var linkedContent; //주소
		
		//jstl
	    <c:forEach items="${member}" var="member">
		    <c:forEach items="${member.plannerVO}" var="pl">
			    <c:forEach items="${pl.diaryVO}" var="di">
		    		
		    	    content = "${di.hashtag}";
		    	    splitedArray = content.split('#');//#으로 구분
		    	    console.log(splitedArray);
		    	    linkedContent = '';
		    	    splitedArray.shift();//첫번째 지워주는 함수
		
		    	    for(var word in splitedArray){
		    	      word = splitedArray[word];
		    	       if(word.indexOf("") == 0)
		    	       { var word2 = "#"+word;
		    	          word = '<a class="hash_color" href="${pageContext.request.contextPath}/search?keyword='+word+'">'+word2+'</a>'
		    	          console.log(word);
		    	          console.log(word2);
		    	       }
		    	       linkedContent += word+' ';
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
			<button class="search_icon" type="submit">
				<i class="fa fa-search"></i>
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
		<span class="font_h">다이어리&nbsp;&nbsp;&nbsp;</span> 
		
		<span class="dropdown">
			<button class="searchDrop dropdown-toggle drop" data-toggle="dropdown">정렬</button>
			<span class="dropdown-menu"> <a class="dropdown-item" 
				href="${pageContext.request.contextPath}/searchDi?keyword=${keyword}&sorter=basic">최신순</a>
		</span>
		
		</span> &nbsp; <span class="dropdown">
			<button class="searchDrop dropdown-toggle drop" data-toggle="dropdown">기간</button>
			<span class="dropdown-menu"> 
				<a class="dropdown-item"
					href="${pageContext.request.contextPath}/searchDi?keyword=${keyword}&sorter=day">1일</a>
				<a class="dropdown-item"
					href="${pageContext.request.contextPath}/searchDi?keyword=${keyword}&sorter=week">1주</a>
				<a class="dropdown-item"
					href="${pageContext.request.contextPath}/searchDi?keyword=${keyword}&sorter=month">1개월</a>
				<a class="dropdown-item"
					href="${pageContext.request.contextPath}/searchDi?keyword=${keyword}&sorter=year">1년</a>
			</span>
		</span> 
		<br />
		<br />

		<c:if test="${empty member}">
			<span class="searchResult">" ${keyword} "</span> 에 관한 다이어리가 없습니다.
		</c:if>

		<!-- 다이어리 반복 -->
		<div class="row">
			<c:forEach items="${member}" var="member">
				<c:forEach items="${member.plannerVO}" var="pl">
					<c:forEach items="${pl.diaryVO}" var="di">
						<div class="col-md-3 ">
							<div class="main-card-diary-area diHover">
								<img src="resources/diary/${di.img_path}"
									class="main-card-diary-img" loading="lazy" data-toggle="modal"
									data-target="#myModal${di.diary_id}">
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
						<!-- 여기  -->
						<div class="modal fade" id="myModal${di.diary_id}" role="dialog">
							<!-- <div class="mySlides"> -->
							<div class="modal-dialog modal-lg modal-dialog-centered">
								<div class="modal-content">
									<!-- 						<div class="modal-header">
							</div> -->
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
									<!-- <div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button>
							</div> -->
								</div>
								<!-- modal-content end -->
							</div>
						</div>
					</c:forEach>
					<!-- Modal end -->
				</c:forEach>
				<!-- 다이어리 반복 끝 -->
			</c:forEach>
		</div>
		<br/><br/>

		<div class="row">
			<div class="paging">
				<!-- 페이징 -->
				<ul class="pagination">
					<c:if test="${pageMaker.prev}">
						<li class="page-item"><a class="page-link"
							href="/searchDi?keyword=${keyword}&sorter=${sorter}&nowPage=${pageMaker.startPage - 1}">◀</a></li>
					</c:if>
					<c:forEach begin="${pageMaker.startPage }"
						end="${pageMaker.endPage }" var="idx">
						<li class="page-item"><a class="page-link"
							href="/searchDi?keyword=${keyword}&sorter=${sorter}&nowPage=${idx}">${idx}</a></li>
					</c:forEach>
					<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						<li class="page-item"><a class="page-link"
							href="/searchDi?keyword=${keyword}&sorter=${sorter}&nowPage=${pageMaker.endPage +1}">▶</a></li>
					</c:if>
				</ul>
				<!-- 페이징 끝 -->
			</div>
			<!-- 다이어리 row end -->
		</div>
		<br />
	</div>
	
	<%@ include file="/WEB-INF/views/includes/chat_icon.jsp" %>
	
	<!-- Footer -->
	<%@ include file="/WEB-INF/views/includes/footer.jsp"%>

</body>
</html>