<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF_8">
<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>diary</title>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<!-- <script src="https://code.jquery.com/jquery-3.5.1.js"></script> -->
	
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"></script>

	<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@700;800&display=swap" rel="stylesheet">
  
	<link rel="stylesheet" href="${contextPath}/resources/css/font.css">
	<link rel="stylesheet" href="${contextPath}/resources/css/header.css">
	<link rel="stylesheet" href="${contextPath}/resources/css/footer.css">
	<link rel="stylesheet" href="${contextPath}/resources/css/main.css">

<style>
/* 모달 스타일 */
	.dialog{
    	width : 300px;
   	 	height : 50px;
    	float: left;
    	margin-left: 30px;
    	margin-botton: 10px;
	}

	.mainImg{
	    float: left;
	}
	
	.diary_img {
	width: 240px;
	height: 240px;
	object-fit: cover;
	display: block;
	border-radius:10px;
}

.popup_img {
	width: 300px;
	height: 300px;
	object-fit: cover;
}
	
</style>
 
<!-- csrf 토큰 -->
<!-- <script type="text/javascript">

	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	
	$(document).ajaxSend(function(e, xhr, options) {
		xhr.setRequestHeader(header, token);
	});
</script> -->

<script type="text/javascript">
/* 삭제 ajax */
	$(document).ready(function() {
		$(document).on("click", ".delete", function(event) {//※주의※		
			if (confirm("삭제하시겠습니까?")) {
				event.preventDefault();
				console.log("delete click");

				var token = $("meta[name='_csrf']").attr("content");
				var header = $("meta[name='_csrf_header']").attr("content");

				var tr = $(this).parent().parent().parent();

				$.ajax({
					type : "DELETE",
					url : $(this).attr("href"),
					cache : false,
					beforeSend : function(xhr) { /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
						console.log("header 실행 " + header + token)
						xhr.setRequestHeader(header, token);
					},
					success : function(result) {
						console.log("result : " + result);
						if (result == "SUCCESS") {
							alert("삭제하시겠습니까?");
							$(tr).remove();
						}
					},
					error : function(e) {
						alert("오류가 발생했습니다.");
						console.log(e);
					}
				}); // ajax end
			};
		}); // event end
	}); // ready end
</script>

