<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>


<title>diary</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@800;900&display=swap" rel="stylesheet"><!-- 큰 영어 -->
  
<link rel="stylesheet" href="${contextPath}/resources/css/font.css">
	
<style>
/*    table, th, td {
    border: 1px solid #bcbcbc;
  } */
table {
	margin-left: 30px;
	font-family: 'IBMPlexSansKR-Light';
}

@font-face {
	font-family: 'GongGothicMedium';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10@1.0/GongGothicMedium.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'GongGothicLight';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10@1.0/GongGothicLight.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

/* 내용 글씨 */
@font-face {
	font-family: 'IBMPlexSansKR-Light';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/IBMPlexSansKR-Light.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

.modifyBtn {
	text-align: right;
}

.diaryHr {
	color: #1dcad3;
	font-size: 40px;
	font-family: 'Montserrat', sans-serif;
}

.fileStyle {
	border: solid 1px;
	/* border-radius: 15px 15px 0 0; */
	font-family: 'GongGothicMedium';
	color: white;
	font-size: 18px;
	background-color: #1dcad3;
	/* width:100px; */
	border-radius: 5px;
}

#fileCheck {
	border: solid 1px;
	/* border-radius: 15px 15px 0 0; */
	font-family: 'GongGothicMedium';
	color: white;
	font-size: 18px;
	background-color: #1dcad3;
	/* width:100px; */
	border-radius: 5px;
}

#View_area, #prev_View_area {
	border-radius: 10px;
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
			img.style.width = '400px'; 
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
$(document).ready(function(){
	
	$("#fileCheck").on("click",function(e){
	
 	var uploadfile = $("#profile_pt").val();
  	console.log(uploadfile);
  	
  	  if(uploadfile == ""){
   	     alert("사진을 첨부해 주세요!");
  	      return false;
  	  }else{
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
/* 	if(kcode == 32) {
		console.log("스페이스바");
		tag.append("#");
		event.returnValue=false;

	} */
}
</script>

</head>
<body>
	<form id='submitBtn' name="myForm" action="${pageContext.request.contextPath}/diary_write?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
		
		<input type="hidden" name="planner_id" value="${planner.planner_id}" />
		<input type="hidden" id="_csrf" name="_csrf" value="${_csrf.token}" />
		<input type="hidden" id="_csrf_header" name="_csrf_header"
			value="${_csrf.headerName}" />

		<div class="container">
			<br>
			<div class="diaryHr">Diary</div>
			<div class="row">

				<!-- <div class="col-sm-3"> -->
				<table class="table table-borderless">
					<tr>
						<td rowspan='5'>
							<div id='View_area' style='position: relative; width: 400px; height: 400px; color: black; border: 0px solid black; dispaly: inline;'>
								<br> <img id="prev_View_area" src='/resources/diary/camera2.png' style='position: relative; width: 400px; height: 400px;' />
							</div>
						</td>
						<td>
							 <input type="file" class="form-control-file border fileStyle" name="uploadfile" id="profile_pt" onchange="previewImage(this,'View_area')">
						</td>
					</tr>
					<tr>
						<td><textarea rows="10" cols="55" name="text" /></textarea></td>
					</tr>
					<tr>
						<td><span style="font-family: 'GongGothicMedium'">Tag</span></td>
					</tr>
					<tr>
						<td><textarea rows="2" cols="55" name="hashtag" id="hashtag" onkeydown="checkCode()">#</textarea></td>
					</tr>
					<tr>
						<td class="modifyBtn">
							<button type="button" id="fileCheck">작성</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
		<!-- 	</div> -->
	</form>

</body>
</html>