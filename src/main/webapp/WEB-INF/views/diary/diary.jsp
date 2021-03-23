<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF_8">
<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>diary</title>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  
  <!-- <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script> -->
  <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
	<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"></script>
	<!-- Font -->
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link
	href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@700;800&display=swap"
	rel="stylesheet">
  
<link rel="stylesheet" href="${contextPath}/resources/css/font.css">
<link rel="stylesheet" href="${contextPath}/resources/css/header.css">
<link rel="stylesheet" href="${contextPath}/resources/css/footer.css">
  
  
  <style>
   .diary_img {
  width: 240px;
  height: 240px;
  object-fit: cover;
  display: block; 
  margin: 0px auto;
}
 .popup_img {
  width: 300px;
  height: 300px;
  object-fit: cover;
}  
  	
  	
  	/* Navbar */
	.navbar {
	  padding: 2px;
	  box-shadow: rgb(0 0 0 / 8%) 0px 1px 12px;
	}
	
	.nav-logo-img {
	  max-width: 70px;
	  max-height: 70px;
	}
	
	.navbar-brand {
	  font-family: 'yg-jalnan';
	  font-size: 1.4em;
	}
	
	.nav-logo-img {
	  max-width: 30px;
	  max-height: 30px;
	  margin: 0px 4px 0px 0px;
	  padding: 0px 0px 3px;
	}
	
	.nav-item {
	  padding: 0px 15px;
	}
	
	/* Footer */
	footer {
	  background-color: #f5f5f7;
	}
	
	.footer-company-info {
	  text-align: center;
	  padding: 50px;
	  font-size: 14px;
	}

/* 주의 주의 */
body {
  font-family: Arial;
  margin: 0;
}

* {
  box-sizing: border-box;
}

img {
  vertical-align: middle;
}

/* Position the image container (needed to position the left and right arrows) */
.container {
  position: relative;
}

/* Hide the images by default */
.mySlides {
  display: none;
}

/* Add a pointer when hovering over the thumbnail images */
.cursor {
  cursor: pointer;
}

/* Next & previous buttons */
.prev,
.next {
  cursor: pointer;
  position: absolute;
  top: 40%;
  width: auto;
  padding: 16px;
  margin-top: -50px;
  color: white;
  font-weight: bold;
  font-size: 20px;
  border-radius: 0 3px 3px 0;
  user-select: none;
  -webkit-user-select: none;
}

