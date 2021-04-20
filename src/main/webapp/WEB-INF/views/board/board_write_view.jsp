<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<meta id="_csrf_header" name="_csrf_header"
	content="${_csrf.headerName}" />
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

<title>BOARD WRITE</title>

<!-- include summernote css/js -->
<%--   <script src="${pageContext.request.contextPath}/resources/summernote/summernote-lite.js"></script>
  <script src="${pageContext.request.contextPath}/resources/summernote/lang/summernote-ko-KR.js"></script>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/summernote/summernote-lite.css"> --%>

<!-- CKeditor -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
<style>
html, body {
	width: 100%;
	height: 100%;
	margins: 0;
	padding: 0;
}

#title {
	width: 975px; 
	margin: 3px 0;
	outline: none;
	text-align: left;
	border-radius: 0.2em;
	border: 2px solid lightgrey;
	font-family: 'GongGothicMedium';
	font-size:13pt;
	height: 38px; 
	margin: 4px 0;
}

	.headline{
		font-family: 'GongGothicMedium';
		color:#1DCAD3;
		font-size:28pt;
		/* line */
		display: flex;
		flex-basis: 100%;
		align-items: center;
		margin: 8px 0px;
	}
	
/* line */	
.headline::after {
	content: "";
	flex-grow: 1;
	background: #1DCAD3;
	height: 1px;
	font-size: 0px;
	line-height: 0px;
	margin: 0px 16px;
}
	
a:hover{
	text-decoration:none !important;
	color:#CFD2D3;
	
}

.btn-default {
	border-radius: 0.2em;
	border: none;
	float: right;
}

#bcategory {
	border-radius: 0.3em;
	border: 2px solid lightgrey;
	width: 130px; 
	height: 38px;
	margin: 4px 0;
}

#bcategory, option{
	font-family: 'GongGothicMedium';
	color:#303E57;
}

#btitle {
	float: right;
	font-size: 19px;
}

/* 미완성  */
select option:hover{
	color:#1DCAD3;
}

select, button{
	border:0;
	outline:none;
}

img{
	width:50px;
	height:50px;
	float:left;
	margin:-2px 1px;
}

	.ListButton, #submitBtn{
		width:70px;
		border-radius:1em;
		border:none; 
		float:right;
		font-family: 'IBMPlexSansKR-Light';
		color: white;
		background:#1DCAD3;
		height:30px;
		margin:10px 1px;
		font-weight:bold;
	}
	
	#submitBtn:focus, button:focus{
		border:0;
		outline:none;
	}

</style>

<script type="text/javascript">
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	$(document).ajaxSend(function(e, xhr, options) {
		xhr.setRequestHeader(header, token);
	});
</script>

<!-- summernote -->
<!-- 	<script>
	$(function(){
   	 $("#text").summernote({
     	  placeholder: '내용을 입력하세요',
      	  tabsize: 2,
      	  height: 500
   	 });
	});
	</script> -->

<script type="text/javascript">
	$(document).ready(function() {
		$("#write").submit(function(event) {
			event.preventDefault();
			console.log("write click");

			var title = $("#title").val();
			var text = CKEDITOR.instances.text.getData();
			var member_id = $("#username").val();
			var board_type_id = $("#bcategory").val();

			var form = {
				title : title,
				text : text,
				member_id : member_id,
				board_type_id : board_type_id
			}

			if (title == "") { //빈값이면      
				alert("제목을 입력하세요");
				$("#title").focus(); //입력포커스 이동
				return; //함수 종료, 폼 데이터를 제출하지 않음
			}
			if (text == "") {
				alert("내용을 입력하세요");
				$("#text").focus();
				return;
			}

			$.ajax({
				type : "PUT",
				url : $(this).attr("action"),
				cache : false,
				data : JSON.stringify(form),
				contentType : 'application/json; charset=utf-8',
				beforeSend : function(xhr){   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
  	                 console.log("header 실행 "+header+token)
  	                 //console.log(sentence.toLowerCase());
  	                 xhr.setRequestHeader(header, token);
				},
				success : function(result) {
					console.log("result : " + result);
					if(result == "SUCCESS"){
 						if(board_type_id == 1) {
							$(location).attr('href', '${pageContext.request.contextPath}/board/1');
							//modelAndView.setViewName("redirect:/board/review");
						}else if(board_type_id == 2) {
							$(location).attr('href', '${pageContext.request.contextPath}/board/2');
							//modelAndView.setViewName("redirect:/board/Q&A");
						}else {
							$(location).attr('href', '${pageContext.request.contextPath}/board/3');
							//modelAndView.setViewName("redirect:/board/accompany");
						} 
					}

				},
				error : function(e) {
					alert("오류가 발생했습니다.");
					console.log(e);
				}
			}); // ajax end
		}); // event end
	}); // ready end
</script>




</head>
<body>
	<!-- Header -->
	<%@ include file="/WEB-INF/views/includes/header.jsp"%>
	<!--Content -->
	<div class="divider-header-blank"></div>
	<div id="wrap">
		<div class="container">
			<img src="/resources/board/write1.png"><a class="headline" href="${pageContext.request.contextPath }/board">새 글 작성하기</a><br />

			<form id="write" method="post" action="${pageContext.request.contextPath}/board?${_csrf.parameterName}=${_csrf.token}" enctype="multipart/form-data">
				<%-- <input type="hidden" id="member_id" name="member_id" value="${bWriteView.member_id }"/>
				<input type="hidden" id="board_type_id" name="board_type_id" value="${bWriteView.board_type_id }"/> --%>
				<input type="hidden" id="_csrf" name="_csrf" value="${_csrf.token}" />
				<input type="hidden" id="_csrf_header" name="_csrf_header" value="${_csrf.headerName}" /> 
				<input type="hidden" id="username" name="username" value="<sec:authentication property="principal.username"/>" />
				<span><select id="bcategory" name="board_type_id">
						<option value="1">review</option>
						<option value="2">Q&A</option>
						<option value="3">동행</option>
						<c:if test="${checkAuthority == 'true'}">
							<option value="4">공지사항</option>
						</c:if>
				</select></span>

				<!-- summernote -->
				<!-- 					<span id="btitle"><input id="title" name="title" placeholder="제목을 입력하세요" style="height:37px; margin:4px 0;"/></span>
					<br /><br />
					<textarea rows="5" cols="60" id="text" name="text"></textarea> -->

				<!-- CKeditor -->
				<span id="btitle"><input id="title" name="title" placeholder="&nbsp;&nbsp;&nbsp;제목을 입력하세요" /></span> <br /><br />
				<textarea class="form-control" id="text" name="text"></textarea>

				<!-- CKeditor -->
					<script type="text/javascript">
						 var ckeditor_config = {
							   resize_enaleb : false,
							   enterMode : CKEDITOR.ENTER_BR,
							   shiftEnterMode : CKEDITOR.ENTER_P,
							   height: 500,
							  
							   filebrowserUploadUrl :  '<c:url value="${pageContext.request.contextPath}/admin/goods/ckUpload" />?${_csrf.parameterName}=${_csrf.token}'
								 
							 }; 
 						CKEDITOR.replace('text', ckeditor_config 
						);
					</script>
				<button type="button" class="ListButton" onclick="window.location.href='${pageContext.request.contextPath }/board/$('select[name=board_type_id]').val()'" >목록</button>
				<!-- <button id="submitBtn" class="btn-default text-primary">완료</button> -->
				<input type="submit" id="submitBtn" value="완료"  />
			</form>

		</div>
	</div>
	<!-- Footer -->
	<%@ include file="/WEB-INF/views/includes/footer.jsp"%>
</body>
</html>