<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<meta id="_csrf_header" name="_csrf_header"
	content="${_csrf.headerName}" />

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@700;800&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="${contextPath}/resources/css/main.css">
<link rel="stylesheet" href="${contextPath}/resources/css/font.css">
<link rel="stylesheet" href="${contextPath}/resources/css/header.css">
<link rel="stylesheet" href="${contextPath}/resources/css/footer.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- 영어 폰트(헤드라인) -->
<style>
@import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@800;900&display=swap');
</style>
<!-- 한글 폰트(헤드라인) -->
<style>
@font-face {
    font-family: 'GongGothicMedium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10@1.0/GongGothicMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
</style>
<!-- 한글 폰트(기본) -->
<style>
@font-face {
    font-family: 'IBMPlexSansKR-Light';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/IBMPlexSansKR-Light.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
</style>

<title>BOARD CONTENT</title>

	<script type="text/javascript">
	  var token = $("meta[name='_csrf']").attr("content");
	  var header = $("meta[name='_csrf_header']").attr("content");
	  $(document).ajaxSend(function(e, xhr, options) { xhr.setRequestHeader(header, token); });
    </script>

<style>
	html, body {
		width: 100%;
		height: 100%;
		margins: 0;
		padding: 0;
	}

	thead{
		text-align:left;
		font-family: 'IBMPlexSansKR-Light';
		font-weight:bold;
	}
	
	.headline{
		font-family: 'Montserrat', sans-serif;
		color:#1DCAD3;
		font-size:28pt;
	}
	
	.Cthead td{
		border-top:2px solid #303E57;
		border-bottom:1px solid #303E57;
	}

    .btn-default{
    	border-radius:0.2em;
    	border:none;
    	float:right;
    }
    
    tbody{
    	text-align:left;
    	font-family: 'IBMPlexSansKR-Light';
    }
    
    .title{
		font-family: 'IBMPlexSansKR-Light';
		font-size:25pt;
		font-weight:bold;
	}
	
	.AnswerButton, .ListButton, .showContent{
		border-radius:1em;
		border:none; 
		float:right;
		font-family: 'IBMPlexSansKR-Light';
		color: white;
		background:#1DCAD3;
		width:100px;
		height:30px;
		margin:10px 1px;
		font-weight:bold;
	}
	
	.ListButton{
		width:70px;
	}
	
	.makeForm{
		border:none;
		background:white;
		font-family: 'IBMPlexSansKR-Light';
		color: #1DCAD3;
		width:40px;
		height:30px;
		font-size:10pt;
		font-weight:bold;
	}
	
	.commentImg{
		width:18px;
		height:17px;
		margin: -4px;
	}
	
	.commentImg2{
		width:21px;
		height:23px;
		margin:5px 7px;
		
	}
	
	.rpl, #cmcnt-btn{
		float:right;
	}
	
	#commLastTime{
		color: #b4b5b4;
	}
	
	.date{
		float:right;
	}
	
	button:focus, input{
		border:0;
		outline:none;
	}

		
	#contents .table {
		width:1100px;
		height:100px;
		
	}
	
	.tbody td{
		border-bottom:1px solid #303E57;
	}
	
	.reply{
		font-weight:bold;
		width:300px;
		font-size:13pt;
	}
	
	.fmt{
		color:#b4b5b4;
		font-size:9pt;
		font-weight:bold;
	}
	
	.writer{
		font-size:13pt;
	}
	
	.comment{
		font-family: 'Montserrat', sans-serif;
		font-size: 16pt;
		color:#ff7473;
		margin:10px 0;
	}
	
	#cmcnt-btn{
		border:none;
		background:white;
		font-family: 'IBMPlexSansKR-Light';
		color:#ff7473;
		width:40px;
		height:30px;
		font-size:10pt;
		font-weight:bold;
	}
	
/* 	#replyBox{
		border:1px solid #ff7473;
		border-left: none;
		border-right: none;
		overflow:hidden;
		padding:8px 20px;
	} */
	
	#text{
		height:150px;
	}
	
	.titleImg{
		width:25px;
		height:25px;
		margin: -6px 15px 6px 0px;
	}
	

