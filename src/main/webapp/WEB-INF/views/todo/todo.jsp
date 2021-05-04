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

<link rel="shortcut icon" type="image/x-icon" href="/resources/img/main/logo.png">
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
<link rel="stylesheet" href="${contextPath}/resources/css/utils.css">

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

	.titleDelete:hover {
		cursor: pointer;
	}
  
	.delete-btn {
		color: #A2A2A2;
	}
  
	.delete-btn:hover {
		cursor: pointer;
	}
  
	.option {
		vertical-align: middle !important;
		text-align: right;
	}
	
	td {
		vertical-align: middle !important;s
	}
  
  	/* 드래그 */
	::selection {
		background-color: #1DCAD3;
		color: white;
	}  
  
  	.makeForm{
  		border:none;
  		border-radius: 15px;
  		width: 20px;
  		height: 20px;
  		margin: 1px 0 0 5px;
  		background:white;
  	}
  	
  	#todo_name{
  		border:2px solid #1DCAD3;
  		border-radius:5px;
  		margin: 30px 0 3px -20px;
  		width:170px;
  		height:30px;
  	}
  	
  	#todo_name_button{
  		font-family: 'IBMPlexSansKR-Light';
  		font-weight:bold;
  		color:white;
  		border:2px solid white;
  		border-radius:5px;
  		height:30px;
  		margin: 0 0 0 6px;
  		padding: 8px 6px 21px 6px;
  		background:#1DCAD3;
  		text-align:center;
  		line-height:100%;
  	}
  	
  	.dropdown > img{
  		object-fit: cover;
 		width:45px;
  		float: right;
  	}
  
  	img {
  		object-fit: cover;
  		max-width: 70px;
		max-height: 70px;
  	}
  	
  	.selected {
	  	text-decoration:line-through #ff7473;
	  	font-weight:bold;
	  	color:#ff7473;

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
	
	.headline2{
		font-family: 'Montserrat', sans-serif;
		color:#1DCAD3;
		font-size:23pt;
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
		color:#ccf3f3;
		transition:1s;
	}	
	
	.inputTitle, .todoList{
		font-family: 'Montserrat', sans-serif;
		font-weight:bold;
		font-size: 20pt;
		padding:0 15px;
		color:#303E57;
		/* line */
		display: flex;
		flex-basis: 100%;
		align-items: center;
		margin: 8px 0;
	}
	
	.introduce{
		font-family: 'IBMPlexSansKR-Light';
		font-weight:bold;
		font-size: 13pt;
		padding:0 15px;
		color:#CFD2D3;
		/* line */
		display: flex;
		flex-basis: 100%;
		align-items: center;
		margin: 8px 0;	
	}
	
	.name{
		color:#65dae0;
		font-size:15pt;
	}
	
	/* line */	
	.inputTitle::after, .todoList::after, .introduce::before{
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
	

	
/* form__group input box */
    .form__group {
	  position: relative;
	  padding: 15px 0 0;
	  margin-top: 10px;
	  width: 50%;
	}

.form__field {
  font-family: 'Montserrat', sans-serif;
  width: 400px;
  border: 0;
  border-bottom: 2px solid #CFD2D3;
  outline: 0;
  font-size: 1.3rem;
  color: #3d464b;
  padding: 7px 0;
  margin: 8px 0 0 0;
  background: transparent;
  transition: border-color 0.2s;
}
.form__field::placeholder {
  color: transparent;
}
.form__field:placeholder-shown ~ .form__label {
  font-size: 1.1rem;
  font-weight:bold;
  color: #3d464b;
  cursor: text;
  top: 28px;
}

.form__label {
  position: absolute;
  top: 0;
  display: block;
  transition: 0.2s;
  font-size: 1rem;
  color: #CFD2D3;
  margin: 0 0 0 6px;
  font-family: 'IBMPlexSansKR-Light';
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

#addToDoTitle{
	margin: 0 0 0 25px;
}


/* submit button */
.wrapper{
  position: relative;
  width: 100%;
  height: 100%;
}
.wrapper button{
  font-family: 'IBMPlexSansKR-Light';
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  
  width: 40px;
  height: 40px;
  line-height: 1;
  font-size: 13px;
  font-weight: bold;
  letter-spacing: 1px;
  /* border: 3px solid #8C82FC;  */
  border:none;
  background: #fff;
  color: #CFD2D3;
  border-radius: 50px;
  cursor: pointer;
  overflow: hidden;
  transition: all .35s;
  
  float:right; 
  margin:-17px 0 17px 130px;
}

.wrapper button:hover{
  /* background: #CFD2D3; */
  background:#dcf8fa;
  color: #fff;
}

#submitBT:focus{
	border:0;
	outline:none;
}

.sendImg{
	width:27px;
	height:27px;
	padding:0 2px 0 0;
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
  /* fill: yellowgreen; */
  fill:#ff7473;
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

/* table */

#TB tr{
	border:1px solid #65dae0;
}

#TB td{
	border-bottom:1px solid #dcf8fa;
}

