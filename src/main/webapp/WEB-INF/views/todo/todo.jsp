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

<!-- form__group input box -->
<link rel="shortcut icon" type="image/x-icon" href="https://cpwebassets.codepen.io/assets/favicon/favicon-aec34940fbc1a6e787974dcd360f2c6b63348d4b1f4e06c77743096d55480f33.ico">
<link rel="mask-icon" type="" href="https://cpwebassets.codepen.io/assets/favicon/logo-pin-8f3771b1072e3c38bd662872f6b673a722f4b3ca2421637d5596661b4e2132cc.svg" color="#111">
<link rel="canonical" href="https://codepen.io/lucasyem/pen/ZEEYKdj">

<!-- submit button -->
<link rel="apple-touch-icon" type="image/png" href="https://cpwebassets.codepen.io/assets/favicon/apple-touch-icon-5ae1a0698dcc2402e9712f7d01ed509a57814f994c660df9f7a952f3060705ee.png">
<link rel="shortcut icon" type="image/x-icon" href="https://cpwebassets.codepen.io/assets/favicon/favicon-aec34940fbc1a6e787974dcd360f2c6b63348d4b1f4e06c77743096d55480f33.ico">
<link rel="mask-icon" type="" href="https://cpwebassets.codepen.io/assets/favicon/logo-pin-8f3771b1072e3c38bd662872f6b673a722f4b3ca2421637d5596661b4e2132cc.svg" color="#111">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
  
  <style>
  	img {
  		object-fit: cover;
  		max-width: 70px;
		max-height: 70px;
  	}
  	
  	.selected {
	  	text-decoration:line-through grey;
	  	font-weight:700;
	  	color:grey;

  	}
	
	dropdown {
		float : right;
	}
	
	.headline{
		font-family: 'GongGothicMedium';
		color:#1DCAD3;
		font-size:28pt;
		/* line */
		display: flex;
		flex-basis: 100%;
		align-items: center;
		margin: 8px 0px;
	}
	
	/* line */	
	.headline::after {
		content: "";
		flex-grow: 1;
		background: #1DCAD3;
		height: 1px;
		font-size: 0px;
		line-height: 0px;
		margin: 0px 16px;
	}
	
	.todoImg{
		width:43px;
		height:43px;
		float:left;
		margin:0 8px 3px 0;
	}
	
	.checkImg2{
		width:30px;
		height:30px;
		float:left;
		margin:0 8px 3px 0;
	}
	
	a:hover{
		text-decoration:none !important;
		color:#CFD2D3;
	}	
	
	.inputTitle, .todoList{
		font-family: 'Montserrat', sans-serif;
		font-weight:bold;
		font-size: 20pt;
		padding:0 15px;
		color:#303E57;
		/* line */
		display: flex;
		 /* flex-basis: 82%;  */
		 flex-basis: 600px;
		align-items: center;
		margin: 8px 0;
		
	}
	
	/* line */	
	.inputTitle::after, .todoList::after{
		content: "";
		flex-grow: 1;
		background: #1DCAD3;
		height: 1px;
		font-size: 0px;
		line-height: 0px;
		margin: 0px 16px;
	}
	
	.recommend1{
		font-family: 'GongGothicMedium';
		font-size: 20pt;
		padding:0 15px;
		color:#303E57;
		/* line */
		display: flex;
		 flex-basis: 82%; 
		/* flex-basis: 100px; */
		align-items: center;
		margin: 8px 0;		
	}
	
   	.introduce{
		color: #CFD2D3;
		font-family: 'IBMPlexSansKR-Light';
		font-weight:bold;
		margin:14px 0 14px -10px;
	}   

   	.introduce{
		display:block;
		float:right;
	}  
	
 	.introduction{
		font-family: 'GongGothicMedium';
		color: #CFD2D3;
	} 
	
	/* form__group input box */
    .form__group {
  position: relative;
  padding: 15px 0 0;
  margin-top: 10px;
  width: 50%;
}

