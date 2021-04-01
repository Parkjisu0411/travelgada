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

<style>
/* 모달 스타일 */
	.dialog{
    	width : 300px;
   	 	height : 50px;
    	float: left;
    	margin-left: 30px;
    	margin-botton: 10px;
	}

	#mainImg{
	    float: left;
	}
	
</style>

<style>
.diary_img {
	width: 240px;
	height: 240px;
	object-fit: cover;
	display: block;
	margin: 0px auto;
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
     
<!-- 삭제 ajax -->
<script type="text/javascript">
    	
	$(document).ready(function(){
		$(document).on("click",".delete",function(event){				
			event.preventDefault();
			console.log("delete click");
			
			var token = $("meta[name='_csrf']").attr("content");
			var header = $("meta[name='_csrf_header']").attr("content");
				
			var tr = $(this).parent().parent().parent();
				
			$.ajax({
				type : "DELETE",
				url : $(this).attr("href"),
				cache : false,
		 		beforeSend : function(xhr){   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
					console.log("header 실행 "+header+token)
					xhr.setRequestHeader(header, token);
				}, 
				success : function(result){
					console.log("result : " + result );
					if(result == "SUCCESS"){
						alert("삭제하시겠습니까?");
						$(tr).remove();
					}
				},
				error : function(e){
					alert("오류가 발생했습니다.");
					console.log(e);
				}
			}); // ajax end
		}); // event end
	}); // ready end
</script>
	
<!-- 다른 플래너로 전환 -->
<script type="text/javascript">
	$(document).ready(function(){
		$("#selectDiary").on('change',function(){
			
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
					//console.log(result);
						$('#diaryDiv').children().remove();
		        	
						var htmls="";
					
		        		$("#diaryDiv").html("");	

		        		$(result).each(function(){	
		        		
		 		       	//다이어리
 		  		      	htmls +='<div class="col-sm-3">';
		   		     	htmls +='<div class="dropdown">';
		   		     	htmls +='<img src="resources/diary/dot3.png" class="btn dropdown-toggle" data-toggle="dropdown" style="height: 20px;float: right;"/>';    
		   		     	htmls +='<div class="dropdown-menu">';
		 	 	      	htmls +='<a class="dropdown-item" onclick="window.open(\'${pageContext.request.contextPath}/diary_modify_view/'+this.diary_id+'&'+this.planner_id+'\',\'popwin2\',\'width=1250,height=800,left=300, top=120\')">수정</a>';
		 	 	      	htmls +='<a class="delete dropdown-item" href="diary/'+ this.diary_id +'">삭제</a>';
		       		 	htmls +='</div></div>';
		     		   	htmls +='<table class="table table-borderless">';
		      		  	htmls +='<tr class="table-light">';
		      		  	htmls +='<td><div>';
		      		  	htmls +='<img class="diary_img" src="resources/diary/'+ this.img_path +'" data-toggle="modal" data-target="#myModal'+ this.diary_id +'"/>';
		    	    	htmls +='</div></td></tr>';
		       		 	htmls +='<tr class="table-light"><td>'+ this.diary_date +'</td></tr>';
		     		   	htmls +='<tr class="table-light"><td>'+ this.hashtag +'</td></tr></table></div>';
		        	
		        		//modal
		      		  	htmls +='<div class="modal fade" id="myModal'+ this.diary_id +'" role="dialog">';
		     		   	htmls +='<div class="modal-dialog modal-lg"><div class="modal-content"><div class="modal-header">';
		        		htmls +='<h3 class="modal-title" style="font-family: \'yg-jalnan\'">diary</h3>';
		      		  	htmls +='<button type="button" class="close" data-dismiss="modal">&times;</button></div>';
		      		  	htmls +='<div class="modal-body"><div id="mainImg">';
		      		  	htmls +='<img class="popup_img" src="resources/diary/'+this.img_path+'" style="position:relative; width: 400px; height: 400px;"/></div>';
		        		htmls +='<div class="dialog"><h4 style="font-family: \'yg-jalnan\'">'+this.diary_date+'</h4></div>';
		       		 	htmls +='<div class="dialog">'+this.hashtag+'</div><div class="dialog">'+this.text+'</div></div>';
		      		  	htmls +='<div class="modal-footer">';
		      		  	htmls +='<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>';
		      		  	htmls +='</div></div></div></div></div>';  
		      		  	
						
		        		});//result end
		        		
		        		//console.log(htmls);
		        	
		        		$("#diaryDiv").append(htmls); 
		        	
		        	}//sucess end
				});//ajax end
			}//getList end
		});//change
	});//document function
