<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>

<title>달력</title>

	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/jquery-date-range-picker/0.21.1/daterangepicker.min.css"
		integrity="sha512-nmvKZG8E3dANbZAsJXpdK6IqpfEXbPNbpe3M3Us1qTipq74IpTRShbpCf8lJFapB7e0MkDbNDKxLjS1VWt2vVg=="
		crossorigin="anonymous" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-date-range-picker/0.21.1/jquery.daterangepicker.min.js"
    	integrity="sha512-jM36zj/2doNDqDlSIJ+OAslGvZXkT+HrtMM+MMgVxCqax1AIm1XAfLuUFP7uMSavUxow+z/T2CRnSu7PDaYu2A=="
    	crossorigin="anonymous"></script>
	
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<!-- <script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 -->	<script
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

	<!-- 달력 부분 -->
	<link href="resources/calendar/datepicker/daterangepicker.css" rel="stylesheet" media="all">
    <link href="resources/calendar/css/datepicker2.css" rel="stylesheet" media="all">

<style>
/* 달력 생성 모달 */
	/* 달력 아이콘 */
	#calImg {
		position: fixed;
		right: 20px;
		width: 25px;
		height: 30px;
	}

	/* 모달 스타일 */
	.modalInput{
        margin-left: 20px;
    }

	.modal_input-style{
		border: none;
		font-size: 15px;
		background-color: rgb(238, 237, 237);
		outline: none;
		height: 40px;
		width: 270px;
		border-radius: 15px;
		padding-left: 20px;
	}

	.modal-submit{
		border: none;
		height: 40px;
		width: 270px;
		border-radius: 15px;
		background-color: rgb(211, 211, 211);
	}

	.modalLabel{
		margin:15px 10px 10px 10px;			
		font-size: 12px;
		color: black;
		display: block;
		height: 10px;
		font-weight: bold;
	}
            
	/* 모달 배경 투명 */
	.modal-backdrop {
		background-color: rgba(0,0,0,.0001) !important;
	}
	
	.modal-dialog2{
		position: fixed;
		top:60px;
		right: 60px;
		width:310px;
	}

/* 모달 스타일 end */
</style>

<style>
/* 다이어리 이미지 */
.diary_img {
	width: 240px;
	height: 240px;
	object-fit: cover;
	display: block;
	margin: 0px auto;
	padding-bottom: 20px;
}
</style>

<style>
/* 모달 스타일 */
	.dialogDi{
    	width : 300px;
   	 	height : 50px;
    	float: left;
    	margin-left: 30px;
    	margin-botton: 10px;
	}

	.mainImg{
	    float: left;
	}
	
</style>

<script>
/* 플래너 생성 경고 */
	$(document).ready(function(){
		$(".modal-submit").click(function(){
			if($("#planner_name").val().length==0){
				alert("플래너 이름을 입력하세요!");
				$("#planner_name").focus();
				return false;
			}//if end
			if($("#input-start").val().length==0){
				alert("여행 기간을 선택해주세요!");
				$("#input-start").focus();
				return false;
			}//if end
			if($("#input-end").val().length==0){
				alert("여행 기간을 선택해주세요!");
				$("#input-start").focus();
				return false;
			}//if end
			if($("#schedule_content").val().length==0){
				alert("나라를 입력하세요!");
				$("#schedule_content").focus();
				return false;
			}//if end
		});//click function end
	});//ready function end
/* 플래너 생성 경고 end */
</script>

<script>
/* 엔드 날짜 클릭시 시작 날짜로 포커스가게 하기 */
	$(document).ready(function(){
		$("#input-end").click(function(){
			$("#input-start").focus();
		});//click function end
	});//ready function end
/* 날짜 동시에 띄우기 end */
</script>

<script>

$(document).ready(function(){
	// 숫자 평점을 별로 변환하도록 호출하는 함수
	$.fn.generateStars = function() {
    	return this.each(function(i,e){$(e).html($('<span/>').width($(e).text()*16));});
    	
};
	$('.star-prototype').generateStars();
	        
});
 
