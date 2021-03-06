<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="en">
<head>

	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
	<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
	<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>
  
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-date-range-picker/0.21.1/daterangepicker.min.css" integrity="sha512-nmvKZG8E3dANbZAsJXpdK6IqpfEXbPNbpe3M3Us1qTipq74IpTRShbpCf8lJFapB7e0MkDbNDKxLjS1VWt2vVg==" crossorigin="anonymous" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-date-range-picker/0.21.1/jquery.daterangepicker.min.js" integrity="sha512-jM36zj/2doNDqDlSIJ+OAslGvZXkT+HrtMM+MMgVxCqax1AIm1XAfLuUFP7uMSavUxow+z/T2CRnSu7PDaYu2A==" crossorigin="anonymous"></script>
    	
	<!-- simplebar CSS-->
 	<link href="/resources/assets/plugins/simplebar/css/simplebar.css" rel="stylesheet"/>
	<!-- Bootstrap core CSS-->
	<link href="/resources/assets/css/bootstrap.min.css" rel="stylesheet"/>
	<!-- Icons CSS-->
	<link href="/resources/assets/css/icons.css" rel="stylesheet" type="text/css"/>
	<!-- Sidebar CSS-->
	<link href="/resources/assets/css/sidebar-menu.css" rel="stylesheet"/>
	<!-- Custom Style-->
	<link href="/resources/assets/css/app-style.css" rel="stylesheet"/>
	<!-- simplebar js -->
	<script src="/resources/assets/plugins/simplebar/js/simplebar.js"></script>
	<!-- sidebar-menu js -->
	<script src="/resources/assets/js/sidebar-menu.js"></script>
	<!-- animate CSS-->
	<link href="/resources/assets/css/animate.css" rel="stylesheet" type="text/css"/>
	<!-- Custom scripts -->
	<script src="/resources/assets/js/app-script.js"></script>

  	<link rel="stylesheet" href="${contextPath}/resources/css/font.css">
	<link rel="stylesheet" href="${contextPath}/resources/css/footer.css">
	
	<!-- Bootstrap core JavaScript-->
	<script src="/resources/assets/js/jquery.min.js"></script>
	<script src="/resources/assets/js/popper.min.js"></script>
	<script src="/resources/assets/js/bootstrap.min.js"></script>
	
	<!-- Font Awesome -->
	<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
	
	<link rel="shortcut icon" type="image/x-icon" href="/resources/img/main/logo.png">
  
	<title>?????? ??????</title>
  
<style>
/* ????????? ?????? */
.selected {
	text-decoration: line-through grey;
	color: red;
}
/* ?????? ??? */
#searchMember {
	text-align: right;
}
/* ?????? ?????? */
.bg-modal {
	background-color: black;
}

/* ?????? ?????? ???*/
#memberKeyword {
	color: white;
}
</style>

<script type="text/javascript">
/* ?????? ?????? */
	function widthrawal(member_id){
		event.preventDefault();
		console.log("delete click");
		
		//member_id
		var member_id = member_id;
		console.log(member_id);
				
		var withdrawal_code = $("#select_"+member_id).val();
		console.log(withdrawal_code);
		
		var tr = $('#tr_'+member_id);
		var htmls="";
		var tdHtmls="";
				
		var form = {
			member_id : member_id,
			withdrawal_code : withdrawal_code
		};

		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
				
		$.ajax({
			type : "PUT",
			url : "/admin/member/withdrawal",
			cache : false,
			contentType:'application/json; charset=utf-8',
            data: JSON.stringify(form), 
			beforeSend : function(xhr) { 
				console.log("header ?????? " + header + token)		
				xhr.setRequestHeader(header, token);
			},
			success : function(result) {
				console.log("result : " + result);
				if (result == "SUCCESS") {
					$(tr).addClass("selected");
					$("#btn_"+member_id).children().remove();
					$("#td_"+member_id).children().remove();
					
					htmls += '<button type="button" class=" btn-light btn-round px-5" data-toggle="modal" data-target="#return_'+member_id+'">????????????</button>'
					tdHtmls += '<div>??????</div>'
					
					$("#btn_"+member_id).append(htmls);
					$("#td_"+member_id).append(tdHtmls);
					
				}
			},
			error : function(e) {
				alert("????????? ??????????????????.");
				console.log(e);
			}
		}); // ajax end	
	}; // function end
		
