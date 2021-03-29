<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<meta id="_csrf_header" name="_csrf_header"
	content="${_csrf.headerName}" />
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>TODO LIST</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script> -->
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"></script>

<!-- Font -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@700;800&display=swap" rel="stylesheet">

<!-- CSS -->
<link rel="stylesheet" href="${contextPath}/resources/css/main.css">
<link rel="stylesheet" href="${contextPath}/resources/css/font.css">
<link rel="stylesheet" href="${contextPath}/resources/css/header.css">
<link rel="stylesheet" href="${contextPath}/resources/css/footer.css">

  
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
  	
	
	dropdown {
		float : right;
	}
	
	

	/* 드롭다운 마우스 오	버 */
	.dropdown:hover .dropdown-menu {
	    display: block;
	    margin-top: 0;
	}
	
	
	/* 체크박스  */
	
	.checkbox-container {

position: relative;

}



// 기본 체크박스 없애기

.checkbox-container input[type="checkbox"] {

position: absolute;

width: 1px;

height: 1px;

padding: 0;

margin: -1px;

overflow: hidden;

clip:rect(0,0,0,0);

border: 0

}



// 웹의 경우 커서에 pointer 설정

.checkbox-container input[type="checkbox"] + label {

display: inline-block;

position: relative;

cusor: pointer;

-webkit-user-select: none;

-moz-user-select: none;

-ms-user-select: none;

user-select: none;

}



// 새로운 디자인의 체크박스 만들기

.checkbox-container input[type="checkbox"] + label:before {

content: ' ';

display: inline-block;

width: 18px;

height: 18px;

line-height: 18px;

margin: -2px 8px 0 0;

text-align: center;

vertical-align: middle;

background: #fafafa;

border: 1px solid #cacece;

border-radius: 3px;

box-shadow: 0px 1px 2px rgba(0,0,0,0.05), inset 0px -15px 10px -12px rgba(0,0,0,0.05);

}



.checkbox-container input[type="checkbox"] + label:active:before,

.checkbox-container input[type="checkbox"]:checked + label:active:before {
        box-shadow: 0px 1px 2px rgba(0,0,0,0.05), inset 0px 1px 3px rgba(0,0,0,0.1);

}



.checkbox-container input[type="checkbox"]:checked + label:before {

content: '\2713';

color: #314ca2;

text-shadow: 1px 1px white;

background: #f1f4ff;

border-color: #adb8c0;

box-shadow: 0px 1px 2px rgba(0,0,0,0.05), inset 0px -15px 10px -12px rgba(0,0,0,0.05);

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
    		$("#addToDoTitle").submit(function(event) {
    			event.preventDefault();
    			console.log("addToDo submit");

    			var planner_id = $("#planner_id").val();
    			var todo_title = $("#todo_title").val();
     			var getRecentTodoTypeId = $(".getRecentTodoTypeId").val();
    			
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
    							htmls +='<c:forEach var="todoName" items="${todoName }"><input class="here" type="hidden" class="todo_type_id" value="${todoName.todo_type_id }">'
    							htmls +='<c:if test="${todoName.todo_type_id} eq ${getRecentTodoTypeId} }">'
    							htmls +='<tr><td><p>${todoName.todo_name }</p></td>'
    							htmls +='<td><label class="checkbox-inline"><input type="checkbox" id="inlineCheckbox1" value="option1"></label></td>'
    							htmls +='<td><a class="delete" href="${pageContext.request.contextPath }/todo/${todoName.todo_id}">x</a></td></tr></c:if></c:forEach>'
    							htmls +='<tr><td colspan="3"><a class="makeForm" href="javascript:void(0);" onclick="function makeForm();">+ 체크리스트 추가</a></td></tr>'
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
    			console.log("makeForm");
    			
    				var tr = $(this).parent();
    			   // var todo_type_id = $(this).parent().parent().parent().parent().parent().parent().children("#here").attr("value");
        			var todo_type_id = $("input[name=todo_type_id]").val();
    			   console.log(todo_type_id);
    						
    				var htmls="";

    			    htmls +='<form id="addToDo" action="/addToDo" method="POST">'
    			    htmls +='<input type="hidden" id="todo_type_id" name="todo_type_id" value="' + todo_type_id + '">'
    			   	//htmls +='<c:forEach items="${todoTitle}" var="todoTitle"><input type="hidden" name="todo_type_id" value="${todoTitle.todo_type_id }"></c:forEach>'
    			    htmls +='<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }" />'
    			    htmls +='<input type="hidden" id="_csrf_header" name="_csrf_header" value="${_csrf.headerName}"/>'
    			    htmls +='<input type="text" id="todo_name" name="todo_name" placeholder="ex.카메라">'
    			    htmls +='<input type="submit" value="체크리스트 만들기"></form>'

    			    $(tr).append(htmls);
    		});
    	});
    </script>
    
    
    <script>
    	$(document).ready(function() {
    		$(".dropdown-item").click(function makeOption(event) {
    			console.log("makeOption");
    			
    				var tr = $(this).parent().parent().siblings(".table").children().children().children().siblings(".option");
    				var del_todo_id = $(".del_todo_name").val();
    						
    				var htmls="";
					
    				htmls +='<a class="delete" href="' + ${pageContext.request.contextPath }/todo/ + del_todo_id + '">수정</a>/'
    				htmls +='<a class="delete" href="' + ${pageContext.request.contextPath }/todo/ + del_todo_id + '">삭제</a>'

    			    $(tr).append(htmls);
    		});
    		
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
						    if (!confirm("삭제하시겠습니까?")) {
						        // 취소 버튼 클릭 시 이벤트
						    } else {
						        // 확인 버튼 클릭 시 이벤트
						    	$(tr).remove();
						    }
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
				
				var list = $(this).parent().parent().parent().children(".table").children().children(".del_todo_name");
				var category = $(this).parent().parent().parent();
				
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
						    if (!confirm("삭제하시겠습니까?")) {
						        // 취소 버튼 클릭 시 이벤트
						    } else {
						        // 확인 버튼 클릭 시 이벤트
						        $(list).remove();
						    	$(category).remove();
						    }	
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
					//$(this).parent().parent().parent().addClass("selected");
					$(this).parent().siblings(".del_todo_name").addClass("selected");
				} else {
					//$(this).parent().parent().parent().removeClass("selected");
					$(this).parent().siblings(".del_todo_name").removeClass("selected");
				} 
			}); 
		}); 
	</script>



