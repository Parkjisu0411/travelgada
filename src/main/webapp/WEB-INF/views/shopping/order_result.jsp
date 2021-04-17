<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 

<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <title>결제 완료</title>

  <!-- CSS -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footer.css">

  <!-- Bootstrap -->
  <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"></script>

  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />

  <style>
    .headline-order-complete {
      font-size: 25px;
      font-weight: 700;
      color: #39B54A;
    }

    html,
    body {
      background-color: #f5f5f5 !important;
    }

    .order-complete-area {
      background-color: #ffffff;
      border-radius: 10px;
      padding: 20px;
    }

    .order-product {
      text-align: center;
      width: 100%;
      border-spacing: 2px;
      border-color: grey;
    }

    .view-detail {
      text-decoration: underline;
    }

    .view-detail:hover {
      cursor: pointer;
    }

    .product-img {
      width: 100px;
      height: 100px;
    }
  </style>
</head>

<body>

  <%@ include file="/WEB-INF/views/includes/header.jsp" %>

  <div class="container order-complete-area">
    <h1 class="headline-order-complete"><i class="fas fa-check-circle fa-lg"></i>&nbsp;결제가 완료되었습니다</h1>
    <br>
    <p>주문 번호: ${buyId}</p>
    <jsp:useBean id="now" class="java.util.Date" />
    <fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
    <p>주문 일자: ${today}</p>
    <p>결제 방법: 카드</p>
    <p>카드 승인 번호: ${cardApplyNum}</p>
    <hr>
    <p>주문을 처리하고 있습니다. 24시간 이내에 주문 확인 이메일이 발송됩니다.<br>
    재고 상황에 따라 배송일이 변경되거나 부득이 주문이 취소될 수도 있습니다. 해당 경우 고객님께 전화나 이메일로 빠르게 연락 드리겠습니다.<br>
    배송의 경우, 주문한 제품의 수량 및 특성에 따라 박스가 2개 이상으로 나누어져 배송될 수 있습니다.<br>
    <br>
    배송일 및 기타 변경 문의는 가다 고객지원센터(1234-5678)로 연락 바랍니다.
    <hr>
    <p>주문 확인</p>
    <span>여기를 클릭하세요: </span><span class="view-detail" onclick="location.href='/shopping/buy_list/${buyId}'">주문 확인</span>
  </div>

  <%@ include file="/WEB-INF/views/includes/footer.jsp"%>

</body>

</html>