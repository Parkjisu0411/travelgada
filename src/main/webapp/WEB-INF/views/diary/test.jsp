<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>달력</title>

  <link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/jquery-date-range-picker/0.21.1/daterangepicker.min.css"
    integrity="sha512-nmvKZG8E3dANbZAsJXpdK6IqpfEXbPNbpe3M3Us1qTipq74IpTRShbpCf8lJFapB7e0MkDbNDKxLjS1VWt2vVg=="
    crossorigin="anonymous" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-date-range-picker/0.21.1/jquery.daterangepicker.min.js"
    integrity="sha512-jM36zj/2doNDqDlSIJ+OAslGvZXkT+HrtMM+MMgVxCqax1AIm1XAfLuUFP7uMSavUxow+z/T2CRnSu7PDaYu2A=="
    crossorigin="anonymous"></script>
	
	
	<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@700;800&display=swap"
	rel="stylesheet">
	

<link rel="stylesheet" href="${contextPath}/resources/css/font.css">
<link rel="stylesheet" href="${contextPath}/resources/css/header.css">
<link rel="stylesheet" href="${contextPath}/resources/css/footer.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

 
<!--     <script>
    
	$(document).ready(function(){
    var content = $(".text").val();
    var splitedArray = content.split(' ');
    var linkedContent = '';
    var array = content.split('#');
    for(var word in splitedArray)
    {
      word = splitedArray[word];
       if(word.indexOf('#') == 0)
       {
          word = '<a href='+word+'>'+word+'</a>';
       }
       linkedContent += word+' ';
    }
    /* document.getElementById('contentElement').innerHTML = linkedContent;  */
    
    $(".result").append(linkedContent); 
	});
    </script> -->
    
        <script>
    
	$(document).ready(function(){
    var content = $(".text").val();
    var splitedArray = content.split(' ');
    var linkedContent = '';
    var array = content.split('#');
    for(var word in splitedArray)
    {
      word = splitedArray[word];
       if(word.indexOf('#') == 0)
       { var word2 = word.substr(1);
          word = '<a href='+word2+'>'+word+'</a>';
       }
       linkedContent += word+' ';
    }
    /* document.getElementById('contentElement').innerHTML = linkedContent;  */
    
    $(".result").append(linkedContent); 
	});
    </script>
    

	
</head>
<body>

<div id="contentElement">

<%--   동해물과 백두산이 #마르고 닳도록
  #안녕
  <div> #</div>
  <div> #바르셀로나</div>
  
  <c:forEach begin="1" end="5">
  	<div> #바르셀로나</div>
  </c:forEach> --%>
  
<!--   <div> #</div>
  #전체 문장 -->
  
  <c:forEach begin="1" end="5">
  <input class="text" type="hidden" value="#하늘  #별  #달 ">
  <span class= "result"></span>
  </c:forEach>
  
<!-- <div>#사랑</div> -->  
</div>
	


</body>
</html>