</head>
<body>

<!-- 해더 -->
<%@ include file="/WEB-INF/views/includes/header.jsp"%>

<!-- 	<br />
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
	</div> -->

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


	<br /><br /><br />
	<div class="container">
		<div class="row">

			<div class="col-sm-3">
				<div class="jb-table">
					<div class="jb-table-row">
						<form id="addToDoTitle" action="/addTodoType" method="POST">
							<input type="hidden" class="getRecentTodoTypeId" value="${getRecentTodoTypeId }"> <input type="hidden" id="planner_id" value="${getPlannerId }">
							<div class="jb-table-cell">
								<p>
									카테고리를 입력하세요<input type="text" id="todo_title" placeholder="ex.전자기기">
								</p>
								<input type="submit" value="카테고리 만들기">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>



	<br />
	<br />
	<div class="todoTable container">
		<div class="row">
			<c:forEach items="${todoTitle }" var="todoTitle">
			<input id="here" type="hidden" class="todo_type_id" name="todo_type_id" value="${todoTitle.todo_type_id }" />
				<div class="col-sm-3">
					<div class="dropdown">
						<img src="resources/diary/dot.png" class="btn dropdown-toggle" data-toggle="dropdown" style='height: 20px;float: right;'/>
						<div class="dropdown-menu dropdown-menu-right">
							<a class="dropdown-item" href="javascript:void(0);" onclick="function makeOption();">수정</a>
							<a class="titleDelete dropdown-item" href="${pageContext.request.contextPath }/todoTitle/${todoTitle.todo_type_id}">삭제</a>
						</div>
					</div>

					<table class="table table-bordered">
						<tr>
							<td colspan="3">${todoTitle.todo_title } ${todoTitle.todo_type_id }</td>
						</tr>		
						<c:forEach var="todoName" items="${todoName }">
						<input class="del_todo_name" type="hidden" value="${todoName.todo_id }">
						<c:if test="${todoName.todo_type_id eq todoTitle.todo_type_id }">	
						<tr >
							<td>
								 <label class="checkbox-inline"><input type="checkbox" id="inlineCheckbox1" value="option1"></label> 
 								<!-- <div class="checkbox-container">

<input type="checkbox" id="is-subscription">

<label for="is-subscription"></label>

</div>  -->
							</td>
						
							<td >
								<p>${todoName.todo_name } ${todoTitle.todo_type_id }</p>
							</td>



							<!-- ajax로 delete 처리 -->
							<td class="option">
								<%-- <a class="delete" href="${pageContext.request.contextPath }/todo/${todoName.todo_id}">x</a> --%>
								<a></a>
							</td>
						</tr>
						</c:if>
						</c:forEach>
						<tr>
							<!-- form으로 insert 처리 -->
							<td colspan="3">
								<a class="makeForm" href="javascript:void(0);" onclick="function makeForm();">+ 체크리스트 추가</a>
							</td>

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

<!-- footer -->
<%@ include file="/WEB-INF/views/includes/footer.jsp"%>

</body>
</html>