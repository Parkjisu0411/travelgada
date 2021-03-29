<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>

<<<<<<< HEAD
<title>다이어리</title>
    <script src="https://code.jquery.com/jquery-latest.js"></script> 
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Bootstrap -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"></script>

<!-- Font -->
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@700;800&display=swap" rel="stylesheet">
	
  <script>
/* 		function showPopup() { 
			window.open('${pageContext.request.contextPath}/test', 
					"a",
					"location=no",
					"width=700, height=600, left=100, top=50"); 
			} */
  </script>
  
<!--     <script>
	$(document).ready(function(){
    	//이미지 변경 함수 호출
    	changeIMG();
    });
	  $('.next').click(function()({
		  $('div').attr('id','myModal${dto.diary_id+1}')
		  })
  </script> -->
  
  <script type="text/javascript">
  
  //삭제 실행
	$(document).ready(function(){//이래야 전체 다 읽고 읽는다. 
		$(".delete").click(function(event){
			event.stopPropagation();//근데 이거를 어떻게 하지??
			console.log("이벤트 실행");
			var trObj = $(this).parent().parent().parent();//이게 클로져래....
			 var token = $("meta[name='_csrf']").attr("content");
			var header = $("meta[name='_csrf_header']").attr("content");
		     
			
			$.ajax({
				type : 'DELETE',//대문자로 해야한다.
				url : $(this).attr("href"),//기억해두자
				cache : false,//왜 적어야 하는지 모르겠다.
				beforeSend : function(xhr){   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
	  				console.log("header 실행 "+header+token)
	  				//console.log(sentence.toLowerCase());
	  			        xhr.setRequestHeader(${_csrf.headerName}, ${_csrf.token});
	  		
	          },
				success: function(result){
					console.log(result);
					if(result=="SUCCESS"){
						$(trObj).remove();//이것도 기억해야 한다.
						
						console.log("<tr> 삭제함")
					}
				},//,까먹고 안 적으면 안된다.
				error:function(e){
					console.log(e);
				}
				
			})
			
		});
		
	});
	
	
	</script>
  
  
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

  </style>
 
</head>
<body>
<!-- Header -->
  <nav class="navbar navbar-expand-lg navbar-light bg-white">
    <div class="container">
      <a class="navbar-brand" href="#"><img class="nav-logo-img" src="${contextPath}/resources/logo.png">가다</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
          <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
              data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 일정 </a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
              <a class="dropdown-item" href="#">플래너</a> <a class="dropdown-item" href="#">준비물</a> <a
                class="dropdown-item" href="#">지도</a>
            </div>
          </li>
          <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
              data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 커뮤니티 </a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
              <a class="dropdown-item" href="#">Q&A</a> <a class="dropdown-item" href="#">리뷰</a> <a
                class="dropdown-item" href="#">동행</a>
            </div>
          </li>
          <li class="nav-item"><a class="nav-link" href="#">쇼핑</a></li>
          <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
              data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 회원정보 </a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
              <a class="dropdown-item" href="#">정보 수정</a>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="#">로그아웃</a>
            </div>
          </li>
        </ul>
        <form class="form-inline">
          <input class="form-control mr-sm-2" type="text" aria-label="Search">
          <button class="btn btn-outline-white btn-sm my-0" type="submit">검색</button>
        </form>
      </div>
    </div>
  </nav>
  
  
<form action ="${pageContext.request.contextPath}/diary_write_view" method="get">
<div class="container">
  <h2 class="text-warning">Diary</h2>
  <div class="row">
  <div class="col-sm-10"> 
  		<select class="form-control" name="planner_id">
			<c:forEach var="id" items="${planner}">
				<option value='${id.planner_id}'>
				${id.end_date} ~ ${id.start_date}&nbsp;
				${id.planner_name}&nbsp;
				${id.planner_id}
				</option>
			</c:forEach>
		</select>		
		
		</div>
		  <div class="col-sm-2">
		<input class="form-control" value="다이어리 작성" type="submit" class="btn btn-outline-warning bg-warning text-white"/>
		<br/>    
    </div>
   
  <c:forEach items="${diary}" var="dto">
  
   <div class="col-sm-3"> 
   <div class="dropdown">
    				<button type="button" class="btn dropdown-toggle" data-toggle="dropdown">
    				</button>
    				<div class="dropdown-menu">
      					<a class="dropdown-item" href="${pageContext.request.contextPath}/diary_modify_view/${dto.diary_id}">수정</a>
      					<a class="delete" href="${pageContext.request.contextPath}/diary/${dto.diary_id}">삭제</a>
    				</div>
  				</div>
  <table class="table table-borderless">
  			
			<tr class="table-light">
      			<td>
      			<div >
      				<img class='diary_img' src='${dto.img_path}' data-toggle="modal" data-target="#myModal${dto.diary_id}"/>
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
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Modal Header</h4>
        </div>
        <div class="modal-body">
        <img class="popup_img" src='${dto.img_path}'/>
          <span>${dto.hashtag}</span>
          <span> ${dto.diary_date}</span>
          <span> ${dto.text}</span>
        </div>
        <div class="modal-footer">
        <button type="button" class='next'>다음 사진</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
    </div>

		</c:forEach>
	</div>
	

	
	</div>
	 </form>
	
<!-- Footer -->
  <footer>
    <div class="footer-company-info">
      © 2021 가다, Inc. All rights reserved<br> 개인정보 처리방침·이용약관·사이트맵
    </div>
  </footer>



  
=======
<title>diary</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- <script src="https://code.jquery.com/jquery-3.5.1.js"></script> -->
	
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"></script>

<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@700;800&display=swap" rel="stylesheet">
  
<link rel="stylesheet" href="${contextPath}/resources/css/font.css">
<link rel="stylesheet" href="${contextPath}/resources/css/header.css">
<link rel="stylesheet" href="${contextPath}/resources/css/footer.css">

<!-- 모달 스타일 -->
<style>
.dialog{
    width : 300px;
    height : 50px;
    float: left;
    margin-left: 30px;
    margin-botton: 10px;
}

#mainImg{
    float: left;
}
</style>

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


