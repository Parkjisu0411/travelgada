<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF_8">
<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>diary</title>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<!-- <script src="https://code.jquery.com/jquery-3.5.1.js"></script> -->
	
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"></script>

	<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@700;800&display=swap" rel="stylesheet">
  
	<link rel="stylesheet" href="${contextPath}/resources/css/font.css">
	<link rel="stylesheet" href="${contextPath}/resources/css/header.css">
	<link rel="stylesheet" href="${contextPath}/resources/css/footer.css">
	<link rel="stylesheet" href="${contextPath}/resources/css/main.css">

<style>
html, body {
	width: 100%;
	height: 100%;
	margins: 0;
	padding: 0;
	/* background-color: #f5f5f5; */
	font-family: 'IBMPlexSansKR-Light';
	font-weight: bold;
}

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
	/* padding-right:20px; */
	/* width: 100%;  */
	text-align: right;
	outline: none;
}

.close:hover {
	color: #1dcad3;
}

/* .dialog-profile{
	font-family: 'GongGothicMedium';
} */
.dialog-wrap {
	width: 100%;
	/* width : 350px; */
	/* 	padding: 20px 20px 20px 0; */
	float: left;
}
/* 모달 스타일 끝 */
</style>

<style>
/* 사진 */
.masonry {
	columns: 4;
	column-gap: 16px;
}

@media ( max-width : 1200px) {
	.masonry {
		columns: 3;
	}
}

@media ( max-width : 992px) {
	.masonry {
		columns: 2;
	}
}

.masonry .grid {
	display: inline-block;
	margin-bottom: 16px;
	position: relative;
}

.masonry .grid:before {
	border-radius: 5px;
	content: "";
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	background-color: rgba(0, 0, 0, 0.2);
}

.masonry .grid img {
	width: 100%;
	border-radius: 5px;
}

.masonry .grid__title {
	font-size: 25px;
	font-weight: bold;
	text-align:right;
	float: right;
	width: 50px;
	padding-right:10px;
	margin-right:10px;

}

.grid__title:hover{
	color: #1dcad3;
}

.masonry .grid__author {
	font-size: 14px;
	font-weight: 300;
}

.masonry .grid__link {
	position: absolute;
	left: 0;
	right: 0;
	top: 0;
	bottom: 0;
}

.masonry .grid__body {
	position: absolute;
	left: 0;
	right: 0;
	top: 0;
	bottom: 0;
	/* padding: 10px; */
	color: #fff;
	display: flex;
	flex-direction: column;
	/*   margin-top: 30px; */
}

.modal-click {
	position: absolute;
	left: 0;
	right: 0;
	top: 0;
	bottom: 0;
	padding: 10px;
	color: #fff;
	display: flex;
	flex-direction: column;
	margin-top: 60px;
}

.masonry .grid__tag {
	background-color: rgba(255, 255, 255, 0.6);
	color: #333;
	border-radius: 5px;
	padding: 5px 15px;
	margin: 1px;
	float:left;
}

.mt-auto {
	margin-top: auto;
	overflow:hidden;
}

.gallery {
	padding-left: 10px;
	padding-right: 10px;
}

.writeBtn {
	border: solid 1px;
	/* border-radius: 15px 15px 0 0; */
	font-family: 'GongGothicMedium';
	color: white;
	font-size: 18px;
	background-color: #1dcad3;
	/* width:100px; */
	border-radius: 15px;
	overflow:hidden;
}

#selectDiary {
	line-height: 60px;
	background-color: transparent;
	color: black;
	font-size: 18px;
	border-radius: 15px;
	border: 2px solid #1dcad3;
	font-family: 'GongGothicMedium';
	outline: none;
}

.paging {
	margin: auto;
	text-align: center;
}

.pagination {
	border-radius: 5px;
}

.page-link {
	outline: none;
	border: none;
	margin: 2px;
	background-color: gray;
	border-radius: 5px;
	height: 3px; *
	color: gray;
}

.page-item {
	outline: none;
	border: none;
	padding: 3px;
}

.hashtag-font {
	font-family: 'IBMPlexSansKR-Light';
	border: bold;
	overflow:hidden;
	height: 35px;
}

.selected {
	background-color: #1dcad3;
}

#diaryDiv{
	/* min-height:1200px; */
}

.di_hr{
	font-family: 'Montserrat', sans-serif;  
	color: #1dcad3; 
	font-size: 50px; 
	font-weight: bold;
	margin-bottom: 30px;
}

.img_hr{
	width:50px;
	margin: 0 0 30px 30px;
}

.default-img{
	width:1000px;
}

.default-div{
	vertical-align: middle; 
	text-align: center;
}
</style>

