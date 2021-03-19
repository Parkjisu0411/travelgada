<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>
<title>Insert title here</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
	<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"></script>
	<!-- Font -->
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link
	href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@700;800&display=swap"
	rel="stylesheet">
  
  <style>
  	img {
  		object-fit: cover;
  		max-width: 70px;
		max-height: 70px;
  	}
  	
  	.selected {
	  	text-decoration:line-through;
	  	font-weight:700;
	  	color:black;
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
  
  <script type="text/javascript">
	  var token = $("meta[name='_csrf']").attr("content");
	  var header = $("meta[name='_csrf_header']").attr("content");
	  $(document).ajaxSend(function(e, xhr, options) { xhr.setRequestHeader(header, token); });
  </script>

    <script type="text/javascript">
    window.onload = function randomImage() {
            var bannerImages=new Array();
                bannerImages[0]="Blue.png";
                bannerImages[1]="Red.png";
                bannerImages[2]="Green.png";
                bannerImages[3]="Yellow.png";

            var ranNum=Math.round(Math.random()*bannerImages.length);

            $(".pdImg").attr({src : bannerImages[ranNum]});
       
	}

    </script>
    
    <script>
    	$(document).ready(function() {
    		$("#addToDo").submit(function(event) {
    			event.preventDefault();
    			console.log("addToDo submit");
    			
    			var token = $("meta[name='_csrf']").attr("content");
                var header = $("meta[name='_csrf_header']").attr("content");
    			
    			var planner_id = $("#planner_id").val();
    			var todo_title = $("#todo_title").val();
    			var todo_name = $("#todo_name").val(); 
    			
    			var form = {
    					// planner_id : planner_id,
    					todo_title : todo_title,
    					todo_name : todo_name
    				};
    				
    			$.ajax({
    				type : "POST",
    				url : $(this).attr("action"),
    				cache : false,
    				data : JSON.stringify(form),
    				contentType : 'application/json; charset=utf-8',
    	            beforeSend : function(xhr){   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
    	                 console.log("header 실행 "+header+token)
    	                 //console.log(sentence.toLowerCase());
    	                 xhr.setRequestHeader(header, token);
    				success : function(result){
    					if(result == "SUCCESS"){
    						console.log("success");
    						
    					}
    				},
    				error : function(e){
    					console.log(e);
    				}
    					
    			}); // ajax end
    		}) // submit end
    	})
    </script>
    
	<script>            
        $(document).ready (function () {                
            $('.btnAdd').click (function () {                                        
                $('.buttons').append (                        
                    '<input type="text" name="txt" placeholder="ex.카메라"><input type="button" class="btnRemove btn-warning" value=" - "><br>'                    
                ); // end append                            
                $('.btnRemove').on('click', function () { 
                    $(this).prev().remove (); // remove the textbox
                    $(this).next ().remove (); // remove the <br>
                    $(this).remove (); // remove the button
                });
            }); // end click                                            
        }); // end ready        
    </script>
    
	<script>
		$(document).ready(function() {
			$("input:checkbox").on('click', function() {
				if ( $(this).prop('checked') ) {
					$(this).parent().parent().parent().addClass("selected");
				} else {
					$(this).parent().parent().parent().removeClass("selected");
				} 
			}); 
		}); 
	</script>


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
	
	<br /><br /><br />
	<div class="container">
	<div class="row text-center" style="width: 100%;">
	<div style="width: 30%; float:none; margin:0 auto">
		  <div class="btn-group">
		    <button type="button" class="btn btn-warning">일정</button>
		    <button type="button" class="btn btn-warning">지도</button>
		    <button type="button" class="btn btn-warning">준비물</button>
		    <button type="button" class="btn btn-warning">다이어리</button>
		  </div>
	</div>
	</div> 	  
	</div>	
	
	<br /><br />
	<div class="container">
	<div class="row">
<%-- 	<div class="col-sm-10">

	  <div class="dropdown">
	    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
	     d-day / 플래너 제목
	    </button>
	    <div class="dropdown-menu dropdown-menu-right">
	    <c:forEach items="${todolist }" var="todo">
	      <a class="dropdown-item" href="#">${todo.planner_id }</a>
	    </c:forEach>
	    </div>
	  </div> --%>
	  
	  
  	<div class="col-sm-12"> 
        <select class="form-control" name="planner_id">
         <c:forEach items="${todolist }" var="todo">
            <option value='${todo.planner_id}'>${todo.planner_id}</option>
         </c:forEach>
      	</select>
    </div>
	</div>
	</div>	  
	

	
	
	<br /><br />
	<div class="container">
	<div class="row">
	<div class="col-sm-3">
	<form id="addToDo" action="/addToDo" method="POST" >
	<!-- <input type="hidden" id="planner_id" value=""> -->		<!-- 플래너 번호를 어디서 받아올 것인가...? -->
    <table class="table table-bordered"  width="100%" cellspacing="0">
    	<tr>
			<td colspan="3">카테고리를 입력하세요<input type="text" id="todo_title" placeholder="ex.전자기기"></td>	
		</tr>

		<tr>
			<td colspan="3">
				<div class="buttons">            
	        		 체크리스트를 입력하세요<input type="text" id="todo_name" placeholder="ex.카메라"><input type="button" class="btnAdd btn-warning" value=" +"><br>
	        	</div>  
			</td>
		</tr>	
		
		<tr>
			<td colspan="3"><input type="submit" value="체크리스트 만들기"></td>
		</tr>
		
	</table>
	</form>
	</div>
	</div>
	</div>
	
	<!-- 더미 데이터 가져오기 연습 -->
	<!-- form 필요 : flag값 db 저장..... -->
<%--  	<br /><br />
	<div class="container">
	<div class="row">
	<c:set var="todolist" value="${todolist}" />
	<c:forEach items="${todolist }" var="todo">
	<div class="col-sm-3">
	
    <table class="table table-bordered"  width="100%" cellspacing="0">
    	<tr>
			<td colspan="3">${todo.todo_title }</td>	
		</tr>

		<tr>
			<td>${todo.todo_name }</td>
			<td>${todo.todo_name }</td>
			<td>${todo.complete_flag }</td>	
				
			<td>
			<label class="checkbox-inline">
	 		 	<input type="checkbox" id="inlineCheckbox1" value="option1">
			</label>
			</td>
			
			<!-- ajax로 delete 처리 -->
			<td><a href="#">x</a></td>
		</tr>
		
		<tr>
			<!-- ajax로 insert 처리 -->
			<td colspan="3"><a href="#">+ 체크리스트 추가</a></td>
		</tr>	
	</table>
	
	</div>
	</c:forEach>
	</div>
	</div>  --%>
	
  	<br /><br />
	<div class="container">
	<div class="row">
	<%-- <c:set var="todolist" value="${todolist}" /> --%>
	<c:forEach items="${todolist }" var="todo">
	<div class="col-sm-3">
	
    <table class="table table-bordered"  width="100%" cellspacing="0">
    	<tr>
			<td colspan="3">
				 ${todo.todo_title }
			</td>	
		</tr>
		
		<tr>
			<td>${todo.todo_name }</td>
				
			<td>
			<label class="checkbox-inline">
	 		 	<input type="checkbox" id="inlineCheckbox1" value="option1">
			</label>
			</td>
			
			<!-- ajax로 delete 처리 -->
			<td><a href="#">x</a></td>
		</tr>
		
		<tr>
			<!-- ajax로 insert 처리 -->
			<td colspan="3"><a href="#">+ 체크리스트 추가</a></td>
		</tr>	
	</table>
	
	</div>
	</c:forEach>
	</div>
	</div>  
	
	
	<br /><br /><br /><br /><br /><br />
	<div class="container">	
		<h3>혹시 잊어버린 물건은 없으신가요?</h3><br />
		<p>다른 여행객들이 주로 챙기는 물품들</p>
		<ol>
			<li>추천 리스트 1</li>
			<li>추천 리스트 2</li>
			<li>추천 리스트 3</li>
			<li>추천 리스트 4</li>
			<li>추천 리스트 5</li>
		</ol>
	</div>
	
	
	<br /><br /><br /><br /><br /><br />
	<div class="container">
	<h3>이 상품이 필요하진 않으신가요?</h3>
	<br /><br />
	<div class="row">
	<c:forEach items="${productList }" var="pdlist">
	<div class="col-sm-3">
	
    <table class="table table-borderless">
         <tr class="table-light">
            <td colspan="2">
                <%-- <img width='100' src='${pdlist.img_path}'/> --%>
                <a href="#">
              	  <img class="pdImg" onload="randomImage()"/>
                </a>
            </td>
         </tr> 
         <tr class="table-light" style="text-align:center;">
         	<td>상품</td>
            <td>
                ${pdlist.product_name}
            </td>
         </tr>
         <tr class="table-light" style="text-align:center;">
         	<td>가격</td>
            <td>
                  ${pdlist.price} 원
            </td>
         </tr>
         <tr style="text-align:center;">
         	<td><a href="#">구매</a></td>
         	<!-- <td><a class="basket" href="#">장바구니</a></td> -->
         	
         	<td>
         	<div class="container">
         	<button type="button" class="btn btn-default btn-sm" data-toggle="modal" data-target="#myModal">장바구니</button>
         	  <!-- The Modal -->
			  <div class="modal" id="myModal">
			    <div class="modal-dialog">
			      <div class="modal-content">
			      
			        <!-- Modal Header -->
			        <div class="modal-header">
			          <h4 class="modal-title">상품이 장바구니에 담겼습니다.</h4>
			          <button type="button" class="close" data-dismiss="modal"></button>
			        </div>
			        
			        <!-- Modal body -->
			        <div class="modal-body">
			          장바구니로 이동하시겠습니까?
			        </div>
			        
			        <!-- Modal footer -->
			        <div class="modal-footer">
			          <button type="button" class="btn btn-default" data-dismiss="modal" onclick="location.href='#'">예</button>
			          <button type="button" class="btn btn-default" data-dismiss="modal">아니오</button>
			        </div>
			        
			      </div>
			    </div>
			  </div>
  
			</div>
         	</td>
         </tr>
	</table>
	</div>
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