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

</style>
	
	<script type="text/javascript">
		$(document).ready(function(){
			$("#delete").click(function(event){		
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
							$(location).attr('href', '${pageContext.request.contextPath}/board/review');
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
		$("#cmcnt-btn").submit(function(event){	
			event.preventDefault();
			console.log("reply click");
			
			var board_id = $("#board_id").val(); 
			var member_id = $("#member_id").val(); 
			var text = $("#text").val(); 
			
			var form = {
					board_id : board_id,
					member_id : member_id,
					text : text
			}
			
			$.ajax({
				type : "POST",
				url : $(this).attr("action"),
				cache : false,
				data : JSON.stringify(form),
				contentType : 'application/json; charset=utf-8',
				success : function(result){
					console.log("result : " + result );
					//$(location).attr('href', '${pageContext.request.contextPath}/board/')
					history.back();
				},
				error : function(e){
					alert("오류가 발생했습니다.");
					console.log(e);
				}
			}); // ajax end
		}); // event end
	}); // ready end
	</script>

<!-- 	<script type="text/javascript">

	function commentList(){
		var url = '${pageContext.request.contextPath}/board/replyList';
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		
	    $.ajax({
	    	type: 'GET',
			url: url,
			cache : false,
			dataType: 'json',
	 		beforeSend : function(xhr){   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
				console.log("header 실행 "+header+token)
				xhr.setRequestHeader(header, token);
			}, 
	        success : function(result){
	        	console.log("성공?????");
	            var a =''; 
	            $(result).each(function(key, value){ 
	            	a += '<c:forEach items="${bReply }" var="bReply">';
	            	a += '<c:forEach items="${bReply.answerList }" var="answer">';
	                a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
	                a += '<div class="commentInfo'+ ${answer.answer_id}'">'+'댓글번호 : '+${answer.answer_id}+' / 작성자 : '+${bReply.member_id};
	                a += '<a onclick="commentUpdate('+${answer.answer_id}+',\''+${bReply.text}+'\');"> 수정 </a>';
	                a += '<a onclick="commentDelete('+${answer.answer_id}+');"> 삭제 </a> </div>';
	                a += '<div class="commentContent'+${answer.answer_id}+'"> <p> 내용 : '+${bReply.text} +'</p>';
	                a += '</div></div></c:forEach></c:forEach>';
	            });
	            
	            $(".commentList").html(a);
	        }
	    });
	}

	</script>
	
	<script>
	$(document).ready(function(){
	    commentList(); //페이지 로딩시 댓글 목록 출력 
	});
	</script> -->
	
	
	<script>
    	$(document).ready(function() {
    		$("#writeReply").submit(function(event) {
    			event.preventDefault();
    			console.log("writeReply submit");

    			var board_id = $("#board_id").val();
    			var member_id = $("#member_id").val();
     			var cmcnt = $("#cmcnt").val();
    			
    			var form = {
    					board_id : board_id,
    					member_id : member_id,
    					cmcnt : cmcnt
    			};
    				
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
    				success : function(result){
    		        	console.log("성공?????");
    		            var a =''; 
    		            $(result).each(function(key, value){ 
    		            	a += '<c:forEach items="${bReply }" var="bReply">';
    		            	a += '<c:forEach items="${bReply.answerList }" var="answer">';
    		                a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
    		                a += '<div class="commentInfo'+ ${answer.answer_id}'">'+'댓글번호 : '+${answer.answer_id}+' / 작성자 : '+${bReply.member_id};
    		                a += '<a onclick="commentUpdate('+${answer.answer_id}+',\''+${bReply.text}+'\');"> 수정 </a>';
    		                a += '<a onclick="commentDelete('+${answer.answer_id}+');"> 삭제 </a> </div>';
    		                a += '<div class="commentContent'+${answer.answer_id}+'"> <p> 내용 : '+${bReply.text} +'</p>';
    		                a += '</div></div></c:forEach></c:forEach>';
    		            });
    		            
    		            $(".commentList").append(a);
    					}  
    				},
    				error : function(e){
    					console.log(e);
    				}
    				
    			}); // ajax end
    		}) // submit end
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
			<h2 class="headline" style="font-family: 'yg-jalnan'">BOARD CONTENT</h2>
				
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
							<th>${bContentView.text }</th>
						</tr>
					</tbody>
				</table>
				
				<button type="button" class="btn-default text-primary" onclick="window.location.href='${pageContext.request.contextPath }/board/${bContentView.board_type_id}'" >목록</button>

				 <c:if test="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username eq bContentView.member_id}">
					<button type="button" class="btn-default text-primary" onclick="window.location.href='${pageContext.request.contextPath }/board/modify/${bContentView.board_id}&${bContentView.member_id }'">수정</button>
			   		<button id="delete" type="button" class="btn-default text-primary" >삭제</button>
			    </c:if> 
			
			    <div class="container">
        			<label for="content">comment</label>
       				 <form id="writeReply" method="post" action="${pageContext.request.contextPath}/board/reply?${_csrf.parameterName}=${_csrf.token}">
       				 <input type="hidden" id="board_id" name="board_id" value="${bContentView.board_id }"/>
					 <input type="hidden" id="member_id" name="member_id" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}"/>
          			 	<div class="comment-text">
               				<textarea id="cmcnt" name="text" placeholder="댓글을 입력해주세요."></textarea>
              			 	<span class="comment-button">
                    			<input type="submit" id="cmcnt-btn" name="cmcnt-btn" class="btn-default text-primary" value="완료"  />
               				</span>
              			</div>
        			</form>
    			</div>

			    <div class="container">
        			<div class="commentList"></div>
        			
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