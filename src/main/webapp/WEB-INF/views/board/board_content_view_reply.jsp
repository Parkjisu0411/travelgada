<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

	thead, tbody{
		text-align:left;
	}

    .btn-default{
    	border-radius:0.2em;
    	border:none;
    	float:right;
    }
    
    tbody{
    	text-align:center;
    }
    
    .showContent{
    	width:100%;
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
	function show_content(){
		document.all.contents.style.display="";
		$(".showContent").remove();
	}
	</script> 
	
	<script>
    	$(document).ready(function() {
    		$(".makeForm").on("click", function makeForm(event) {
    			console.log("makeForm");
    			
   				var tr = $(this).parent().parent();
   				
       			var answer_id = $(this).attr("name");
   						
   				var htmls="";
   				
   				htmls +='<tr><td colspan="4">'
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
		function addReply(){
			event.preventDefault();
			console.log("addReply submit");

			var board_id = $("#board_id").val();
			var member_id = ${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username};
 			var text = $("#text").val();
 			var top_answer_id = $("#answer_id").val();
			
			var form = {
					board_id : board_id,
					member_id : member_id,
					text : text,
					top_answer_id : top_answer_id
			};
			
			if(member_id.length == 0){
				alert("로그인이 필요한 서비스입니다.");
				location.href="${pageContext.request.contextPath}/member/login";
				return;
			}
			
			
				
			$.ajax({
				type : "PUT",
				url : $(this).attr("action"),
				cache : false,
				data: JSON.stringify(form),
				contentType : 'application/json; charset=utf-8',
	            beforeSend : function(xhr){   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
	                 console.log("header 실행 "+header+token)
	                 //console.log(sentence.toLowerCase());
	                 xhr.setRequestHeader(header, token);
	            },
				success : function(result){
					if(result == "SUCCESS"){
		        	console.log("성공?????");


					}  
					
				},
				error : function(e){
					console.log(e);
				}
				
			}); // ajax end
		}
	</script> 
    

<!--   	<script>
	function write_reply(){
   		var board_id=$("#board_id").val();
   		//var text=document.getElementById("#text").value;
   		//var text=$("#text").val();
    	//var member_id=$("#member_id").val();
    	var member_id = $("#member_id").val();
    	var text=$("#text").val();
    	
		if(member_id.length == 0){
			alert("로그인이 필요한 서비스입니다.");
			location.href="${pageContext.request.contextPath}/member/login";
			return;
		}
		
   	 	//폼 데이터를 받을 주소
    	//$("#write").action="${pageContext.request.contextPath}/board/write?${_csrf.parameterName}=${_csrf.token}";
    	//폼 데이터를 서버에 전송
    	//document.write.submit();
     	$("#writeReply").submit();
     	if(result == "SUCCESS"){
     		show_reply();
     	}
     	
	}
	</script>   -->



</head>
<body>
	<!-- Header -->
	<%@ include file="/WEB-INF/views/includes/header.jsp" %>
	<!--Content -->
	<div class="divider-header-blank"></div>
	<div id="wrap">
		<div class="container">
			<h2 class="headline" style="font-family: 'yg-jalnan'">BOARD REPLY CONTENT</h2>
				<table class="table">
					<thead>
						<tr>
							<th><br/>
								<h3  style="font-family: 'yg-jalnan'; font_weight:lighter;">${bContentView.title }</h3><br/>
								<img class="nav-profile-img" src='/resources/img/profile/${bImgPath.profile_img_path }' onerror="this.src='/resources/img/profile/default_profile_img.jpg'">&nbsp;
								${bContentView.member_id }&nbsp;&nbsp;&nbsp;
								${bContentView.board_date }
							</th>
						</tr>						
					</thead>
				
					<tbody>
						<tr>	
							<th><div id="contents" style="display:none;">${bContentView.text }</div></th>			
						</tr>
					</tbody>
				</table>
				
				
				
				<button type="button" class="showContent btn btn-outline-primary" onclick="show_content()" >본문 내용 보기</button><br /><br />
				
				<button type="button" class="btn-default text-primary" onclick="window.location.href='${pageContext.request.contextPath }/board/${bContentView.board_type_id}'" >목록</button>

				 <c:if test="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username eq bContentView.member_id}">
					<button type="button" class="btn-default text-primary" onclick="window.location.href='${pageContext.request.contextPath }/board/modify/${bContentView.board_id}/${bContentView.member_id }'">수정</button>
			   		<button type="button" class="delete btn-default text-primary">삭제</button>
			    </c:if> 
			    
			    <sec:authorize access="isAnonymous()">
  					<button type="button" class="btn-default text-primary" onclick="check_id()" style="border-radius:0.2em; border:none; float:right;">답글 달기</button>
				</sec:authorize>

				<sec:authorize access="isAuthenticated()">
					<button type="button" class="btn-default text-primary" onclick="window.location.href='${pageContext.request.contextPath }/board/answer/${bContentView.board_id}'" style="border-radius:0.2em; border:none; float:right;">답글 달기</button>
				</sec:authorize>
			
			    <div class="container">
        			<label for="content">comment</label>
       				 <form id="writeReply" method="post" action="${pageContext.request.contextPath}/board/reply?${_csrf.parameterName}=${_csrf.token}">
       				 <input type="hidden" id="board_id" name="board_id" value="${bContentView.board_id }"/>
					 <input type="hidden" id="member_id" name="member_id" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}"/>
          			 <input type="hidden" id="_csrf" name="_csrf" value="${_csrf.token}"/>
					 <input type="hidden" id="_csrf_header" name="_csrf_header" value="${_csrf.headerName}"/>	
						<textarea id="text" class="form-control col-sm-11" name="text" placeholder="댓글을 입력해주세요."></textarea>
              			 <input type="submit" id="cmcnt-btn" name="cmcnt-btn" class="btn-default text-primary" value="완료"  /> 
        				 <!-- <button type="button" id="cmcnt-btn" class="btn-default text-primary" >완료</button>  -->
        			</form>	
    			</div><br />
				
			    <div class="container">
        			<div class="commentList"></div>
        			 <table class="table" id="add">
        			<c:forEach items="${bReply }" var="bReply">
        				<c:forEach items="${bReply.answerList }" var="answer">
        				<input type="hidden" class="answer_id" name="answer_id" value="${answer.answer_id }"/>
						<tr class="answerList">
							<td>${answer.answer_id }</td>
							<td>${answer.member_id }</td>
							<td>${answer.answer_date }</td>
							<td>${answer.text }</td>
							<td>
									<input type="button" class="makeForm btn-primary" name="${answer.answer_id }" value="답글" />
								<c:if test="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username eq answer.member_id }">
									<button type="button" class="btn-default text-primary" onclick="">수정</button>
									<button type="button" class="deleteAnswer btn-default text-primary">삭제</button>
								</c:if>
	
							</td>
						</tr>
						</c:forEach>
					</c:forEach>
					</table>
    			</div>
			
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