/* 페이징 */
.flex {
     -webkit-box-flex: 1;
     -ms-flex: 1 1 auto;
     flex: 1 1 auto
 }

 @media (max-width:991.98px) {
     .padding {
         padding: 1.5rem
     }
 }

 @media (max-width:767.98px) {
     .padding {
         padding: 1rem
     }
 }

 .padding {
     padding: 5rem
 }

 .pagination,
 .jsgrid .jsgrid-pager {
     display: flex;
     padding-left: 0;
     list-style: none;
     border-radius: 0.25rem
 }

 .page-link {
     color: black
 }

 .pagination.pagination-rounded-flat .page-item {
     margin: 0 .25rem
 }

 .pagination-rounded-flat {}

 .pagination-success .page-item.active .page-link,
 .page-link a {
     background: #00c689;
     border-color: #00c689
 }

 .pagination.pagination-rounded-flat .page-item .page-link,
 .page-link a {
     border: none;
     border-radius: 50px;
 }


</style>

	<script>
		function check_id(){
      	 	alert("로그인이 필요한 서비스입니다.");
			location.href="${pageContext.request.contextPath}/member/login";
   		}
	</script>
	
	<script type="text/javascript">
		$(document).ready(function(){
			$(document).on('click', ".delete", function(event){		
				if (confirm("삭제하시겠습니까?")) {
				event.preventDefault();
				console.log("delete click");
				
				$.ajax({
					type : "DELETE",
					url : "${pageContext.request.contextPath }/board/${bContentView.board_id}",
					cache : false,
					beforeSend : function(xhr){   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
   	                 console.log("header 실행 "+header+token)
   	                 //console.log(sentence.toLowerCase());
   	                 xhr.setRequestHeader(header, token);
					},
					success : function(result){
						console.log("result : " + result );
						if(result == "SUCCESS"){
							window.history.back();
						}
					},
					error : function(e){
						alert("오류가 발생했습니다.");
						console.log(e);
					}
				}); // ajax end
			}else{
				return false;
			}
			}); // event end
		}); // ready end
	</script>
	
	<script type="text/javascript">
		$(document).ready(function(){
			$(".deleteAnswer").on('click', function(event){		
				if (confirm("삭제하시겠습니까?")) {
				event.preventDefault();
				console.log("deleteAnswer click");
				
				var aId = $(".answer_id").val();
				
				var tr = $(this).parent().parent();
				
				$.ajax({
					type : "DELETE",
					url : "${pageContext.request.contextPath }/board/reply/" + aId,
					cache : false,
					beforeSend : function(xhr){   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
   	                 console.log("header 실행 "+header+token)
   	                 //console.log(sentence.toLowerCase());
   	                 xhr.setRequestHeader(header, token);
					},
					success : function(result){
						console.log("result : " + result );
						if(result == "SUCCESS"){
							$(tr).remove();
						}
					},
					error : function(e){
						alert("오류가 발생했습니다.");
						console.log(e);
					}
				}); // ajax end
			}else{
				return false;
			}
			}); // event end
		}); // ready end
	</script>
	
	
	 <script>
    	$(document).ready(function() {
    		$("#writeReply").on('submit', function(event) {
    			event.preventDefault();
    			console.log("writeReply submit");

    			var board_id = $("#board_id").val();
    			var member_id = $("#member_id").val();
     			var text = $("#text").val();
    			
    			var form = {
    					board_id : board_id,
    					member_id : member_id,
    					text : text
    			};
    			
    			if(member_id.length == 0){
    				alert("로그인이 필요한 서비스입니다.");
    				location.href="${pageContext.request.contextPath}/member/login";
    				return;
    			}
    				
    			$.ajax({
    				type : "POST",
    				url : $(this).attr("action"),
    				cache : false,
    				data : JSON.stringify(form),
    				contentType : 'application/json; charset=utf-8',
    	            beforeSend : function(xhr){   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
    	                 console.log("header 실행 "+header+token)
    	                 //console.log(sentence.toLowerCase());
    	                 xhr.setRequestHeader(header, token);
    	            },
    				success : function(data){
    					
    					console.log(data);
    					var answer_date = data.answer_date;
    					var answer_id = data.answer_id;
    					var board_id = data.board_id;
    					var member_id = data.member_id;
    					var text = data.text;
    					var top_answer_id = data.top_answer_id;
    					var username = "${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}";
		   		          		
   		          		var a = '';

						a+='<tr class="answerList">';
						a+='<td>' + data.answer_id + '</td>';
						a+='<td>' + data.member_id + '</td>';
						a+='<td>' + data.answer_date + '</td>';
						a+='<td>' + data.text + '</td>';
						a+='<td><input type="button" class="makeForm btn-primary" name="'+ answer_id +'" value="답글" />';
						a+='<button type="button" class="btn-default text-primary" onclick="window.location.href=\'${pageContext.request.contextPath }/board/modify/'+ board_id + '/'+ member_id + '\'">수정</button>';
						a+='<button type="button" class="delete btn-default text-primary">삭제</button>';
						a+='</td>';
						a+='</tr>';
    		    
						$("textarea").val('');
    		            $("#add").prepend(a);

    					
    					
    				},
    				error : function(e){
    					console.log(e);
    				}
    				
    			}); // ajax end
    		}) // submit end
    	});
    </script>
    
    

	<script>
    	$(document).ready(function() {
    		$(".makeForm").on("click", function makeForm(event) {
    			console.log("makeForm");
    			
   				var tr = $(this).parent().parent().parent();
   				
       			var answer_id = $(this).attr("name");
   						
   				var htmls="";
   				
   				htmls +='<tr class="answerList"><td>'
   			    htmls +='<form id="reply" method="POST" action="${pageContext.request.contextPath}/board/reply?${_csrf.parameterName}=${_csrf.token}">'
   			    htmls +='<input type="hidden" id="answer_id" name="answer_id" value="' + answer_id + '">'
   			    htmls +='<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }" />'
   			    htmls +='<input type="hidden" id="_csrf_header" name="_csrf_header" value="${_csrf.headerName}"/>'
   			    htmls +='<textarea id="text" class="form-control col-sm-11" name="text" placeholder="댓글을 입력해주세요."></textarea></td></form>'
   			    htmls +='<td><button onclick="function addReply();">완료</button></td></tr>'

   			    $(tr).after(htmls);
    		});
    	});
    </script>
    
		<script>
			function refreshDate(){
			    $("#commLastTime").text(transferTime( $("#commLastTime").attr("class") ) );
			};
			 
			$(function(){    
			    //마지막으로 작성된 댓글시간 출력을 함수 바로 실행
			    refreshDate();
			    //그리고 10초 뒤 또 실행하도록 설정
			    setInterval(function(){refreshDate()}, 10000);
			});
		</script>

		<script>
			function transferTime(time){    
			     var now = new Date();
			     var sYear = time.substring(0,4);
			     var sMonth = time.substring(5,7)-1;
			     var sDate = time.substring(8,10);
			     var sHour = time.substring(11,13);
			     var sMin = time.substring(14,16);
			     //var sSecond = time.substring(12,14);
			     var sc = 1000;
			 
			     var today = new Date(sYear,sMonth,sDate,sHour,sMin);
			     //지나간 초
			     var pastSecond = parseInt((now-today)/sc,10);
			 
			     var date;
			     var hour;
			     var min;
			     var str = "";
			 
			     var restSecond = 0;
			     if(pastSecond > 86400){  // 24시간이 지났을 때
			      date = parseInt(pastSecond / 86400,10);
			      restSecond = pastSecond % 86400;
			      str = date + "일 전";
/* 			      if(restSecond > 3600){
			       hour = parseInt(restSecond / 3600,10);
			       restSecond = restSecond % 3600;
			       str = str + hour + "시간 ";
			       if(restSecond > 60){
			        min = parseInt(restSecond / 60,10);
			        restSecond = restSecond % 60;
			        str = str + min + "분 " + restSecond + "초 전";
			       }else{
			        str = str + restSecond + "초 전";
			       }
			      }else if(restSecond > 60){
			       min = parseInt(restSecond / 60,10);
			       restSecond = restSecond % 60;
			       str = str + min + "분 " + restSecond + "초 전";
			      }else{
			       str = str + restSecond + "초 전";
			      } */
			     }else if(pastSecond > 3600){		// 1시간이 지났을 때
			      hour = parseInt(pastSecond / 3600,10);
			      restSecond = pastSecond % 3600;
			      str = str + hour + "시간 ";
			      if(restSecond > 60){
			       min = parseInt(restSecond / 60,10);
			       restSecond = restSecond % 60;
			       //str = str + min + "분 " + restSecond + "초 전";
			       str = str + min + "분 전";
			      }else{
			       str = str + restSecond + "초 전";
			      }
			     }else if(pastSecond > 60){			// 60초가 지났을 때
			      min = parseInt(pastSecond / 60,10);
			      restSecond = pastSecond % 60;
			      str = str + min + "분 전";
			     }else{
			      str = pastSecond + "초 전";
			     }
			 
			     if(str=="0초 전"){
			         str = "방금 전";
			     }
			     
			     return str;
			}

		</script>

	<script>
	$(document).on("click",".showContent",function(){
	      if( $(this).parent().find("#contents").css("display")=="none"){
	    	document.all.contents.style.display="";
	        $(this).text("목록 열기");
	      }else{
	    	  document.all.contents.style.display="none";
	        $(this).text("목록 닫기");
	      }
	});

	</script>