.form__field {
  font-family: 'Montserrat', sans-serif;
  width: 100%;
  border: 0;
  border-bottom: 2px solid #1DCAD3;
  outline: 0;
  font-size: 1.3rem;
  color: #303E57;
  padding: 7px 0;
  background: transparent;
  transition: border-color 0.2s;
}
.form__field::placeholder {
  color: transparent;
}
.form__field:placeholder-shown ~ .form__label {
  font-size: 1.3rem;
  font-weight:bold;
  cursor: text;
  top: 20px;
}

.form__label {
  position: absolute;
  top: 0;
  display: block;
  transition: 0.2s;
  font-size: 1rem;
  color: #1DCAD3;
}

.form__field:focus {
  padding-bottom: 6px;
  font-weight: 700;
  border-width: 3px;
  border-image: linear-gradient(to right, #ff7473, #fff);
  border-image-slice: 1;
}
.form__field:focus ~ .form__label {
  position: absolute;
  top: 0;
  display: block;
  transition: 0.2s;
  font-size: 1rem;
  color: #ff7473;
  font-weight: 700;
}

/* reset input */
.form__field:required, .form__field:invalid {
  box-shadow: none;
}

/* submit button */
/* .wrapper{
  position: relative;
  width: 100%;
  height: 100%;
}

.wrapper input{
  font-family: 'Ubuntu', sans-serif;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  
  width: 170px;
  height: 40px;
  line-height: 1;
  font-size: 18px;
  font-weight: bold;
  letter-spacing: 1px;
  border: 3px solid #8C82FC;
  background: #fff;
  color: #8C82FC;
  border-radius: 40px;
  cursor: pointer;
  overflow: hidden;
  transition: all .35s;
}

.wrapper input:hover{
  background: #8C82FC;
  color: #fff;
}

.wrapper input span value{
  opacity: 1;
  visibility: visible;
  transition: all .35s;
}

.success{
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: #fff;
  border-radius: 50%;
  z-index: 1;
  opacity: 0;
  visibility: hidden;
  transition: all .35s;
}

.success svg{
  width: 20px;
  height: 20px;
  fill: yellowgreen;
  transform-origin: 50% 50%;
  transform: translateY(-50%) rotate(0deg) scale(0);
  transition: all .35s;
}

.wrapper input .is_active{
  width: 40px;
  height: 40px;
}

.wrapper input .is_active .success{
  opacity: 1;
  visibility: visible;
}

.wrapper input .is_active .success svg{
  margin-top: 50%;
  transform: translateY(-50%) rotate(720deg) scale(1);
}

.wrapper input .is_active span{
  opacity: 0;
  visibility: hidden;
} */

/* submit button */


.wrapper{
  position: relative;
  width: 100%;
  height: 100%;
}
.wrapper button{
  font-family: 'Ubuntu', sans-serif;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  
  width: 170px;
  height: 40px;
  line-height: 1;
  font-size: 18px;
  font-weight: bold;
  letter-spacing: 1px;
  border: 3px solid #8C82FC;
  background: #fff;
  color: #8C82FC;
  border-radius: 40px;
  cursor: pointer;
  overflow: hidden;
  transition: all .35s;
}

.wrapper button:hover{
  background: #8C82FC;
  color: #fff;
}

.wrapper button span{
  opacity: 1;
  visibility: visible;
  transition: all .35s;
}

.success{
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: #fff;
  border-radius: 50%;
  z-index: 1;
  opacity: 0;
  visibility: hidden;
  transition: all .35s;
}

.success svg{
  width: 20px;
  height: 20px;
  fill: yellowgreen;
  transform-origin: 50% 50%;
  transform: translateY(-50%) rotate(0deg) scale(0);
  transition: all .35s;
}

.wrapper button.is_active{
  width: 40px;
  height: 40px;
}

.wrapper button.is_active .success{
  opacity: 1;
  visibility: visible;
}

.wrapper button.is_active .success svg{
  margin-top: 50%;
  transform: translateY(-50%) rotate(720deg) scale(1);
}

.wrapper button.is_active span{
  opacity: 0;
  visibility: hidden;
}



  </style>
  
  <!-- form__group input box -->
  <script src="https://cpwebassets.codepen.io/assets/editor/iframe/iframeConsoleRunner-d8236034cc3508e70b0763f2575a8bb5850f9aea541206ce56704c013047d712.js"></script>
  <script src="https://cpwebassets.codepen.io/assets/editor/iframe/iframeRefreshCSS-4793b73c6332f7f14a9b6bba5d5e62748e9d1bd0b5c52d7af6376f3d1c625d7e.js"></script>
  <script src="https://cpwebassets.codepen.io/assets/editor/iframe/iframeRuntimeErrors-4f205f2c14e769b448bcf477de2938c681660d5038bc464e3700256713ebe261.js"></script>
  
  <script>
  	window.console = window.console || function(t) {};
  </script>
  
  <script>  
	  if (document.location.search.match(/type=embed/gi)) {
	    window.parent.postMessage("resize", "*");
	  }
  </script>
  
  <!-- submit button -->
<!--   <script>
 	 window.console = window.console || function(t) {};
  </script>
  
  <script>
	  if (document.location.search.match(/type=embed/gi)) {
	    window.parent.postMessage("resize", "*");
	  }
  </script> -->
  
  

 	<script type="text/javascript">
	  var token = $("meta[name='_csrf']").attr("content");
	  var header = $("meta[name='_csrf_header']").attr("content");
	  $(document).ajaxSend(function(e, xhr, options) { xhr.setRequestHeader(header, token); });
    </script>


<!--	<script>
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
    						//$(location).attr('href', '${pageContext.request.contextPath}/todo');
    						    location.reload();
    					}  
    				},
    				error : function(e){
    					console.log(e);
    				}
    				
    			}); // ajax end
    		}) // submit end
    	});
    </script> -->
    



	<script>
    	$(document).ready(function() {
    		$("#addToDoTitle").on('submit', function(event) {
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
    						//$(location).attr('href', '${pageContext.request.contextPath}/todo');
    						    location.reload();
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
    		$(".makeForm").one("click", function makeForm(event) {
    			console.log("makeForm");
    			
    				var tr = $(this).parent();
    			   // var todo_type_id = $(this).parent().parent().parent().parent().parent().parent().children("#here").attr("value");
        			//var todo_type_id = $("input[name=todo_type_id]").val();
        			var todo_type_id = $(this).attr("name");
    			    console.log(todo_type_id);
    						
    				var htmls="";

    			    htmls +='<form id="addToDo" method="POST">'
    			    htmls +='<input type="hidden" id="todo_type_id" name="todo_type_id" value="' + todo_type_id + '">'
    			    htmls +='<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }" />'
    			    htmls +='<input type="hidden" id="_csrf_header" name="_csrf_header" value="${_csrf.headerName}"/>'
    			    htmls +='<input type="text" id="todo_name" name="todo_name" placeholder="ex.카메라">'
    			    htmls +='<button onclick="function addToDo();">완료</button></form>'

    			    $(tr).append(htmls);
    		});
    	});
    </script>
    
    
    <script>
    		function addToDo() {
    			
    			console.log("addToDo submit");
    			
    			var tr = $(this).parent();
    			var todo_name = $("#todo_name").val();
    			var todo_type_id = $("#todo_type_id").val();
    			
    			var form = {
    					todo_name : todo_name,
    					todo_type_id : todo_type_id
    			};
				
				$.ajax({
    				type : "POST",
    				url : "",
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
    						
    						var htmls="";

						    htmls +='<tr><td><div class="label">'
							htmls +='<label class="checkbox-inline"><input type="checkbox" id="inlineCheckbox1" value="option1"></label>'
							htmls +='</div></td>'
							htmls +='<td ><p>' + todo_name + '</p></td>'
							htmls +='<td class="option">'
							htmls +='<input type="hidden" class="modi_todo_name" value="' + todo_type_id + '">'
							htmls +='</td></tr>'
							
			        	$(tr).append(htmls); 
    						
    					}
    				},
    				error : function(e){
    					console.log(e);
    				} 
    					
    			}); // ajax end
    		}
    	
    </script>
    
    
    
 <script>
       $(document).ready(function() {
          $(".listModify").one("click", function makeOption(event) {
             console.log("makeOption");

                //var tr = $(this).parent().parent().siblings(".table").children().children().children().siblings(".option");
                //var del_todo_id = $(".del_todo_name").val();
                
                
               var tr = $(this).parent().parent().parent().find(".option");
                /*var del_todo_name = $(this).parent().parent().parent().find(".del_todo_name").attr("value");
                //var del_todo_id = $(this).attr("value");
                var modi_todo_name = $(this).parent().parent().parent().find(".option").children().attr("value");
                //var modify_todo_name = $(this).siblings(".todoName").attr("value");
                //var modify_todo_name = $(this).siblings().children(".option").children().attr("value"); */
                      
                var htmls="";

                     
                //htmls +='<a class="modify" href="' + ${pageContext.request.contextPath }/todo/ + del_todo_id + '"><input type="hidden" class="todo_Name" value="' + modify_todo_name + '">수정</a>/'
                htmls +='<a class="modify">수정</a>/';      
                htmls +='<a class="delete">삭제</a>';
                
                $(tr).append(htmls)
                
                
                var del_todo_name = $("input[name=modi_todo_id]").;
               //var del_todo_name = document.getElementsByClassName("modi_todo_name").value;
                console.log(del_todo_name);
                $(".modify").attr("onclick",'window.open(\'${pageContext.request.contextPath}/todo_modify_view/' + del_todo_name + '\', \'popwin2\',\'width=300,height=200,left=300, top=120\')')
                /* $("img").attr("width", "500"); */
                console.log(del_todo_name);


                 
                
                //$(tr).toggle('slow');
          });      
          
       });
    </script>
    
    <script>
	function openwin() {
		window.open('about:blank','popwin',
		  'width=1250,height=800,toolbar=no, location=no, status=no, menubar=no, scrollbars=no, resizable=no, left=300, top=120');
  	document.formDate.submit();
	}//function end
