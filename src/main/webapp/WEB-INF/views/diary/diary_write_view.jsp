<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���̾</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</head>
<body>
<!-- 
1.���� ������ ���� ������ �ϳ� �־�� �մϴ�.
2.�÷��� �̸��� ������ �;� �Ѵ�. 
3.�׷����� ������ ��� �Ǿ�� �ұ��???
���̾ �̸��� �����;� �ϴµ� �ű⼭

���̾ �ۼ� ��ư �ϳ� �־�� �ϰ� 
ǥ�� �� �������� �װ��� �־�� �ϰ�  -->
<!-- 	private int diary_id;
	private String img_path;
	private String text;
	private String hashtag;
	private Timestamp diary_date;
	private int planner_id;     -->

<div class="container">
  <h2 class="text-warning">Diary</h2>
  
  		<select name="planner_id">
			<c:forEach var="id" items="${diary}">
				<option value='${id.planner_id}'>${id.planner_id}</option>
			</c:forEach>
		</select><br/>
		<button type="button" class="btn">���̾ �ۼ�</button>
  <div class="row">
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