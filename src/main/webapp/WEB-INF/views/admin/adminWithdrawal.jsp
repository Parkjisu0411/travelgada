<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>

<title>관리자</title>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/jquery-date-range-picker/0.21.1/daterangepicker.min.css"
		integrity="sha512-nmvKZG8E3dANbZAsJXpdK6IqpfEXbPNbpe3M3Us1qTipq74IpTRShbpCf8lJFapB7e0MkDbNDKxLjS1VWt2vVg=="
		crossorigin="anonymous" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-date-range-picker/0.21.1/jquery.daterangepicker.min.js"
    	integrity="sha512-jM36zj/2doNDqDlSIJ+OAslGvZXkT+HrtMM+MMgVxCqax1AIm1XAfLuUFP7uMSavUxow+z/T2CRnSu7PDaYu2A=="
    	crossorigin="anonymous"></script>
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>-->
 	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@700;800&display=swap" rel="stylesheet">
	
	<link rel="stylesheet" href="${contextPath}/resources/css/font.css">
	<link rel="stylesheet" href="${contextPath}/resources/css/header.css">
	<link rel="stylesheet" href="${contextPath}/resources/css/footer.css">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style>
/* 테이블 스타일 */
	/* pw */
	.pwWidth{
		width: 100px;
		overflow: hidden;
		text-overflow: ellipsis;
	}
</style>

<script type="text/javascript">
/* 회원 되돌리기 */
	function returnMember(member_id){
				event.preventDefault();
				console.log("delete click");
				
				var member_id = member_id;
				console.log(member_id);
				
				var withdrawal_code = 0;
				console.log(withdrawal_code);

				var token = $("meta[name='_csrf']").attr("content");
				var header = $("meta[name='_csrf_header']").attr("content");
				
				var tr = $('#tr_'+member_id);
				var htmls="";
				
				var form = {
						member_id : member_id,
						withdrawal_code : withdrawal_code,
		           };

				$.ajax({
					type : "PUT",
					url : "/withdrawalMember",
					cache : false,
					contentType:'application/json; charset=utf-8',
		            data: JSON.stringify(form), 
					beforeSend : function(xhr) { 
						console.log("header 실행 " + header + token)
						xhr.setRequestHeader(header, token);
					},
					success : function(result) {
						console.log("result : " + result);
						if (result == "SUCCESS") {
							$(tr).remove();
							
						}
					},
					error : function(e) {
						alert("오류가 발생했습니다.");
						console.log(e);
					}
				}); // ajax end
			
		}; // event end
		
	
</script>

</head>