table{
	border-radius:15px;
	border-collapse:collapse;
	overflow:hidden;
}

.TBcategory{
	background-color: #65dae0;
	font-family: 'IBMPlexSansKR-Light';
	font-weight:bold;
	font-size: 18px;
	color:white;
}

.label{
	padding:0 -50px 0 0;
}

.TBtitle{
	padding:0 0 0 10px;
}

.checkbox-inline{
	padding:11px 0 0 20px;
}

.td1{
	width:20px;
}

.option input{
	background-color:#1dc9d3;
}

.TBname{
	padding:9px 0 0 0;
}

.todoListTable{
	font-family: 'IBMPlexSansKR-Light';
	font-weight:bold;
}

.insert-todo-area{
	background-color: #ccf3f3;
}

.insert-todo-area > td {
	border-left:1px solid #ccf3f3;
	border-right:1px solid #ccf3f3;
	border-bottom:1px solid #ccf3f3;
	border-top:1px solid #ccf3f3;
}

/* checkbox */
.custom-control-input-green:focus~.custom-control-label::before {
  border-color: #28a745 !important;
  box-shadow: 0 0 0 0.2rem rgba(40, 167, 69, 0.25) !important;
}

.custom-control-input-green:checked~.custom-control-label::before {
  border-color: #28a745 !important;
  background-color: #28a745 !important;
}

.custom-control-input-green:focus:not(:checked)~.custom-control-label::before {
  border-color: #5bd778 !important;
}