/* Position the "next button" to the right */
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover,
.next:hover {
  background-color: rgba(0, 0, 0, 0.8);
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* Container for image text */
.caption-container {
  text-align: center;
  background-color: #222;
  padding: 2px 16px;
  color: white;
}

.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Six columns side by side */
.column {
  float: left;
  width: 16.66%;
}

/* Add a transparency effect for thumnbail images */
.demo {
  opacity: 0.6;
}

.active,
.demo:hover {
  opacity: 1;
}






  </style>
  
   <script type="text/javascript">
	  var token = $("meta[name='_csrf']").attr("content");
	  var header = $("meta[name='_csrf_header']").attr("content");
	  $(document).ajaxSend(function(e, xhr, options) { xhr.setRequestHeader(header, token); });
    </script>
     
    <script type="text/javascript">
    	
		$(document).ready(function(){
			$(".delete").click(function(event){				
				event.preventDefault();
				console.log("delete click");
				
				var tr = $(this).parent().parent().parent();
				
				$.ajax({
					type : "DELETE",
					url : $(this).attr("href"),
					cache : false,
					beforeSend : function(xhr){   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
   	                 console.log("header 실행 "+header+token)
   	                 //console.log(sentence.toLowerCase());
   	                 xhr.setRequestHeader(header, token);
					},
					success : function(result){
						console.log("result : " + result );
						if(result == "SUCCESS"){
							alert("삭제하시겠습니까?");
							$(tr).remove();
						}
					},
					error : function(e){
						alert("오류가 발생했습니다.");
						console.log(e);
					}
				}); // ajax end
			}); // event end
		}); // ready end
	</script>
	

 
<script type="text/javascript">
$(document).ready(function(){
	$("#selectDiary").on('change',function(){
		//alert(this.value);
		var planner_id = this.value;
		console.log(planner_id);
		getList();
		function getList() {
			var url = "${pageContext.request.contextPath}/diary_other/"+planner_id;
			console.log(url);
			
			$.ajax({
	            type: 'GET',
	            url: url,
	            cache : false, // 이걸 안쓰거나 true하면 수정해도 값반영이 잘안댐
	            dataType: 'json',// 데이터 타입을 제이슨 꼭해야함, 다른방법도 2가지있음
		        success: function(result) {
					//console.log(result);
		         	$('#diaryDiv').children().remove();
		        	
					var htmls="";
					
		        	$("#diaryDiv").html("");	

		        	$(result).each(function(){	
		        			
 		        	htmls +='<div class="col-sm-3">';
		        	htmls +='<div class="dropdown">';
		        	htmls +='<button type="button" class="btn dropdown-toggle" data-toggle="dropdown"></button>';
		        	htmls +='<div class="dropdown-menu">';
		        	htmls +='<a class="dropdown-item" href="${pageContext.request.contextPath}/diary_modify_view/'+ this.diary_id +'">수정</a>';
		        	htmls +='<a class="delete dropdown-item" href="${pageContext.request.contextPath}/diary/'+ this.diary_id +'">삭제</a>';
		        	htmls +='</div></div>';
		        	htmls +='<table class="table table-borderless">';
		        	htmls +='<tr class="table-light">';
		        	htmls +='<td><div>';
		        	htmls +='<img class="diary_img" src="resources/diary/'+ this.img_path +'" data-toggle="modal" data-target="#myModal'+ this.diary_id +'"/>';
		        	htmls +='</div></td></tr>';
		        	htmls +='<tr class="table-light"><td>'+ this.diary_date +'</td></tr>';
		        	htmls +='<tr class="table-light"><td>'+ this.hashtag +'</td></tr></table></div>';
		        	
		        	//modal
		        	htmls +='<div class="modal fade" id="myModal'+ this.diary_id +'" role="dialog">';
		        	htmls +='<div class="modal-dialog modal-lg"><div class="modal-content"><div class="modal-header">';
		        	htmls +='<button type="button" class="close" data-dismiss="modal">&times;</button>';
		        	htmls +='<h4 class="modal-title">Modal Header</h4></div>';
		        	htmls +='<div class="modal-body">';
		        	htmls +='<img class="popup_img" src="resources/diary/'+ this.img_path +'"/>';
		        	htmls +='<span>'+this.hashtag+'</span><span>'+ this.diary_date +'</span><span>'+ this.text +'</span></div>';
		        	htmls +='<div class="modal-footer"><button type="button" class="next">다음 사진</button>';
		        	htmls +='<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>';
		        	htmls +='</div></div></div></div></div>'; 
	
		        	});
		        	
		        	$("#diaryDiv").append(htmls); 
		        	
		        }
		
	});
}
	});//change
});//document function

</script>

	<script>
	$(document).ready(function(){
		var currDate = new Date();
		var day = new Date(2021,8,30);
		var dday = currDate.getDate() - day.getDate();
		console.log(dday);
		
		$("#dday").append(dday);
		});
	</script>
	
	
	<script>
var slideIndex = 0;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
	console.log(n);
  var i;
  var slides = document.getElementsByClassName("mySlides");
  //var dots = document.getElementsByClassName("demo");
  //var captionText = document.getElementById("caption");
  if (n > slides.length) {slideIndex = 1}
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";
      
  }
/*   for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  } */
  slides[slideIndex-1].style.display = "block";
  //dots[slideIndex-1].className += " active";
  //captionText.innerHTML = dots[slideIndex-1].alt;
}
</script>
	
	<script>