<body>

	<!-- Header -->
	<%@ include file="/WEB-INF/views/includes/header.jsp"%>
	
	<br/><br/>	
	
	<!--Content -->
	<div class="container">
		<span class="headline" style="font-family: 'yg-jalnan'; font-size:30px;">
			<a href="/admin">회원 관리</a>
		</span> &nbsp;
		
		<span><a href="/admin/withdrawal">탈퇴한 회원</a></span>
		<br/>
		탈퇴사유  &nbsp;&nbsp;
		1 : 홍보성 글 작성&nbsp;&nbsp;
		2 : 부적절한 글 작성&nbsp;&nbsp;
		3 : ??&nbsp;&nbsp;
		4 : 기타&nbsp;&nbsp;
		<br/>
		총 회원 수 : ${total} &nbsp;&nbsp; 탈퇴한 회원 수 : ${withdrawal} 
		<table class="table">
			<thead>
				<tr>
					<th>이름</th>
					<th>아이디</th>
					<th>sns 타입</th>
					
					<th>이메일</th>
					<th>휴대폰</th>
					<th>탈퇴여부</th>
					<th>탈퇴사유</th>
					<th>관리</th>
				</tr>
			</thead>
				<tbody> <!-- 탈퇴한 회원은 선 끄어야 한다. --> 
				
					<c:forEach items="${memberList}" var="member" varStatus="status">
						<tr id = "tr_${member.member_id}">
							<td>${member.member_name }</td>
							<td>${member.member_id }</td>
							<td>
															<c:choose>
    								<c:when test="${member.sns_type eq null}">
        								일반
    								</c:when>
    								<c:otherwise>
        								${member.sns_type }
    								</c:otherwise>
								</c:choose>
							
							
							</td>
							
							<td>${member.email }</td>
							<td>${member.phone_num }</td>
							<td>						
								<c:choose>
    								<c:when test="${member.withdrawal_flag eq 0}">
        								회원
    								</c:when>
    								<c:otherwise>
        								탈퇴
    								</c:otherwise>
								</c:choose>
							</td>
							<td>
								<c:choose>
    								<c:when test="${member.withdrawal_code eq 1}">
        								홍보성 글 작성
    								</c:when>
    								<c:when test="${member.withdrawal_code eq 2}">
        								부적절한 글 작성
    								</c:when>
    								<c:when test="${member.withdrawal_code eq 3}">
        								??
    								</c:when>
    								<c:when test="${member.withdrawal_code eq 4}">
        								기타
    								</c:when>
    								<c:otherwise>
        								
    								</c:otherwise>
								</c:choose>
							
							
							</td>
							<td id= "btn_${member.member_id}">
								<c:choose>
    								<c:when test="${member.withdrawal_flag eq 0}">
        								<button type="button" data-toggle="modal" data-target="#withdrawal_${member.member_id }">탈퇴</button>
    								</c:when>
    								<c:otherwise>
        								<button type="button" data-toggle="modal" data-target="#return_${member.member_id }">되돌리기</button>
    								</c:otherwise>
								</c:choose>
							</td>
						</tr>
					</c:forEach>
				
				</tbody>
			</table>
			
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

	</div>
	<!--Content end -->
	
	<c:forEach items="${memberList}" var="member" varStatus="status">
	<!-- 회원 탈퇴 -->
	 <!-- The Modal -->
  <div class="modal" id="withdrawal_${member.member_id}">
    <div class="modal-dialog">
      <div class="modal-content"> 
     <!--  <form action= "/withdrawal" method="post" class="withdrawal"> -->
      <input class="withdrawalMember" type= "hidden" name="member_id" value="${member.member_id}">
        <!-- Modal body -->
        <div class="modal-body">
        
          <div>${member.member_id}님을 정말 탈퇴시키겠습니까?</div>
          <select name="withdrawal_code" id="select_${member.member_id}">
          	<option value="1" >홍보성 글 작성</option>
          	<option value="2" >부적절한 글 작성</option>
          	<option value="3" >??</option>
          	<option value="4" >기타</option>
          </select>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
        	<button type="submit" class="btn btn-danger" data-dismiss="modal" onclick="widthrawal('${member.member_id}')">확인</button>
          <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
        </div>
       <!--  </form> -->
      </div>
    </div>
  </div>
  
  <!-- 회원 되돌리기 -->
  	 <!-- The Modal -->
  <div class="modal" id="return_${member.member_id }">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->

        
        <!-- Modal body -->
        <div class="modal-body">
          <div>${member.member_id }님을 다시 회원으로 되돌리시겠습니까?</div>
          회원 탈퇴 사유 : 
          
          <c:choose>
    								<c:when test="${member.withdrawal_code eq 1}">
        								홍보성 글 작성
    								</c:when>
    								<c:when test="${member.withdrawal_code eq 2}">
        								부적절한 글 작성
    								</c:when>
    								<c:when test="${member.withdrawal_code eq 3}">
        								??
    								</c:when>
    								<c:when test="${member.withdrawal_code eq 4}">
        								기타
    								</c:when>
								</c:choose>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
        	<button type="button" class="btn btn-danger" data-dismiss="modal" onclick="returnMember('${member.member_id}')">확인</button>
          <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
        </div>
        
      </div>
    </div>
  </div>
  </c:forEach>
	<!-- Footer -->
	<%@ include file="/WEB-INF/views/includes/footer.jsp"%>

</body>
</html>