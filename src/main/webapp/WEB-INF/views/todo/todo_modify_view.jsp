<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>

<title>TODO</title>

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
 	
 	<link rel="stylesheet" href="${contextPath}/resources/css/font.css">
	
	<script type="text/javascript">
	  var token = $("meta[name='_csrf']").attr("content");
	  var header = $("meta[name='_csrf_header']").attr("content");
	  $(document).ajaxSend(function(e, xhr, options) { xhr.setRequestHeader(header, token); });
    </script>
    
<script type="text/javascript">
$(document).ready(function(){
	$("#submitBtn").on("click",function(){
	
	  	 window.opener.name = "parentPage";
		  document.myForm.target = "parentPage"; 
		  
		  $("#formDate").submit();
		  self.close();

	});
});

</script>

	<style>
  table {
    margin-left:60px;
  }
</style>

<script type="text/javascript">
	$(document).ready(function(){
		$(document).submit("submit", "#submitBtn",function(event){
			event.preventDefault();
			console.log("modify click");
			
			var todo_id = $("#todo_id").val(); 
			var todo_name = $("#todo_name").val(); 
			
			var form = {
				todo_id : todo_id,
				todo_name : todo_name
			}
			
			$.ajax({
				type : "PUT",
				url : $(this).attr("action"),
				cache : false,
				data : JSON.stringify(form),
				contentType : 'application/json; charset=utf-8',
				success : function(result){
					if(result == "SUCCESS"){
						console.log("result : " + result );
						location.reload();
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
	
</head>
<body>
<form id='formDate' name="myForm" action="${pageContext.request.contextPath}/todo?${todo_view.todo_id}">
<input type="hidden" id="todo_id" value="${todo_view.todo_id }">
<input type="hidden" id="_csrf" name="_csrf" value="${_csrf.token}"/>
<input type="hidden" id="_csrf_header" name="_csrf_header" value="${_csrf.headerName}"/>

<div class="container">
<br>
  <div class="row">

   <div class="col-sm-3"> 
   
   <textarea rows= "10" cols="50" name="todo_name">${todo_view.todo_name}</textarea>
   <input type="button" style="font-family: 'yg-jalnan'" id="submitBtn" value="작성">
 
	</div> 
	</div>
	</div>
</form>
	
</body>
</html>