<script type="text/javascript">
/* 삭제 ajax */
	$(document).ready(function() {
		$(document).on("click", ".delete", function(event) {//※주의※		
			if (confirm("삭제하시겠습니까?")) {
				event.preventDefault();
				console.log("delete click");

				var token = $("meta[name='_csrf']").attr("content");
				var header = $("meta[name='_csrf_header']").attr("content");

				var tr = $(this).parent().parent().parent().parent();

				$.ajax({
					type : "DELETE",
					url : $(this).attr("href"),
					cache : false,
					beforeSend : function(xhr) { /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
						console.log("header 실행 " + header + token)
						xhr.setRequestHeader(header, token);
					},
					success : function(result) {
						console.log("result : " + result);
						if (result == "SUCCESS") {
							$(tr).remove();
						}
					},
					error : function(e) {
						alert("오류가 발생했습니다.");
						console.log(e);
					}
				}); // ajax end
			};
		}); // event end
	}); // ready end
</script>

<!-- 다른 플래너로 전환 -->


<script>
/* 작성 팝업 */
	function openwin() {
		window.open('about:blank','popwin',
		  'width=1000,height=650,toolbar=no, location=no, status=no, menubar=no, scrollbars=no, resizable=no, left=450, top=220');
  	document.formDate.submit();
	}//function end
</script>

 <script type="text/javascript">
 /* select box 새로운 플래너 값 고정 */
	$(document).ready(function(){
		var currPlanner_id= ${other.planner_id};  
		console.log("현재 플래너의 아이디 : "+ currPlanner_id);
	
		$("#selectDiary").val(currPlanner_id).prop("selected", true);
	}); 
 
</script> 

<script>
/* 해시태그 & 링크 */
	$(document).ready(function(){
		
		link();

	});//function end
	
	function link() {
		var content; //내용
		var splitedArray; //배열
		var linkedContent; //주소
		
		//jstl
	    <c:forEach items="${diary}" var="di"> 
    		console.log("${di.hashtag}")
			content = "${di.hashtag}";//# 해시태그
			splitedArray = content.split('#');//#으로 구분
			console.log(splitedArray);
			linkedContent = '';
			linkedModalContent='';
			splitedArray.shift();//첫번째 지워주는 함수

			for(var word in splitedArray){
				var word = splitedArray[word];
				console.log("word : "+word);
				if(word.indexOf("") == 0){ 
					var word2 = "#"+word;
					word = '<div class="grid__tag" ><a style="color:black;" href="${pageContext.request.contextPath}/search?keyword='+word+'">'+word2+'</a></div>'
					console.log(word);
    	          	console.log(word2);
				}//if end
				linkedContent += word+' ';
			}//for end
			
			$("#${di.diary_id}").append(linkedContent);
			
			for(var word in splitedArray){
				word = splitedArray[word];
				if(word.indexOf("") == 0){ 
					var word2 = "#"+word;
					word = '<a style="color:black;" href="${pageContext.request.contextPath}/search?keyword='+word+'">'+word2+'</a>&nbsp;'
					console.log(word);
    	          	console.log(word2);
				}//if end
				linkedModalContent += word+' ';
			}//for end
    	    
			$("#modal${di.diary_id}").append(linkedModalContent);
    	
		</c:forEach>

		};
		
/* 해시태그 & 링크 끝 */
</script>

<script>
	$(document).ready(function(){
		
		var paging = $("#"+${nowPage});
		$(paging).addClass("selected");
	
	});
</script>

</head>
<body>

