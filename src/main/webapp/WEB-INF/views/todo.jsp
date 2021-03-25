<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<meta id="_csrf_header" name="_csrf_header"
	content="${_csrf.headerName}" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

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
	
	button{
		float : right;
	}
	/* 드롭다운 마우스 오	버 */
	.dropdown:hover .dropdown-menu {
	    display: block;
	    margin-top: 0;
	}
  </style>

<!--   <style>
      
      .jb-table {
        display: table;
        width: 80%;
        border: 1px solid #bcbcbc;
      }
      .jb-table-row {
        display: table-row;
        border: 1px solid #bcbcbc;
      }
      .jb-table-cell {
        display: table-cell;
        padding: 0px 20px;
        height: 100px;
        border: 1px solid #bcbcbc;
      }
      .jb-top {
        vertical-align: top;
        border: 1px solid #bcbcbc;
      }
      
    </style> -->

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
    		$("#addToDoTitle").submit(function(event) {
    			event.preventDefault();
    			console.log("addToDo submit");

    			var planner_id = $("#planner_id").val();
    			var todo_title = $("#todo_title").val();
     			var getRecentTodoTypeId = $("#getRecentTodoTypeId").val();
    			
    			var form = {
    					planner_id : planner_id,
    					todo_title : todo_title,
     					getRecentTodoTypeId : getRecentTodoTypeId
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
    	            },
    				success : function(result){
    					if(result == "SUCCESS"){
    						console.log("success");
    						
    						var htmls="";

    						    htmls +='<div class="container"><div class="row">'
    							htmls +='<div class="col-sm-3"><div class="dropdown"><button type="button" class="btn dropdown-toggle" data-toggle="dropdown"></button>'
    							htmls +='<div class="dropdown-menu dropdown-menu-right"><a class="dropdown-item" >수정</a>'
    							htmls +='<a class="titleDelete dropdown-item" href="${pageContext.request.contextPath }/todoTitle/${getRecentTodoTypeId}">삭제</a></div></div>'
    							htmls +='<table class="table table-bordered"><tr><td colspan="3">${getRecentTodoTypeId }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td></tr>'
    							htmls +='<c:forEach var="todoName" items="${todoName }">'
    							htmls +='<c:if test="${todoName.todo_type_id eq getRecentTodoTypeId }">'
    							htmls +='<tr><td><p>${todoName.todo_name }</p></td>'
    							htmls +='<td><label class="checkbox-inline"><input type="checkbox" id="inlineCheckbox1" value="option1"></label></td>'
    							htmls +='<td><a class="delete" href="${pageContext.request.contextPath }/todo/${todoName.todo_id}">x</a></td></tr></c:if></c:forEach>'
    							htmls +='<tr><td><a class="makeForm" href="javascript:void(0);" onclick="function makeForm();">+ 체크리스트 추가</a></td><td class="blank"></td><td></td></tr>'
    							htmls +='</table></div></div></div>'

    			        	$(".todoTable").append(htmls); 
    						$(location).attr('href', '${pageContext.request.contextPath}/todo');
    			        	
    					}  
    				},
    				error : function(e){
    					console.log(e);
    				}
    				
    			}); // ajax end
    		}) // submit end
    	});
    </script>

<script>
    	$(document).ready(function() {
    		$(".makeForm").click(function makeForm(event) {
    			console.log("click");
    			
    				var tr = $(this).parent();
    						
    				var htmls="";

    			    htmls +='<form id="addToDo" action="addToDo" method="POST">'
    			   	htmls +='<c:forEach items="${todoTitle}" var="todoTitle"><input type="hidden" id="getTodoTypeId" value="${todoTitle.todo_type_id }"></c:forEach>'
    			    
    			    htmls +='<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }" />'
    			    htmls +='<input type="text" id="todo_name" placeholder="ex.카메라">'
    			    htmls +='<input type="submit" value="체크리스트 만들기"></div></form>'

    			    $(tr).append(htmls); 
    		});
    	});
    </script>

