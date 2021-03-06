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
	body {
		font-family: 'IBMPlexSansKR-Light';
	}

	hr {
		background-color: #1DCAD3;
	}
	
	.member-img {
		margin: 30px;
		height: 100px;
		width : 100px;
		display: block;
	}
	
	.error_next_box {
		color: red;
		font-size: 0.8em;
	}
	
	.green {
		color: green;
	}
	
	.gada-btn-group {
		text-align: right;
	}
	
	table tr td .gada-btn {
		flaot: right;
	}
	
	#preview-area {
		position:relative;
		width: 100px;
		height: 100px;
		color: black;
		border: 0px solid black;
	}
	
	table {
		width: 100%;
		margin-bottom: 20px;
	}
	
	table th {
		text-align: left;
		height: 50px;
		padding-left: 20px;
		font-size: 18px;
	}
	
	
	.change-btn {
		width: 140px;
	}
	
	input {
		border: 1px solid #1DCAD3;
		border-radius: 30px;
	}
	
	input:focus {
		outline: none;
		border: 2px solid #1DCAD3;
	}
	
	#fileForm label {
		text-align: center;
		width: 150px;
	}
	
	#profile_pt {
		display: none;
	}
	
	.disabled {
		background-color: #189fa6 !important;
		border: none;
	}
	