</script>

<style>
span.star-prototype, span.star-prototype > * {
    height: 17px; 
    background: url(http://i.imgur.com/YsyS5y8.png) 0 -16px repeat-x;
    width: 80px;
    display: inline-block;
}
 
span.star-prototype > * {
    background-position: 0 0;
    max-width:80px; 
}

</style>

<!-- <script>
/* 해시태그 & 링크 */
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
    
    $(".result").append(linkedContent); 
	});
</script> -->

<script>
/* 해시태그 & 링크 */
	$(document).ready(function(){
			
		var content; //내용
		var splitedArray; //배열
		var linkedContent; //주소
		
		//jstl
	    <c:forEach items="${diMore}" var="di"> 
    		
    	    content = "${di.hashtag}";
    	    splitedArray = content.split('#');//#으로 구분
    	    console.log(splitedArray);
    	    linkedContent = '';
    	    splitedArray.shift();//첫번째 지워주는 함수

    	    for(var word in splitedArray){
    	      word = splitedArray[word];
    	       if(word.indexOf("") == 0)
    	       { var word2 = "#"+word;
    	          word = '<a href="${pageContext.request.contextPath}/search?keyword='+word+'">'+word2+'</a>'
    	          console.log(word);
    	          console.log(word2);
    	       }
    	       linkedContent += word+' ';
    	    }
    	    
    	    $("#${di.diary_id}").append(linkedContent);
    	</c:forEach>

	});
/* 해시태그 & 링크 끝 */
</script>
	
