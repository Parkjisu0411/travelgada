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

</head>
<body>
<!-- 
1.디데이 가지고 오는 쿼리문 하나 있어야 합니다.
2.플래너 이름을 가지고 와야 한다. 
3.그럴려면 쿼리가 어떻게 되어야 할까나요???
다이어리 이름을 가져와야 하는데 거기서

다이어리 작성 버튼 하나 있어야 하고 
표를 한 페이지에 네개씩 넣어야 하고  -->
<!-- 	private int diary_id;
	private String img_path;
	private String text;
	private String hashtag;
	private Timestamp diary_date;
	private int planner_id;     -->

<div class="container">
  <h2 class="text-warning">Diary</h2>
  <div class="row">
  <div class="col-sm-10"> 
  		<select class="form-control" name="planner_id">
			<c:forEach var="id" items="${diary}">
				<option value='${id.planner_id}'>${id.planner_id}</option>
			</c:forEach>
		</select>
		</div>
		  <div class="col-sm-2">
		<button class="form-control" type="button" class="btn btn-outline-warning bg-warning text-white" onclick="location.href='${pageContext.request.contextPath}/diary_write_view'">다이어리 작성</button>
    </div>
  <c:forEach items="${diary}" var="dto">
   <div class="col-sm-3"> 
  <table class="table table-borderless">
			<tr>
      			<td>
      				<img width='100' src='${dto.img_path}'/>
				</td>
			</tr> 
			<tr>
      			<td>
      				${dto.diary_date}
				</td>
			</tr>
			<tr>
      			<td>
      				${dto.hashtag}
				</td>
			</tr>
			</table>
			</div> 
		</c:forEach>
	</div>
	</div>
</body>
</html>