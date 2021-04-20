<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>

<title>다이어리</title>

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
 	
 	<link rel="stylesheet" href="${contextPath}/resources/css/font.css">
 	<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@700;800&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@800;900&display=swap" rel="stylesheet"><!-- 큰 영어 -->
  
	
	<script type="text/javascript">
	/* 미리보기 */
	function previewImage(targetObj, View_area) {
	var preview = document.getElementById(View_area); //div id
	var ua = window.navigator.userAgent;

  //ie일때(IE8 이하에서만 작동)
	if (ua.indexOf("MSIE") > -1) {
		targetObj.select();
		try {
			var src = document.selection.createRange().text; // get file full path(IE9, IE10에서 사용 불가)
			var ie_preview_error = document.getElementById("ie_preview_error_" + View_area);


			if (ie_preview_error) {
				preview.removeChild(ie_preview_error); //error가 있으면 delete
			}

			var img = document.getElementById(View_area); //이미지가 뿌려질 곳

			//이미지 로딩, sizingMethod는 div에 맞춰서 사이즈를 자동조절 하는 역할
			img.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"+src+"', sizingMethod='scale')";
		} catch (e) {
			if (!document.getElementById("ie_preview_error_" + View_area)) {
				var info = document.createElement("<p>");
				info.id = "ie_preview_error_" + View_area;
				info.innerHTML = e.name;
				preview.insertBefore(info, null);
			}
		}
  //ie가 아닐때(크롬, 사파리, FF)
	} else {
		var files = targetObj.files;
		for ( var i = 0; i < files.length; i++) {
			var file = files[i];
			var imageType = /image.*/; //이미지 파일일경우만.. 뿌려준다.
			if (!file.type.match(imageType))
				continue;
			var prevImg = document.getElementById("prev_" + View_area); //이전에 미리보기가 있다면 삭제
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
			if (window.FileReader) { // FireFox, Chrome, Opera 확인.
				var reader = new FileReader();
				reader.onloadend = (function(aImg) {
					return function(e) {
						aImg.src = e.target.result;
					};
				})(img);
				reader.readAsDataURL(file);
			} else { // safari is not supported FileReader
				//alert('not supported FileReader');
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
}
	</script>
	
<script type="text/javascript">
$(document).ready(function(){
	$("#submitBtn").on("click",function(){
	
	  	 window.opener.name = "parentPage";
		  document.myForm.target = "parentPage"; 
		  
		  $("#formDate").submit();
		  self.close();

	});
});



</script>
	<style>
/*    table, th, td {
    border: 1px solid #bcbcbc;
  } */ 
  table {
    margin-left:30px;
    font-family: 'IBMPlexSansKR-Light';
  }
  
  @font-face {
    font-family: 'GongGothicMedium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10@1.0/GongGothicMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

@font-face {
    font-family: 'GongGothicLight';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10@1.0/GongGothicLight.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

/* 내용 글씨 */
@font-face {
    font-family: 'IBMPlexSansKR-Light';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/IBMPlexSansKR-Light.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

.modifyBtn{
	text-align:right;
}
.diaryHr{
	color: #1dcad3;
	font-size:40px;
	font-family: 'Montserrat', sans-serif;  
}
.fileStyle{
	border: solid 1px;
	/* border-radius: 15px 15px 0 0; */
	font-family: 'GongGothicMedium';
	color: white;
	font-size:18px;
	background-color: #1dcad3;
	/* width:100px; */
	border-radius: 5px; 

}
#submitBtn{
	border: solid 1px;
	/* border-radius: 15px 15px 0 0; */
	font-family: 'GongGothicMedium';
	color: white;
	font-size:18px;
	background-color: #1dcad3;
	/* width:100px; */
	 border-radius: 5px; 

}
#View_area, #prev_View_area{
border-radius: 10px; 

}
</style>
	
</head>
<body>
<form id='formDate' name="myForm" action="${pageContext.request.contextPath}/diary_modify?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
<input type="hidden" name="diary_id" value="${diary_view.diary_id}"/>
<input type="hidden" name="planner_id" value="${planner.planner_id}"/>
<input type="hidden" id="_csrf" name="_csrf" value="${_csrf.token}"/>
<input type="hidden" id="_csrf_header" name="_csrf_header" value="${_csrf.headerName}"/>

<div class="container">
<br>
  <div class="diaryHr">Diary</div>
  <div class="row">

<!--    <div class="col-sm-3">  -->
 <table class="table table-borderless">
			<tr>
      			<td rowspan='5'>
      			<input type="hidden" value="${diary_view.img_path}" name="currImg"/>
      				
				<div id='View_area' style='position:relative; width: 400px; height: 400px; color: black; border: 0px solid black; dispaly: inline; '>
				<br>
				<img id="prev_View_area"  src='/resources/diary/${diary_view.img_path}' style='position:relative; width: 400px; height: 400px;'/>
				</div>
					</td>
				<td>
<!--      <div class="form-group"> -->
      
     	<input type="file" class="form-control-file border fileStyle" name="uploadfile" id="profile_pt" onchange="previewImage(this,'View_area')">
	
<!--     </div>  -->
				</td>
			</tr> 
			<tr>
				<td>
      				<textarea rows= "10" cols="55" name="text">${diary_view.text}</textarea>
				</td>
			</tr>
			<tr>
      			<td>
      				<span style="font-family: 'GongGothicMedium'">Tag</span>
				</td>
			</tr>
			<tr>
			<td>
      		<textarea rows= "2" cols="55" name="hashtag">${diary_view.hashtag}</textarea>
			</td>
			</tr>
			<tr>
			<td class="modifyBtn">
			<!-- <div > -->
					<input type="button"  id="submitBtn" value="작성">
		<!-- 	</div> -->
			</td>
			</tr>
			</table>
			</div> 
	</div>
<!-- 	</div> -->
</form>
	
</body>
</html>