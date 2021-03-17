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
  <script src="https://code.jquery.com/jquery-latest.js"></script> 

  <script>
		/* function showPopup() { window.open('${pageContext.request.contextPath}/test', "a","location=no", "width=700, height=600, left=100, top=50"); }
  */ 
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
  width: 600px;
  height: 600px;
  object-fit: cover;
}

  
  </style>
</head>
<body>
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
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
    </div>
<!--   </div> -->
		</c:forEach>
	</div>
	

	
	</div>
	 </form>
	 
	 

  
</body>
</html>