</head>
<body>
	<!-- Header -->
	<%@ include file="/WEB-INF/views/includes/header.jsp" %>
	<!--Content -->
	<div class="divider-header-blank"></div>
	<div id="wrap">
		<div class="container">
			<!-- <h2 class="headline" style="font-family: 'yg-jalnan'">BOARD CONTENT</h2> -->
			
			<c:if test="${bContentView.board_type_id eq 1}">
				<span class="headline">REVIEW</span>
			</c:if>
			<c:if test="${bContentView.board_type_id eq 2}">
				<span class="headline">Q&A</span>
			</c:if>
			<c:if test="${bContentView.board_type_id eq 3}">
				<span class="headline">ACCOMPANY</span>
			</c:if>
			<c:if test="${bContentView.board_type_id eq 4}">
				<span class="headline">NOTICE</span>
			</c:if>
			
			
				<br /><br /><br />
				<table class="table">
					<thead class="Cthead">
						<tr>
							<td>
								<img class="titleImg" src="/resources/board/writing.png"><span class="title">${bContentView.title }</span><br/><br/><br />
								<img class="nav-profile-img" src='/resources/img/profile/${bImgPath.profile_img_path }' onerror="this.src='/resources/img/profile/default_profile_img.jpg'">&nbsp;
								<span class="writer">${bContentView.member_id }</span>
								<span class="date">
								<fmt:formatDate value="${bContentView.board_date }" pattern="yyyy/MM/dd hh:mm"/>&nbsp;
								<span id="commLastTime" class="${bContentView.board_date}"></span>
								</span>
								
							</td>
						</tr>						
					</thead>

					<tbody class="tbody">
						<tr>
							<td>${bContentView.text }</td>
						</tr>
					</tbody>
				</table>
				
				<button type="button" class="ListButton" onclick="window.location.href='${pageContext.request.contextPath }/board/${bContentView.board_type_id}'" >목록</button>

				 <c:if test="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username eq bContentView.member_id}">
					<button type="button" class="btn-default text-primary" onclick="window.location.href='${pageContext.request.contextPath }/board/modify/${bContentView.board_id}/${bContentView.member_id }'">수정</button>
			   		<button type="button" class="delete btn-default text-primary">삭제</button>
			    </c:if> 
			    
			    <sec:authorize access="isAnonymous()">
  					<button type="button" class="AnswerButton" onclick="check_id()" >답글 달기</button>
				</sec:authorize>

				<sec:authorize access="isAuthenticated()">
					<button type="button" class="AnswerButton" onclick="window.location.href='${pageContext.request.contextPath }/board/answer/${bContentView.board_id}'" >답글 달기</button>
				</sec:authorize>
				

				<br /><br /><br />
			    <div class="container">
        			<table class="table" id="add">
        			<c:forEach items="${bReply }" var="bReply">
        				<c:forEach items="${bReply.answerList }" var="answer">
        				<input type="hidden" class="answer_id" name="answer_id" value="${answer.answer_id }"/>
						<tr class="answerList" >
							<%-- <td>${answer.answer_id }</td> --%>
							<td><span class="reply"><img class="nav-profile-img" src='/resources/img/profile/${bImgPath.profile_img_path }' onerror="this.src='/resources/img/profile/default_profile_img.jpg'">&nbsp;&nbsp; ${answer.member_id }</span>&nbsp;&nbsp;&nbsp;&nbsp;<span class="fmt"><span><fmt:formatDate value="${answer.answer_date }" pattern="yyyy/MM/dd hh:mm"/></span></span><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${answer.text }</div></td>
							
							<td>
									<span class="rpl"><img class="commentImg" src="/resources/board/comment1.png">
									<input type="button" class="makeForm" name="${answer.answer_id }" value="답글" /></span>
								<c:if test="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username eq answer.member_id }">
									<button type="button" class="btn-default text-primary" onclick="window.location.href='${pageContext.request.contextPath }/board/modify/${bContentView.board_id}&${bContentView.member_id }'">수정</button>
									<button type="button" class="deleteAnswer btn-default text-primary">삭제</button>
								</c:if>
							</td>
						</tr>
						</c:forEach>
					</c:forEach>
					</table>
    			</div>
    			
    			<br /><br />
    			
 
			    <div id="replyBox" class="container">
        			<img class="commentImg2" src="/resources/board/comment2.png"><span class="comment">comment</span>
       				 <form id="writeReply" method="post" action="${pageContext.request.contextPath}/board/reply?${_csrf.parameterName}=${_csrf.token}">
       				 <input type="hidden" id="board_id" name="board_id" value="${bContentView.board_id }"/>
					 <input type="hidden" id="member_id" name="member_id" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}"/>
          			 <input type="hidden" id="_csrf" name="_csrf" value="${_csrf.token}"/>
					 <input type="hidden" id="_csrf_header" name="_csrf_header" value="${_csrf.headerName}"/>	
						<textarea id="text" class="form-control col-sm-12" name="text" placeholder="댓글을 입력해주세요."></textarea>
              			<input type="submit" id="cmcnt-btn" name="cmcnt-btn" value="완료" onclick="check_id()" />
        			</form>	
    			</div><br /><br />
    			
    			
    		<div class="divider-header-blank"></div>
			<button type="button" class="showContent" >목록 닫기</button>
			<div id="contents" style="display:'';">
			<table class="table">
				<thead>
					<tr class="thead">
						<td>번호</td>
						<td>제목</td>
						<td>작성자</td>
						<td>날짜</td>
					</tr>
				</thead>

				<tbody>
					<c:forEach items="${boardReviewList }" var="boardReviewList">
					<tr class="con">
						<td>${boardReviewList.board_id }</td>
						<td class="content">
							<div class="content2">
							<c:forEach begin="1" end="${boardReviewList.bindent }">[답변]</c:forEach>
							<a href="${pageContext.request.contextPath }/board/${boardReviewList.board_id}/${boardReviewList.member_id}">${boardReviewList.title }</a>			
							<a class="Rcnt" href="${pageContext.request.contextPath }/board/replyContent/${boardReviewList.board_id}/${boardReviewList.member_id}">&nbsp;&nbsp;${boardReviewList.cnt }</a>	
							</div>
						</td>
						<td class="content2"><a href="#" onclick="delchk();">${boardReviewList.member_id }</a></td>
						<td><fmt:formatDate value="${boardReviewList.board_date }" pattern="yyyy/MM/dd hh:mm"/></td>
					</tr>
					</c:forEach>
				</tbody>
			</table>


			
			<ul class="pagination d-flex justify-content-center flex-wrap pagination-rounded-flat pagination-success">
  			<!-- <ul class="pagination" style="padding:80px 350px;">	 -->
		  		<c:if test="${pageMaker.prev}">
	       		  <li class="page-item"><a class="page-link" href="${getBoardTypeId}${pageMaker.makeQuery(pageMaker.startPage - 1) }">prev</a></li>
	     		</c:if>

	      		<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
	         		<li class="page-item active"><a class="page-link" href="${getBoardTypeId}${pageMaker.makeQuery(idx)}">${idx}</a></li>
	      		</c:forEach>
	      
	      		<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
	         		<li class="page-item"><a class="page-link" href="${getBoardTypeId}${pageMaker.makeQuery(pageMaker.endPage +1) }">next</a></li>
	      		</c:if>  
		 	</ul> 
			</div><br /><br /><br />





			
				<div style="padding:0 400px;">
				<form class="form-inline">
					<select style="border-radius:0.2em; border:2px solid black;">
						<option>제목</option>
						<option>제목+내용</option>
						<option>내용</option>
					</select>&nbsp;&nbsp;
					<input class="form-control mr-sm-2" type="text" aria-label="Search" style="width:50%;">
					<button class="btn btn-outline-white btn-sm my-0" type="submit">
						<i class="fas fa-search"></i>
					</button>
				</form>
				</div>




		</div>
	</div>
	<!-- Footer -->
	<%@ include file="/WEB-INF/views/includes/footer.jsp" %>
</body>
</html>