function openwin() {
	

  window.open('about:blank','popwin',
		  'width=1250,height=800,toolbar=no, location=no, status=no, menubar=no, scrollbars=no, resizable=no, left=300, top=120');
  document.formDate.submit();
}


</script>

</head>
<body>

<%@ include file="/WEB-INF/views/includes/header.jsp"%>



<!-- 다이어리 부분 시작 -->
<div class="container">
<form action ="${pageContext.request.contextPath}/diary_write_view" method="get" target="popwin" name="formDate">
	<div class="row">
		<div class="col-sm-10"> 
			<select class="form-control" name="planner_id" id="selectDiary">
				<c:forEach var="id" items="${planner}">
					<option value='${id.planner_id}'>
				  	${id.planner_name}&nbsp;&nbsp; ${id.start_date}&nbsp;&nbsp;~&nbsp;&nbsp;${id.end_date}
					</option>
				</c:forEach>
			</select>		
		 
		</div>
		<div class="col-sm-2">
			<input class="form-control" value="다이어리 작성" type="button" class="btn btn-outline-warning bg-warning text-white" onclick="openwin();"/>
			<br/>    
    	</div>
     </div>
</form>
	<div class="row"  id="diaryDiv">
		<c:forEach items="${diary}" var="dto">
			<div class="col-sm-3"> 
   			<div class="dropdown">
    				<button type="button" class="btn dropdown-toggle" data-toggle="dropdown">
    				</button>
    				<div class="dropdown-menu">
      					<a class="dropdown-item" onclick="window.open('${pageContext.request.contextPath}/diary_modify_view/${dto.diary_id}',
      					'popwin2','width=1250,height=800,left=300, top=120')">수정</a>
      					<a class="delete dropdown-item" href="${pageContext.request.contextPath}/diary/${dto.diary_id}">삭제</a>
    				</div>
  				</div>
  <table class="table table-borderless">
  			
			<tr class="table-light">
      			<td>
      			<div >
      				<img class='diary_img' src='resources/diary/${dto.img_path}' data-toggle="modal" data-target="#myModal${dto.diary_id}"/>
				</div>
				</td>
			</tr> 
			<tr class="table-light">
      			<td>
      				${dto.diary_date}
				</td>
			</tr>
			<tr class="table-light">
      			<td>
      				${dto.hashtag}
				</td>
			</tr>
			</table>
			</div> 
			

			
	<!-- Modal -->
	<!-- 	<div class="row justify-content-center"> -->
	
	<div class="modal fade" id="myModal${dto.diary_id}" role="dialog">
	<!-- <div class="mySlides"> -->
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
	
				<div class="modal-header">
					     
					<h3 class="modal-title">diary</h3>
					<button type="button" class="close" data-dismiss="modal">&times;</button>  
				</div>
	
				<div class="modal-body">
					<table class="table table-borderless">
			<tr>
      			<td rowspan='7'>
				
				<img class="popup_img" src='resources/diary/${dto.img_path}' style='position:relative; width: 400px; height: 400px;'/>

					</td>
					
				<td>
						
     작성일
				</td>
			</tr> 
		<tr>
      			<td>
      				${dto.diary_date}
				</td>
			</tr>
			<tr>
				<td>
      				${dto.hashtag}
				</td>
			</tr>
			<tr>
      			<td rowspan='3'>
      				${dto.text}
				</td>
			</tr>
		
			</table>
				</div>
	
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
        
			</div>
		</div>
	</div>
<!-- 		<a class="prev" onclick="plusSlides(-1)">❮</a>
 	<a class="next" onclick="plusSlides(1)">❯</a> -->
	
	
	
	<!-- </div> -->
	
</c:forEach>
</div>
</div>


            
	
	<!-- Footer -->
  <footer>
    <div class="footer-company-info">
      © 2021 가다, Inc. All rights reserved<br> 개인정보 처리방침·이용약관·사이트맵
    </div>
  </footer>
</body>
</html>