</script>
    
    


	<script type="text/javascript">
		$(document).ready(function(){
			$(document).on("click", ".delete", function(event){		
				if (confirm("삭제하시겠습니까?")) {
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
							$(tr).remove();
						}
					},
					error : function(e){
						alert("오류가 발생했습니다.");
						console.log(e);
					}
				}); // ajax end
			}else{
				return false;
			}
			}); // event end
		}); // ready end
	</script>

	<script type="text/javascript">
		$(document).ready(function(){
			$(".titleDelete").click(function(event){			
				if (confirm("삭제하시겠습니까?")) {
				event.preventDefault();
				console.log("titleDelete click");
				
				var category = $(this).parent().parent().parent();
				var list = $(this).parent().parent().parent().find(".todoListTable");
				
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
							$(list).remove();
					    	$(category).remove();
						}
					},
					error : function(e){
						alert("오류가 발생했습니다.");
						console.log(e);
					}
				}); // ajax end
				
			}else{
				return false;
			}
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
					//$(this).parent().siblings(".del_todo_name").addClass("selected");
					$(this).parent().parent().parent().parent().children().children("p").addClass("selected");
				} else {
					//$(this).parent().parent().parent().removeClass("selected");
					//$(this).parent().siblings(".del_todo_name").removeClass("selected");
					$(this).parent().parent().parent().parent().children().children("p").removeClass("selected");
				} 
			}); 
		}); 
	</script>
	



