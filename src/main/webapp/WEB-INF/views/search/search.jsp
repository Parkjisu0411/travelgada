<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-date-range-picker/0.21.1/daterangepicker.min.css"
	integrity="sha512-nmvKZG8E3dANbZAsJXpdK6IqpfEXbPNbpe3M3Us1qTipq74IpTRShbpCf8lJFapB7e0MkDbNDKxLjS1VWt2vVg=="
	crossorigin="anonymous" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-date-range-picker/0.21.1/jquery.daterangepicker.min.js"
	integrity="sha512-jM36zj/2doNDqDlSIJ+OAslGvZXkT+HrtMM+MMgVxCqax1AIm1XAfLuUFP7uMSavUxow+z/T2CRnSu7PDaYu2A=="
	crossorigin="anonymous"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- <script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@700;800&display=swap"
	rel="stylesheet">

<link rel="stylesheet" href="${contextPath}/resources/css/font.css">
<link rel="stylesheet" href="${contextPath}/resources/css/header.css">
<link rel="stylesheet" href="${contextPath}/resources/css/footer.css">
<link rel="stylesheet" href="${contextPath}/resources/css/main.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- 달력 부분 -->
<link href="/resources/calendar/datepicker/daterangepicker.css" rel="stylesheet" media="all">
<link href="/resources/calendar/css/datepicker2.css" rel="stylesheet" media="all">

<!-- 폰트 -->
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@800;900&display=swap"
	rel="stylesheet">


<title>검색</title>

<style>