.custom-control-input-green:not(:disabled):active~.custom-control-label::before {
  background-color: #d6f5dd !important;
  border-color: #d6f5dd !important;
}



  </style>
  
  <!-- form__group input box -->
  <script src="https://cpwebassets.codepen.io/assets/editor/iframe/iframeConsoleRunner-d8236034cc3508e70b0763f2575a8bb5850f9aea541206ce56704c013047d712.js"></script>
  <script src="https://cpwebassets.codepen.io/assets/editor/iframe/iframeRefreshCSS-4793b73c6332f7f14a9b6bba5d5e62748e9d1bd0b5c52d7af6376f3d1c625d7e.js"></script>
  <script src="https://cpwebassets.codepen.io/assets/editor/iframe/iframeRuntimeErrors-4f205f2c14e769b448bcf477de2938c681660d5038bc464e3700256713ebe261.js"></script>

 	<script>
		$(document).ready(function() {
			$("input:checkbox").on('click', function() {
				if ( $(this).prop('checked') ) {
					$(this).parent().parent().parent().parent().children().children("span").addClass("selected");
					//$(".TBtodoName").find("p").addClass("selected");
				} else {
					$(this).parent().parent().parent().parent().children().children("span").removeClass("selected");
					//$(".TBtodoName").find("p").removeClass("selected");
				} 
			}); 
		}); 
	</script>
	
	<script type="text/javascript">
		function deleteTodo(todo_id) {
			$.ajax({
				type : "DELETE",
				url : "todo/" + todo_id,
				cache : false,
				beforeSend : function(xhr){
	  	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				},
				success : function(result){
					$("#" + todo_id).remove();
				},
				error : function(e){
					console.log(e);
				}
			})
		}
		
		function modifyTodo(todo_id) {
			var content = "";
			content += "<input type='text' class='form-control' id='modify-todo-form' value='" + $("#" + todo_id + " .TBname").text() + "' />";
			console.log(content);
			$("#" + todo_id + " .TBtodoName").append(content);
			$("#" + todo_id + " .TBname").css("display", "none");
			
			$("#modify-todo-form").focus();
			$("#modify-todo-form").blur(function() {
				$("#modify-todo-form").remove();
				$("#" + todo_id + " .TBname").css("display", "");
			})
			$("#modify-todo-form").keydown(function(key) {
				if(key.keyCode == 13) {
					if(!$("#modify-todo-form").val()) {
						$("#modify-todo-form").blur();
						return;
					}
					var data = {
						todo_id : todo_id,
						todo_name : $("#modify-todo-form").val()
					};
					console.log(data);
					$.ajax({
						type : "PUT",
						url : "/todo/" + todo_id,
						cache : false,
						data : JSON.stringify(data),
						contentType : 'application/json',
						beforeSend : function(xhr){
			  	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
						},
						success : function(result){
							$("#" + todo_id + " .TBname").html($("#modify-todo-form").val());
							$("#modify-todo-form").remove();
							$("#" + todo_id + " .TBname").css("display", "");
						},
						error : function(e){
							console.log(e);
						}
					})
					
				}
			})
		}
		
		function insertTodo(todo_type_id) {
			var content = "";
			content += "<td colspan='2' class='insert-todo-form'>";
			content += "<input type='text' class='form-control' placeholder='준비물을 입력하세요.' name='todo_name' />";
			content += "</td>";
			content += "<td class='insert-todo-form'>";
			content += "<button type='button' class='gada-btn-reverse' onclick='submitTodo(" + todo_type_id + ")'>저장</button>";
			content += "</td>";
			
			$("#" + todo_type_id + " .insert-todo-area").append(content);
			$("#" + todo_type_id + " .addCK").css("display", "none");
			$("#" + todo_type_id + " input[name=todo_name]").focus();
			
		}
		
		function submitTodo(todo_type_id) {
			if(!$("#" + todo_type_id + " input[name=todo_name]").val()) {
				$("#" + todo_type_id + " input[name=todo_name]").focus();
				return;
			}
			var data = {
				todo_name : $("#" + todo_type_id + " input[name=todo_name]").val(),
				todo_type_id : todo_type_id
			};
			
			console.log(data);
			$.ajax({
				type : "POST",
				url : "todo",
				data : JSON.stringify(data),
				contentType : "application/json",
				cache : false,
				beforeSend : function(xhr){
	  	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				},
				success : function(result){
					console.log("SUCCESS");
					var content = "";
					content += "<tr class='todoListTable' id='" + result.todo_id + "'>"
					content += "<td class='td1'>";
					content += "	<div class='label'>";
					content += "		<label class='checkbox-inline'>";
					content += "			<input type='checkbox' name='input_check' value='1' />";
					content += "			<input type='hidden' name='input-check' value='0' />";
					content += "		</label>";
					content += "	</div>";
					content += "</td>";
					content += "<td class='TBtodoName'>";
					content += "	<span class='TBname' onclick='modifyTodo(" + result.todo_id + ")'>" + result.todo_name + "</span>";
					content += "</td>";
					content += "<td class='option'>";
					content += "	<span class='delete-btn' onclick='deleteTodo(" + result.todo_id + ")'><i class='far fa-trash-alt'></i></span>";
					content += "</td>";
					content += "</tr>"
					$("#" + todo_type_id + " .insert-todo-area").before(content);
					$("#" + todo_type_id + " .insert-todo-form").remove();
					$("#" + todo_type_id + " .addCK").css("display", "");
				},
				error : function(e){
					console.log(e);
				}
			})
		}
		
		function deleteTodoTitle(todo_type_id) {
			
			if(confirm("주의!\n준비물이 모두 삭제됩니다.\n카테고리를 삭제하시겠습니까?")) {
				$.ajax({
					type : "DELETE",
					url : "todoTitle/" + todo_type_id,
					cache : false,
					beforeSend : function(xhr){
		  	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
					},
					success : function(result){
						$("#" + todo_type_id).remove();
					},
					error : function(e){
						console.log(e);
					}
				})
			}
		}
		
		function insertTodoType() {
			console.log("카테고리생성")
			if(!$("#todo_title").val()) {
				$("#todo_title").focus();
				return;
			}
			var data = {
				planner_id : ${planner.planner_id},
				todo_title : $("#todo_title").val()
			};
			console.log(data);
			$.ajax({
				type : "POST",
				url : "/todoTitle",
				cache : false,
				data : JSON.stringify(data),
				contentType : 'application/json',
				beforeSend : function(xhr){
	  	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				},
				success : function(result){
					var content = "";
					content += "<div class='col-sm-3' id='" + result.todo_type_id + "'>";
					content += "	<div class='dropdown'>";
					content += "		<img src='resources/todo/dot.png' class='btn dropdown-toggle' data-toggle='dropdown' />";
					content += "		<div class='dropdown-menu dropdown-menu-right'>";
					content += "			<a class='titleDelete dropdown-item' onclick='deleteTodoTitle(" + result.todo_type_id + ")'>카테고리 삭제</a>";
					content += "		</div>";
					content += "	</div>";
					content += "	<table class='table' id='TB'>";
					content += "		<tr>";
					content += "			<td colspan='3' class='TBcategory'><span class='TBtitle'>" + result.todo_title + "</span></td>";
					content += "		</tr>";
					content += "	<tr class='insert-todo-area'>";
					content += "		<td class='addCK' colspan='3'>";
					content += "			<div class='container'>";
					content += "				<div class='row'>";
					content += "					<input type='image' class='makeForm' onclick='insertTodo(" + result.todo_type_id + ")' src='resources/todo/plus.png' />";
					content += "				</div>";
					content += "			</div>";
					content += "		</td>";
					content += "	</tr>";
					content += "	</table>";
					content += "</div>";
					
					$("#divRow").append(content);
					$("#todo_title").val("");
				},
				error : function(e){
					console.log(e);
				}
			})
		}
		
	</script>