</head>
<body>

<!-- Header -->
<%@ include file="/WEB-INF/views/includes/header.jsp"%>

	<br />
	<div class="container">
	<a class="headline" href="${pageContext.request.contextPath }/todo"><img class="todoImg" src="/resources/todo/checkImg.png">준비물</a><br />
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

	<br /><br />

 	<div class="container">
 	<span class="inputTitle"><img class="checkImg2" src="/resources/todo/checkImg2.png">CATEGORY</span><span class="introduce"> 카테고리 제목을 입력하세요!</span>
 	
		<%-- <span class="introduce"> "${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}"님만의 카테고리를 만들어보세요!</span> --%>
		<div class="row">
			<div class="col-sm-7">
				<div class="jb-table">
					<div class="jb-table-row">
						<form id="addToDoTitle" action="/addTodoType" method="POST">
							<input type="hidden" class="getRecentTodoTypeId" value="${getRecentTodoTypeId }"> <input type="hidden" id="planner_id" value="${getPlannerId }">
<!-- 							<div class="jb-table-cell"> <br />
						 		<p>
									<input type="text" id="todo_title" placeholder="ex.전자기기">
								</p>
								<input type="submit" value="카테고리 만들기">
							</div> -->
						
						<div class="form__group field">
						  <input type="text" id="todo_title" class="form__field" placeholder="ex.전자기기" name="name" required/>
						  <label for="todo_title" class="form__label">Make Category</label>
						</div>
						 <!-- <input type="submit" value="카테고리 만들기" style="float:right; margin:-30px 0 30px 0;"> -->
						 