</style>
<script type="text/javascript">
	//img preview
	function previewImage(targetObj, view_area) {
		var preview = document.getElementById(view_area);
		
		var files = targetObj.files;
		for ( var i = 0; i < files.length; i++) {
			var file = files[i];
			var imageType = /image.*/; //????????? ??????????????????.. ????????????.
			if (!file.type.match(imageType)) {
				console.log("???????????? ?????????")
				continue;				
			}
			var prevImg = document.getElementById("prev_" + view_area); //????????? ??????????????? ????????? ??????
			if (prevImg) {
				preview.removeChild(prevImg);
			}
			var img = document.createElement("img");
			img.id = "prev_" + view_area;
			img.classList.add("rounded-circle");
			img.classList.add("member-img");
			img.file = file;
			img.style.width = '100px'; 
			img.style.height = '100px';
			preview.appendChild(img);
			console.log(img);
			
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

	//????????????
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
			$("#view_area img").attr("src", $("#img").attr("src"));
			$("#fileForm input[name='uploadfile']").val("");
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
			$("#password-area").css("display", "none");
			$("#change-password-area").css("display", "");
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
								location.reload();
							}
						},
						error : function(e) {
							console.log(e);
							alert("????????? ??????????????????.");
						}
					});
				},
				error : function(e) {
					alert("?????? ????????? ??? ????????? ??????????????????.");
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
			
			if(confirm("??????????????? ?????????????????????????")) {
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
							alert("??????????????? ??????????????????. \n?????? ????????? ????????????.");
							$("#logout").submit();
						}
					},
					error : function(e) {
						alert("????????? ??????????????????.");
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

            if(confirm('????????? ?????????????????????????')) {
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
    						alert("????????? ??????????????????.");
    						$("#name-area").css("display", "");
    						$("#change-name-area").css("display", "none");
    						$("#name").html(name);
    					}
    				},
    				error : function(e){
    					alert("????????? ??????????????????.");
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
			
			if(confirm("???????????? ?????????????????????????")) {
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
							alert("???????????? ??????????????????.");
							$("#email-area").css("display", "");
							$("#change-email-area").css("display", "none");
							$("#email").html(email);
						}
					},
					error : function(e) {
						alert("????????? ??????????????????.");
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
			
			if(confirm("??????????????? ?????????????????????????")) {
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
							alert("??????????????? ??????????????????.");
							$("#phone-area").css("display", "");
							$("#change-phone-area").css("display", "none");
							$("#phone").html(phone);
						}
					},
					error : function(e) {
						alert("????????? ??????????????????.");
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
			if(confirm("?????? ????????? ????????????????????????? \n(?????? : ?????? ?????? ??? ????????? ?????? ????????? ???????????? ????????? ??? ????????????.)")) {
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
							alert("???????????? ???????????????.");
							$("#logout").submit();
						}
					},
					error : function(e) {
						alert("????????? ??????????????????.");
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
                	showErrorMsg(oMsg, "??????????????? ??????????????????.");
					$("#change-password-finish-btn").attr('class', ' btn gada-btn disabled');
	            	$("#change-password-finish-btn").attr('disabled', true);
                } else {
	                $.ajax({
	                	type : "GET",
	        			url : "/member/checkpw?id=" + id + "&pw=" + password,
	        			success : function(data) {
	        				var result = data;
	        				if (result == "SUCCESS") {
	        					showSuccessMsg(oMsg, "???????????????.");
	        				} else {
	        					showErrorMsg(oMsg, "??????????????? ???????????? ????????????.");
	        					$("#change-password-finish-btn").attr('class', 'btn gada-btn disabled');
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
				showErrorMsg(oMsg, "??????????????? ??????????????????.");
				$("#change-password-finish-btn").attr('class', 'btn gada-btn disabled');
            	$("#change-password-finish-btn").attr('disabled', true);
			} else if(!isPW.test(newPassword)) {
				showErrorMsg(oMsg, "8~16??? ?????? ??? ?????????, ??????, ??????????????? ???????????????.");
				$("#change-password-finish-btn").attr('class', 'btn gada-btn disabled');
            	$("#change-password-finish-btn").attr('disabled', true);
			} else if(newPassword == password) {
				showErrorMsg(oMsg, "?????? ??????????????? ???????????????.");
				$("#change-password-finish-btn").attr('class', 'btn gada-btn disabled');
            	$("#change-password-finish-btn").attr('disabled', true);
			} 
			else {
				showSuccessMsg(oMsg, "?????? ???????????????.");
			}
            });
		
		$("#change-confirmPassword-input").keyup(function (e) {
			e. preventDefault();
			
			var newPassword = $("#change-newPassword-input").val();
			var confirmPassword = $("#change-confirmPassword-input").val();
			var oMsg = $("#cpswdMsg");
			
			if(confirmPassword != newPassword) {
				showErrorMsg(oMsg, "??????????????? ???????????? ????????????.");
				$("#change-password-finish-btn").attr('class', 'btn gada-btn disabled');
            	$("#change-password-finish-btn").attr('disabled', true);
			} else {
				showSuccessMsg(oMsg, "???????????????.");
				$("#change-password-finish-btn").attr('class', 'btn gada-btn disabled');
            	$("#change-password-finish-btn").attr('disabled', false);
			}
            });
		
		$("#change-name-input").keyup(function (e) {
            e.preventDefault();

            var name = $("#change-name-input").val();
            var oMsg = $("#nameMsg");
            var isName = /^[???-???|???-???|a-z|A-Z|]+$/;

            if (name == "") {
            	showErrorMsg(oMsg, "????????? ????????? ??????????????????.");
            	$("#change-name-finish-btn").attr('class', 'btn gada-btn disabled');
            	$("#change-name-finish-btn").attr('disabled', true);
                return false;
            } else if(!isName.test(name)) {
            	showErrorMsg(oMsg, "????????? ?????? ??? ???????????? ???????????????. (????????????, ?????? ?????? ??????)");
            	$("#change-name-finish-btn").attr('class', 'btn gada-btn disabled');
            	$("#change-name-finish-btn").attr('disabled', true);
            } else {
            	hideMsg(oMsg);
            	$("#change-name-finish-btn").attr('class', 'btn gada-btn');
            	$("#change-name-finish-btn").attr('disabled', false);
            }
        });
		
		$("#change-email-input").keyup(function (e) {
			e.preventDefault();
			
			var email = $("#change-email-input").val();
			var oMsg = $("#emailMsg");
			var isEmail = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
			
			if(email == "") {
				showErrorMsg(oMsg, "???????????? ??????????????????.");
				$("#change-email-finish-btn").attr('class', 'btn gada-btn disabled');
				$("#change-email-finish-btn").attr('disabled', true);
			} else if(!isEmail.test(email)) {
				showErrorMsg(oMsg, "????????? ????????? ????????????.");
				$("#change-email-finish-btn").attr('class', 'btn gada-btn disabled');
				$("#change-email-finish-btn").attr('disabled', true);
			} else {
				hideMsg(oMsg);
				$("#change-email-finish-btn").attr('class', 'btn gada-btn');
				$("#change-email-finish-btn").attr('disabled', false);
			}
        });

		$("#change-phone-input").keyup(function (e) {
			e.preventDefault();
			
			var phone = $("#change-phone-input").val();
			var oMsg = $("#phoneMsg");
			var isPhone = /(01[016789])([0-9]{3,4})([0-9]{4})$/;
			
			if(phone == "") {
				showErrorMsg(oMsg, "??????????????? ??????????????????.");
				$("#change-phone-finish-btn").attr('class', 'btn gada-btn disabled');
				$("#change-phone-finish-btn").attr('disabled', true);
			} else if(!isPhone.test(phone)) {
				showErrorMsg(oMsg, "??????????????? ????????? ????????????.");
				$("#change-phone-finish-btn").attr('class', 'btn gada-btn disabled');
				$("#change-phone-finish-btn").attr('disabled', true);
			} else {
				hideMsg(oMsg);
				$("#change-phone-finish-btn").attr('class', 'btn gada-btn');
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
		<hr />
		<div class="col-md-8 gada-card" style="margin: auto;">
			<table class="table-borderless">
				<colgroup>
					<col width="30%" />
					<col width="50%" />
					<col width="20%" />
				</colgroup>
				<tr id="img-area">
					<th>??????</th>
					<td>
						<img id="img" class="rounded-circle member-img" src="/resources/img/profile/${member.profile_img_path }" onerror="this.src='/resources/img/profile/default_profile_img.jpg'">
					</td>
					<td>
						<button type="button" class="btn gada-btn change-btn" id="change-img-btn">?????? ??????</button>
					</td>
				</tr>
				<tr id="change-img-area" style="display: none;">
					<th>??????</th>
					<td colspan="2">
						<div class="img-preview">
							<div id='view_area'>
								<img class="rounded-circle member-img" id="prev_view_area" width='100' src='/resources/img/profile/${member.profile_img_path }' onerror="this.src='/resources/img/profile/default_profile_img.jpg'"/>
							</div>
						</div>
						<form id="fileForm" enctype="multipart/form-data" method="post">
							<label for="profile_pt" class="gada-btn">UPLOAD</label>
							<input type="file" name="uploadfile" id="profile_pt" onchange="previewImage(this,'view_area')">
						</form>
						<div class="gada-btn-group">
							<button type="button" class="btn gada-btn-reverse" id="change-img-cancle-btn">??????</button>
							<button type="button" class="btn gada-btn" id="change-img-finish-btn">??????</button>
						</div>
					</td>
				</tr>
				<tr>
					<th>?????????</th>
					<td colspan="2" id="id">${member.member_id }</td>
				</tr>
				<tr id="password-area">
					<th>????????????</th>
					<td><strong>********</strong></td>
					<td>
						<button type="button" class="btn gada-btn change-btn" id="change-password-btn">???????????? ??????</button>
					</td>
				</tr>
				<tr id="change-password-area" style="display: none;">
					<th>????????????</th>
					<td>
						<div class="password-change">
							<div class="input">
								<label for="change-password-input">?????? ????????????</label> <input type="password"
									class="now-input" id="change-password-input" />
								<p class="error_next_box" id="pswdMsg" style="display: none" aria-live="assertive"></p>
							</div>
							<div class="input">
								<label for="change-newPassword-input">?????? ????????????</label> <input type="password"
									class="now-input" id="change-newPassword-input" />
								<p class="error_next_box" id="npswdMsg" style="display: none" aria-live="assertive"></p>
							</div>
							<div class="input">
								<label for="change-confirmPassword-input">?????? ???????????? ??? ??????</label> <input
									type="password" class="now-input" id="change-confirmPassword-input" />
								<p class="error_next_box" id="cpswdMsg" style="display: none" aria-live="assertive"></p>
							</div>
						</div>
					</td>
					<td>
						<div class="gada-btn-group">
							<button type="button" class="btn gada-btn-reverse" id="change-password-cancle-btn">??????</button>
							<button type="button" class="btn gada-btn disabled" id="change-password-finish-btn" disabled>??????</button>
						</div>
					</td>
				</tr>
				<tr id="name-area">
					<th>??????</th>
					<td id="name">${member.member_name }</td>
					<td><button type="button" class="btn gada-btn change-btn" id="change-name-btn">?????? ??????</button></td>
				</tr>
				<tr id="change-name-area" style="display: none;">
					<th>??????</th>
					<td>
						<div class="name-change">
							<div class="input">
								<label for="name">????????? ??????</label> <input type="text" class="name-input" id="change-name-input" />
								<p class="error_next_box" id="nameMsg" style="display: none" aria-live="assertive"></p>
							</div>
							
						</div>
					</td>
					<td>
						<div class="gada-btn-group">
							<button type="button" class="btn gada-btn-reverse" id="change-name-cancle-btn">??????</button>
							<button type="button" class="btn gada-btn disabled" id="change-name-finish-btn" disabled="disabled">??????</button>
						</div>
					</td>
				</tr>
				<tr id="email-area">
					<th>?????????</th>
					<td id="email">${member.email }</td>
					<td><button type="button" class="btn gada-btn change-btn" id="change-email-btn">????????? ??????</button></td>
				</tr>
				<tr id="change-email-area" style="display: none;">
					<th>?????????</th>
					<td>
						<div class="email-change">
							<div class="input">
								<label for="email">????????? ?????????</label> <input type="text" class="email-input" id="change-email-input" />
								<p class="error_next_box" id="emailMsg" style="display: none" aria-live="assertive"></p>
							</div>
							
						</div>
					</td>
					<td>
						<div class="gada-btn-group">
							<button type="button" class="btn gada-btn-reverse" id="change-email-cancle-btn">??????</button>
							<button type="button" class="btn gada-btn disabled" id="change-email-finish-btn" disabled="disabled">??????</button>
						</div>
					</td>
				</tr>
				<tr id="phone-area">
					<th>????????????</th>
					<td id="phone">${member.phone_num }</td>
					<td><button type="button" class="btn gada-btn change-btn" id="change-phone-btn">???????????? ??????</button></td>
				</tr>
				<tr id="change-phone-area" style="display: none;">
					<th>????????????</th>
					<td>
						<div class="phone-change">
							<div class="input">
								<label for="phone">????????? ????????????</label> <input type="text" class="phone-input" id="change-phone-input" />
								<p class="error_next_box" id="phoneMsg" style="display: none" aria-live="assertive"></p>
							</div>
						</div>
					</td>
					<td>
						<div class="gada-btn-group">
							<button type="button" class="btn gada-btn-reverse" id="change-phone-cancle-btn">??????</button>
							<button type="button" class="btn gada-btn disabled" id="change-phone-finish-btn" disabled>??????</button>
						</div>
					</td>
				</tr>
			</table>
			<div class="gada-btn-group">
				<button type="button" class="btn gada-btn-reverse" onclick="window.history.back();">????????????</button>
				<button type="button" class="btn gada-btn" onclick="#" id="withdrawal-member-btn">????????????</button>
			</div>
		</div>
	</div>
	<!-- Footer -->
	<%@ include file="/WEB-INF/views/includes/footer.jsp"%>
</body>
</html>