<!-- 다른 플래너로 전환 -->
<script type="text/javascript">
	$(document).ready(function(){
		$(document).on("change","#selectDiary",function(event){
			
			var planner_id = this.value;
			console.log(planner_id);
			getList();
			
			function getList() {
				var url = "${pageContext.request.contextPath}/diary_other/"+planner_id;
				var token = $("meta[name='_csrf']").attr("content");
				var header = $("meta[name='_csrf_header']").attr("content");
				
				console.log(url);
			
				$.ajax({
					type: 'GET',
					url: url,
					cache : false,
					dataType: 'json',
			 		beforeSend : function(xhr){   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
						console.log("header 실행 "+header+token)
						xhr.setRequestHeader(header, token);
					}, 
					success: function(result) {
						console.log(result);
						$('#diaryDiv').children().remove();
		        	
						var htmls="";
					
		        		$("#diaryDiv").html("");	
		        		
		        		var content; //내용
	            		var splitedArray; //배열
	            		var linkedContent; //주소

		        		$(result).each(function(){	
		        		
			 		       	//다이어리
	 		  		      	htmls +='<div class="grid">';
			   		     	htmls +='<img src="resources/diary/'+this.img_path+'" data-toggle="modal" data-target="#myModal'+this.diary_id+'"/>';
			   		     	htmls +='<div class="grid__body">';    
			   		     	htmls +='<div class="mt-auto" >';
			 	 	      	htmls +='<span id= "'+this.diary_id+'"></span>';
			 	 	      	htmls +='</div></div></div>';
			       		 	
			   	
			        		//modal
			      		  	htmls +='<div class="modal fade" id="myModal'+ this.diary_id +'" role="dialog">';
			     		   	htmls +='<div class="modal-dialog modal-lg"><div class="modal-content"><div class="modal-header">';
			        		htmls +='<h3 class="modal-title" style="font-family: \'yg-jalnan\'">diary</h3>';
			      		  	htmls +='<button type="button" class="close" data-dismiss="modal">&times;</button></div>';
			      		  	htmls +='<div class="modal-body"><div id="mainImg">';
			      		  	htmls +='<img class="popup_img" src="resources/diary/'+this.img_path+'" style="position:relative; width: 400px; height: 400px;"/></div>';
			        		htmls +='<div class="dialog"><h4 style="font-family: \'yg-jalnan\'">'+this.diary_date+'</h4></div>';
			       		 	htmls +='<div class="dialog"><span id="modal'+ this.diary_id +'"></span></div><div class="dialog">'+this.text+'</div></div>';
			      		  	htmls +='<div class="modal-footer">';
			      		  	htmls +='<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>';
			      		  	htmls +='</div></div></div></div></div>';  
		      		  	
		      		  $("#diaryDiv").append(htmls);
		      		  	
		      		  console.log("너 안됨"+this.hashtag)
	            		content = this.hashtag;
	            		array = content.split("#");
	            		console.log(array);
	            		linkedContent = '';
	            		array.shift();//첫번째 지워주는 함수

	            		for(var word in array){
	            			word = array[word];
	            			if(word.indexOf("") == 0){ 
	            				var word2 = "#"+word;
	            				word = '<a href="${pageContext.request.contextPath}/search?keyword='+word+'">'+word2+'</a>'
	            				console.log(word);
	                	          console.log(word2);
	            			}//if end
	            			linkedContent += word+' ';
	            		}//for end
	                	 
	            		console.log(this.diary_id);
	            		$('#'+this.diary_id).append(linkedContent);
	            		$('#modal'+this.diary_id).append(linkedContent);
		      		  	
		        		});//result end
		        	}//sucess end
				});//ajax end
			}//getList end
		});//change
	});//document function
</script>

<script>
/* 작성 팝업 */
	function openwin() {
		window.open('about:blank','popwin',
		  'width=1250,height=800,toolbar=no, location=no, status=no, menubar=no, scrollbars=no, resizable=no, left=300, top=120');
  	document.formDate.submit();
	}//function end
</script>

 <script type="text/javascript">
 /* select box 새로운 플래너 값 고정 */
	$(document).ready(function(){
	
		var currPlanner_id= ${other.planner_id};  
		console.log("현재 플래너의 아이디 : "+ currPlanner_id);
	
		$("#selectDiary").val(currPlanner_id).prop("selected", true);
	}); 
 
</script> 

<script>
/* 해시태그 & 링크 */
	$(document).ready(function(){
		
		link();

	});//function end
	
	function link() {
		var content; //내용
		var splitedArray; //배열
		var linkedContent; //주소
		
		//jstl
	    <c:forEach items="${diary}" var="di"> 
    		console.log("${di.hashtag}")
			content = "${di.hashtag}";//# 해시태그
			splitedArray = content.split('#');//#으로 구분
			console.log(splitedArray);
			linkedContent = '';
			splitedArray.shift();//첫번째 지워주는 함수

			for(var word in splitedArray){
				word = splitedArray[word];
				if(word.indexOf("") == 0){ 
					var word2 = "#"+word;
					word = '<span class="grid__tag" ><a style="color:black;" href="${pageContext.request.contextPath}/search?keyword='+word+'">'+word2+'</a></span>&nbsp;'
					console.log(word);
    	          	console.log(word2);
				}//if end
				linkedContent += word+' ';
			}//for end
    	    
			$("#${di.diary_id}").append(linkedContent);
			$("#modal${di.diary_id}").append(linkedContent);
    	
		</c:forEach>

		};
		
/* 해시태그 & 링크 끝 */
</script>

<script>

function d(){
	console.log("dddddd");
}


</script>

<style>

