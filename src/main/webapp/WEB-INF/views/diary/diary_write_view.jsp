<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>다이어리</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- 	private int diary_id;
	private String img_path;
	private String text;
	private String hashtag;
	private Timestamp diary_date;
	private int planner_id;     -->

</head>
<body>
<form action="${pageContext.request.contextPath}/diary_write" method="post">
<input type="hidden" id="_csrf" name="_csrf" value="${_csrf.token}"/>
<input type="hidden" id="_csrf_header" name="_csrf_header" value="${_csrf.headerName}"/>
<input type="hidden" name="planner_id" value="${planner.planner_id}"/>

<div class="container">
  <h2 class="text-warning">Diary</h2>
  <div class="row">

   <div class="col-sm-3"> 
   <p>${planner.planner_id}</p>
 <table class="table table-borderless">
			<tr>
      			<td rowspan='5'>
      				<img width='100' src='https://github.com/tjaqpfflsk/hello/blob/main/%EC%97%AC%ED%96%891.png?raw=true'/>
				</td>
				<td>
<!--      <div class="form-group"> -->
      <input type="file" class="form-control-file border" name="img_path">
<!--     </div>  -->
				</td>
			</tr> 
			<tr>
				<td>
      				<textarea rows= "10" cols="50" name="hashtag"/></textarea>
				</td>
			</tr>
			<tr>
      			<td>
      				<h4>Tag</h4>
				</td>
			</tr>
			<tr>
			<td>
      		<textarea rows= "1" cols="30" name="text"/></textarea>
			</td>
			</tr>
			<tr>
			<td>
			<input type="submit" value="작성">
			</td>
			</tr>
			</table>
			</div> 
	</div>
	</div>
</form>
	
</body>
</html>