<!-- <div class="wrapper">
	<input type="submit" class="is_active" value="Submit" style="float:right; margin:-20px 0 20px 100px;">
    <div class="success">
    <svg xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" viewBox="0 0 29.756 29.756" style="enable-background:new 0 0 29.756 29.756;" xml:space="preserve">
      
	<path d="M29.049,5.009L28.19,4.151c-0.943-0.945-2.488-0.945-3.434,0L10.172,18.737l-5.175-5.173   c-0.943-0.944-2.489-0.944-3.432,0.001l-0.858,0.857c-0.943,0.944-0.943,2.489,0,3.433l7.744,7.752   c0.944,0.943,2.489,0.943,3.433,0L29.049,8.442C29.991,7.498,29.991,5.953,29.049,5.009z"></path>
 	</svg>
    </div>
</div>
<script src="https://cpwebassets.codepen.io/assets/common/stopExecutionOnTimeout-157cd5b220a5c80d4ff8e0e70ac069bffd87a61252088146915e8726e5d9f147.js"></script>
<script id="rendered-js">
	let btn = document.querySelector("button");
	
	btn.addEventListener("click", active);
	
	function active() {
	  btn.classList.toggle("is_active");
	}
</script>		 -->

<div class="wrapper">
	
	<button class="" type="submit" style="float:right; margin:-20px 0 20px 100px;">
	<span id="submitValue">Submit</span>
    <div class="success">
    <svg xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" viewBox="0 0 29.756 29.756" style="enable-background:new 0 0 29.756 29.756;" xml:space="preserve">
      
	<path d="M29.049,5.009L28.19,4.151c-0.943-0.945-2.488-0.945-3.434,0L10.172,18.737l-5.175-5.173   c-0.943-0.944-2.489-0.944-3.432,0.001l-0.858,0.857c-0.943,0.944-0.943,2.489,0,3.433l7.744,7.752   c0.944,0.943,2.489,0.943,3.433,0L29.049,8.442C29.991,7.498,29.991,5.953,29.049,5.009z"></path>
 	</svg>
    </div>
    </button>
</div>
<script src="https://cpwebassets.codepen.io/assets/common/stopExecutionOnTimeout-157cd5b220a5c80d4ff8e0e70ac069bffd87a61252088146915e8726e5d9f147.js"></script>
<script id="rendered-js">
	let btn = document.querySelector(".wrapper button");
	
	btn.addEventListener("click", active);
	
/* 	function active() {
	if(#todo_title != ""){
		btn.classList.toggle("is_active");
	}else{
		btn.classList.toggle("");
	}
	  
	} */
	
	function active() {
		if(result == "SUCCESS"){
			btn.classList.toggle("is_active");
		}else{
			btn.classList.toggle("");
		}
		  
		}
