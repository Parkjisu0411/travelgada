<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

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


</head>
<body>
<!--  	<div class="btn-group btn-group-lg">
		 <div class="row text-center" style="width: 100%">
			<div style="width: 30%; float:none; margin:0 auto"> 
				<button type="button" class="btn btn-info btn-lg ">����</button>
				<button type="button" class="btn btn-info btn-lg ">Ŀ�´�Ƽ</button>
				<button type="button" class="btn btn-info btn-lg ">����</button>
				<button type="button" class="btn btn-info btn-lg ">�˻�</button>
		 	</div>
		</div> 
	</div>  -->

	<nav  class="navbar  navbar-expand-sm  bg-warning navbar-dark fixed-top"> 
	<!-- �ΰ� -->
	<a class="navbar-brand" href="#"><img src="logo.png" alt="Logo" style="width:80px;"></a>
		
	<!-- �޴� ��ũ -->	


	  <ul  class="navbar-nav"> 

	    <li  class="nav-item"> 
	      <a  class="nav-link"  href="#">����</a> 
	    </li> 

	    <li class="nav-item"> 
	      <a class="nav-link" href="#">Ŀ�´�Ƽ</a> 
	    </li>

	    <li class="nav-item"> 
	      <a class="nav-link" href="#">����</a> 
	    </li> 
	    
	   	<li class="nav-item"> 
	      <a class="nav-link" href="#">�˻�</a> 
	    </li> 

		<form class="form-inline" action="#">
			<input class="form-control" type="text" placeholder="�˻���">
			<button class="btn btn-success" type="submit">ã��</button>
		</form>

		<li class="nav-item"> 
	      <a class="nav-link" href="#">�α���</a> 
	    </li> 
       
	  </ul>
	</nav>
	
	<br /><br /><br />
	<div class="container">
	<div class="row text-center" style="width: 100%;">
	<div style="width: 30%; float:none; margin:0 auto">
		  <div class="btn-group">
		    <button type="button" class="btn btn-warning">����</button>
		    <button type="button" class="btn btn-warning">����</button>
		    <button type="button" class="btn btn-warning">�غ�</button>
		    <button type="button" class="btn btn-warning">���̾</button>
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
	     d-day / �÷��� ����
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
	<c:forEach items="${todolist }" var="todo">
	<div class="col-sm-3">
	
    <table class="table table-bordered"  width="100%" cellspacing="0">
    	<tr>
			<td colspan="3">${todo.todo_title }</td>	
		</tr>

		<tr>
			<td>${todo.todo_name }</td>
			<%-- <td>${todo.complete_flag }</td> --%>		
			<td>
			<label class="checkbox-inline">
	 		 	<input type="checkbox" id="inlineCheckbox1" value="option1">
			</label>
			</td>
			<!-- ajax�� delete ó�� -->
			<td><a href="#">x</a></td>
		</tr>
		
		<tr>
			<!-- ajax�� insert ó�� -->
			<td colspan="3"><a href="#">+ üũ����Ʈ �߰�</a></td>
		</tr>	
	</table>
	
	</div>
	</c:forEach>
	</div>
	</div>
	
	
	<br /><br /><br /><br /><br /><br />
	<div class="container">	
		<h3>Ȥ�� �ؾ���� ������ �����Ű���?</h3><br />
		<p>�ٸ� ���ఴ���� �ַ� ì��� ��ǰ��</p>
		<ol>
			<li>��õ ����Ʈ 1</li>
			<li>��õ ����Ʈ 2</li>
			<li>��õ ����Ʈ 3</li>
			<li>��õ ����Ʈ 4</li>
			<li>��õ ����Ʈ 5</li>
		</ol>
	</div>
	
	
	<br /><br /><br /><br /><br /><br />
	<div class="container">
	<h3>�� ��ǰ�� �ʿ����� �����Ű���?</h3>
	<br /><br />
	<div class="row">
	<c:forEach items="${productList }" var="pdlist">
	<div class="col-sm-3">
	
    <table class="table table-borderless">
         <tr class="table-light">
            <td>
                <%-- <img width='100' src='${pdlist.img_path}'/> --%>
                <img class="pdImg" onload="randomImage()" width="100"/>
            </td>
         </tr> 
         <tr class="table-light" style="text-align:center;">
         	<td>��ǰ</td>
            <td>
                ${pdlist.product_name}
            </td>
         </tr>
         <tr class="table-light" style="text-align:center;">
         	<td>����</td>
            <td>
                  ${pdlist.price} ��
            </td>
         </tr>
         <tr style="text-align:center;">
         	<td><a href="#">����</a></td>
         	<!-- <td><a class="basket" href="#">��ٱ���</a></td> -->
         	
         	<td>
         	<div class="container">
         	<button type="button" class="btn btn-default btn-sm" data-toggle="modal" data-target="#myModal">��ٱ���</button>
         	  <!-- The Modal -->
			  <div class="modal" id="myModal">
			    <div class="modal-dialog">
			      <div class="modal-content">
			      
			        <!-- Modal Header -->
			        <div class="modal-header">
			          <h4 class="modal-title">��ǰ�� ��ٱ��Ͽ� �����ϴ�.</h4>
			          <button type="button" class="close" data-dismiss="modal"></button>
			        </div>
			        
			        <!-- Modal body -->
			        <div class="modal-body">
			          ��ٱ��Ϸ� �̵��Ͻðڽ��ϱ�?
			        </div>
			        
			        <!-- Modal footer -->
			        <div class="modal-footer">
			          <button type="button" class="btn btn-default" data-dismiss="modal" onclick="location.href='#'">��</button>
			          <button type="button" class="btn btn-default" data-dismiss="modal">�ƴϿ�</button>
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
</body>
</html>