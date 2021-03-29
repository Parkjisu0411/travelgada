<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>

<title>다이어리</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<<<<<<< HEAD
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- 	private int diary_id;
	private String img_path;
	private String text;
	private String hashtag;
	private Timestamp diary_date;
	private int planner_id;     -->
=======
 	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
 	
 	<link rel="stylesheet" href="${contextPath}/resources/css/font.css">
	
>>>>>>> 39e5e13d84f1493bfbeed7085aa1bac272a136a9
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
				preview.removeChild(prevImg);
			}
			var img = document.createElement("img"); 
			img.id = "prev_" + View_area;
			img.classList.add("obj");
			img.file = file;
			img.style.width = '300px'; 
			img.style.height = '300px';
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
	$("#updateForm").submit(function(event){
    
    event.preventDefault();
    
    var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
       
    
	var img_path = $("#img_path").val();
	var text = $("#text").val();
	var hashtag = $("#hashtag").val();           
	var diary_id = $("#diary_id").val();
      
	console.log($(this).attr("action"));

	var form = {
    		  img_path: img_path,
    		  text: text,
    		  hashtag: hashtag,
    		  diary_id: diary_id
      };

      $.ajax({
        type : "PUT",
        url : $(this).attr("action"),
        cache : false,
        contentType:'application/json; charset=utf-8',
		data: JSON.stringify(form), 
		beforeSend : function(xhr){   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
				console.log("header 실행 "+header+token)
				//console.log(sentence.toLowerCase());
			    xhr.setRequestHeader(header, token);
		
     },
        success: function (result) {       
          if(result == "SUCCESS"){
             //list로 
             $(location).attr('href', '${pageContext.request.contextPath}/diary')                            
          }                       
        },
        error: function (e) {
            console.log(e);
        }
    })          

  }); // end submit()

</script>


</head>
<body>
<form action="${pageContext.request.contextPath}/diary_write" method="post" enctype="multipart/form-data">
<input type="hidden" name="diary_id" value="${diary_view.diary_id}"/>

<div class="container">
<<<<<<< HEAD
  <h2 class="text-warning">Diary</h2>
=======
<br>
  <h1 class="text-warning" style="font-family: 'yg-jalnan'">Diary</h1>
>>>>>>> 39e5e13d84f1493bfbeed7085aa1bac272a136a9
  <div class="row">

   <div class="col-sm-3"> 
 <table class="table table-borderless">
			<tr>
      			<td rowspan='5'>
      				<img width='100' src='${diary_view.img_path}'/> -->
				<div id='View_area' style='position:relative; width: 400px; height: 400px; color: black; border: 0px solid black; dispaly: inline; '></div>
					</td>
				<td>
<!--      <div class="form-group"> -->
      
<<<<<<< HEAD
     	<input type="file" class="form-control-file border" name="img_path" id="profile_pt" onchange="previewImage(this,'View_area')">
		<input type="button" id='uploadBtn' value="업로드"/>
=======
     	<input type="file" style="font-family: 'yg-jalnan'" class="form-control-file border" name="uploadfile" id="profile_pt" onchange="previewImage(this,'View_area')">
	
>>>>>>> 39e5e13d84f1493bfbeed7085aa1bac272a136a9
<!--     </div>  -->
				</td>
			</tr> 
			<tr>
				<td>
      				<textarea rows= "10" cols="50" name="text">${diary_view.text}</textarea>
				</td>
			</tr>
			<tr>
      			<td>
      				<h4 style="font-family: 'yg-jalnan'">Tag</h4>
				</td>
			</tr>
			<tr>
			<td>
<<<<<<< HEAD
      		<textarea rows= "1" cols="30" name="hashtag">${diary_view.hashtag}</textarea>
=======
      		<textarea rows= "2" cols="50" name="hashtag">${diary_view.hashtag}</textarea>
>>>>>>> 39e5e13d84f1493bfbeed7085aa1bac272a136a9
			</td>
			</tr>
			<tr>
			<td>
<<<<<<< HEAD
			<input type="submit" value="작성" id= 'updateForm'>
=======
					<input type="button" style="font-family: 'yg-jalnan'" id="submitBtn" value="�옉�꽦">
>>>>>>> 39e5e13d84f1493bfbeed7085aa1bac272a136a9
			</td>
			</tr>
			</table>
			</div> 
	</div>
	</div>
</form>
	
</body>
</html>