</script>		 				 
						 
						 
						<!-- form__group input box -->
						<script src="https://cpwebassets.codepen.io/assets/common/stopExecutionOnTimeout-157cd5b220a5c80d4ff8e0e70ac069bffd87a61252088146915e8726e5d9f147.js"></script>
						<script src="https://cdpn.io/cp/internal/boomboom/pen.js?key=pen.js-26d5455c-a1ec-dcaa-7dc1-56eead3bc59d" crossorigin=""></script>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br />
	
<%-- 	<div class="container">
		
		<!-- &nbsp;&nbsp;<h4 style="font-family: 'yg-jalnan'">카테고리를 입력하세요</h4> -->
		
			
			<span class="inputTitle"><img class="checkImg2" src="/resources/todo/checkImg2.png">CATEGORY</span>
			<span class="introduction"> "${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}"님만의 카테고리를 만들어보세요!</span>
			<span class="introduce"><div >
						<form id="addToDoTitle" action="/addTodoType" method="POST">
						<input type="hidden" class="getRecentTodoTypeId" value="${getRecentTodoTypeId }"> <input type="hidden" id="planner_id" value="${getPlannerId }">
						
							
							
						 		
								<input type="text" id="todo_title" placeholder="ex.전자기기">
								
								<input type="submit" value="카테고리 만들기">
							
						</form>
			</div></span>
			
		
	</div>
	<br /> --%>
	
	

	
	<div class="todoTable container">
	<span class="todoList"><img class="checkImg2" src="/resources/todo/checkImg2.png">TODO LIST</span>
		<div class="row">
			<c:forEach items="${todoTitle }" var="todoTitle">
				<div class="col-sm-3">
					<div class="dropdown">
						<img src="resources/diary/dot.png" class="btn dropdown-toggle" data-toggle="dropdown" style='height: 20px;float: right;'/>	
						<div class="dropdown-menu dropdown-menu-right">
							<button class="listModify dropdown-item" >수정</button>
							<a class="titleDelete dropdown-item" href="${pageContext.request.contextPath }/todoTitle/${todoTitle.todo_type_id}">카테고리 삭제</a>
						</div>

					<table class="table table-bordered">
						<tr>
							<td colspan="3">${todoTitle.todo_title } ${todoTitle.todo_type_id }</td>
						</tr>	
							
						
						
						<c:forEach var="todoName" items="${todoName }">
						<input class="del_todo_name" type="hidden" name="del_todo_name" value="${todoName.todo_id }">
						<c:if test="${todoName.todo_type_id eq todoTitle.todo_type_id }">	

						<tr class="todoListTable">
							<td>
								<div class="label">
								 <label class="checkbox-inline"><input type="checkbox" id="inlineCheckbox1" value="option1"></label> 
 								</div>
							</td>
						
							<td>
								<p>${todoName.todo_name } ${todoName.todo_id }</p>
							</td>

							<!-- ajax로 delete 처리 -->
							<td class="option">
								 <input type="hidden" id="${todoName.todo_id }" name="todo_id" value="${todoName.todo_id }"> 	
								<%-- <a class="delete" href="${pageContext.request.contextPath }/todo/${todoName.todo_id}">x</a> --%>
							</td>
						</tr>
						
						</c:if>
						</c:forEach>
						
						<tr>
							<!-- form으로 insert 처리 -->
							<td colspan="3">
								<div class="container">
								<div class="row">
									<input type="button" class="makeForm btn-primary" name="${todoTitle.todo_type_id }" value="+ 체크리스트 추가" />
								</div>
								</div>
							</td>
						</tr>
						
					</table>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	
	
	




	<br /><br /><br /><br /><br /><br />
	<div class="container">
		<span class="recommend1"><img class="checkImg2" src="/resources/todo/checkImg2.png">혹시 잊어버린 물건은 없으신가요?</span>
		<hr style="border: solid 1px light-grey; width: 100%;">
		
		<div>다른 여행객들이 주로 챙기는 물품들</div>
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
		<span class="recommend1"><img class="checkImg2" src="/resources/todo/checkImg2.png">이 상품이 필요하진 않으신가요?</span>  
		<hr style="border: solid 1px light-grey; width: 100%;">
		<br />
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