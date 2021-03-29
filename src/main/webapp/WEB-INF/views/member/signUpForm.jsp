<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@700;800&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="${contextPath}/resources/css/main.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SignUp Form</title>
<style>
html, body {
	width: 100%;
	height: 100%;
	margins: 0;
	padding: 0;
}

#wrap {
	min-heigth: 100%;
}

#signup-form {
	margin: 0 auto;
}

.form-check-label {
	margin-left: 20px;
	color: gray;
}
<<<<<<< HEAD

.navbar {
	padding: 2px;
	box-shadow: rgb(0 0 0/ 8%) 0px 1px 12px;
}

.nav-logo-img {
	max-width: 70px;
	max-height: 70px;
}

.navbar-brand {
	font-family: 'yg-jalnan';
	font-size: 1.4em;
}

.nav-logo-img {
	max-width: 30px;
	max-height: 30px;
	margin: 0px 4px 0px 0px;
	padding: 0px 0px 3px;
}

.nav-item {
	padding: 0px 15px;
}

/* Footer */
footer {
	background-color: #f5f5f7;
}

.footer-company-info {
	text-align: center;
	padding: 50px;
	font-size: 14px;
}
</style>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
=======

.green {
	color: green;
}
</style>
<script type="text/javascript">
	/* 공통함수 */
	function showErrorMsg(obj, msg) {
		obj.attr("class", "error_next_box");
		obj.html(msg);
		obj.show();
	}
	function showSuccessMsg(obj, msg) {
		obj.attr("class", "error_next_box green");
		obj.html(msg);
		obj.show();
	}
	function hideMsg(obj) {
		obj.hide();
	}

	function setFocusToInputObject(obj) {
		if (submitFlag) {
			submitFlag = false;
			obj.focus();
		}
	}
	function submitClose() {
		submitFlag = true;
		$("#btnJoin").attr("disabled", true);
	}
	function submitOpen() {
		$("#btnJoin").attr("disabled", false);
	}

	function checkSpace(str) {
		if (str.search(/\s/) != -1) {
			return true;
		} else {
			return false;
		}
	}

	function isValidPasswd(str) {
		var cnt = 0;
		if (str == "") {
			return false;
		}

		/* check whether input value is included space or not */
		var retVal = checkSpace(str);
		if (retVal) {
			return false;
		}
		if (str.length < 8) {
			return false;
		}
		for (var i = 0; i < str.length; ++i) {
			if (str.charAt(0) == str.substring(i, i + 1))
				++cnt;
		}
		if (cnt == str.length) {
			return false;
		}

		var isPW = /^[A-Za-z0-9`\-=\\\[\];',\./~!@#\$%\^&\*\(\)_\+|\{\}:"<>\?]{8,16}$/;
		if (!isPW.test(str)) {
			return false;
		}

		return true;
	}

	/* Form Check Method */
	function checkId(event) {
		if (idFlag)
			return true;

		var id = $("#id").val();
		var oMsg = $("#idMsg");
		var oInput = $("#id");

		if (id == "") {
			showErrorMsg(oMsg, "필수 정보입니다.");
			setFocusToInputObject(oInput);
			return false;
		}

		var isID = /^[a-z0-9]{5,20}$/;
		if (!isID.test(id)) {
			showErrorMsg(oMsg, "5~20자의 영문 소문자와 숫자만 사용 가능합니다.");
			setFocusToInputObject(oInput);
			return false;
		}

		idFlag = true;
		$.ajax({
			type : "GET",
			url : "/member/checkid?id=" + id,
			success : function(data) {
				var result = data;

				if (result == "SUCCESS") {
					if (event == "first") {
						showSuccessMsg(oMsg, "멋진 아이디네요!");
					} else {
						hideMsg(oMsg);
					}
					idFlag = true;
				} else {
					showErrorMsg(oMsg, "이미 사용중이거나 탈퇴한 아이디입니다.");
					setFocusToInputObject(oInput);
				}
			}
		});
		hideMsg(oMsg);
		return true;
	}

	function checkPswd1() {
		if (pwFlag)
			return true;

		var id = $("#id").val();
		var pw = $("#pswd1").val();
		var oImg = $("#pswd1Img");
		var oSpan = $("#pswd1Span");
		var oMsg = $("#pswd1Msg");
		var oInput = $("#pswd1");

		if (pw == "") {
			showErrorMsg(oMsg, "필수 정보입니다.");
			setFocusToInputObject(oInput);
			pwFlag = false;
			return false;
		}

		var isPW = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/;
		if (!isPW.test(pw)) {
			showErrorMsg(oMsg, "8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.");
			setFocusToInputObject(oInput);
			pwFlag = false;
			return false;
		}

		hideMsg(oMsg);
		pwFlag = true;
		return true;
	}

	function checkPswd2() {
		var pswd1 = $("#pswd1");
		var pswd2 = $("#pswd2");
		var oMsg = $("#pswd2Msg");
		var oImg = $("#pswd2Img");
		var oBlind = $("#pswd2Blind");
		var oInput = $("#pswd2");

		if (pswd2.val() == "") {
			showErrorMsg(oMsg, "필수 정보입니다.");
			oBlind.html("");
			setFocusToInputObject(oInput);
			return false;
		}
		if (pswd1.val() != pswd2.val()) {
			showErrorMsg(oMsg, "비밀번호가 일치하지 않습니다.");
			oBlind.html("");
			setFocusToInputObject(oInput);
			return false;
		} else {
			oBlind.html("일치합니다");
			hideMsg(oMsg);
			return true;
		}

		return true;
	}

	function checkName() {
		var oMsg = $("#nameMsg");
		var nonchar = /[^가-힣a-zA-Z0-9]/gi;

		var name = $("#name").val();
		var oInput = $("#name");
		if (name == "") {
			showErrorMsg(oMsg, "필수 정보입니다.");
			setFocusToInputObject(oInput);
			return false;
		}
		if (name != "" && nonchar.test(name)) {
			showErrorMsg(oMsg, "한글과 영문 대 소문자를 사용하세요. (특수기호, 공백 사용 불가)");
			setFocusToInputObject(oInput);
			return false;
		}

		hideMsg(oMsg);
		return true;
	}

	function checkEmail() {
		var email = $("#email").val();
		var oMsg = $("#emailMsg");
		var oInput = $("#email");

		if (email == "") {
			showErrorMsg(oMsg, "필수 정보입니다.");
			setFocusToInputObject(oInput);
			return true;
		}

		var isEmail = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
		var isHan = /[ㄱ-ㅎ가-힣]/g;
		if (!isEmail.test(email) || isHan.test(email)) {
			showErrorMsg(oMsg, "이메일 주소를 다시 확인해주세요.");
			setFocusToInputObject(oInput);
			return false;
		}

		hideMsg(oMsg);
		return true;
	}

	function checkPhoneNo() {
		var phoneNo = $("#phoneNo").val();
		var oMsg = $("#phoneNoMsg");
		var oInput = $("#phoneNo");

		if (phoneNo == "") {
			showErrorMsg(oMsg, "필수 정보입니다.");
			setFocusToInputObject(oInput);
			return false;
		}

		hideMsg(oMsg);
		return true;
	}
	
	function checkUnrealInput() {
        if (checkId('join')
                & checkPswd1()
                & checkPswd2()
                & checkName()
                & checkEmail()
        ) {
            return true;
        } else {
            return false;
        }
    }

	function mainSubmit() {

		if (!checkUnrealInput()) {
			submitOpen();
			return false;
		}

		if (idFlag && pwFlag && authFlag) {
			$("#join_form").submit();
		} else {
			submitOpen();
			return false;
		}
	}

	$(document)
			.ready(
					function() {

						$("#btnJoin").click(function(event) {
							clickcr(this, 'sup.signup', '', '', event);
							submitClose();
							if (idFlag && pwFlag && authFlag) {
								mainSubmit();
							} else {
								setTimeout(function() {
									mainSubmit();
								}, 700);
							}
						});

						//Check SignUpForm
						$("#id").keyup(function() {
							idFlag = false;
							checkId("first");
						});
						$("#pswd1").keyup(function() {
							pwFlag = false;
							checkPswd1();
						});
						$("#pswd2").keyup(function() {
							checkPswd2();
						});
						$("#name").keyup(function() {
							checkName();
						});
						$("#email").keyup(function() {
							checkEmail();
						});

						//Submit SignUpForm
>>>>>>> 39e5e13d84f1493bfbeed7085aa1bac272a136a9
						$("#btnSubmit")
								.click(
										function(event) {
											event.preventDefault();
											var form = {
												member_id : $("#id").val(),
												pw : $("#pswd1").val(),
												member_name : $("#name").val(),
												email : $("#email").val(),
												phone_num : $("#phone_num")
														.val(),
											};

											$
													.ajax({
														type : "POST",
														url : "${pageContext.request.contextPath}/member",
														data : JSON
																.stringify(form),
														contentType : 'application/json',
														beforeSend : function(
																xhr) {
															xhr
																	.setRequestHeader(
																			"${_csrf.headerName}",
																			"${_csrf.token}");
														},
														success : function(
																result) {
															if (result == "SUCCESS") {
																alert("회원가입 완료.");
																$(location)
																		.attr(
																				'href',
																				'${pageContext.request.contextPath}/');
															}
														},
														error : function(e) {
															console.log(
																	"ERROR : ",
																	e);
															alert("회원가입 실패.");
															return false;
														}
													});
										});
					})
</script>
</head>
<body>
	<!-- Header -->
	<nav class="navbar navbar-expand-lg navbar-light bg-white">
		<div class="container">
			<a class="navbar-brand" href="#"><img class="nav-logo-img"
				src="${contextPath}/resources/logo.png">가다</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> 일정 </a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="#">플래너</a> <a
								class="dropdown-item" href="#">준비물</a> <a class="dropdown-item"
								href="#">지도</a>
						</div></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> 커뮤니티 </a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="#">Q&A</a> <a
								class="dropdown-item" href="#">리뷰</a> <a class="dropdown-item"
								href="#">동행</a>
						</div></li>
					<li class="nav-item"><a class="nav-link" href="#">쇼핑</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> 회원정보 </a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="#">정보 수정</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="#">로그아웃</a>
						</div></li>
				</ul>
				<form class="form-inline">
					<input class="form-control mr-sm-2" type="text" aria-label="Search">
					<button class="btn btn-outline-white btn-sm my-0" type="submit">검색</button>
				</form>
			</div>
		</div>
	</nav>
	<!--Content -->
	<div class="divider-header-blank"></div>
	<div id="wrap">
		<div class="container">
			<div class="col-md-6" id="signup-form">
				<h2 class="headline" style="font-family: 'yg-jalnan'">
					<img class="nav-logo-img" src="${contextPath}/resources/logo.png">가다
					회원가입
				</h2>
<<<<<<< HEAD
				<form>
=======
				<form id="join_form">
>>>>>>> 39e5e13d84f1493bfbeed7085aa1bac272a136a9
					<div class="form-group">
						<label for="id">아이디:</label> <input type="text"
							class="form-control" placeholder="ID" id="id" />
					</div>
					<div class="form-group">
						<label for="pw">비밀번호:</label> <input type="password"
<<<<<<< HEAD
							class="form-control" placeholder="Password" id="pw" />
					</div>
					<div class="form-group">
						<label for="pw2">비밀번호 재확인:</label> <input type="password"
							class="form-control" placeholder="Password" id="pw2" />
					</div>
					<div class="form-group">
						<label for="name">이름:</label> <input type="text"
							class="form-control" placeholder="Name" id="name" />
					</div>
					<div class="form-group">
						<label for="email">이메일:</label> <input type="email"
							class="form-control" placeholder="Email" id="email" />
=======
							class="form-control" placeholder="Password" id="pswd1"
							maxlength="16" /> <span class="error_next_box" id="pswd1Msg"
							style="display: none" aria-live="assertive">5~12자의 영문 소문자,
							숫자와 특수기호(_)만 사용 가능합니다.</span>
					</div>
					<div class="form-group">
						<label for="pw2">비밀번호 재확인:</label> <input type="password"
							class="form-control" placeholder="Password" id="pswd2"
							maxlength="16" /> <span id="pswd2Blind" style="color: green;"></span>
						<span class="error_next_box" id="pswd2Msg" style="display: none"
							aria-live="assertive"></span>
					</div>
					<div class="form-group">
						<label for="name">이름:</label> <input type="text"
							class="form-control" placeholder="Name" id="name" maxlength="30" />
						<span class="error_next_box" id="nameMsg" style="display: none"
							aria-live="assertive"></span>
					</div>
					<div class="form-group">
						<label for="email">이메일:</label> <input type="email"
							class="form-control" placeholder="Email" id="email"
							maxlength="40" /> <span class="error_next_box" id="emailMsg"
							style="display: none" aria-live="assertive"></span>
>>>>>>> 39e5e13d84f1493bfbeed7085aa1bac272a136a9
					</div>
					<div class="form-group">
						<label for="phone_num">휴대폰:</label> <input type="text"
							class="form-control" placeholder="Phone Number" id="phone_num" />
					</div>
					<button type="submit" class="btn btn-primary" id="btnSubmit">회원가입</button>
				</form>
			</div>
		</div>
	</div>
	<!-- Footer -->
<<<<<<< HEAD
	<footer>
		<div class="footer-company-info">
			© 2021 가다, Inc. All rights reserved<br> 개인정보 처리방침·이용약관·사이트맵
		</div>
	</footer>
=======
	<%@ include file="/WEB-INF/views/includes/footer.jsp"%>

	<script>
		var idFlag = false;
		var pwFlag = false;
		var submitFlag = false;
	</script>
>>>>>>> 39e5e13d84f1493bfbeed7085aa1bac272a136a9
</body>
</html>