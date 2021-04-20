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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- 영어 폰트(헤드라인) -->
<style>
@import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@800;900&display=swap');
</style>
<!-- 한글 폰트(헤드라인) -->
<style>
@font-face {
    font-family: 'GongGothicMedium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10@1.0/GongGothicMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
</style>
<!-- 한글 폰트(기본) -->
<style>
@font-face {
    font-family: 'IBMPlexSansKR-Light';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/IBMPlexSansKR-Light.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
</style>

<title>NOTICE BOARD</title>
<style>
html, body {
	width: 100%;
	height: 100%;
	margins: 0;
	padding: 0;
}

.table td{
	border:1px solid #1DCAD3;
	border-left:none;
	border-right:none;
}

.thead td{
	border-left:none;
	border-right:none;
	background-color:#1DCAD3;
	color:white;
}

.headline{
	font-family: 'Montserrat', sans-serif;
	color:#1DCAD3;
	font-size:28pt;
}

.introduction{
	font-family: 'GongGothicMedium';
	color: #CFD2D3;
}

.bar{
	color: #b4b5b4;
	font-size:14pt;
	font-weight:bold;
}

.con{
	font-family: 'IBMPlexSansKR-Light';
	font-weight:bold;
    text-align:center;
}

.content{
	color:#3d464b;
	margin:0 30px;
	text-align:left;
	width:40%;
}

.content2{
	margin:0 30px;
}

.noticeContent2 {
	color:#ff7473 !important;
}

.notice, thead{
	font-family: 'IBMPlexSansKR-Light';
    text-align:center;
    font-weight:bold;
    color:#303E57;
}

.notice td{
	border:2px solid #1DCAD3;
	border-left:none;
	border-right:none;
} 

.content2 a{
	/* color:black; */
	color:#3d464b;
}

a{
	text-decoration:none !important 
}

.Rcnt{
	color:#ff7473 !important;
	font-size:11pt;
}

.pin{
	width:18px;
	height:18px;
}

.writeButton{
	border-radius:1em;
	border:none; 
	float:right;
	font-family: 'GongGothicMedium';
	color: white;
	background:#1DCAD3;
	width:70px;
	height:30px;
	margin:10px 0;
}

	button:focus{
		border:0;
		outline:none;
	}

	.con a:hover{
		color:#1DCAD3;
	}
	
	.Rcnt:hover{
		font-size:1em;
	}
	
	.headline:hover{
		color: #CFD2D3;
	}
</style>

	<script>
		function check_id(){
      	 	alert("로그인이 필요한 서비스입니다");
			location.href="${pageContext.request.contextPath}/member/login";
   		}
	</script>
</head>
<body>
	<!-- Header -->
	<%@ include file="/WEB-INF/views/includes/header.jsp" %>
	<!--Content -->
	<div class="divider-header-blank"></div>
	<div id="wrap">
		<div class="container">
			<a class="headline" href="${pageContext.request.contextPath }/board/4">NOTICE</a><br />
			<span class="bar">|</span><span class="introduction"> 공지사항을 확인해주세요!</span><br /><br />
					<table class="table">
					<thead>
						<tr class="thead">
							<td>번호</td>
							<td>제목</td>
							<td>작성자</td>
							<td>날짜</td>
							<td>조회수</td>
						</tr>
					</thead>

					<tbody>
						<c:forEach items="${boardNoticeList }" var="boardNoticeList">
							<tr class="notice">
								<td>${boardNoticeList.board_id }</td>
								<td class="content">
									<a href="${pageContext.request.contextPath }/board/${boardNoticeList.board_id}/${boardNoticeList.member_id}/${boardNoticeList.board_type_id}" class="noticeContent2" ><img class="pin" src="/resources/board/push-pin.png">&nbsp;&nbsp;&nbsp;${boardNoticeList.title }</a>
								</td>
								<td>${boardNoticeList.member_id }</td>
								<td><fmt:formatDate value="${boardNoticeList.board_date }" pattern="yyyy/MM/dd hh:mm"/></td>
								<td>${boardNoticeList.bhit }</td>
							</tr>
						</c:forEach>					
					
						<c:forEach items="${boardReviewList }" var="boardReviewList">
						<tr class="con">
							<td>${boardReviewList.board_id }</td>
							<td class="content">
								<div class="content2">
								<c:forEach begin="1" end="${boardReviewList.bindent }">[답변]</c:forEach>
								<a href="${pageContext.request.contextPath }/board/${boardReviewList.board_id}/${boardReviewList.member_id}/${boardReviewList.board_type_id}">${boardReviewList.title }</a>
								<a class="Rcnt" href="${pageContext.request.contextPath }/board/replyContent/${boardReviewList.board_id}/${boardReviewList.member_id}/${boardReviewList.board_type_id}">&nbsp;&nbsp;${boardReviewList.cnt }</a>
								</div>
							</td>
							<td class="content2"><a href="#" onclick="delchk();">${boardReviewList.member_id }</a></td>
							<td><fmt:formatDate value="${boardReviewList.board_date }" pattern="yyyy/MM/dd hh:mm"/></td>
							<td>${boardReviewList.bhit }</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>

			<div>	
			<sec:authorize access="isAnonymous()">
  				<button class="writeButton" type="button" onclick="check_id()">쓰기</button>
			</sec:authorize>

			<sec:authorize access="isAuthenticated()">
  				 <button class="writeButton" type="button"  onclick="window.location.href='${pageContext.request.contextPath }/board/'" >쓰기</button>
			</sec:authorize>	
			</div>
			
			<ul class="pagination" style="padding:80px 500px;">	
		  		<c:if test="${pageMaker.prev}">
	       		  <li class="page-item"><a class="page-link" href="${getBoardTypeId}${pageMaker.makeQuery(pageMaker.startPage - 1) }">prev</a></li>
	     		</c:if>

	      		<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
	         		<li class="page-item"><a class="page-link" href="${getBoardTypeId}${pageMaker.makeQuery(idx)}">${idx}</a></li>
	      		</c:forEach>
	      
	      		<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
	         		<li class="page-item"><a class="page-link" href="${getBoardTypeId}${pageMaker.makeQuery(pageMaker.endPage +1) }">next</a></li>
	      		</c:if> <br> 
		 	</ul>

				<div style="padding:0 400px;">
				<form class="form-inline">
					<select style="border-radius:0.2em; border:2px solid black;">
						<option>제목</option>
						<option>제목+내용</option>
						<option>내용</option>
					</select>&nbsp;&nbsp;
					<input class="form-control mr-sm-2" type="text" aria-label="Search" style="width:50%;">
					<button class="btn btn-outline-white btn-sm my-0" type="submit">
						<i class="fas fa-search"></i>
					</button>
				</form>
				</div>
		</div>
	</div>
	<!-- Footer -->
	<%@ include file="/WEB-INF/views/includes/footer.jsp" %>
</body>
</html>