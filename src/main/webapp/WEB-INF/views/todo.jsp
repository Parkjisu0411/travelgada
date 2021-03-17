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
				<button type="button" class="btn btn-info btn-lg ">일정</button>
				<button type="button" class="btn btn-info btn-lg ">커뮤니티</button>
				<button type="button" class="btn btn-info btn-lg ">쇼핑</button>
				<button type="button" class="btn btn-info btn-lg ">검색</button>
		 	</div>
		</div> 
	</div>  -->

	<nav  class="navbar  navbar-expand-sm  bg-warning navbar-dark fixed-top"> 
	<!-- 로고 -->
	<a class="navbar-brand" href="#"><img src="logo.png" alt="Logo" style="width:80px;"></a>
		
	<!-- 메뉴 링크 -->	


	  <ul  class="navbar-nav"> 

	    <li  class="nav-item"> 
	      <a  class="nav-link"  href="#">일정</a> 
	    </li> 

	    <li class="nav-item"> 
	      <a class="nav-link" href="#">커뮤니티</a> 
	    </li>

	    <li class="nav-item"> 
	      <a class="nav-link" href="#">쇼핑</a> 
	    </li> 
	    
	   	<li class="nav-item"> 
	      <a class="nav-link" href="#">검색</a> 
	    </li> 

		<form class="form-inline" action="#">
			<input class="form-control" type="text" placeholder="검색어">
			<button class="btn btn-success" type="submit">찾기</button>
		</form>

		<li class="nav-item"> 
	      <a class="nav-link" href="#">로그인</a> 
	    </li> 
       
	  </ul>
	</nav>
	
	<br /><br /><br />
	<div class="container">
	<div class="row text-center" style="width: 100%;">
	<div style="width: 30%; float:none; margin:0 auto">
		  <div class="btn-group">
		    <button type="button" class="btn btn-warning">일정</button>
		    <button type="button" class="btn btn-warning">지도</button>
		    <button type="button" class="btn btn-warning">준비물</button>
		    <button type="button" class="btn btn-warning">다이어리</button>
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
	     d-day / 플래너 제목
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
			<!-- ajax로 delete 처리 -->
			<td><a href="#">x</a></td>
		</tr>
		
		<tr>
			<!-- ajax로 insert 처리 -->
			<td colspan="3"><a href="#">+ 체크리스트 추가</a></td>
		</tr>	
	</table>
	
	</div>
	</c:forEach>
	</div>
	</div>
	
	
	<br /><br /><br /><br /><br /><br />
	<div class="container">	
		<h3>혹시 잊어버린 물건은 없으신가요?</h3><br />
		<p>다른 여행객들이 주로 챙기는 물품들</p>
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
	<h3>이 상품이 필요하진 않으신가요?</h3>
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
         	<td>상품</td>
            <td>
                ${pdlist.product_name}
            </td>
         </tr>
         <tr class="table-light" style="text-align:center;">
         	<td>가격</td>
            <td>
                  ${pdlist.price} 원
            </td>
         </tr>
         <tr style="text-align:center;">
         	<td><a href="#">구매</a></td>
         	<!-- <td><a class="basket" href="#">장바구니</a></td> -->
         	
         	<td>
         	<div class="container">
         	<button type="button" class="btn btn-default btn-sm" data-toggle="modal" data-target="#myModal">장바구니</button>
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
			        <div class="modal-body">
			          장바구니로 이동하시겠습니까?
			        </div>
			        
			        <!-- Modal footer -->
			        <div class="modal-footer">
			          <button type="button" class="btn btn-default" data-dismiss="modal" onclick="location.href='#'">예</button>
			          <button type="button" class="btn btn-default" data-dismiss="modal">아니오</button>
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