@font-face {
    font-family: 'GongGothicMedium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10@1.0/GongGothicMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

@font-face {
    font-family: 'GongGothicLight';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10@1.0/GongGothicLight.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

/* 내용 글씨 */
@font-face {
    font-family: 'IBMPlexSansKR-Light';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/IBMPlexSansKR-Light.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

html, body {
	width: 100%;
	height: 100%;
	margins: 0;
	padding: 0;
	background-color: #f5f5f5;
}

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
/* 별 */
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

<style>
/* 도시, 국가 ... */
	.box{
		width:310px;	
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
	}
</style>

<style>
.diHover:hover, .plBox:hover{
	box-shadow: 5px 5px 5px rgba(0, 0, 0, 0.4);
}
</style>

<script>
/* 해시태그 & 링크 */
	$(document).ready(function(){
			
		var content; //내용
		var splitedArray; //배열
		var linkedContent; //주소
		
		//jstl
	    
	    <c:forEach items="${member}" var="member">
	    <c:forEach items="${member.plannerVO}" var="pl">
	    <c:forEach items="${pl.diaryVO}" var="di">
    		console.log("${di.hashtag}")
    	    content = "${di.hashtag}";
    	    splitedArray = content.split('#');//#으로 구분
    	    console.log(splitedArray);
    	    linkedContent = '';
    	    splitedArray.shift();//첫번째 지워주는 함수

    	    for(var word in splitedArray){
    	      word = splitedArray[word];
    	       if(word.indexOf("") == 0)
    	       { var word2 = "#"+word;
    	          word = '<a class="hash_color" href="${pageContext.request.contextPath}/search?keyword='+word+'">'+word2+'</a>'
    	          console.log(word);
    	          console.log(word2);
    	       }
    	       linkedContent += word+' ';
    	    }
    	    
    	    $("#${di.diary_id}").append(linkedContent);
    	    $("#modal${di.diary_id}").append(linkedContent);
    	</c:forEach>
    	</c:forEach>
    	</c:forEach>
    	
	});
/* 해시태그 & 링크 끝 */
</script>

<style>

.plBox {
	background-color: white;
	border-radius: 15px;
}

.searchBtn {
	border-radius: 15px;
	font-weight: bold;
	width: 100px;
}



#keyword_search{
	height: 45px;
/* 	width: 50%; */
/* 	min-width: 100%; */
	line-height: 70px;
	background-color: transparent;
	color: black;
	font-size: 20px;
	border-radius: 50px;
	border: 2px solid #303E57;
	font-family: 'GongGothicMedium';
	outline:none;
}

.search_icon{
	background-color: #303E57;
	border-radius: 50px;
	border: none;
 	outline:none; 
	padding-top: 10px;
	padding-bottom: 9px;
	text-align: center; 
	width: 45px;
	height: 45px;
	margin-left:10px;
	font-family: 'GongGothicMedium';  
	font-size:20px; 
	color:white;
	
}



.wrap_search{
	font-family: 'IBMPlexSansKR-Light';
}

.search_menu{
	font-family: 'GongGothicMedium';
	color:#303E57;
	font-size:20px;
}

.font_h{
	font-family: 'GongGothicMedium';
	color:#1dcad3;
	font-size:30px;
}

.memu{
	border: solid 1px;
	border-radius: 15px 15px 0 0;
	font-family: 'GongGothicMedium';
	color: white;
	font-size:20px;
	background-color: #1dcad3;
	width:100px;
	margin-left:-13px;
}

.hr_search{
	border: 0.5px solid #1dcad3;
}

.line{
	border: none;
	outline: none;
	border-bottom: 2px solid #1dcad3;
	

}

.more{
	float:right;
	color:#1dcad3;
	font-size:15px;
	font-family: 'GongGothicMedium';
}

.search_keyword{
	color:#303E57;
	font-size:15px;
	font-family: 'GongGothicMedium';
	text-align:center;

}

.hash_color{
	color:#303E57;
}
/* 여기 */
/* 모달 스타일 */
.dialogDi{
   
  	height : 40px;

}

.mainImg{
    float: left;
}

.Mcontent{
	padding:0px;
	width:100%
}

.dialogtext{
	width : 350px;
  	height : 240px;
  	font-weight: bold;
  	
  	
  
}
.dialog-date, .dialog-hashtag{
	text-align:right;
}


.popup_img{
	position: relative; 
	width: 400px; 
	height: 400px;
}

.dialog-profile{
	font-family: 'GongGothicMedium';
}

.dialog-wrap{
	width : 350px;
	margin: 20px 0 20px 20px;
   	float: left;
}

</style>

</head>
<body>

	<!-- Header -->
	<%@ include file="/WEB-INF/views/includes/header.jsp"%>

	<!-- 달력 이미지 - container 안에 있으면 안됨 -->
	<img id="calImg" src="/resources/calendar/cal.png" data-toggle="modal" data-target="#calModal"/>

	<!--Content -->
	<div class="container wrap_search">
	
		<!-- 검색 바 -->
		<form action="${pageContext.request.contextPath}/search" method="get">			
			<input id="keyword_search" class="col-sm-11" type="text" name="keyword" placeholder="검색어를 입력하세요."/>
			<button class="search_icon" type="submit"><i class="fa fa-search search-icon-in"></i></button>
		</form>	
		<br/>
		<div class="search_keyword"><span style="font-size:22px">" ${keyword} "</span> 에 관한 검색입니다.</div>
		<br/>
		
		<!-- 검색 메뉴 -->
	  	<div class=" line col-12">
		<button type="button" class="memu btn" onclick="window.location.href='${pageContext.request.contextPath}/search?keyword=${keyword}'">통합</button>
		<button type="button" class="memu btn " onclick="window.location.href='${pageContext.request.contextPath}/searchPl?keyword=${keyword}&sorter=basic'">일정</button>
		<button type="button" class="memu btn " onclick="window.location.href='${pageContext.request.contextPath}/searchDi?keyword=${keyword}&sorter=basic'">다이어리</button>
		</div>
		
		<br/><br/>
		<!-- 일정 searchPl --> 
		<span class="font_h">일정</span>
		
		
		<br/>
		<a class = "more" href="${pageContext.request.contextPath}/searchPl?keyword=${keyword}"> 더보기 </a>
		<br/>
		
		<!-- 반복 2개까지만 -->
		<c:forEach items="${searchPl}" var="pl" > 
		<div class="row plBox">
			<div class="col-sm-5"><a href="/search/${pl.member_id}/${pl.planner_id}">일정사진</a></div>
			<div class="col-sm-7"><!-- 국가, 도시, 만족도 -->
			
			<div class="box">
			<br>
			국가 : &nbsp;
				<c:forEach items="${pl.scheduleVO}" var="sc">
					<c:if test="${sc.schedule_type_id eq 5}">
						${sc.schedule_content}
					</c:if>
				</c:forEach>
			</div>
			<br/>
			
			<div class="box">
			도시 : &nbsp;
			<c:forEach items="${pl.scheduleVO}" var="sc">
				<c:if test="${sc.schedule_type_id eq 1}"> 
					${sc.schedule_content}
				  </c:if>
			</c:forEach>
			<br/>
			<br/>
			</div>
			
			${pl.start_date}&nbsp; ~ &nbsp;${pl.end_date}
			<br/><br/>
			
			<span class="star-prototype">${pl.satisfaction}</span>
			<br/><br/>
			
			</div><!-- 국가, 도시, 만족도 끝 -->
		</div><!-- 일정 검색 -->
		<br/>
		</c:forEach>
		<!-- 반복 끝 -->
		<!-- 일정 더보기 버튼 -->
		<br/>
		<%-- <div class="btn_more">
			<button type="button" style ="background-color:#f5df4d" class=" searchBtn btn btn-sm " onclick = "location.href = '${pageContext.request.contextPath}/searchPl?keyword=${keyword}' ">더보기</button>
		</div> --%>
	
		<br/><br/>
		<!-- 다이어리 searchDi -->
		<hr class="hr_search">
		<br/><br/>
		<h5 class="font_h">다이어리</h5>
		
		<br/>
		<a class = "more" href="${pageContext.request.contextPath}/searchDi?keyword=${keyword}"> 더보기 </a>
		<br/>
		
		<!-- 다이어리 반복 -->
		
			<div class="row">
			<c:forEach items="${member}" var="member">
			<c:forEach items="${member.plannerVO}" var="pl">
			<c:forEach items="${pl.diaryVO}" var="di">

				<div class="col-md-3 ">
					<div class="main-card-diary-area diHover">
						<img src="resources/diary/${di.img_path}"
							class="main-card-diary-img" loading="lazy" data-toggle="modal"
							data-target="#myModal${di.diary_id}">
						<div class="main-card-diary-content">
							<div class="main-card-diary-profile">
								<img class="nav-profile-img"
									src='/resources/img/profile/${member.profile_img_path }'
									onerror="this.src='/resources/img/profile/default_profile_img.jpg'">
								<a class="main-card-diary-profile-id" href="#">${member.member_id}</a>
							</div>
							<div class="main-card-diary-hashtag-area">
								<span class="main-card-diary-hashtag" id="${di.diary_id }"></span>
							</div>
						</div>
					</div>
				</div>
				<!-- 다이어리 끝 -->

				<!-- Modal --><!-- 여기  -->
				<div class="modal fade" id="myModal${di.diary_id}" role="dialog">
					<!-- <div class="mySlides"> -->
					<div class="modal-dialog modal-lg modal-dialog-centered">
						 <div class="modal-content MDI">
	<!-- 						<div class="modal-header">
							</div> -->
							<div class="modal-body Mcontent">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
								<div class="mainImg">
									<img class="popup_img" src='resources/diary/${di.img_path}'/>
								</div>
								<div class="dialog-wrap">
								<div class="dialogDi dialog-profile">
									<img class="nav-profile-img" src='/resources/img/profile/${member.profile_img_path }' onerror="this.src='/resources/img/profile/default_profile_img.jpg'">
									${member.member_id}								
								</div>
								<div class="dialogDi dialog-date">
									${di.diary_date}
								</div>
								<div class="dialogtext">${di.text}</div>
								<div class="dialogDi dialog-hashtag"><span id= "modal${di.diary_id}"></span></div>
								</div>
							</div>
							<!-- <div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button>
							</div> -->
						</div><!-- modal-content end -->
					</div>
				</div>
				</c:forEach>
				<!-- Modal end -->
				</c:forEach><!-- 다이어리 반복 끝 -->
				</c:forEach>
			</div><!-- 다이어리 row end -->
		
		<br/>
		
		<%-- <div class="btn_more">
			<!-- 다이어리 더보기 버튼 -->
			<button type="button" style ="background-color:#f5df4d" class="searchBtn btn btn-sm" onclick = "location.href = '${pageContext.request.contextPath}/searchDi?keyword=${keyword}' ">더보기</button>
		</div> --%>
		
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