<div class="wrap">
	<!-- 해더 -->
	<%@ include file="/WEB-INF/views/includes/header.jsp"%>
	
	<div>
		<img class="img_hr" src = "/resources/notebook.png"/>&nbsp;&nbsp;
		<a href="/diary"><span class="di_hr">DIARY</span></a>
	</div>
	
	<!-- 플래너 셀렉트, 다이어리 작성 -->
	<div class = "gallery">
		<form action ="${pageContext.request.contextPath}/diary_write_view" method="get" target="popwin" name="formDate">
			<div class="row">
				<div class="col-sm-10"> 
					<select class="form-control" name="planner_id" id="selectDiary" style="font-family: 'GongGothicMedium'" onchange="location.href='${pageContext.request.contextPath}/diary_other/'+this.value">
						<c:forEach var="di" items="${planner}">
							<%-- <option value='${di.planner_id}' style="font-family: 'GongGothicMedium'">
						  		${di.planner_name}&nbsp;&nbsp; ${di.start_date}&nbsp;&nbsp;~&nbsp;&nbsp;${di.end_date}
							</option> --%>
							
							<c:if test="${di.planner_id eq planner_id}">
								<option value='${di.planner_id}' style="font-family: 'GongGothicMedium'">
							  		${di.planner_name}&nbsp;&nbsp; ${di.start_date}&nbsp;&nbsp;~&nbsp;&nbsp;${di.end_date}
								</option>
							</c:if>
							<c:if test="${di.planner_id ne planner_id}">
								<option value='${di.planner_id}' style="font-family: 'GongGothicMedium'">
							  		${di.planner_name}&nbsp;&nbsp; ${di.start_date}&nbsp;&nbsp;~&nbsp;&nbsp;${di.end_date}
								</option>
							</c:if>
						</c:forEach>
					</select>		
				</div>
				<div class="col-sm-2">
					<input class="writeBtn form-control" value="다이어리 작성" style="font-family: 'GongGothicMedium'" type="button" 
						class="btn btn-outline-warning bg-warning text-white" onclick="openwin();" />
					<br/>    
		    	</div>
		     </div>
		</form><!-- 다이어리 작성을 위한 form -->
		
		<c:if test="${empty diary}">
			<div class = "default-div">
				<div><img class="default-img" src='/resources/diarywrite2.png' /></div>
			</div>
		</c:if>

		<div class="masonry">
			<div id="diaryDiv">
				<c:forEach items="${diary}" var="di">
					<div class="grid">
						<img src='/resources/diary/${di.img_path}' onerror="this.src='/resources/img/main/logo3.png'" />
						<!-- 사진 -->
						
						<div class="grid__body" >
						<div class="dropdown">
									<div class="grid__title" data-toggle="dropdown">...</div>
									<!-- <img src="resources/diary/dot3.png" /> -->
									<div class="dropdown-menu">
										<a class="dropdown-item"
											onclick="window.open('${pageContext.request.contextPath}/diary_modify_view/${di.diary_id}/${di.planner_id}',
      											'popwin2','width=1000,height=650,left=450, top=220')">수정</a>
										<a class="delete dropdown-item" href="/diary/${di.diary_id}">삭제</a>
									</div>
								</div>
							<div class="modal-click" data-toggle="modal" data-target="#myModal${di.diary_id}">
							<!-- <div class="relative"> -->
								<!--  <a class="grid__link" target="_blank" href="/" ></a> -->
								<!--    <p class="grid__author"></p> -->
								
								
							<!-- </div> -->
							<div class="mt-auto">
								<div class="hashtag-font"id="${di.diary_id}"></div>
							</div>
							</div>
							
						</div><!-- grid_body -->
					</div>

						<!-- Modal -->
					<!-- 여기  -->
					<div class="modal fade" id="myModal${di.diary_id}" role="dialog">
						<!-- <div class="mySlides"> -->
						<div class="modal-dialog modal-lg modal-dialog-centered">
							<div class="modal-content ">
								<!-- 						<div class="modal-header">
							</div> -->
							<div class="row  ">
									<div class="col-sm-6">
										<img class="popup_img" src='/resources/diary/${di.img_path}' onerror="this.src='/resources/img/main/logo3.png'"/>
									</div>
									<div class="dialog-wrap col-sm-6 ">
										<%-- 			<div class="dialogDi dialog-profile">
									<img class="nav-profile-img" src='/resources/img/profile/${member.profile_img_path }' onerror="this.src='/resources/img/profile/default_profile_img.jpg'">
									${member.member_id}								
								</div> --%>
										<button type="button" class="close" data-dismiss="modal">&times;</button>
										<div class="dialogDi dialog-date">${di.diary_date}</div>
										<div class="dialogtext"><pre>${di.text}</pre></div>
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
			</div>
		</div>
	</div>
	
		<br/><br/>
		<div class="container">
			<div class="row">
				<div class="paging">
					<!-- 페이징 -->
					<ul class="pagination">
						<c:if test="${pageMaker.prev}">
							<li class="page-item">
								<a class="page-link" href="/diary_other/${planner_id}?nowPage=${pageMaker.startPage - 1}">◀</a>
							</li>
						</c:if>
						<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage}" var="idx">
							<li class="page-item">
								<a id ="${idx}" class="page-link" href="/diary_other/${planner_id}?nowPage=${idx}"></a>
							</li>
						</c:forEach>
						<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
							<li class="page-item">
								<a class="page-link" href="/diary_other/${planner_id}?nowPage=${pageMaker.endPage +1}">▶</a>
							</li>
						</c:if>
					</ul>
					<!-- 페이징 끝 -->
				</div>
				<!-- 다이어리 row end -->
			</div>
		</div>
		
	<!-- footer -->
	<%@ include file="/WEB-INF/views/includes/footer.jsp"%>
	
	</div>

</body>
</html>