</head>
<body>

<!-- Header -->
<%@ include file="/WEB-INF/views/includes/header.jsp"%>

	<br />
	<div class="container">
	<a class="headline" href="${pageContext.request.contextPath }/todo"><img class="todoImg" src="/resources/todo/checkImg.png">준비물&nbsp;&nbsp;<span class="headline2">Todo List</span></a><br />
	</div><br />


 	<div class="container">
 	<div class="inputTitle"><img class="checkImg2" src="/resources/todo/checkImg2.png">CATEGORY<span class="introduce"><span class="name">${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}</span>&nbsp;님 만의 카테고리를 만들어보세요!</span></div>
 	
		<div class="row">
			<div class="col-sm-7">
				<div class="jb-table">
					<div class="jb-table-row">
						<form id="addToDoTitle" action="/addTodoType" method="POST">
						<br />
						<div class="form__group field">
						  <input type="text" id="todo_title" class="form__field" placeholder=" " name="name" required/>
						  <label for="todo_title" class="form__label">카테고리 제목을 입력해주세요!</label>
						</div>
						 
						<!-- submit button -->
						<div class="wrapper">
							<button type="button" id="submitBT" onclick="insertTodoType()">
								<span><img class="sendImg" src="/resources/todo/send.png"></span>
						    </button>
						</div><br /><br />
						
						<!-- submit button -->
						<script src="https://cpwebassets.codepen.io/assets/common/stopExecutionOnTimeout-157cd5b220a5c80d4ff8e0e70ac069bffd87a61252088146915e8726e5d9f147.js"></script>
						 
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

	
	<div class="todoTable container">
	<span class="todoList"><img class="checkImg2" src="/resources/todo/checkImg2.png">TODO LIST</span><br />
		<div class="row" id="divRow">
			<c:forEach items="${todoTypeList }" var="todoType">
				<div class="col-sm-3" id="${todoType.todo_type_id }">
					<div class="dropdown">
						<img src="resources/todo/dot.png" class="btn dropdown-toggle" data-toggle="dropdown" />
						<div class="dropdown-menu dropdown-menu-right">
							<a class="titleDelete dropdown-item" onclick="deleteTodoTitle(${todoType.todo_type_id})">카테고리 삭제</a>
						</div>
					</div>
					<table id="TB" class="table">
						<tr>
							<td colspan="3" class="TBcategory"><span class="TBtitle">${todoType.todo_title }</span></td>
						</tr>
						<c:forEach items="${todoType.todo }" var="todo">
							<tr class="todoListTable" id="${todo.todo_id }">
								<td class="td1">
									<div class="label">
										<label class="checkbox-inline">
											<input type="checkbox" name="input_check" id="inlineCheckbox1" value='1'>
										 	<input type="hidden" name="input_check" id="input_check_hidden" value='0'/>
										</label>
									</div>
								</td>
								<td class="TBtodoName">
									<span class="TBname" onclick="modifyTodo(${todo.todo_id})">${todo.todo_name }</span>
								</td>
								<td class="option">
									<span class="delete-btn"  onclick="deleteTodo(${todo.todo_id})"><i class="far fa-trash-alt"></i></span>
								</td>
							</tr>
						</c:forEach>
						<tr class="insert-todo-area">
							<td class="addCK" colspan="3">
								<div class="container">
									<div class="row">
										<input type="image" class="makeForm" onclick="insertTodo(${todoType.todo_type_id})" src="resources/todo/plus.png" />
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