<script>
    	$(document).ready(function() {
    		$("#addToDo").submit(function(event) {
    			event.preventDefault();
    			console.log("addToDo submit");
    			
    			var todo_name = $("#todo_name").val();
    			var getTodoTypeId = $("#getTodoTypeId").val();
    			
    			var form = {
    					todo_name : todo_name,
    					getTodoTypeId : getTodoTypeId
    			};
				
				$.ajax({
    				type : "POST",
    				url : $(this).attr("action"),
    				cache : false,
    				data : JSON.stringify(form),
    				contentType : 'application/json; charset=utf-8',
    	            beforeSend : function(xhr){  
    	                 console.log("header 실행 "+header+token)
    	                 //console.log(sentence.toLowerCase());
    	                 xhr.setRequestHeader(header, token);
    	            },
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
    	});
    </script>

<script type="text/javascript">
		$(document).ready(function(){
			$(".delete").click(function(event){				
				event.preventDefault();
				console.log("delete click");
				
				var tr = $(this).parent().parent();
				
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
			$(".titleDelete").click(function(event){				
				event.preventDefault();
				console.log("titleDelete click");
				
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

<script>            
        $(document).ready (function () {                
            $('.btnAdd').click (function () {                                        
                $('.buttons').append (                        
                    '<input type="text" name="txt" placeholder="ex.카메라"><input type="button" class="btnRemove btn-warning" value=" - "><br>'                    
                ); // end append                            
                $('.btnRemove').on('click', function () { 
                    $(this).prev().remove (); // remove the textbox
                    $(this).next().remove (); // remove the <br>
                    $(this).remove (); // remove the button
                });
            }); // end click                                            
        }); // end ready        
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
			<a class="navbar-brand" href="#"><img class="nav-logo-img"
				src="${pageContext.request.contextPath}/resources/logo.png">가다</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> 일정 </a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="#">플래너</a> <a
								class="dropdown-item" href="#">준비물</a> <a class="dropdown-item"
								href="#">지도</a>
						</div></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> 커뮤니티 </a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="#">Q&A</a> <a
								class="dropdown-item" href="#">리뷰</a> <a class="dropdown-item"
								href="#">동행</a>
						</div></li>
					<li class="nav-item"><a class="nav-link" href="#">쇼핑</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> 회원정보 </a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="#">정보 수정</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="#">로그아웃</a>
						</div></li>
				</ul>
				<form class="form-inline">
					<input class="form-control mr-sm-2" type="text" aria-label="Search">
					<button class="btn btn-outline-white btn-sm my-0" type="submit">검색</button>
				</form>
			</div>
		</div>
	</nav>

	<br />
	<br />
	<br />
	<div class="container">
		<div class="row text-center" style="width: 100%;">
			<div style="width: 30%; float: none; margin: 0 auto">
				<div class="btn-group">
					<button type="button" class="btn btn-warning">일정</button>
					<button type="button" class="btn btn-warning">지도</button>
					<button type="button" class="btn btn-warning">준비물</button>
					<button type="button" class="btn btn-warning">다이어리</button>
				</div>
			</div>
		</div>
	</div>

	<br />
	<br />
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<select class="form-control" name="planner_id">
					<c:forEach items="${plannerList }" var="planner">
						<option value='${planner.planner_id}'>${planner.planner_name}</option>
					</c:forEach>
				</select>
			</div>
		</div>
	</div>

	<%-- 	<br /><br />
	<div class="container">
	<div class="row">
	<div class="col-sm-3">
	<form id="addToDoTitle" action="/addTodoType" method="POST" >
	<input type="hidden" id="planner_id" value="${getPlannerId }">
    <table class="table table-bordered"  width="100%" cellspacing="0">
    	<tr>
			<td colspan="3">카테고리를 입력하세요<input type="text" id="todo_title" placeholder="ex.전자기기"></td>	
		</tr>
	
		<tr>
			<td colspan="3">
				<div class="buttons">      
					<form id="addToDo" action="/addTodo" method="POST" >
					<input type="hidden" id="getRecentTodoTypeId" value="${getRecentTodoTypeId }">
	        		 체크리스트를 입력하세요<input type="text" id="todo_name" placeholder="ex.카메라"><input type="button" class="btnAdd btn-warning" value=" +"><br>
	        		<input type="submit" value="체크리스트 만들기">
	        		</form>
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
	--%>

	<div class="container">
		<div class="row">

			<div class="col-sm-3">
				<div class="jb-table">
					<div class="jb-table-row">
						<form id="addToDoTitle" action="/addTodoType" method="POST">
							<input type="hidden" id="getRecentTodoTypeId"
								value="${getRecentTodoTypeId }"> <input type="hidden" id="planner_id" value="${getPlannerId }">
							<div class="jb-table-cell">
								<p>
									카테고리를 입력하세요<input type="text" id="todo_title" placeholder="ex.전자기기">
								</p>
								<input type="submit" value="체크리스트 만들기">
							</div>
						</form>
					</div>


					<%--       <div class="jb-table-row">
       <form id="addToDo" action="/addTodo" method="POST" >
	   <input type="hidden" id="getRecentTodoTypeId" value="${getRecentTodoTypeId }">
        <div class="jb-table-cell jb-top">
          <p>체크리스트를 입력하세요<input type="text" id="todo_name" placeholder="ex.카메라"><input type="button" class="btnAdd btn-warning" value=" +"><br></p>
       	  <input type="submit" value="체크리스트 만들기">
        </div>
       </form>
      </div> --%>

					<!--       <div class="jb-table-row">
        <div class="jb-table-cell jb-top">
          <p><input type="submit" value="체크리스트 만들기"></p>
        </div>
      </div> -->
				</div>
			</div>
			<!-- </form> -->
		</div>
	</div>



	<br />
	<br />
	<div class="todoTable container">
		<div class="row">
			<c:forEach items="${todoTitle }" var="todoTitle">
				<div class="col-sm-3">
					<div class="dropdown">
						<button type="button" class="btn dropdown-toggle"
							data-toggle="dropdown"></button>
						<div class="dropdown-menu dropdown-menu-right">
							<a class="dropdown-item" onclick="window.open('${pageContext.request.contextPath}/diary_modify_view/${dto.diary_id}', 'popwin2','width=1250,height=800,left=300, top=120')">수정</a>
							<a class="titleDelete dropdown-item" href="${pageContext.request.contextPath }/todoTitle/${todoTitle.todo_type_id}">삭제</a>
						</div>
					</div>

					<table class="table table-bordered">
						<tr>
							<td colspan="3">${todoTitle.todo_title }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<%--  <a class="titleDelete" href="${pageContext.request.contextPath }/todoTitle/${todoTitle.todo_type_id}">x</a> --%>
							</td>
						</tr>

						<c:forEach var="todoName" items="${todoName }">
							<c:if test="${todoName.todo_type_id eq todoTitle.todo_type_id }">
								<tr>
									<td>
										<p>${todoName.todo_name }</p>
									</td>

									<td><label class="checkbox-inline"> <input
											type="checkbox" id="inlineCheckbox1" value="option1">
									</label></td>

									<!-- ajax로 delete 처리 -->
									<td><a class="delete"
										href="${pageContext.request.contextPath }/todo/${todoName.todo_id}">x</a></td>
								</tr>
							</c:if>
						</c:forEach>

						<tr>
							<!-- ajax로 insert 처리 -->
							<td><a class="makeForm" href="javascript:void(0);" onclick="function makeForm();">+ 체크리스트 추가</a></td>
							<td class="blank"></td>
							<td></td>
						</tr>

					</table>

				</div>
			</c:forEach>
		</div>
	</div>





	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<div class="container">
		<h3>혹시 잊어버린 물건은 없으신가요?</h3>
		<br />
		<p>다른 여행객들이 주로 챙기는 물품들</p>
		<ol>
			<li>추천 리스트 1</li>
			<li>추천 리스트 2</li>
			<li>추천 리스트 3</li>
			<li>추천 리스트 4</li>
			<li>추천 리스트 5</li>
		</ol>
	</div>


	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<div class="container">
		<h3>이 상품이 필요하진 않으신가요?</h3>
		<br /> <br />
		<div class="row">
			<c:forEach items="${productList }" var="pdlist">
				<div class="col-sm-3">

					<table class="table table-borderless">
						<tr class="table-light">
							<td colspan="2">
								<%-- <img width='100' src='${pdlist.img_path}'/> --%> <a
								href="#"> <!-- <img class="pdImg" onload="randomImage()"/> -->
									<img width='100' src="Blue.png" />
							</a>
							</td>
						</tr>
						<tr class="table-light" style="text-align: center;">
							<td>상품</td>
							<td>${pdlist.product_name}</td>
						</tr>
						<tr class="table-light" style="text-align: center;">
							<td>가격</td>
							<td>${pdlist.price}원</td>
						</tr>
						<tr style="text-align: center;">
							<td><a href="#">구매</a></td>
							<!-- <td><a class="basket" href="#">장바구니</a></td> -->

							<td>
								<div class="container">
									<button type="button" class="btn btn-default btn-sm"
										data-toggle="modal" data-target="#myModal">장바구니</button>
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
												<div class="modal-body">장바구니로 이동하시겠습니까?</div>

												<!-- Modal footer -->
												<div class="modal-footer">
													<button type="button" class="btn btn-default"
														data-dismiss="modal" onclick="location.href='#'">예</button>
													<button type="button" class="btn btn-default"
														data-dismiss="modal">아니오</button>
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