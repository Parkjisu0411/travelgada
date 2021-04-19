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
<title>Login Form</title>
<style>
.member-img {
	margin: 30px;
	height: 100px;
	width : 100px;
	display: block;
}

.error_next_box {
	color: red;
	font-size: 0.5em;
}

.green {
	color: green;
}

#preview-area {
	position:relative;
	width: 100px;
	height: 100px;
	color: black;
	border: 0px solid black;
}
</style>
<script type="text/javascript">
	//img preview
	function previewImage(targetObj, view_area) {
		var preview = document.getElementById(view_area);
		
		var files = targetObj.files;
		for ( var i = 0; i < files.length; i++) {
			var file = files[i];
			var imageType = /image.*/; //이미지 파일일경우만.. 뿌려준다.
			if (!file.type.match(imageType))
				continue;
			var prevImg = document.getElementById("prev_" + view_area); //이전에 미리보기가 있다면 삭제
			if (prevImg) {
				preview.removeChild(prevImg);
			}
			var img = document.createElement("img"); 
			img.id = "prev_" + view_area;
			img.classList.add("obj");
			img.file = file;
			img.style.width = '100px'; 
			img.style.height = '100px';
			preview.appendChild(img);
			
			var reader = new FileReader();
			reader.onloadend = (function(aImg) {
				return function(e) {
					aImg.src = e.target.result;
				};
			})(img);
			reader.readAsDataURL(file);
			
		}
	}

	//

	//공통함수
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
	//

	$(document).ready(function() {
		
		//change button click event
		$("#change-img-btn").click(function(e) {
			e.preventDefault();
			$("#img-area").css("display", "none");
			$("#change-img-area").css("display", "");
		});
		
		$("#change-img-cancle-btn").click(function(e) {
			e.preventDefault();
			$("#img-area").css("display", "");
			$("#change-img-area").css("display", "none");
		});
		
		$("#change-password-btn").click(function(e) {
			e.preventDefault();
			$("#password-area").css("display", "");
			$("#change-password-area").css("display", "none");
		});

		$("#change-password-cancle-btn").click(function(e) {
			e.preventDefault();
			$("#password").val('');
			$("#newPassword").val('');
			$("#confirmPassword").val('');
			$("#password-area").css("display", "");
			$("#change-password-area").css("display", "none");
		});

		$("#change-name-btn").click(function(e) {
			e.preventDefault();
			$("#name-area").css("display", "none");
			$("#change-name-area").css("display", "");
		});

		$("#change-name-cancle-btn").click(function(e) {
			e.preventDefault();
			$("#name").val('');
			$("#name-area").css("display", "");
			$("#change-name-area").css("display", "none");
		});

		$("#change-email-btn").click(function(e) {
			e.preventDefault();
			$("#email-area").css("display", "none");
			$("#change-email-area").css("display", "");
		});

		$("#change-email-cancle-btn").click(function(e) {
			e.preventDefault();
			$("#email").val('');
			$("#email-area").css("display", "");
			$("#change-email-area").css("display", "none");
		});

		$("#change-phone-btn").click(function(e) {
			e.preventDefault();
			$("#phone-area").css("display", "none");
			$("#change-phone-area").css("display", "");
		});

		$("#change-phone-cancle-btn").click(function(e) {
			e.preventDefault();
			$("#phone").val('');
			$("#phone-area").css("display", "");
			$("#change-phone-area").css("display", "none");
		});
		//
		
		//submit button click event
		$("#change-img-finish-btn").click(function(e) {
			e.preventDefault();
			var form = $("#fileForm")[0];
			var formData = new FormData(form);
			console.log(form);
			console.log(formData);
			$.ajax({
				type : "POST",
				url : "/file/profile",
				data : formData,
				cache : false,
				contentType : false,
				processData : false,
				beforeSend : function(xhr) {
					xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				},
				success : function(result) {
					console.log("파일 업로드 완료.");
					console.log(result);
					var img_path = result;
					var id = $("#id").text();
					var form = {
						member_id : id,
						profile_img_path : img_path
					};
					
					$.ajax({
						type : "PUT",
						url : "/member/" + id,
						data : JSON.stringify(form),
						contentType : "application/json",
						cache : false,
						beforeSend : function(xhr) {
							xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
						},
						success : function(result) {
							if(result == "SUCCESS") {
								console.log(result);
								location.reload();
							}
						},
						error : function(e) {
							console.log(e);
							alert("에러가 발생했습니다.");
						}
					});
				},
				error : function(e) {
					alert("파일 업로드 중 에러가 발생했습니다.");
					console.log(e);
				}
			})
		});
		
		$("#change-password-finish-btn").click(function(e) {
			e.preventDefault();
			var id = $("#id").text();
			var form = {
				member_id : id,
				pw : $("#change-newPassword-input").val()
			}
			
			if(confirm("비밀번호를 변경하시겠습니까?")) {
				$.ajax({
					type : "PUT",
					url : "/member/" + id,
					data : JSON.stringify(form),
					contentType : "application/json",
					cache : false,
					beforeSend : function(xhr) {
						xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
					},
					success : function(result) {
						if(result == "SUCCESS") {
							alert("비밀번호를 변경했습니다. \n다시 로그인 해주세요.");
							$("#logout").submit();
						}
					},
					error : function(e) {
						alert("에러가 발생했습니다.");
						console.log(e);
					}
				})
			}
		});
		
		$("#change-name-finish-btn").click(function(e) {
            e.preventDefault();
          	var id = $("#id").text();
          	var name = $("#change-name-input").val();
            var form = {
				member_id : id,
				member_name : name
			};

            if(confirm('이름을 변경하시겠습니까?')) {
                $.ajax({
                    type: "PUT",
                    url: "/member/" + id,
                    data : JSON.stringify(form),
        			contentType : "application/json",
        			cache : false,
                    beforeSend : function(xhr){
          	             xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
       				},
       				success : function(result){
    					console.log("result : " + result );
    					if(result == "SUCCESS"){
    						alert("이름을 변경했습니다.");
    						$("#name-area").css("display", "");
    						$("#change-name-area").css("display", "none");
    						$("#name").html(name);
    					}
    				},
    				error : function(e){
    					alert("오류가 발생했습니다.");
    					console.log(e);
    				}
                });
            }

        });
		
		$("#change-email-finish-btn").click(function(e) {
			e.preventDefault();
			var id = $("#id").text();
			var email = $("#change-email-input").val();
			var form = {
				member_id : id,
				email : email
			};
			
			if(confirm("이메일을 변경하시겠습니까?")) {
				$.ajax({
					type : "PUT",
					url : "/member/" + id,
					data : JSON.stringify(form),
					contentType : "application/json",
					cache : false,
					beforeSend : function(xhr) {
						xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
					},
					success : function(result) {
						if(result == "SUCCESS") {
							alert("이메일을 변경했습니다.");
							$("#email-area").css("display", "");
							$("#change-email-area").css("display", "none");
							$("#email").html(email);
						}
					},
					error : function(e) {
						alert("오류가 발생했습니다.");
						console.log(e);
					}
				})
			}
		});
		
		$("#change-phone-finish-btn").click(function(e) {
			e.preventDefault();
			
			var id = $("#id").text();
			var phone = $("#change-phone-input").val();
			var form = {
				member_id : id,
				phone_num : phone
			};
			
			if(confirm("휴대전화를 변경하시겠습니까?")) {
				$.ajax({
					type : "PUT",
					url : "/member/" + id,
					data : JSON.stringify(form),
					contentType : "application/json",
					cache : false,
					beforeSend : function(xhr) {
						xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
					},
					success : function(result) {
						if(result == "SUCCESS") {
							alert("휴대전화를 변경했습니다.");
							$("#phone-area").css("display", "");
							$("#change-phone-area").css("display", "none");
							$("#phone").html(phone);
						}
					},
					error : function(e) {
						alert("오류가 발생했습니다.");
						console.log(e);
					}
				});
			}
		});
		
		$("#withdrawal-member-btn").click(function(e) {
			e.preventDefault();
			
			var id = $("#id").text();
			var form = {
				member_id : id,
				withdrawal_flag : 1,
				withdrawal_code : 1
			};
			if(confirm("회원 탈퇴를 진행하시겠습니까? \n(경고 : 회원 탈퇴 시 관련된 모든 정보가 사라지며 복구할 수 없습니다.)")) {
				$.ajax({
					type : "PUT",
					url : "/member/" + id,
					data : JSON.stringify(form),
					contentType : "application/json",
					cache : false,
					beforeSend : function(xhr) {
						xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
					},
					success : function(result) {
						if(result =="SUCCESS") {
							alert("회원탈퇴 되었습니다.");
							$("#logout").submit();
						}
					},
					error : function(e) {
						alert("에러가 발생했습니다.");
						console.log(e);
					}
				});
			}
		});
		//
		
		//keyup event
		$("#change-password-input").keyup(function (e) {
                e.preventDefault();
                
                var password = $("#change-password-input").val();
                var id = $("#id").text();
                var oMsg = $("#pswdMsg");
                
                if(password == "") {
                	showErrorMsg(oMsg, "비밀번호를 입력해주세요.");
					$("#change-password-finish-btn").attr('class', 'n-btn btn-sm btn-accent disabled');
	            	$("#change-password-finish-btn").attr('disabled', true);
                } else {
	                $.ajax({
	                	type : "GET",
	        			url : "/member/checkpw?id=" + id + "&pw=" + password,
	        			success : function(data) {
	        				var result = data;
	        				if (result == "SUCCESS") {
	        					showSuccessMsg(oMsg, "일치합니다.");
	        				} else {
	        					showErrorMsg(oMsg, "비밀번호가 일치하지 않습니다.");
	        					$("#change-password-finish-btn").attr('class', 'n-btn btn-sm btn-accent disabled');
	        	            	$("#change-password-finish-btn").attr('disabled', true);
	        				}
	        			}
	                });
                }
            });
		
		$("#change-newPassword-input").keyup(function (e) {
			e.preventDefault();
			
			var newPassword = $("#change-newPassword-input").val();
			var password = $("#change-password-input").val();
			var oMsg = $("#npswdMsg");
			var isPW = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/;
			
			if(newPassword == "") {
				showErrorMsg(oMsg, "비밀번호를 입력해주세요.");
				$("#change-password-finish-btn").attr('class', 'n-btn btn-sm btn-accent disabled');
            	$("#change-password-finish-btn").attr('disabled', true);
			} else if(!isPW.test(newPassword)) {
				showErrorMsg(oMsg, "8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.");
				$("#change-password-finish-btn").attr('class', 'n-btn btn-sm btn-accent disabled');
            	$("#change-password-finish-btn").attr('disabled', true);
			} else if(newPassword == password) {
				showErrorMsg(oMsg, "기존 비밀번호와 동일합니다.");
				$("#change-password-finish-btn").attr('class', 'n-btn btn-sm btn-accent disabled');
            	$("#change-password-finish-btn").attr('disabled', true);
			} 
			else {
				showSuccessMsg(oMsg, "사용 가능합니다.");
			}
            });
		
		$("#change-confirmPassword-input").keyup(function (e) {
			e. preventDefault();
			
			var newPassword = $("#change-newPassword-input").val();
			var confirmPassword = $("#change-confirmPassword-input").val();
			var oMsg = $("#cpswdMsg");
			
			if(confirmPassword != newPassword) {
				showErrorMsg(oMsg, "비밀번호가 일치하지 않습니다.");
				$("#change-password-finish-btn").attr('class', 'n-btn btn-sm btn-accent disabled');
            	$("#change-password-finish-btn").attr('disabled', true);
			} else {
				showSuccessMsg(oMsg, "일치합니다.");
				$("#change-password-finish-btn").attr('class', 'n-btn btn-sm btn-accent disabled');
            	$("#change-password-finish-btn").attr('disabled', false);
			}
            });
		
		$("#change-name-input").keyup(function (e) {
            e.preventDefault();

            var name = $("#change-name-input").val();
            var oMsg = $("#nameMsg");
            var isName = /^[ㄱ-ㅎ|가-힣|a-z|A-Z|]+$/;

            if (name == "") {
            	showErrorMsg(oMsg, "변경할 이름을 입력해주세요.");
            	$("#change-name-finish-btn").attr('class', 'n-btn btn-sm btn-accent disabled');
            	$("#change-name-finish-btn").attr('disabled', true);
                return false;
            } else if(!isName.test(name)) {
            	showErrorMsg(oMsg, "한글과 영문 대 소문자를 사용하세요. (특수기호, 공백 사용 불가)");
            	$("#change-name-finish-btn").attr('class', 'n-btn btn-sm btn-accent disabled');
            	$("#change-name-finish-btn").attr('disabled', true);
            } else {
            	hideMsg(oMsg);
            	$("#change-name-finish-btn").attr('class', 'n-btn btn-sm btn-accent');
            	$("#change-name-finish-btn").attr('disabled', false);
            }
        });
		
		$("#change-email-input").keyup(function (e) {
			e.preventDefault();
			
			var email = $("#change-email-input").val();
			var oMsg = $("#emailMsg");
			var isEmail = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
			
			if(email == "") {
				showErrorMsg(oMsg, "이메일을 입력해주세요.");
				$("#change-email-finish-btn").attr('class', 'n-btn btn-sm btn-accent disabled');
				$("#change-email-finish-btn").attr('disabled', true);
			} else if(!isEmail.test(email)) {
				showErrorMsg(oMsg, "이메일 형식이 아닙니다.");
				$("#change-email-finish-btn").attr('class', 'n-btn btn-sm btn-accent disabled');
				$("#change-email-finish-btn").attr('disabled', true);
			} else {
				hideMsg(oMsg);
				$("#change-email-finish-btn").attr('class', 'n-btn btn-sm btn-accent');
				$("#change-email-finish-btn").attr('disabled', false);
			}
        });

		$("#change-phone-input").keyup(function (e) {
			e.preventDefault();
			
			var phone = $("#change-phone-input").val();
			var oMsg = $("#phoneMsg");
			var isPhone = /(01[016789])([0-9]{3,4})([0-9]{4})$/;
			
			if(phone == "") {
				showErrorMsg(oMsg, "휴대전화를 입력해주세요.");
				$("#change-phone-finish-btn").attr('class', 'n-btn btn-sm btn-accent disabled');
				$("#change-phone-finish-btn").attr('disabled', true);
			} else if(!isPhone.test(phone)) {
				showErrorMsg(oMsg, "휴대전화를 형식이 아닙니다.");
				$("#change-phone-finish-btn").attr('class', 'n-btn btn-sm btn-accent disabled');
				$("#change-phone-finish-btn").attr('disabled', true);
			} else {
				hideMsg(oMsg);
				$("#change-phone-finish-btn").attr('class', 'n-btn btn-sm btn-accent');
				$("#change-phone-finish-btn").attr('disabled', false);
			}
		});
		//

	})
