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
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/main/logo.png">
<link
	href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@700;800&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="${contextPath}/resources/css/main.css">
<link rel="stylesheet" href="${contextPath}/resources/css/font.css">
<link rel="stylesheet" href="${contextPath}/resources/css/header.css">
<link rel="stylesheet" href="${contextPath}/resources/css/footer.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>BOARD REPLY CONTENT</title>

	<script type="text/javascript">
	  var token = $("meta[name='_csrf']").attr("content");
	  var header = $("meta[name='_csrf_header']").attr("content");
	  $(document).ajaxSend(function(e, xhr, options) { xhr.setRequestHeader(header, token); });
    </script>

<style>  

	/* ๋๋๊ทธ */
	::selection {
		background-color: #1DCAD3;
		color: white;
	}  

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
	
	.AnswerButton, .ListButton, .showContent, .modifyContent, .deleteContent{
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
	
	.showMainContent{
		border-radius:1em;
		border:1px solid #1DCAD3; 
		display:block;
		font-family: 'IBMPlexSansKR-Light';
		color: #1DCAD3;
		background:none;
		width:20%;
		height:30px;
		margin: 0 auto;
		font-weight:bold;
	}
	
	
	.showMainContent:hover{
		background:#1DCAD3;
		color:white;
	}
	
	.ListButton, .modifyContent, .deleteContent{
		width:70px;
	}
	
	.makeForm, .modifyAnswer, .deleteAnswer{
		border:none;
		background:none;
		font-family: 'IBMPlexSansKR-Light';
		color: #1DCAD3;
		width:40px;
		height:30px;
		font-size:10pt;
		font-weight:bold;
		margin:13px 0px;
	}
	
	.commentImg{
		width:18px;
		height:17px;
		margin: 20px -7px;
	}
	
	.deleteImg{
		width:20px;
		height:20px;
		padding:2px;
		margin: 0 -6px 0 5px;
	}
	
	.modifyImg{
		width:20px;
		height:20px;
		padding:2px;
		margin: 0 -6px 0 5px;
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

		
	#contents .ListTable {
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

 	/* ๊ฒ์ํ ๋ชฉ๋ก */
 	.ListTable td{
	border:1px solid #1DCAD3;
	border-left:none;
	border-right:none;
	}
	
	.ListTable {
		border-top:2px solid #1DCAD3;
		border-bottom:2px solid #1DCAD3;
	}

.con{
	font-family: 'IBMPlexSansKR-Light';
	font-weight:bold;
    text-align:center;
}

.content{
	color:#3d464b;
	margin:0 30px;
	text-align:left;
	width:40%;
}

.content2{
	margin:0 30px;
}

.content2 a{
	/* color:black; */
	color:#3d464b;
}

a{
	text-decoration:none !important 
}

.Rcnt{
	color:#ff7473 !important;
	font-size:11pt;
}

.pin{
	width:18px;
	height:18px;
}
	
	.con a:hover{
		color:#1DCAD3;
	}

	.Rcnt:hover{
		font-size:1em;
	}

.formBT{
	border:1px solid white;
	border-radius:5px;
	font-family: 'IBMPlexSansKR-Light';
	font-weight:bold;
	color:white;
	margin:123px 0 0 -12px;
	background:#1DCAD3;
}		

#reply{
	width: 860px;
	border:1px solid #65dae0;
	border-radius:7px;
	
}		
	
	/* ๊ฒ์ */
	#board_keyword_search{
		height: 30px;
 	 	width: 300px; 
	 	/* min-width: 100%;  */ 
		line-height: 70px;
		background-color: transparent;
		color: black;
		font-size: 15px;
		/* border-radius: 50px; */
		border:none;
		border-bottom: 2px solid #303E57;
		font-family: 'GongGothicMedium';
		outline:none;
	}
	.search_icon{
		background-color: #303E57;
		border-radius: 50px;
		border: none;
	 	outline:none; 
		padding-top: 6px;
		padding-bottom: 9px;
		text-align: center; 
		width: 28px;
		height: 28px;
		margin-left:1px;
		margin-top:1px;
		font-family: 'GongGothicMedium';  
		font-size:13px; 
		color:white;
	}
	
	#select{
		height: 30px;
 	 	width: 120px;
	 	/* min-width: 100%;  */ 
		line-height: 70px;
		background-color: transparent;
		color: black;
		font-size: 15px;
		border-radius: 50px;
		border: 2px solid #303E57;
		font-family: 'GongGothicMedium';
		outline:none;
	}
	
	.search_board{
		width:50%;
		margin:0 auto;
	}

