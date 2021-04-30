<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>

	<title>다이어리 작성</title>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@800;900&display=swap" rel="stylesheet"><!-- 큰 영어 -->
	<link rel="stylesheet" href="${contextPath}/resources/css/font.css">
	<link rel="shortcut icon" type="image/x-icon" href="/resources/img/main/logo.png">
		
<style>

.modifyBtn {
	text-align: right;
}

.diaryHr {
	padding-top: 100px;
	color: #1dcad3;
	font-size: 40px;
	font-family: 'Montserrat', sans-serif;
}

.fileStyle {
	border: solid 1px;
	font-family: 'GongGothicMedium';
	color: white;
	font-size: 18px;
	background-color: #1dcad3;
	border-radius: 5px;
}

#fileCheck {
	border: solid 1px;
	font-family: 'GongGothicMedium';
	color: white;
	font-size: 18px;
	background-color: #1dcad3;
	border-radius: 5px;
}

#View_area, #prev_View_area {
	border-radius: 10px;
	object-fit: cover;
}

.header {
	background: linear-gradient(103deg, rgb(29, 202, 211) 0%, rgb(29, 202, 211) 50%, rgb(29, 160, 211)) 100% center;
	box-shadow: rgb(0 0 0 / 10%) 0px 4px 6px 0px;
	color: #ffffff;
	font-size: 30px;
	height: 60px;
	line-height: 50px;
	position: fixed;
	z-index: 1;
}

textarea{
	width:100%;
}

.tag-label{
	margin:20px;
}

.text-area::-webkit-scrollbar {
	width: 10px;
}

.text-area::-webkit-scrollbar-thumb {
	background-color: #a1eef2;
	border-radius: 10px;
	background-clip: padding-box;
	border: 2px solid transparent;
}

.text-area::-webkit-scrollbar-track {
	background-color: white;
	border-radius: 10px;
	box-shadow: inset 0px 0px 5px white;
}

.tag-area::-webkit-scrollbar {
	width: 10px;
}

.tag-area::-webkit-scrollbar-thumb {
	background-color: #a1eef2;
	border-radius: 10px;
	background-clip: padding-box;
	border: 2px solid transparent;
}

.tag-area::-webkit-scrollbar-track {
	background-color: white;
	border-radius: 10px;
	box-shadow: inset 0px 0px 5px white;
}

</style>
	
<script>
	/* 미리보기 */
	function previewImage(targetObj, View_area) {
		var preview = document.getElementById(View_area); 
		var ua = window.navigator.userAgent;

		var files = targetObj.files;
		for ( var i = 0; i < files.length; i++) {
			var file = files[i];
			var imageType = /image.*/; 
			if (!file.type.match(imageType))
				continue;
			var prevImg = document.getElementById("prev_" + View_area); 
			if (prevImg) {
				//$("#firstImg").remove();
				preview.removeChild(prevImg);
			}
			var img = document.createElement("img"); 
			img.id = "prev_" + View_area;
			img.classList.add("obj");
			img.file = file;
			img.style.width = '100%'; 
			img.style.height = '400px';
			preview.appendChild(img);
			if (window.FileReader) { 
				var reader = new FileReader();
				reader.onloadend = (function(aImg) {
					return function(e) {
						aImg.src = e.target.result;
					};
				})(img);
				reader.readAsDataURL(file);
			} else { 
				if (!document.getElementById("sfr_preview_error_"
						+ View_area)) {
					var info = document.createElement("p");
					info.id = "sfr_preview_error_" + View_area;
					info.innerHTML = "not supported FileReader";
					preview.insertBefore(info, null);
				}
			}
		}
	}
</script>

<script>

	$(document).ready(function() {

		$("#fileCheck").on("click", function(e) {

			var uploadfile = $("#profile_pt").val();
			console.log(uploadfile);

			if (uploadfile == "") {
				alert("사진을 첨부해 주세요!");
				return false;
			} else {
				window.opener.name = "parentPage";
				document.myForm.target = "parentPage";
				$("#submitBtn").submit();
				self.close();
			}
		});
	});
	
</script>

<script>

function checkCode(){
	
	var kcode = event.keyCode;
	var tag = document.getElementById("hashtag");
	
	if(kcode == 13){ 
		console.log("엔터");
		event.returnValue=false;
	}
}
</script>

<script>

$(document).ready(function(){
	 
	$('#hashtag').popover({content: "ex) #여행  #가다 ", placement: "bottom"}); 
	 
});

</script>

</head>
<body>
	<form id='submitBtn' name="myForm" action="${pageContext.request.contextPath}/diary?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
		
		<input type="hidden" name="planner_id" value="${planner.planner_id}" />

		<div class="col-md-12 header">
			<img class="nav-logo-img" src="/resources/img/main/logo.png" style="height: 25px;">
			<h5 style="font-family:yg-jalnan; display: inline;">가다</h5>
		</div>
			
		<div class="container">
		
			<div class="diaryHr"></div>
			
			<div class="row">
				<div class="col-sm-6 box">
					<div  id='View_area' style=' width: 100%; height:400px; color: black; border: 0px solid black; '>
						<br> 
						<img id="prev_View_area" src='/resources/diary/camera2.png' style=' width: 100%; height:400px;' />
					</div>
				</div>
				<div class="col-sm-6 box">
					<input type="file" class="form-control-file border fileStyle" name="uploadfile" id="profile_pt" onchange="previewImage(this,'View_area')">
					<br />
					<textarea class="text-area" rows="10" cols="55" name="text" /></textarea>
					<div class="tag-label"style="font-family: 'GongGothicMedium'">Tag</div>
					<textarea class="tag-area" rows="2" cols="55" name="hashtag" id="hashtag" onkeydown="checkCode()">#</textarea>
					<div class="modifyBtn ">
						<br/>
						<button type="button" id="fileCheck">작성</button>
					</div>
				</div>
			</div>
		</div>
	</form>

</body>
</html>