</script>

<!-- 작성 팝업 -->
<script>
	function openwin() {
		window.open('about:blank','popwin',
		  'width=1250,height=800,toolbar=no, location=no, status=no, menubar=no, scrollbars=no, resizable=no, left=300, top=120');
  	document.formDate.submit();
	}//function end
</script>

 <script type="text/javascript">
  $(document).ready(function(){
	
	 var currPlanner_id= ${other.planner_id};  
	console.log("현재 플래너의 아이디 : "+ currPlanner_id);
	
	$("#selectDiary").val(currPlanner_id).prop("selected", true);
}); 
 
</script> 

</head>
<body>

<!-- 해더 -->
<%@ include file="/WEB-INF/views/includes/header.jsp"%>

<!-- 플래너 셀렉트, 다이어리 작성 -->
<div class="container">
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


	<!-- 다이어리  -->
	<div class="row"  id="diaryDiv">
		<!-- 다이어리 반복문 -->
		<c:forEach items="${diary}" var="dto">
			<!-- ajax 써야 하는 부분 -->
			<div class="col-sm-3"> 
				<!-- 다이어리 수정, 삭제 -->
   				<div class="dropdown" >
    				<img src="resources/diary/dot3.png" class="btn dropdown-toggle" data-toggle="dropdown" style='height: 20px;float: right;'/>
    				<div class="dropdown-menu" >
      					<a class="dropdown-item" onclick="window.open('${pageContext.request.contextPath}/diary_modify_view/${dto.diary_id}&${dto.planner_id}',
      					'popwin2','width=1250,height=800,left=300, top=120')">수정</a>
      					<a class="delete dropdown-item" href="diary/${dto.diary_id}">삭제</a>
    				</div>
  				</div>
  				<!-- 다이어리 테이블 -->
  				<table class="table table-borderless">
					<tr class="table-light">
      					<td>
      						<div >
      							<!-- 다이어리 이미지 -->
      							<img class='diary_img' src='resources/diary/${dto.img_path}' data-toggle="modal" data-target="#myModal${dto.diary_id}"/>
							</div>
						</td>
					</tr> 
					<tr class="table-light">
      					<td>${dto.diary_date}</td>
					</tr>
					<tr class="table-light">
      					<td>${dto.hashtag}</td>
					</tr>
				</table>
			</div> 
					
	<!-- Modal -->
	<!-- 	<div class="row justify-content-center"> -->

	<div class="modal fade" id="myModal${dto.diary_id}" role="dialog">
		<!-- <div class="mySlides"> -->
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title" style="font-family: 'yg-jalnan'">diary</h3>
					<button type="button" class="close" data-dismiss="modal">&times;</button>  
				</div>
				<div class="modal-body" >
					<div id="mainImg">
					<img class="popup_img" src='resources/diary/${dto.img_path}' style='position:relative; width: 400px; height: 400px;'/>
				</div>		
					<div class="dialog"><h4 style="font-family: 'yg-jalnan'">${dto.diary_date}</h4></div>
        			<div class="dialog">${dto.hashtag}</div>
       				<div class="dialog">${dto.text}</div>
      			</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
      	  </div>
		</div>
	</div>

<!-- <a class="prev" onclick="plusSlides(-1)">❮</a>
<a class="next" onclick="plusSlides(1)">❯</a> -->
		
		</c:forEach><!-- 다이어리,모달 반복문 끝 -->
	</div>
</div><!-- container 끝 -->

<!-- footer -->
<%@ include file="/WEB-INF/views/includes/footer.jsp"%>

</body>
</html>