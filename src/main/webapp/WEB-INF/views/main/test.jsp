<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<c:forEach items="${diary}" var="diary">
		diaryId: ${diary.diary_Id}<br>
		diaryDate: ${diary.diary_date}<br>
		diaryText: ${diary.text}<br>
		diaryHashtag: ${diary.hashtag}<br>
		diaryImgPath: <img src="${diary.img_path}">
	</c:forEach>
</body>
</html>