</style>

	<script>
		function check_id(){
      	 	alert("๋ก๊ทธ์ธ์ด ํ์ํ ์๋น์ค์๋๋ค.");
			location.href="${pageContext.request.contextPath}/member/login";
   		}
	</script>
	
	<script type="text/javascript">
		$(document).ready(function(){
			$(document).on('click', ".delete", function(event){		
				if (confirm("์ญ์?ํ์๊ฒ?์ต๋๊น?")) {
				event.preventDefault();
				console.log("delete click");
				
				$.ajax({
					type : "DELETE",
					url : "${pageContext.request.contextPath }/board/${bContentView.board_id}",
					cache : false,
					beforeSend : function(xhr){   /*๋ฐ์ดํฐ๋ฅผ ์?์กํ๊ธฐ ์?์ ํค๋์ csrf๊ฐ์ ์ค์?ํ๋ค*/
   	                 console.log("header ์คํ "+header+token)
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
						alert("์ค๋ฅ๊ฐ ๋ฐ์ํ์ต๋๋ค.");
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
				if (confirm("์ญ์?ํ์๊ฒ?์ต๋๊น?")) {
				event.preventDefault();
				console.log("deleteAnswer click");
				
				var aId = $(".answer_id").val();
				
				var tr = $(this).parent().parent();
				
				$.ajax({
					type : "DELETE",
					url : "${pageContext.request.contextPath }/board/reply/" + aId,
					cache : false,
					beforeSend : function(xhr){   /*๋ฐ์ดํฐ๋ฅผ ์?์กํ๊ธฐ ์?์ ํค๋์ csrf๊ฐ์ ์ค์?ํ๋ค*/
   	                 console.log("header ์คํ "+header+token)
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
						alert("์ค๋ฅ๊ฐ ๋ฐ์ํ์ต๋๋ค.");
						console.log(e);
					}
				}); // ajax end
			}else{
				return false;
			}
			}); // event end
		}); // ready end
	</script>
	
	<!-- ๊ฒ์๊ธ ์ญ์? -->
	<script type="text/javascript">
		$(document).ready(function(){
			$(".deleteContent").on('click', function(event){		
				if (confirm("์ญ์?ํ์๊ฒ?์ต๋๊น?")) {
				event.preventDefault();
				console.log("deleteAnswer click");
				
				var board_id = $(".board_id").val();
				
				$.ajax({
					type : "DELETE",
					url : "${pageContext.request.contextPath }/board/" + board_id,
					cache : false,
					beforeSend : function(xhr){   /*๋ฐ์ดํฐ๋ฅผ ์?์กํ๊ธฐ ์?์ ํค๋์ csrf๊ฐ์ ์ค์?ํ๋ค*/
   	                 console.log("header ์คํ "+header+token)
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
						alert("์ค๋ฅ๊ฐ ๋ฐ์ํ์ต๋๋ค.");
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
    			
    			if(member_id.length = 0){
    				alert("๋ก๊ทธ์ธ์ด ํ์ํ ์๋น์ค์๋๋ค.");
    				location.href="${pageContext.request.contextPath}/member/login";
    				return;
    			}
    				
    			$.ajax({
    				type : "POST",
    				url : $(this).attr("action"),
    				cache : false,
    				data : JSON.stringify(form),
    				contentType : 'application/json; charset=utf-8',
    	            beforeSend : function(xhr){   /*๋ฐ์ดํฐ๋ฅผ ์?์กํ๊ธฐ ์?์ ํค๋์ csrf๊ฐ์ ์ค์?ํ๋ค*/
    	                 console.log("header ์คํ "+header+token)
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
						a+='<td><input type="button" class="makeForm btn-primary" name="'+ answer_id +'" value="๋ต๊ธ" />';
						a+='<button type="button" class="btn-default text-primary" onclick="window.location.href=\'${pageContext.request.contextPath }/board/modify/'+ board_id + '/'+ member_id + '\'">์์?</button>';
						a+='<button type="button" class="delete btn-default text-primary">์ญ์?</button>';
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
		document.all.mainContents.style.display="";
		$(".showMainContent").remove();
	}
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
   			    htmls +='<textarea id="text" class="form-control col-sm-12" name="text" placeholder="๋๊ธ์ ์๋?ฅํด์ฃผ์ธ์."></textarea></td></form>'
   			    htmls +='<td><button class="formBT" onclick="function addReply();">์๋ฃ</button></td></tr>'

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
				alert("๋ก๊ทธ์ธ์ด ํ์ํ ์๋น์ค์๋๋ค.");
				location.href="${pageContext.request.contextPath}/member/login";
				return;
			}
			
			
				
			$.ajax({
				type : "PUT",
				url : $(this).attr("action"),
				cache : false,
				data: JSON.stringify(form),
				contentType : 'application/json; charset=utf-8',
	            beforeSend : function(xhr){   /*๋ฐ์ดํฐ๋ฅผ ์?์กํ๊ธฐ ์?์ ํค๋์ csrf๊ฐ์ ์ค์?ํ๋ค*/
	                 console.log("header ์คํ "+header+token)
	                 //console.log(sentence.toLowerCase());
	                 xhr.setRequestHeader(header, token);
	            },
				success : function(result){
					if(result == "SUCCESS"){
		        	console.log("์ฑ๊ณต?????");


					}  
					
				},
				error : function(e){
					console.log(e);
				}
				
			}); // ajax end
		}
	</script> 
    

		<script>
			function refreshDate(){
			    $("#commLastTime").text(transferTime( $("#commLastTime").attr("class") ) );
			};
			 
			$(function(){    
			    //๋ง์ง๋ง์ผ๋ก ์์ฑ๋ ๋๊ธ์๊ฐ ์ถ๋?ฅ์ ํจ์ ๋ฐ๋ก ์คํ
			    refreshDate();
			    //๊ทธ๋ฆฌ๊ณ? 10์ด ๋ค ๋ ์คํํ๋๋ก ์ค์?
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
			     //์ง๋๊ฐ ์ด
			     var pastSecond = parseInt((now-today)/sc,10);
			 
			     var date;
			     var hour;
			     var min;
			     var str = "";
			 
			     var restSecond = 0;
			     if(pastSecond > 86400){  // 24์๊ฐ์ด ์ง๋ฌ์ ๋
			      date = parseInt(pastSecond / 86400,10);
			      restSecond = pastSecond % 86400;
			      str = date + "์ผ ์?";
/* 			      if(restSecond > 3600){
			       hour = parseInt(restSecond / 3600,10);
			       restSecond = restSecond % 3600;
			       str = str + hour + "์๊ฐ ";
			       if(restSecond > 60){
			        min = parseInt(restSecond / 60,10);
			        restSecond = restSecond % 60;
			        str = str + min + "๋ถ " + restSecond + "์ด ์?";
			       }else{
			        str = str + restSecond + "์ด ์?";
			       }
			      }else if(restSecond > 60){
			       min = parseInt(restSecond / 60,10);
			       restSecond = restSecond % 60;
			       str = str + min + "๋ถ " + restSecond + "์ด ์?";
			      }else{
			       str = str + restSecond + "์ด ์?";
			      } */
			     }else if(pastSecond > 3600){		// 1์๊ฐ์ด ์ง๋ฌ์ ๋
			      hour = parseInt(pastSecond / 3600,10);
			      restSecond = pastSecond % 3600;
			      str = str + hour + "์๊ฐ ";
			      if(restSecond > 60){
			       min = parseInt(restSecond / 60,10);
			       restSecond = restSecond % 60;
			       //str = str + min + "๋ถ " + restSecond + "์ด ์?";
			       str = str + min + "๋ถ ์?";
			      }else{
			       str = str + restSecond + "์ด ์?";
			      }
			     }else if(pastSecond > 60){			// 60์ด๊ฐ ์ง๋ฌ์ ๋
			      min = parseInt(pastSecond / 60,10);
			      restSecond = pastSecond % 60;
			      str = str + min + "๋ถ ์?";
			     }else{
			      str = pastSecond + "์ด ์?";
			     }
			 
			     if(str=="0์ด ์?"){
			         str = "๋ฐฉ๊ธ ์?";
			     }
			     
			     return str;
			}

		</script>

	<script>
		$(document).on("click",".showContent",function(){
		      if( $(this).parent().find("#contents").css("display")=="none"){
		    	document.all.contents.style.display="";
		        $(this).text("๋ชฉ๋ก ๋ซ๊ธฐ");
		      }else{
		    	  document.all.contents.style.display="none";
		        $(this).text("๋ชฉ๋ก ์ด๊ธฐ");
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
							<td><br/>
								<img class="titleImg" src="/resources/board/writing.png"><span class="title">${bContentView.title }</span><br/><br/><br />
								<img class="nav-profile-img" src='/resources/img/profile/${bImgPath.profile_img_path }' onerror="this.src='/resources/img/profile/default_profile_img.jpg'">&nbsp;
								${bContentView.member_id }&nbsp;&nbsp;&nbsp;
								<span class="date">
								<fmt:formatDate value="${bContentView.board_date }" pattern="yyyy/MM/dd HH:mm"/>&nbsp;
								<span id="commLastTime" class="${bContentView.board_date}"></span>
								</span>
							</td>
						</tr>						
					</thead>
				
					<tbody class="tbody">
						<tr>	
							<td><div id="mainContents" style="display:none;">${bContentView.text }</div> <button type="button" class="showMainContent" onclick="show_content()" >๋ณธ๋ฌธ ๋ด์ฉ ๋ณด๊ธฐ</button></td>		
						</tr>
					</tbody>
				</table>


				<button type="button" class="ListButton" onclick="window.location.href='${pageContext.request.contextPath }/board/${bContentView.board_type_id}'" >๋ชฉ๋ก</button>

				<c:if test="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username eq bContentView.member_id}">
				 	<button type="button" class="deleteContent">์ญ์?</button>
				 	<input type="hidden" class="board_id" name="board_id" value="${bContentView.board_id }"/>
					<button type="button" class="modifyContent" onclick="window.location.href='${pageContext.request.contextPath }/board/modify/${bContentView.board_id}/${bContentView.member_id }/${bContentView.board_type_id }'">์์?</button>
			    </c:if> 
			    
			    <sec:authorize access="isAnonymous()">
  					<button type="button" class="AnswerButton" onclick="check_id()" >๋ต๊ธ ๋ฌ๊ธฐ</button>
				</sec:authorize>

				<sec:authorize access="isAuthenticated()">
					<button type="button" class="AnswerButton" onclick="window.location.href='${pageContext.request.contextPath }/board/answer/${bContentView.board_id}'" >๋ต๊ธ ๋ฌ๊ธฐ</button>
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
								<c:if test="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username eq answer.member_id }">
									<span class="rpl"><img class="deleteImg" src="/resources/board/garbage.png"><button type="button" class="deleteAnswer">์ญ์?</button></span>
									<span class="rpl"><img class="modifyImg" src="/resources/board/pencil.png"><button type="button" class="modifyAnswer">์์?</button></span>
								
									<span class="rpl"><img class="commentImg" src="/resources/board/comment1.png">
									<input type="button" class="makeForm" name="${answer.answer_id }" value="๋ต๊ธ" /></span>
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
						<textarea id="text" class="form-control col-sm-12" name="text" placeholder="๋๊ธ์ ์๋?ฅํด์ฃผ์ธ์."></textarea>
              			<input type="submit" id="cmcnt-btn" name="cmcnt-btn" value="์๋ฃ" onclick="check_id()" />
        			</form>	
    			</div><br /><br />
    			
    			
    		<div class="divider-header-blank"></div>
			<button type="button" class="showContent" >๋ชฉ๋ก ๋ซ๊ธฐ</button>
			<div id="contents" style="display:'';">
			<table class="ListTable">
					<!-- ๊ฒ์๊ธ -->
					<c:forEach items="${boardReviewList }" var="boardReviewList">
					<tr class="con">
						<td>${boardReviewList.board_id }</td>
						<td class="content">
							<div class="content2">
							<c:forEach begin="1" end="${boardReviewList.bindent }">[๋ต๋ณ]</c:forEach>
							<a href="${pageContext.request.contextPath }/board/${boardReviewList.board_id}/${boardReviewList.member_id}/${boardReviewList.board_type_id}">${boardReviewList.title }</a>			
							<a class="Rcnt" href="${pageContext.request.contextPath }/board/replyContent/${boardReviewList.board_id}/${boardReviewList.member_id}/${boardReviewList.board_type_id}">&nbsp;&nbsp;${boardReviewList.cnt }</a>	
							</div>
						</td>
						<td class="content2"><a href="#" onclick="delchk();">${boardReviewList.member_id }</a></td>
						<td><fmt:formatDate value="${boardReviewList.board_date }" pattern="yyyy/MM/dd HH:mm"/></td>
					</tr>
					</c:forEach>
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


			<!-- ๊ฒ์ํ ๊ฒ์ bar -->
			<div class="search_board">
			<form action="${pageContext.request.contextPath}/searchBoard" method="get">	
				<select id="select" class="col-sm-3" name="searchType">
					<option value="title">์?๋ชฉ</option>
					<option value="2">์?๋ชฉ+๋ด์ฉ</option>
					<option value="3">๋ด์ฉ</option>
				</select>&nbsp;&nbsp;
				
				<!-- ๊ฒ์ ํค์๋ ์๋?ฅ -->
				<input id="board_keyword_search" class="col-sm-7" type="text" name="keyword" placeholder="๊ฒ์์ด๋ฅผ ์๋?ฅํ์ธ์."/>
				<button class="search_icon" type="submit"><i class="fa fa-search search-icon-in"></i></button>
			</form>


<%-- 			    <div class="container">
        			<label for="content">comment</label>
       				 <form id="writeReply" method="post" action="${pageContext.request.contextPath}/board/reply?${_csrf.parameterName}=${_csrf.token}">
       				 <input type="hidden" id="board_id" name="board_id" value="${bContentView.board_id }"/>
					 <input type="hidden" id="member_id" name="member_id" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}"/>
          			 <input type="hidden" id="_csrf" name="_csrf" value="${_csrf.token}"/>
					 <input type="hidden" id="_csrf_header" name="_csrf_header" value="${_csrf.headerName}"/>	
						<textarea id="text" class="form-control col-sm-11" name="text" placeholder="๋๊ธ์ ์๋?ฅํด์ฃผ์ธ์."></textarea>
              			 <input type="submit" id="cmcnt-btn" name="cmcnt-btn" class="btn-default text-primary" value="์๋ฃ" onclick="check_id()" /> 
        				 <!-- <button type="button" id="cmcnt-btn" class="btn-default text-primary" >์๋ฃ</button>  -->
        			</form>	
    			</div><br />
				
			    <div class="container">
        			<table class="table" id="add">
        			<c:forEach items="${bReply }" var="bReply">
        				<c:forEach items="${bReply.answerList }" var="answer">
        				<input type="hidden" class="answer_id" name="answer_id" value="${answer.answer_id }"/>
						<tr class="answerList" >
							<td>${answer.answer_id }</td>
							<td><img class="nav-profile-img" src='/resources/img/profile/${bImgPath.profile_img_path }' onerror="this.src='/resources/img/profile/default_profile_img.jpg'">&nbsp; ${answer.member_id } &nbsp;&nbsp;<fmt:formatDate value="${answer.answer_date }" pattern="yyyy/MM/dd hh:mm"/></td>
							<td>${answer.text }</td>
							<td>
									<input type="button" class="makeForm btn-primary" name="${answer.answer_id }" value="๋ต๊ธ" />
								<c:if test="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username eq answer.member_id }">
									<button type="button" class="btn-default text-primary" onclick="window.location.href='${pageContext.request.contextPath }/board/modify/${bContentView.board_id}&${bContentView.member_id }'">์์?</button>
									<button type="button" class="deleteAnswer btn-default text-primary">์ญ์?</button>
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
						<option>์?๋ชฉ</option>
						<option>์?๋ชฉ+๋ด์ฉ</option>
						<option>๋ด์ฉ</option>
					</select>&nbsp;&nbsp;
					<input class="form-control mr-sm-2" type="text" aria-label="Search" style="width:50%;">
					<button class="btn btn-outline-white btn-sm my-0" type="submit">
						<i class="fas fa-search"></i>
					</button>
				</form>
				</div> --%>
		</div>
	</div>
	<!-- Footer -->
	<%@ include file="/WEB-INF/views/includes/footer.jsp" %>
</body>
</html>