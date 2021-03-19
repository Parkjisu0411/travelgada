<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>

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



  
</body>
</html>