/* 사진 */
.masonry {
  columns: 4;
  column-gap: 16px;
}
@media (max-width: 1200px) {
  .masonry {
    columns: 3;
  }
}
@media (max-width: 992px) {
  .masonry {
    columns: 2;
  }
}
.masonry .grid {
  display: inline-block;
  margin-bottom: 16px;
  position: relative;
}
.masonry .grid:before {
  border-radius: 5px;
  content: "";
  position: absolute;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  background-color: rgba(0, 0, 0, 0.2);
}
.masonry .grid img {
  width: 100%;
  border-radius: 5px;
}
.masonry .grid__title {
  font-size: 28px;
  font-weight: bold;
  margin: 0px 0px 10px 0px;
}
.masonry .grid__author {
  font-size: 14px;
  font-weight: 300;
}
.masonry .grid__link {
  position: absolute;
  left: 0;
  right: 0;
  top: 0;
  bottom: 0;
}
.masonry .grid__body {
  position: absolute;
  left: 0;
  right: 0;
  top: 0;
  bottom: 0;
  padding: 30px 30px;
  color: #fff;
  display: flex;
  flex-direction: column;
}
.masonry .grid__tag {
  background-color: rgba(255, 255, 255, 0.6);
  color: #333;
  border-radius: 5px;
  padding: 5px 15px;
  margin-bottom: 5px;
}

.mt-auto {
  margin-top: auto;
}

.gallery{

padding-left:10px;
padding-right:10px;

}

</style>

</head>
<body>

	<!-- 해더 -->
	<%@ include file="/WEB-INF/views/includes/header.jsp"%>
	
	<!-- 플래너 셀렉트, 다이어리 작성 -->

	<div class = "gallery">

		<form action ="${pageContext.request.contextPath}/diary_write_view" method="get" target="popwin" name="formDate">
			<div class="row">
				<div class="col-sm-10"> 
					<select class="form-control" name="planner_id" id="selectDiary" style="font-family: 'yg-jalnan'">
						<c:forEach var="id" items="${planner}">
							<option value='${id.planner_id}' style="font-family: 'yg-jalnan'">
						  		${id.planner_name}&nbsp;&nbsp; ${id.start_date}&nbsp;&nbsp;~&nbsp;&nbsp;${id.end_date}
							</option>
						</c:forEach>
					</select>		
				</div>
				<div class="col-sm-2">
					<input class="form-control" value="다이어리 작성" style="font-family: 'yg-jalnan'" type="button" class="btn btn-outline-warning bg-warning text-white" onclick="openwin();"/>
					<br/>    
		    	</div>
		     </div>
		</form><!-- 다이어리 작성을 위한 form -->

		<div class="masonry">
			<div id="diaryDiv">
	
				<c:forEach items="${diary}" var="di">
	
				  <div class="grid">
				    <img src='resources/diary/${di.img_path}' />
				    <div class="grid__body" data-toggle="modal" data-target="#myModal${di.diary_id}" >
				      <div class="mt-auto" >
				        <span id= "${di.diary_id}"></span>
				      </div>
				    </div>
				  </div>
	  
				  <div class="modal fade" id="myModal${di.diary_id}" role="dialog">
						<div class="modal-dialog modal-lg">
							<div class="modal-content">
								<div class="modal-header">
									<h3 class="modal-title" style="font-family: 'yg-jalnan'">diary</h3>
									<button type="button" class="close" data-dismiss="modal">&times;</button>  
								</div>
								<div class="modal-body" >
									<div class="mainImg">
									<img class="popup_img" src='resources/diary/${di.img_path}' style='position:relative; width: 400px; height: 400px;'/>
								</div>		
									<div class="dialog"><h4 style="font-family: 'yg-jalnan'">${di.diary_date}</h4></div>
				        			<div class="dialog"><span id= "modal${di.diary_id}"></span></div>
				       				<div class="dialog">${di.text}</div>
				      			</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
								</div>
				      	  	</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>

	<!-- footer -->
	<%@ include file="/WEB-INF/views/includes/footer.jsp"%>

</body>
</html>