/* ?????? ?????? */	
</script>

<script type="text/javascript">
/* ?????? ???????????? */
	function returnMember(member_id){
		event.preventDefault();
		console.log("delete click");
				
		var member_id = member_id;
		console.log(member_id);
				
		var withdrawal_code = 0;
		console.log(withdrawal_code);
		
		var tr = $('#tr_'+member_id);
		var htmls="";
		var tdHtmls="";// ??????/??????
		
		var form = {
				member_id : member_id,
				withdrawal_code : withdrawal_code
        };

		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
				
		$.ajax({
			type : "PUT",
			url : "/admin/member/withdrawal",
			cache : false,
			contentType:'application/json; charset=utf-8',
			data: JSON.stringify(form), 
			beforeSend : function(xhr) { 
				console.log("header ?????? " + header + token)
				xhr.setRequestHeader(header, token);
			},
			success : function(result) {
				console.log("result : " + result);
				if (result == "SUCCESS") {
					
					$(tr).removeClass("selected");
					$("#btn_"+member_id).children().remove();
					$("#td_"+member_id).children().remove();
							
					htmls += '<button type="button" class=" btn-light btn-round px-5" data-toggle="modal" data-target="#withdrawal_'+member_id+'">??????</button>'
					tdHtmls += '<div>??????</div>'
					
					$("#btn_"+member_id).append(htmls);
					$("#td_"+member_id).append(tdHtmls);
							
				}
			},
			error : function(e) {
				alert("????????? ??????????????????.");
				console.log(e);
			}
		}); // ajax end	
	}; // function end
/* ???????????? */
</script>

<script type="text/javascript">
/* ??? ?????? */
	$(document).ready(function(){
	
		console.log("selected");
		var tr;
    
    	<c:forEach items="${memberList}" var="member">
    		if(${member.withdrawal_flag} == 1){
    			tr = $("#tr_${member.member_id}");
    			$(tr).addClass("selected");
    		}
		</c:forEach>
	
	});
</script>

</head>

