<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>OOPS!</title>

<!-- Bootstrap -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">

<style>
	body {
		background-color: #f5f5f5;
	}
	
	.error-code {
		color: #00b8ff;
		font-size: 85px;
		font-weight: 700;
	}
	
	.error-content {
		color: #00b8ff;
		font-size: 28px;
		font-weight: 400;
	}
	
	.error-content-detail {
		color: #7f8a98;
		font-size: 18px;
		font-weight: 400;
	}
	
	.error-area {
	    position: absolute;
        left: 50%;
        top: 50%;
        transform: translate(-50%, -50%);
        width: 40%;
        height: 50%;
        padding: 20px;
	}
	
	.go-home {
		font-size: 20px;
		color: #00b8ff;
		font-weight: 400;
	}
	
	.go-home:hover {
		cursor: pointer;
		text-decoration: underline;
	}
	
</style>

</head>
<body>

	<div class="container error-area">
	<div class="error-code">404</div>
	<div class="error-content">페이지를 찾을 수 없습니다.</div><br>
	<div class="error-content-detail">The page you visited has an invalid or deleted address.<br>
	방문하신 페이지의 주소가 잘못되었거나 삭제된 페이지입니다.</div><br>
	<div class="go-home" onclick="location.href='/'">홈으로 돌아가기</div>
	</div>
	
</body>
</html>