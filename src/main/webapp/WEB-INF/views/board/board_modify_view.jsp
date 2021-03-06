<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/main/logo.png">
<link
	href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@700;800&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="${contextPath}/resources/css/main.css">
<link rel="stylesheet" href="${contextPath}/resources/css/font.css">
<link rel="stylesheet" href="${contextPath}/resources/css/header.css">
<link rel="stylesheet" href="${contextPath}/resources/css/footer.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MODIFY CONTENT</title>

<!-- include summernote css/js -->
<%--   <script src="${pageContext.request.contextPath}/resources/summernote/summernote-lite.js"></script>
  <script src="${pageContext.request.contextPath}/resources/summernote/lang/summernote-ko-KR.js"></script>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/summernote/summernote-lite.css"> --%>

<!-- CKeditor -->
	 <script type="text/javascript" src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
	 
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

/* ๋ฏธ์์ฑ  */
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
	  $(document).ajaxSend(function(e, xhr, options) { xhr.setRequestHeader(header, token); });
    </script>

	<!-- summernote -->
<!-- 	<script>
	$(function(){
   	 $("#text").summernote({
     	  placeholder: '๋ด์ฉ์ ์๋?ฅํ์ธ์',
      	  tabsize: 2,
      	  height: 500
   	 });
	});
	</script> -->
	
	<script type="text/javascript">
	$(document).ready(function(){
		$("#modify").submit(function(event){			
			event.preventDefault();
			console.log("modify click");
			
			var board_id = $("#board_id").val(); 					
			var text = CKEDITOR.instances["text"].getData();
			var title = $("#title").val(); 
			var board_type_id = $("#bcategory").val(); 
			
			var form = {
				board_id : board_id,
				title : title,
				text : text,
				board_type_id : board_type_id
			}
			
			$.ajax({
				type : "PUT",
				url : $(this).attr("action"),
				cache : false,
				data : JSON.stringify(form),
				contentType : 'application/json; charset=utf-8',
				success : function(result){
					console.log("result : " + result );
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
				},
				error : function(e){
					alert("์ค๋ฅ๊ฐ ๋ฐ์ํ์ต๋๋ค.");
					console.log(e);
				}
			}); // ajax end
		}); // event end
	}); // ready end
	</script>

</head>
<body>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>
	<!--Content -->
	<div class="divider-header-blank"></div>
	<div id="wrap">
		<div class="container">
			<a class="headline" href="${pageContext.request.contextPath }/board"><img src="/resources/board/write1.png">๊ธ ์์?</a><br />
			
			<form id="modify" action="${pageContext.request.contextPath}/board/${bContentView.board_id}" enctype="multipart/form-data">
				<input type="hidden" id="_csrf" name="_csrf" value="${_csrf.token}"/>
				<input type="hidden" id="_csrf_header" name="_csrf_header" value="${_csrf.headerName}"/>
				<input type="hidden" id="board_id" value="${bContentView.board_id }">
					<span><select id="bcategory" name="board_type_id">
						<option value="1">review</option>
						<option value="2">Q&A</option>
						<option value="3">๋ํ</option>
						<c:if test="${checkAuthority == 'true'}">
							<option value="4">๊ณต์ง์ฌํญ</option>
						</c:if>
					</select></span>
					
					<span id="btitle"><input type="text" id="title" name="title" value="${bContentView.title }" placeholder="์?๋ชฉ์ ์๋?ฅํ์ธ์" style="height:37px; margin:4px 0;"/></span>
					<br /><br />
					<textarea id="text" name="text">${bContentView.text }</textarea>
					
					<!-- CKeditor -->
					<script type="text/javascript">
						 var ckeditor_config = {
							   resize_enaleb : false,
							   enterMode : CKEDITOR.ENTER_BR,
							   shiftEnterMode : CKEDITOR.ENTER_P,
							   height: 500,
							   
							   filebrowserUploadUrl :  '<c:url value="${pageContext.request.contextPath}/board/ckupload" />?${_csrf.parameterName}=${_csrf.token}'
						 }; 
 						CKEDITOR.replace('text', ckeditor_config);
					</script>
				
				<%-- <button type="button" class="btn-default text-primary" onclick="window.location.href='${pageContext.request.contextPath }/board/review'">๋ชฉ๋ก</button> --%>
				<button type="button" class="ListButton" onclick="window.location.href='${pageContext.request.contextPath }/board/${btID}'" >๋ชฉ๋ก</button>
				<input type="submit" id="submitBtn" value="์๋ฃ"  />
			</form>
			
		</div>
	</div>
	<!-- Footer -->
	<%@ include file="/WEB-INF/views/includes/footer.jsp" %>
</body>
</html>