</style>
 
<!-- csrf 토큰 -->
<!-- <script type="text/javascript">

	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	
	$(document).ajaxSend(function(e, xhr, options) {
		xhr.setRequestHeader(header, token);
	});
</script> -->
     
<!-- 삭제 ajax -->
<script type="text/javascript">
    	
	$(document).ready(function(){
		$(".delete").click(function(event){				
			event.preventDefault();
			console.log("delete click");
			
			var token = $("meta[name='_csrf']").attr("content");
			var header = $("meta[name='_csrf_header']").attr("content");
				
			var tr = $(this).parent().parent().parent();
				
			$.ajax({
				type : "DELETE",
				url : $(this).attr("href"),
				cache : false,
		 		beforeSend : function(xhr){   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
					console.log("header 실행 "+header+token)
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
	
<!-- 다른 플래너로 전환 -->
<script type="text/javascript">
	$(document).ready(function(){
		$("#selectDiary").on('change',function(){
			
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
		        			
		        			/* <span class="dropdown-item" onclick="window.open('${pageContext.request.contextPath}/diary_modify_view/${dto.diary_id}',
		      					'popwin2','width=1250,height=800,left=300, top=120')">수정</span>  */
		        		
		 		       	//다이어리
 		  		      	htmls +='<div class="col-sm-3">';
		   		     	htmls +='<div class="dropdown">';
		   		     	htmls +='<img src="resources/diary/dot.png" class="btn dropdown-toggle" data-toggle="dropdown" style="height: 20px;float: right;"/>';    
		   		     	htmls +='<div class="dropdown-menu">';
		 	 	      	htmls +='<a class="dropdown-item" onclick="window.open(\'${pageContext.request.contextPath}/diary_modify_view/'+this.diary_id+'\',\'popwin2\',\'width=1250,height=800,left=300, top=120\')">수정</a>';
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
		        		htmls +='<h3 class="modal-title" style="font-family: \'yg-jalnan\'">diary</h3>';
		      		  	htmls +='<button type="button" class="close" data-dismiss="modal">&times;</button>';
		      		  	htmls +='<div class="modal-body"><div id="mainImg">';
		      		  	htmls +='<img class="popup_img" src="resources/diary/'+this.img_path+'" style="position:relative; width: 400px; height: 400px;"/></div>';
		        		htmls +='<div class="dialog"><h4 style="font-family: \'yg-jalnan\'">'+this.diary_date+'</h4></div>';
		       		 	htmls +='<div class="dialog">'+this.hashtag+'</div><div class="dialog">'+this.text+'</div></div>';
		      		  	htmls +='<div class="modal-footer">';
		      		  	htmls +='<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>';
		      		  	htmls +='</div></div></div></div></div>';  
		
		        		});//result end
		        		
		        		//console.log(htmls);
		        	
		        		$("#diaryDiv").append(htmls); 
		        	
		        	}//sucess end
				});//ajax end
			}//getList end
		});//change
	});//document function
</script>

<!-- 작성 팝업 -->
<script>
	function openwin() {
		window.open('about:blank','popwin',
		  'width=1250,height=800,toolbar=no, location=no, status=no, menubar=no, scrollbars=no, resizable=no, left=300, top=120');
  	document.formDate.submit();
	}//function end
</script>

</head>
<body>

<!-- 해더 -->
<%@ include file="/WEB-INF/views/includes/header.jsp"%>

<!-- 플래너 셀렉트, 다이어리 작성 -->
<div class="container">
<form action ="${pageContext.request.contextPath}/diary_write_view" method="get" target="popwin" name="formDate">
	<div class="row">
		<div class="col-sm-10"> 
			<select class="form-control" name="planner_id" id="selectDiary" style="font-family: 'yg-jalnan'">
				<c:forEach var="id" items="${planner}">
					<option value='${id.planner_id}' style="font-family: 'yg-jalnan'">
				  	${id.planner_name}&nbsp;&nbsp; ${id.start_date}&nbsp;&nbsp;~&nbsp;&nbsp;${id.end_date}
					</option>
				</c:forEach>
			</select>		
		 
		</div>
		<div class="col-sm-2">
			<input class="form-control" value="다이어리 작성" style="font-family: 'yg-jalnan'" type="button" class="btn btn-outline-warning bg-warning text-white" onclick="openwin();"/>
			<br/>    
    	</div>
     </div>
</form><!-- 다이어리 작성을 위한 form -->

	<!-- 다이어리  -->
	<div class="row"  id="diaryDiv">
		<!-- 다이어리 반복문 -->
		<c:forEach items="${diary}" var="dto">
			<!-- ajax 써야 하는 부분 -->
			<div class="col-sm-3"> 
				<!-- 다이어리 수정, 삭제 -->
   				<div class="dropdown" >
    				<img src="resources/diary/dot3.png" class="btn dropdown-toggle" data-toggle="dropdown" style='height: 20px;float: right;'/>
    				<div class="dropdown-menu" >
      					<a class="dropdown-item" onclick="window.open('${pageContext.request.contextPath}/diary_modify_view/${dto.diary_id}',
      					'popwin2','width=1250,height=800,left=300, top=120')">수정</a>
      					<a class="delete dropdown-item" href="diary/${dto.diary_id}">삭제</a>
    				</div>
  				</div>
  				<!-- 다이어리 테이블 -->
  				<table class="table table-borderless">
					<tr class="table-light">
      					<td>
      						<div >
      							<!-- 다이어리 이미지 -->
      							<img class='diary_img' src='resources/diary/${dto.img_path}' data-toggle="modal" data-target="#myModal${dto.diary_id}"/>
							</div>
						</td>
					</tr> 
					<tr class="table-light">
      					<td>${dto.diary_date}</td>
					</tr>
					<tr class="table-light">
      					<td>${dto.hashtag}</td>
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
					<h3 class="modal-title" style="font-family: 'yg-jalnan'">diary</h3>
					<button type="button" class="close" data-dismiss="modal">&times;</button>  
				</div>
				<div class="modal-body" >
					<div id="mainImg">
					<img class="popup_img" src='resources/diary/${dto.img_path}' style='position:relative; width: 400px; height: 400px;'/>
				</div>		
					<div class="dialog"><h4 style="font-family: 'yg-jalnan'">${dto.diary_date}</h4></div>
        			<div class="dialog">${dto.hashtag}</div>
       				<div class="dialog">${dto.text}</div>
      			</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
      	  </div>
		</div>
	</div>

<!-- <a class="prev" onclick="plusSlides(-1)">❮</a>
<a class="next" onclick="plusSlides(1)">❯</a> -->
		
		</c:forEach><!-- 다이어리,모달 반복문 끝 -->
	</div>
</div><!-- container 끝 -->

<!-- footer -->
<%@ include file="/WEB-INF/views/includes/footer.jsp"%>

>>>>>>> 39e5e13d84f1493bfbeed7085aa1bac272a136a9
</body>
</html>