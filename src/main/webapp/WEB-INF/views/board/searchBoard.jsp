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
<%-- <link rel="stylesheet" href="${contextPath}/resources/css/main.css"> --%>
<link rel="stylesheet" href="${contextPath}/resources/css/font.css">
<link rel="stylesheet" href="${contextPath}/resources/css/header.css">
<link rel="stylesheet" href="${contextPath}/resources/css/footer.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>SEARCH BOARD</title>

<style>

/* ๋๋๊ทธ */
::selection {
	background-color: #1DCAD3;
	color: white;
}  

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

.writeButton:hover{
	box-shadow: 5px 5px 5px #CFD2D3;
	color: #303E57;
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
	
	/* ๊ฒ์ */
	#board_keyword_search{
		height: 30px;
 	 	width: 300px; 
	 	/* min-width: 100%;  */ 
		line-height: 70px;
		background-color: transparent;
		color: black;
		font-size: 15px;
		/* border-radius: 50px; */
		border:none;
		border-bottom: 2px solid #303E57;
		font-family: 'GongGothicMedium';
		outline:none;
	}
	.search_icon{
		background-color: #303E57;
		border-radius: 50px;
		border: none;
	 	outline:none; 
		padding-top: 6px;
		padding-bottom: 9px;
		text-align: center; 
		width: 28px;
		height: 28px;
		margin-left:1px;
		margin-top:1px;
		font-family: 'GongGothicMedium';  
		font-size:13px; 
		color:white;
	}
	
	#select{
		height: 30px;
 	 	width: 120px;
	 	/* min-width: 100%;  */ 
		line-height: 70px;
		background-color: transparent;
		color: black;
		font-size: 15px;
		border-radius: 50px;
		border: 2px solid #303E57;
		font-family: 'GongGothicMedium';
		outline:none;
	}
	
	.search_board{
		width:50%;
		margin:0 auto;
	}
	
/* ํ์ด์ง */
.paging{
   margin:20px auto;
   text-align:center;
}

.pagination{
   border-radius: 5px;
}

.page-link{
   font-family: 'GongGothicMedium';
   color: white;
   font-size:12px;
   background-color: #1DCAD3;
   width:30px;
   border-radius: 5px;
   padding:5px 2px 2px 2px;
   border:none;
   margin:5px 2px;
}

.page-link1{
   font-family: 'GongGothicMedium';
   color: #303E57;
   font-size:12px;
   background-color:none;
   width:50px;
   border-radius: 5px;	
   margin:0 10px;
}

</style>
	
	<!-- ๋ก๊ทธ์ธ ์ํ ์ฒดํฌ -->
	<script>
		function check_id(){
      	 	alert("๋ก๊ทธ์ธ์ด ํ์ํ ์๋น์ค์๋๋ค.");
			location.href="${pageContext.request.contextPath}/member/login";
   		}
	</script>
	
	<!-- ์์ฑ์ ํด๋ฆญ ์ ์ด๋ --> <!-- ๋ฏธ์์ฑ -->
	<script>
		function show_member_history(){
			
   		}
	</script>

