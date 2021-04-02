<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>BOARD WRITE</title>

<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<style>
	html, body {
		width: 100%;
		height: 100%;
		margins: 0;
		padding: 0;
	}

	thead, tbody{
		text-align:left;
	}

    #title {
        width: 100%;
        margin: 3px 0;
        outline: none;
        text-align: left;
        border : none;
    }
    
    .headline{
    	font-family: 'yg-jalnan';
    	/* border-bottom: 1px solid lightgrey;
    	padding-bottom:5px;
    	width:130px;
    	border-width:2px; */
    }
    
    .btn-default{
    	border-radius:0.2em;
    	border:none;
    	float:right;
    }
    

</style>

<script>
$(function(){
    $("#description").summernote({
        placeholder: '내용을 입력하세요',
        tabsize: 2,
        height: 500
    });
});
</script>

<script>
function write_board(){
    var title=$("#title").val();
    var description=$("#description").val();
    var member_id=$("#member_id").val();
    var board_type_id=$("#board_type_id").val();
    if(title==""){ //빈값이면
        alert("제목을 입력하세요"); 
        $("#title").focus(); //입력포커스 이동
        return; //함수 종료, 폼 데이터를 제출하지 않음
    }
    if(description==""){
        alert("내용을 입력하세요");
        $("#description").focus();
        return;
    }
    //폼 데이터를 받을 주소
    document.write.action="${pageContext.request.contextPath}/board";
    //폼 데이터를 서버에 전송
    document.write.submit();
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
			<h2 class="headline">글 작성</h2>
				<form name="write" method="post" enctype="multipart/form-data">
				<%-- <input type="hidden" id="member_id" name="member_id" value="${bWriteView.member_id }"/>
				<input type="hidden" id="board_type_id" name="board_type_id" value="${bWriteView.board_type_id }"/> --%>
					<table class="table">
					<thead>
						<tr>
							<td><h3><input id="title" name="title" placeholder="제목" style="font-family: 'yg-jalnan'"/></h3></td>
						</tr>				
					</thead>
					
					<tbody>
						<tr>
							<td><textarea rows="5" cols="60" name="description" id="description"></textarea></td>
						</tr>
					</tbody>
					</table>
				</form>
			
				<p>첨부파일</p>
				<input type="button" class="btn-default text-primary" value="완료" onclick="javascript:write_board()" >
				<button type="button" class="btn-default text-primary" onclick="window.location.href='${pageContext.request.contextPath }/board/review'">목록</button>
				
			

		</div>
	</div>
	<!-- Footer -->
	<%@ include file="/WEB-INF/views/includes/footer.jsp" %>
</body>
</html>