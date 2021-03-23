<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>diary</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	
	<script type="text/javascript">
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

<style>
/*    table, th, td {
    border: 1px solid #bcbcbc;
  } */ 
  table {
    margin-left:60px;
  }
</style>


</head>
<body>
<form id='submitBtn' name="myForm" action="${pageContext.request.contextPath}/diary_write?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
<input type="hidden" name="planner_id" value="${planner.planner_id}"/>
<input type="hidden" id="_csrf" name="_csrf" value="${_csrf.token}"/>
<input type="hidden" id="_csrf_header" name="_csrf_header" value="${_csrf.headerName}"/>
		  


<div class="container">
<br>
  <h1 class="text-warning" >Diary</h1>
  <div class="row">

<div class="col-sm-3">
 <table class="table table-borderless">
			<tr>
      			<td rowspan='5'>
				<div id='View_area' style='position:relative; width: 400px; height: 400px; color: black; border: 0px solid black; dispaly: inline; '>
				<br>
				<img id="prev_View_area" width='100' src='/resources/diary/camera2.png' style='position:relative; width: 400px; height: 400px;'/>
				</div>
					</td>
				<td>
<!--      <div class="form-group"> -->
      
     	<input type="file" class="form-control-file border" name="uploadfile" id="profile_pt" onchange="previewImage(this,'View_area')">
		<!-- <input type="button" id='uploadBtn' value="업로드"/> -->
<!--     </div>  -->
				</td>
			</tr> 
			<tr>
				<td>
      				<textarea rows= "10" cols="50" name="text"/></textarea>
				</td>
			</tr>
			<tr>
      			<td>
      				<h4>Tag</h4>
				</td>
			</tr>
			<tr>
			<td>
      		<textarea rows= "1" cols="50" name="hashtag"/></textarea>
			</td>
			</tr>
			<tr>
			<td>
			<!-- <input type="button" value="작성" style="display:none;" > -->
			<button type="button" id="fileCheck">작성</button>
			</td>
			</tr>
			</table>
			</div> 
	</div>
	</div>
</form>
	
</body>
</html>