</head>
<body>

	<!-- Header -->
	<%@ include file="/WEB-INF/views/includes/header.jsp"%>

	<!-- 달력 이미지 - container 안에 있으면 안됨 -->
	<img id="calImg" src="resources/calendar/cal.png" data-toggle="modal" data-target="#calModal"/>

	<!--Content -->
	<div class="container">
	
		<!-- 검색 바 -->
		<form action="${pageContext.request.contextPath}/search" method="get">			
			<input id="keyword" class="col-sm-11" type="text" name="keyword" placeholder="Search.."/>
			<button type="submit"><i class="fa fa-search"></i></button>
		</form>	
		<hr/>	
		
		<!-- 검색 메뉴 -->	
		<a style="font-family: 'yg-jalnan'" href="${pageContext.request.contextPath}/search?keyword=${keyword}">통합</a>&nbsp;&nbsp;		
		<a style="font-family: 'yg-jalnan'"  href="${pageContext.request.contextPath}/searchPl?keyword=${keyword}&sorter=basic">일정</a>&nbsp;&nbsp;
		<a style="font-family: 'yg-jalnan'" href="${pageContext.request.contextPath}/searchDi?keyword=${keyword}&sorter=basic">다이어리</a>
		<hr/>
		
		<!-- 다이어리 searchDi -->
		<span style="font-family: 'yg-jalnan'; font-size:20px;">다이어리</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<span class="dropdown">
			<span class="dropdown-toggle" data-toggle="dropdown">정렬 ↓ </span>
				<span class="dropdown-menu">
    	  			<a class="dropdown-item" href="${pageContext.request.contextPath}/searchDi?keyword=${keyword}&sorter=basic">최신순</a>
    			</span>		
		</span>
		 &nbsp;
		<span class="dropdown">
			<span class="dropdown-toggle" data-toggle="dropdown">기간 ↓ </span>
				<span class="dropdown-menu">
     		 		<a class="dropdown-item" href="${pageContext.request.contextPath}/searchDi?keyword=${keyword}&sorter=day">1일</a>
    	  			<a class="dropdown-item" href="${pageContext.request.contextPath}/searchDi?keyword=${keyword}&sorter=week">1주</a>
    	  			<a class="dropdown-item" href="${pageContext.request.contextPath}/searchDi?keyword=${keyword}&sorter=month">1개월</a>
    	  			<a class="dropdown-item" href="${pageContext.request.contextPath}/searchDi?keyword=${keyword}&sorter=year">1년</a>
    			</span>		
		</span>
		<br/><br/>
		
		<!-- 다이어리 반복 -->
			<div class="row">
				<c:forEach items="${diMore}" var="di"> 
					<div class="col-sm-3">
						<img class="diary_img" src='resources/diary/${di.img_path}' data-toggle="modal" data-target="#myModal${di.diary_id}"/>
						<span id= "${di.diary_id}"></span>
						<br/>
					</div><!-- 다이어리 끝 -->
					
				<!-- Modal -->
				<div class="modal fade" id="myModal${di.diary_id}" role="dialog">
					<!-- <div class="mySlides"> -->
					<div class="modal-dialog modal-lg">
						<div class="modal-content">
							<div class="modal-header">
								<h3 class="modal-title" style="font-family: 'yg-jalnan'">diary</h3>
								<button type="button" class="close" data-dismiss="modal">&times;</button>
							</div>
							<div class="modal-body">
								<div class="mainImg">
									<img class="popup_img" src='resources/diary/${di.img_path}'
										style='position: relative; width: 400px; height: 400px;' />
								</div>
								<div class="dialogDi">
									<h4 style="font-family: 'yg-jalnan'">${di.diary_date}</h4>
								</div>
								<div class="dialogDi">${di.hashtag}</div>
								<div class="dialogDi">${di.text}</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div>
				<!-- Modal end -->
				</c:forEach><!-- 다이어리 반복 끝 -->
			</div><!-- 다이어리 row end -->
		<br/>
		
	<!-- 달력 모달 -->
	<!-- Modal -->
	<div class="modal" id="calModal" role="dialog">
		<div class="modal-dialog modal-dialog2">
			<div class="modal-content">
				<form class="form" action="${pageContext.request.contextPath}/planner_create" method="post">

	<!-- 숨겨서 보내야 하는 정보들 -->
		<input type="hidden" name="member_id" value="${member}"/>
		<input type="hidden" id="_csrf" name="_csrf" value="${_csrf.token}"/>
		<input type="hidden" id="_csrf_header" name="_csrf_header" value="${_csrf.headerName}"/>			
			<div class="modalWrapper">
				
					<button type="button" class="close" data-dismiss="modal">&times;</button>  
                    <br>
                    <div class="modalInput">
                        <h3 class="modalLabel">플래너 이름</h3>
                            <input style="font-family: 'yg-jalnan'" name="planner_name" class="modal_input-style" type="text" placeholder="가다랑 함께 즐거운 여행!" id="planner_name">
                        </div>
                        <div class="modalInput">
                            <h3 class="modalLabel">여행시작</h3>
                            <input style="font-family: 'yg-jalnan'" name="start_date" class="modal_input-style" type="text"  placeholder="YYYY/MM/DD" id="input-start">
                        </div>
                        <div class="modalInput">
                            <h3 class="modalLabel">여행종료</h3>
                            <input style="font-family: 'yg-jalnan'" name="end_date" class="modal_input-style" type="text"  placeholder="YYYY/MM/DD" id="input-end">
                        </div>
                        <div class="modalInput">
                            <h3 class="modalLabel">나라</h3>
                            <input style="font-family: 'yg-jalnan'" name="schedule_content" class="modal_input-style" type="text" placeholder="어디로 여행 갈까요?" id="schedule_content">
                        </div>
                        <br>
						<div class="modalInput">
                        	<input class="modal-submit" style="font-family: 'yg-jalnan'" type="submit" value="작성"/>
						</div>
					<br>
				</div>
				</form>
			</div>
		</div>
	</div><!-- 달력 모달 end -->
	</div><!-- container end -->
	
	<!-- 달력 (아래 추가) -->
	<script src="resources/calendar/datepicker/moment.min.js"></script>
	<script src="resources/calendar/datepicker/daterangepicker.js"></script>
    <script src="resources/calendar/js/global.js"></script>

	<!-- Footer -->
	<%@ include file="/WEB-INF/views/includes/footer.jsp"%>

</body>
</html>