<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���̾</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- 	private int diary_id;
	private String img_path;
	private String text;
	private String hashtag;
	private Timestamp diary_date;
	private int planner_id;     -->
	
	<script type="text/javascript">
	function previewImage(targetObj, View_area) {
	var preview = document.getElementById(View_area); //div id
	var ua = window.navigator.userAgent;

  //ie�϶�(IE8 ���Ͽ����� �۵�)
	if (ua.indexOf("MSIE") > -1) {
		targetObj.select();
		try {
			var src = document.selection.createRange().text; // get file full path(IE9, IE10���� ��� �Ұ�)
			var ie_preview_error = document.getElementById("ie_preview_error_" + View_area);


			if (ie_preview_error) {
				preview.removeChild(ie_preview_error); //error�� ������ delete
			}

			var img = document.getElementById(View_area); //�̹����� �ѷ��� ��

			//�̹��� �ε�, sizingMethod�� div�� ���缭 ����� �ڵ����� �ϴ� ����
			img.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"+src+"', sizingMethod='scale')";
		} catch (e) {
			if (!document.getElementById("ie_preview_error_" + View_area)) {
				var info = document.createElement("<p>");
				info.id = "ie_preview_error_" + View_area;
				info.innerHTML = e.name;
				preview.insertBefore(info, null);
			}
		}
  //ie�� �ƴҶ�(ũ��, ���ĸ�, FF)
	} else {
		var files = targetObj.files;
		for ( var i = 0; i < files.length; i++) {
			var file = files[i];
			var imageType = /image.*/; //�̹��� �����ϰ�츸.. �ѷ��ش�.
			if (!file.type.match(imageType))
				continue;
			var prevImg = document.getElementById("prev_" + View_area); //������ �̸����Ⱑ �ִٸ� ����
			if (prevImg) {
				preview.removeChild(prevImg);
			}
			var img = document.createElement("img"); 
			img.id = "prev_" + View_area;
			img.classList.add("obj");
			img.file = file;
			img.style.width = '300px'; 
			img.style.height = '300px';
			preview.appendChild(img);
			if (window.FileReader) { // FireFox, Chrome, Opera Ȯ��.
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
	$("#uploadBtn").on("click",function(e){
		var formData = new FormData();
		var inputFile = $("input[name='img_path']");
		var files = inputFile[0].files;
		
		console.log(files);
		for(var i = 0; i<file.length; i++){
		formData.append("uploadFile",files)
		}
		
		$.ajax({
			url:'${pageContext.request.contextPath}/upload',
			processData: false,
			contentTypez: false,
			data: formData,
			type:'Post',
			sucess: function(result){
				alert("Uploaded");
			}
		})
		
	})
})


</script>



</head>
<body>
<form action="${pageContext.request.contextPath}/diary_write" method="post" enctype="multipart/form-data">
<input type="hidden" name="planner_id" value="${planner.planner_id}"/>

<div class="container">
  <h2 class="text-warning">Diary</h2>
  <div class="row">

   <div class="col-sm-3"> 
   <p>${planner.planner_id}</p>
 <table class="table table-borderless">
			<tr>
      			<td rowspan='5'>
      				<!-- <img width='100' src='https://github.com/tjaqpfflsk/hello/blob/main/%EC%97%AC%ED%96%891.png?raw=true'/> -->
				<div id='View_area' style='position:relative; width: 400px; height: 400px; color: black; border: 0px solid black; dispaly: inline; '></div>
					</td>
				<td>
<!--      <div class="form-group"> -->
      
     	<input type="file" class="form-control-file border" name="img_path" id="profile_pt" onchange="previewImage(this,'View_area')">
		<input type="button" id='uploadBtn' value="���ε�"/>
<!--     </div>  -->
				</td>
			</tr> 
			<tr>
				<td>
      				<textarea rows= "10" cols="50" name="hashtag"/></textarea>
				</td>
			</tr>
			<tr>
      			<td>
      				<h4>Tag</h4>
				</td>
			</tr>
			<tr>
			<td>
      		<textarea rows= "1" cols="30" name="text"/></textarea>
			</td>
			</tr>
			<tr>
			<td>
			<input type="submit" value="�ۼ�">
			</td>
			</tr>
			</table>
			</div> 
	</div>
	</div>
</form>
	
</body>
</html>