</script>
</head>
<body>
	<!-- Header -->
	<%@ include file="/WEB-INF/views/includes/header.jsp"%>
	<!--Content -->
	<div class="container">
		<h2 class="gada-headline">Member INFO</h2>
		<div class="col-md-8 gada-card" style="margin: auto;">
			<table class="table">
				<tr id="img-area">
					<th>사진</th>
					<td>
						<img id="img" class="rounded-circle member-img" src="/resources/img/profile/${member.profile_img_path }" onerror="this.src='/resources/img/profile/default_profile_img.jpg'">
					</td>
					<td>
						<button type="button" class="btn gada-btn" id="change-img-btn">사진 변경</button>
					</td>
				</tr>
				<tr id="change-img-area" style="display: none;">
					<th>사진</th>
					<td>
						<div class="img-preview">
							<div id='view_area'>
								<img class="rounded-circle member-img" id="prev_view_area" width='100' src='/resources/img/profile/${member.profile_img_path }' onerror="this.src='/resources/img/profile/default_profile_img.jpg'"/>
							</div>							</div>
						<form id="fileForm" enctype="multipart/form-data" method="post">
							<input type="file" style="font-family: 'yg-jalnan'" class="form-control-file border" name="uploadfile" id="profile_pt" onchange="previewImage(this,'view_area')">
						</form>
					</td>
					<td>
						<div class="btn-group">
							<button type="button" class="n-btn btn-sm-btn-lighter" id="change-img-cancle-btn">취소</button>
							<button type="button" class="n-btn btn-sm-btn-accent" id="change-img-finish-btn">완료</button>
						</div>
					</td>
				</tr>
				<tr>
					<th>아이디</th>
					<td colspan="2" id="id">${member.member_id }</td>
				</tr>
				<tr id="password-area">
					<th>비밀번호</th>
					<td><strong>********</strong></td>
					<td>
						<button type="button" class="btn gada-btn" id="change-password-btn">비밀번호 변경</button>
					</td>
				</tr>
				<tr id="change-password-area" style="display: none;">
					<th>비밀번호</th>
					<td colspan="2">
						<div class="password-change">
							<div class="input">
								<label for="change-password-input">현재 비밀번호</label> <input type="password"
									class="now-input" id="change-password-input" />
								<span class="error_next_box" id="pswdMsg" style="display: none" aria-live="assertive"></span>
							</div>
							<div class="input">
								<label for="change-newPassword-input">신규 비밀번호</label> <input type="password"
									class="now-input" id="change-newPassword-input" />
								<span class="error_next_box" id="npswdMsg" style="display: none" aria-live="assertive"></span>
							</div>
							<div class="input">
								<label for="change-confirmPassword-input">신규 비밀번호 재 입력</label> <input
									type="password" class="now-input" id="change-confirmPassword-input" />
								<span class="error_next_box" id="cpswdMsg" style="display: none" aria-live="assertive"></span>
							</div>
							<div class="btn-group">
								<button type="button" class="n-btn btn-sm-btn-lighter" id="change-password-cancle-btn">취소</button>
								<button type="button" class="n-btn btn-sm-btn-accent disabled" id="change-password-finish-btn" disabled>완료</button>
							</div>
						</div>
					</td>
				</tr>
				<tr id="name-area">
					<th>이름</th>
					<td id="name">${member.member_name }</td>
					<td><button type="button" class="btn gada-btn" id="change-name-btn">이름 변경</button></td>
				</tr>
				<tr id="change-name-area" style="display: none;">
					<th>이름</th>
					<td colspan="2">
						<div class="name-change">
							<div class="input">
								<label for="name">변경할 이름</label> <input type="text" class="name-input" id="change-name-input" />
								<span class="error_next_box" id="nameMsg" style="display: none" aria-live="assertive"></span>
							</div>
							<div class="btn-group">
								<button type="button" class="n-btn btn-sm-btn-lighter" id="change-name-cancle-btn">취소</button>
								<button type="button" class="n-btn btn-sm-btn-accent disabled" id="change-name-finish-btn" disabled="disabled">완료</button>
							</div>
						</div>
					</td>
				</tr>
				<tr id="email-area">
					<th>이메일</th>
					<td id="email">${member.email }</td>
					<td><button type="button" class="btn gada-btn" id="change-email-btn">이메일 변경</button></td>
				</tr>
				<tr id="change-email-area" style="display: none;">
					<th>이메일</th>
					<td colspan="2">
						<div class="email-change">
							<div class="input">
								<label for="email">변경할 이메일</label> <input type="text" class="email-input" id="change-email-input" />
								<span class="error_next_box" id="emailMsg" style="display: none" aria-live="assertive"></span>
							</div>
							<div class="btn-group">
								<button type="button" class="n-btn btn-sm-btn-lighter" id="change-email-cancle-btn">취소</button>
								<button type="button" class="n-btn btn-sm-btn-accent disabled" id="change-email-finish-btn" disabled="disabled">완료</button>
							</div>
						</div>
					</td>
				</tr>
				<tr id="phone-area">
					<th>휴대전화</th>
					<td id="phone">${member.phone_num }</td>
					<td><button type="button" class="btn gada-btn" id="change-phone-btn">휴대전화 변경</button></td>
				</tr>
				<tr id="change-phone-area" style="display: none;">
					<th>휴대전화</th>
					<td colspan="2">
						<div class="phone-change">
							<div class="input">
								<label for="phone">변경할 휴대전화</label> <input type="text" class="phone-input" id="change-phone-input" />
								<span class="error_next_box" id="phoneMsg" style="display: none" aria-live="assertive"></span>
							</div>
							<div class="btn-group">
								<button type="button" class="n-btn btn-sm-btn-lighter" id="change-phone-cancle-btn">취소</button>
								<button type="button" class="n-btn btn-sm-btn-accent disabled" id="change-phone-finish-btn" disabled>완료</button>
							</div>
						</div>
					</td>
				</tr>
			</table>
			<button type="button" class="btn gada-btn" onclick="window.history.back();">돌아가기</button>
			<button type="button" class="btn gada-btn" onclick="#" id="withdrawal-member-btn">회원탈퇴</button>
		</div>
	</div>
	<!-- Footer -->
	<%@ include file="/WEB-INF/views/includes/footer.jsp"%>
</body>
</html>