<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="ko">
<head>
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
<link rel="stylesheet" href="${contextPath}/resources/css/utils.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>EnrollForm</title>
<style>
	hr {
		background-color: #1DCAD3;
	}
	
	body {
		font-family: 'IBMPlexSansKR-Light';
		background-color: #f5f5f5;
	}
	
	input {
		width: 100% !important;
		margin-bottom: 10px;
		border-radius: 30px !important;
	}
	
	th {
		padding-left: 20px;
	}
	
	#postcode {
		width: 50% !important;
		display: inline !important;
	}
	
	#postcode-btn {
		width: 40%;
	}
	
	table {
		margin: auto;
	}
	
	.gada-btn-group {
		text-align: center;
	}
</style>
<script>
	$(document).ready(function() {
		$("#enroll-cancel-btn").click(function(e) {
			e.preventDefault();
			window.close();
		})
		
		$("#enroll-submit-btn").click(function(e) {
			e.preventDefault();
			var form = {
				member_id : $("#id").text(),
				shipping_loc_name : $("#name").val(),
				receiver : $("#receiver").val(),
				receiver_phone_num : $("#phone").val(),
				zip_code : $("#postcode").val(),
				address : $("#address").val(),
				address_detail : $("#address_detail").val()
			};
			
			$.ajax({
				type : "POST",
				url : "/member/shipping",
				data : JSON.stringify(form),
				contentType : "application/json",
				cache : false,
				beforeSend : function(xhr) {
					xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				},
				success : function(result) {
					if(result == "SUCCESS") {
						alert("배송지를 저장했습니다.");
						opener.location.reload();
						window.close();
					}
				},
				error : function(e) {
					alert("에러가 발생했습니다.");
				}
			});
		})
	//
	
	var name = "<%=request.getParameter("shipping_loc_name") %>";
	var receiver = "<%=request.getParameter("receiver") %>";
	var phone = "<%=request.getParameter("receiver_phone_num") %>";
	var postcode = "<%=request.getParameter("zip_code") %>";
	var address = "<%=request.getParameter("address") %>";
	var address_detail = "<%=request.getParameter("address_detail") %>";
	
	if(name != "null") {
		$("#name").val(name);
		$("#receiver").val(receiver);
		$("#phone").val(phone);
		$("#postcode").val(postcode);
		$("#address").val(address);
		$("#address_detail").val(address_detail);
	}
	//
	}) 
	
</script>
</head>
<body>
	<div class="container">
		<p id="id" style="display: none"><sec:authentication property="principal.username"/></p>
		<h2 class="gada-headline">SHIPPING LIST</h2>
		<h3 class="gada-headline">(enroll / modify)</h3>
		<hr />
		<form id="shipping-form">
			<table class="table-borderless">
				<colgroup>
					<col width="100px" />
					<col width="350px" />
				</colgroup>
				<thead>
					<tr><th colspan="2">배송지 정보 상세</th></tr>
				</thead>
				<tbody>
					<tr>
						<th>배송지명</th>
						<td><input type="text" class="form-control" id="name" placeholder="배송지명" maxlength="20"/></td>
					</tr>
					<tr>
						<th>수령인</th>
						<td><input type="text" class="form-control" id="receiver" placeholder="수령인" maxlength="20"></td>
					</tr>
					<tr>
						<th>주소</th>
						<td>
							<input type="text" class="form-control" id="postcode" placeholder="우편번호" readonly="readonly" />
							<button type="button" class="btn gada-btn-reverse"  onclick="execDaumPostcode()" id="postcode-btn" >우편번호 찾기</button>
							<input type="text" class="form-control" id="address" placeholder="주소" readonly="readonly">
							<input type="text" class="form-control" id="address_detail" placeholder="상세주소" />
						</td>
					</tr>
					<tr>
						<th>연락처</th>
						<td><input type="text" class="form-control" id="phone" placeholder="연락처" maxlength="11" /></td>
					</tr>
				</tbody>
			</table>
			<div class="gada-btn-group">
				<button class="btn gada-btn" id="enroll-submit-btn">저장</button>
				<button class="btn gada-btn-reverse" id="enroll-cancel-btn">취소</button>
			</div>
		</form>
	</div>
	
	
	<!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
	<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
	<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
	</div>
	
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	    // 우편번호 찾기 화면을 넣을 element
	    var element_layer = document.getElementById('layer');
	
	    function closeDaumPostcode() {
	        // iframe을 넣은 element를 안보이게 한다.
	        element_layer.style.display = 'none';
	    }
	
	    function execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수
	
	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }
	
	                /* // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    document.getElementById("extraAddress").value = extraAddr;
	                
	                } else {
	                    document.getElementById("extraAddress").value = '';
	                } */
	
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('postcode').value = data.zonecode;
	                document.getElementById("address").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("address_detail").focus();
	
	                // iframe을 넣은 element를 안보이게 한다.
	                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
	                element_layer.style.display = 'none';
	            },
	            width : '100%',
	            height : '100%',
	            maxSuggestItems : 5
	        }).embed(element_layer);
	
	        // iframe을 넣은 element를 보이게 한다.
	        element_layer.style.display = 'block';
	
	        // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
	        initLayerPosition();
	    }
	
	    // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
	    // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
	    // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
	    function initLayerPosition(){
	        var width = 300; //우편번호서비스가 들어갈 element의 width
	        var height = 400; //우편번호서비스가 들어갈 element의 height
	        var borderWidth = 5; //샘플에서 사용하는 border의 두께
	
	        // 위에서 선언한 값들을 실제 element에 넣는다.
	        element_layer.style.width = width + 'px';
	        element_layer.style.height = height + 'px';
	        element_layer.style.border = borderWidth + 'px solid';
	        // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
	        element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
	        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
	    }
	</script>
</body>
</html>