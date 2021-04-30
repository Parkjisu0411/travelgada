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

	/* 드래그 */
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
	width: 1111px; 
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

img{
	width:50px;
	height:50px;
	float:left;
	margin:-2px 4px;
}

    

#btitle {
	float: right;
	font-size: 19px;
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
    
<script>
	$(document).ready(function() {
		$("#addAnswer").submit(function(event){
			event.preventDefault();
			console.log("addAnswer submit");
			
			var board_id = $("#board_id").val();
			var member_id = $("#member_id").val();
			var title = $("#title").val();
			var text = CKEDITOR.instances.text.getData();
			var bgroup = $("#bgroup").val();
			var bstep = $("#bstep").val();
			var bindent = $("#bindent").val();
			var board_type_id = $("#board_type_id").val();
			
			var form = {
				board_id : board_id,
				member_id : member_id,
				title : title,
				text : text,
				bgroup : bgroup,
				bstep : bstep,
				bindent : bindent,
				board_type_id : board_type_id		
			};
			
			$.ajax({
				type : "POST",
				url : $(this).attr("action"),
				cache : false,
				data : JSON.stringify(form),
				contentType : 'application/json; charset=utf-8',
				success : function(result){
					if(result == "SUCCESS"){
						console.log("success");
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
				error : function(e){
					console.log(e);
				}
				
			}); // ajax end
		}); // submit end
	}); // ready end
</script>



</head>
<body>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>
	<!--Content -->
	<div class="divider-header-blank"></div>
	<div id="wrap">
		<div class="container">
			<a class="headline" href="${pageContext.request.contextPath }/board"><img src="/resources/board/write1.png">답글 작성</a><br />
			
				<form id="addAnswer" action="${pageContext.request.contextPath}/board/${board_answer_view.board_id}" enctype="multipart/form-data">
				<input type="hidden" id="_csrf" name="_csrf" value="${_csrf.token}"/>
				<input type="hidden" id="_csrf_header" name="_csrf_header" value="${_csrf.headerName}"/>
				<input type="hidden" id="board_id" value="${board_answer_view.board_id }">	
				<input type="hidden" id="bgroup" value="${board_answer_view.bgroup }">	
				<input type="hidden" id="bstep" value="${board_answer_view.bstep }">	
				<input type="hidden" id="bindent" value="${board_answer_view.bindent }">
				<input type="hidden" id="board_type_id" value="${board_answer_view.board_type_id }">
				<input type="hidden" id="member_id" value="${board_answer_view.member_id }">
					
					<span id="btitle"><input type="text" id="title" name="title" value="${board_answer_view.title }" placeholder="제목을 입력하세요" style="height:37px; margin:4px 0;"/></span>
					<br /><br />
					<textarea rows="5" cols="60" id="text" name="text">${board_answer_view.text }</textarea>
					
					<!-- CKeditor -->
					<script type="text/javascript">
						 var ckeditor_config = {
							   resize_enaleb : false,
							   enterMode : CKEDITOR.ENTER_BR,
							   shiftEnterMode : CKEDITOR.ENTER_P,
							   filebrowserUploadUrl :  '<c:url value="${pageContext.request.contextPath}/board/ckupload" />?${_csrf.parameterName}=${_csrf.token}'
							 }; 
 						CKEDITOR.replace('text', ckeditor_config);
					</script>
				
				<button type="button" class="ListButton" onclick="window.location.href='${pageContext.request.contextPath }/board/${btID}'">목록</button>
				<input type="submit" id="submitBtn" value="완료"  />
				</form>
			
		</div>
	</div>
	<!-- Footer -->
	<%@ include file="/WEB-INF/views/includes/footer.jsp" %>
</body>
</html>