<body class="bg-theme bg-theme9">

	<!-- Start wrapper-->
 	<div id="wrapper">
		
		<!--Start sidebar-wrapper-->
		<div id="sidebar-wrapper" data-simplebar="" data-simplebar-auto-hide="true">
			<div class="brand-logo">
				<a href="/" style="font-family:yg-jalnan"><img src="/resources/img/main/logo.png" class="logo-icon" alt="logo icon">??????</a>
			</div>
   				<ul class="sidebar-menu do-nicescrol">
      				<li>
        				<a href="/admin/member">
          					<i class="fas fa-user-cog"></i> <span>?????? ??????</span>
        				</a>
      				</li>
      				<li>
        				<a href="/admin/room">
          					<i class="fas fa-comment-dots"></i> <span>1:1 ?????? ??????</span>
        				</a>
      				</li>
					<li>
						<a href="/admin/statistic/visitor">
							<i class="fas fa-chart-line"></i> <span>????????? ??????</span>
						</a>
					</li>
					<li>
						<a href="/admin/statistic/sales">
							<i class="fas fa-hand-holding-usd"></i> <span>?????? ??????</span>
						</a>
					</li>
					<li>
						<a href="/admin/statistic/destination">
							<i class="fas fa-globe-americas"></i> <span>????????? ??????</span>
						</a>
					</li>
				</ul>
		</div>
		<!--End sidebar-wrapper-->
	
		<div class="content-wrapper">
			<div class="container-fluid">
			
			<span class="headline" style="font-family: 'yg-jalnan'; font-size:30px;">
				<a href="/admin/member">?????? ??????</a>
			</span> &nbsp; 
			
 			<span><a href="/admin/member/withdrawal">????????? ??????</a></span> &nbsp;&nbsp;
	
			<!-- ?????? -->
			<div id="searchMember">
				<form class="search-bar" action="${pageContext.request.contextPath}/admin/member/search" method="get">			
					<input id="memberKeyword" class="col-2" type="text" class="form-control" name="keyword" placeholder="?????? ??????" value="${keyword}"/>
					<button type="submit" class="searchM-btn btn-light"><i class="icon-magnifier"></i></button>
				</form>
			</div>
			
				<!-- member list ????????? -->
				<div class="row mt-3">
					<div class="col-lg-12">
						<div class="card">
							<div class="card-body">
              					<div class="table-responsive">
              						<span style="color:white;">??? ?????? ??? : ${total} &nbsp;&nbsp; ????????? ?????? ??? : ${withdrawal} </span>
								<!-- member list -->
								<table class="table">
									<thead>
										<tr>
											<th>??????</th>
											<th>?????????</th>
											<th>sns ??????</th>
											<th>?????????</th>
											<th>?????????</th>
											<th>??????/??????</th>
											<th>??????</th>
										</tr>
									</thead>
										<tbody>
											<c:forEach items="${memberList}" var="member" varStatus="status">
												<tr id = "tr_${member.member_id}">
													<td>${member.member_name }</td>
													<td><a href="/admin/member/search/${member.member_id }">${member.member_id }</a></td>
													<td>
														<c:choose>
						    								<c:when test="${member.sns_type eq null}">
						        								??????
						    								</c:when>
						    								<c:otherwise>
						        								${member.sns_type }
						    								</c:otherwise>
														</c:choose>
													</td>
													<td>${member.email }</td>
													<td>${member.phone_num }</td>
													<td id= "td_${member.member_id}">
														<div>					
															<c:choose>
						    									<c:when test="${member.withdrawal_flag eq 0}">
						        									??????
						    									</c:when>
						    									<c:otherwise>
						        									??????
						    									</c:otherwise>
															</c:choose>
														</div>	
													</td>
													<td id= "btn_${member.member_id}">
														<c:choose>
						    								<c:when test="${member.withdrawal_flag eq 0}">
						        								<button type="button" class=" btn-light btn-round px-5" data-toggle="modal" data-target="#withdrawal_${member.member_id }">??????</button>
						    									
						    								</c:when>
						    								<c:otherwise>
						        								<button type="button" class=" btn-light btn-round px-5" data-toggle="modal" data-target="#return_${member.member_id }">????????????</button>
						    								</c:otherwise>
														</c:choose>
													</td>
												</tr>
											</c:forEach>			
										</tbody>
									</table>
			     				</div>
            				</div>
          				</div>
          			</div>
          		</div>	
				<!-- member list ????????? end -->
				
				<!-- ????????? -->
				<ul class="pagination" style="padding:80px 500px;">	
			  		<c:if test="${pageMaker.prev}">
		       		  <li class="page-item"><a class="page-link" href="${pageMaker.makeQuery(pageMaker.startPage - 1) }">prev</a></li>
		     		</c:if>
		      		<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
		         		<li class="page-item"><a class="page-link" href="${pageMaker.makeQuery(idx)}">${idx}</a></li>
		      		</c:forEach>
		      		<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
		         		<li class="page-item"><a class="page-link" href="${pageMaker.makeQuery(pageMaker.endPage +1) }">next</a></li>
		      		</c:if>
			 	</ul>
				 <!-- ????????? ??? -->
		 
	
	<!-- The Modal -->
	<c:forEach items="${memberList}" var="member" varStatus="status">
	<!-- ?????? ?????? -->
	<div class="modal" id="withdrawal_${member.member_id}">
    	<div class="modal-dialog ">
			<div class="modal-content bg-modal"> 
        		<!-- Modal body -->
        		<div class="modal-body">
        			<br/>
          			<div>
          				<span style="color:green; font-size:22px; font-weight:border;">${member.member_id}</span> 
          				<span style="color:white;">?????? ?????? ?????????????????????????</span></div>
          			<br/>
          		
          			<select name="withdrawal_code" id="select_${member.member_id}">
          				<option value="1" style="background : white;" >???????????? ?????? ?????????</option>
          				<option value="2" style="background : white;">????????? ?????? ??????????????? ???????????? ??????</option>
        			  	<option value="3" style="background : white;">????????????/????????? ?????? ??? ????????? ??????</option>
        			  	<option value="4" style="background : white;">??????</option>
       			   </select>
       		   </div>
        
        		<!-- Modal footer -->
        		<div class="modal-footer">
        			<button type="submit" class="btn-danger btn-round px-5" data-dismiss="modal" onclick="widthrawal('${member.member_id}')">??????</button>
          			<button type="button" class=" btn-round px-5" data-dismiss="modal">??????</button>
        		</div>
      		</div>
    	</div>
  	</div>
  	<!-- ?????? ?????? ??? -->
  
	<!-- ?????? ???????????? -->
	<!-- The Modal -->
	<div class="modal" id="return_${member.member_id }">
    	<div class="modal-dialog">
      		<div class="modal-content bg-modal">
				<!-- Modal body -->
        		<div class="modal-body">
        			<br/>
          			<div>
          				<span style="color:green; font-size:22px; font-weight:border;">${member.member_id }</span> 
          				<span style="color:white;">?????? ?????? ???????????? ?????????????????????????</span>
          			</div>
          			<br/>
          			<span style="color:white;">
          				?????? ?????? ?????? : 
          					<c:choose>
    							<c:when test="${member.withdrawal_code eq 1}">
        							???????????? ?????? ?????????
    							</c:when>
    							<c:when test="${member.withdrawal_code eq 2}">
        							????????? ?????? ??????????????? ???????????? ??????
    							</c:when>
    							<c:when test="${member.withdrawal_code eq 3}">
        							????????????/????????? ?????? ??? ????????? ??????
    							</c:when>
    							<c:when test="${member.withdrawal_code eq 4}">
        							??????
    							</c:when>
							</c:choose>
					</span>
        		</div>
        		
        		<!-- Modal footer -->
        		<div class="modal-footer">
        			<button type="button" class=" btn-danger btn-round px-5" data-dismiss="modal" onclick="returnMember('${member.member_id}')">??????</button>
          			<button type="button" class=" btn-round px-5" data-dismiss="modal">??????</button>
        		</div>
      		</div>
      	</div>
	</div>
	</c:forEach>
	<!-- ?????? ?????? ??? -->
	
			</div><!-- content-wrapper end -->
		</div><!-- container-fluid end-->

	<!--start color switcher - ?????? ????????? -->
	<div class="right-sidebar">
		<div class="switcher-icon">
			<i class="zmdi zmdi-settings zmdi-hc-spin"></i>
		</div>
		<div class="right-sidebar-content">
	
			<p class="mb-0">Gaussion Texture</p>
			<hr>
	      
			<ul class="switcher">
				<li id="theme1"></li>
				<li id="theme2"></li>
				<li id="theme3"></li>
				<li id="theme4"></li>
				<li id="theme5"></li>
				<li id="theme6"></li>
			</ul>
	
			<p class="mb-0">Gradient Background</p>
			<hr>
		
			<ul class="switcher">
				<li id="theme7"></li>
				<li id="theme8"></li>
				<li id="theme9"></li>
				<li id="theme10"></li>
				<li id="theme11"></li>
				<li id="theme12"></li>
				<li id="theme13"></li>
				<li id="theme14"></li>
				<li id="theme15"></li>
			</ul>
		</div>
	</div>
	<!--end color switcher - ?????? ????????? -->
	
	</div><!--End wrapper-->
  
</body>

</html>