</head>
<body>
	
	<!-- Header -->
	<%@ include file="/WEB-INF/views/includes/header.jsp"%>
	<!-- ๊ฒ์ํ ๋ชฉ๋ก -->
	<div class="divider-header-blank"></div>
	<div id="wrap">
		<div class="container">
			<a class="headline" href="${pageContext.request.contextPath }/board/1">REVIEW</a><br />
			<span class="bar">|</span><span class="introduction"> ์์คํ ์ถ์ต์ ๊ฐ๋ค ํ์๋ค๊ณผ ๊ณต์?ํด๋ณด์ธ์!</span><br /><br />
			<table class="table">
				<thead>
					<tr class="thead">
						<td>๋ฒํธ</td>
						<td>์?๋ชฉ</td>
						<td>์์ฑ์</td>
						<td>๋?์ง</td>
						<td>์กฐํ์</td>
					</tr>
				</thead>

				<tbody>
					<!-- ๊ณต์ง์ฌํญ -->
					<c:forEach items="${boardNoticeList }" var="boardNoticeList">
						<tr class="notice">
							<td>${boardNoticeList.board_id }</td>
							<td class="content">
								<a href="${pageContext.request.contextPath }/board/${boardNoticeList.board_id}/${boardNoticeList.member_id}/${boardNoticeList.board_type_id}" class="noticeContent2" ><img class="pin" src="/resources/board/push-pin.png">&nbsp;&nbsp;&nbsp;${boardNoticeList.title }</a>
							</td>
							<td>${boardNoticeList.member_id }</td>
							<td><fmt:formatDate value="${boardNoticeList.board_date }" pattern="yyyy/MM/dd HH:mm"/></td>
							<td>${boardNoticeList.bhit }</td>
						</tr>
					</c:forEach>
				
					<!-- ๊ฒ์๊ธ -->
					<c:forEach items="${boardReviewList }" var="boardReviewList">
					<tr class="con">
						<td>${boardReviewList.board_id }</td>
						<td class="content">
							<div class="content2">
							<c:forEach begin="1" end="${boardReviewList.bindent }">[๋ต๋ณ]</c:forEach>
							<a href="${pageContext.request.contextPath }/board/${boardReviewList.board_id}/${boardReviewList.member_id}/${boardReviewList.board_type_id}">${boardReviewList.title }</a>			
							<a class="Rcnt" href="${pageContext.request.contextPath }/board/replyContent/${boardReviewList.board_id}/${boardReviewList.member_id}/${boardReviewList.board_type_id}">&nbsp;&nbsp;${boardReviewList.cnt }</a>	
							</div>
						</td>
						<td class="content2"><a href="#" onclick="delchk();">${boardReviewList.member_id }</a></td>
						<td><fmt:formatDate value="${boardReviewList.board_date }" pattern="yyyy/MM/dd HH:mm"/></td>
						<td>${boardReviewList.bhit }</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>

			<!-- ๊ถํ์ ๋ฐ๋ผ ์ฐ๊ธฐ ๋ฒํผ ๋ํ๋ด๊ธฐ -->
			<div>	
			<sec:authorize access="isAnonymous()">
  				<button class="writeButton" type="button" onclick="check_id()">์ฐ๊ธฐ</button>
			</sec:authorize>

			<sec:authorize access="isAuthenticated()">
  				 <button class="writeButton" type="button"  onclick="window.location.href='${pageContext.request.contextPath }/board/write/${getBoardTypeId}'" >์ฐ๊ธฐ</button>
			</sec:authorize>	
			</div><br /><br /><br />

			<!-- ๊ฒ์ํ ํ์ด์ง -->
		 	<div class="row">
         	<div class="paging">
			
			<ul class="pagination">
  			<!-- <ul class="pagination" style="padding:80px 350px;">	 -->
		  		<c:if test="${pageMaker.prev}">
	       		  <li class="page-item"><a class="page-link1" href="${getBoardTypeId}${pageMaker.makeQuery(pageMaker.startPage - 1) }">prev</a></li>
	     		</c:if>

	      		<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
	         		<li class="page-item"><a class="page-link" href="${getBoardTypeId}${pageMaker.makeQuery(idx)}">${idx}</a></li>
	      		</c:forEach>
	      
	      		<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
	         		<li class="page-item"><a class="page-link1" href="${getBoardTypeId}${pageMaker.makeQuery(pageMaker.endPage +1) }">next</a></li>
	      		</c:if>  
		 	</ul> 
			</div>
		  </div><br /><br /><br />
  
		 	

			<!-- ๊ฒ์ํ ๊ฒ์ bar -->
			<div class="search_board">
<%-- 			<form action="${pageContext.request.contextPath}/searchBoard" method="get">	
				<select id="select" class="col-sm-3" name="searchType">
					<option value="title">์?๋ชฉ</option>
					<option value="2">์?๋ชฉ+๋ด์ฉ</option>
					<option value="3">๋ด์ฉ</option>
				</select>&nbsp;&nbsp;
				
				<!-- ๊ฒ์ ํค์๋ ์๋?ฅ -->
				<input id="board_keyword_search" class="col-sm-7" type="text" name="keyword" placeholder="๊ฒ์์ด๋ฅผ ์๋?ฅํ์ธ์."/>
				<button class="search_icon" type="submit"><i class="fa fa-search search-icon-in"></i></button>
			</form> --%>
			<form name="form1" method="post" action="${pageContext.request.contextPath}/searchBoard">

			    <select id="select" class="col-sm-3" name="searchType">
			        <option value="user_id"
						<c:if test="${map.search_option == 'user_id'}">selected</c:if>
					>์์ฑ์</option>
						
						        <option value="title" 
						<c:if test="${map.search_option == 'title'}">selected</c:if>
						        >์?๋ชฉ</option>
						
						        <option value="content" 
						<c:if test="${map.search_option == 'content'}">selected</c:if>
						        >๋ด์ฉ</option>
						
						        <option value="all" 
						<c:if test="${map.search_option == 'all'}">selected</c:if>
						       >์์ฑ์+๋ด์ฉ+์?๋ชฉ</option>
						
						   </select>
						   <input name="keyword" value="${map.keyword}">
						    <input type="submit" value="์กฐํ">
						</form>
			
			</div>
			
		<!-- DIV ์๋ฆฌ -->	
		</div>
	</div>		
	
	<!-- Footer -->
	<%@ include file="/WEB-INF/views/includes/footer.jsp"%>
</body>
</html>