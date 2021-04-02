<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>결제</title>

  <style>
    /* Common */
    .information-headline {
      font-size: 22px;
    }

    /* Content */
    .input-box {
      /* border: 1px solid rgb(235. 235. 235) !important; */
      width: 65%;
      height: 40px;
      margin-bottom: 15px;
      margin-right: 10px;
    }

    .input-button {
      height: 40px;
    }

    .product-img {
      width: 100%;
      height: 100%;
      border-radius: 8px;
      object-fit: cover;
    }

    .price {
      text-align: right;
    }

    .nav-link {
      color: #000000;
    }

    .nav-link:hover {
      color: #000000;
    }

    .tab-content {
      height: 330px;
      margin-top: 20px;
    }

    /* Widget */
    .widget {
      border: 1px solid rgb(221, 221, 221);
      border-radius: 12px;
      padding: 24px !important;
    }

    .widget-product-information {
      margin: 20px;
    }

    .product-name {
      width: 100%;
      height: 100%;
    }

    .product-area {
      height: 400px;
      overflow: scroll;
      overflow-x: hidden;
    }

    .total-price {
      float: right;
    }

    .use-point {
      float: right;
    }

    .payment-amount {
      float: right;
    }

    .pay-button {
      background-color: #FE5000;
      color: #FFFFFF;
      font-size: 20px;
      width: 100%;
      height: 50px;
      margin-top: 10px;
      border-radius: 32px;
      border: none;
      outline: none;
    }
  </style>

  <!-- Bootstrap -->
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"></script>

</head>

<body>
  <div class="container">
    <div class="row">
      <div class="col-md-8 content">
        <h2 class="information-headline">배송 정보</h2>
        <ul class="nav nav-tabs">
          <li class="nav-item">
            <a class="nav-link active" data-toggle="tab" href="#existing">기존 배송지</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="tab" href="#new">신규 입력</a>
          </li>
        </ul>
        <div class="tab-content">
          <div class="tab-pane fade show active" id="existing">
            <p>AIAacademy(서울 강북구 수유로12가길 2)</p>
            <p>직장(경기 성남시 분당구 대왕판교로 477)</p>
            <p>집(서울 강남구 가로수길 5)</p>
          </div>
          <div class="tab-pane fade" id="new">
            <input type="text" class="input-box" placeholder="배송지명"><br>
            <input type="text" class="input-box" placeholder="수령인"><br>
            <input type="text" class="input-box" placeholder="우편번호">
            <button class="input-button">우편번호 찾기</button><br>
            <input type="text" class="input-box" placeholder="주소"><br>
            <input type="text" class="input-box" placeholder="상세주소"><br>
            <input type="text" class="input-box" placeholder="연락처">
          </div>
        </div>
        <hr>
        <h2 class="information-headline">포인트 사용</h2>
        <input type="text" class="input-box" placeholder="포인트">
        <button class="input-button">모두 사용</button><br>
        <span>잔여 포인트</span>
        <hr>
      </div>


      <!-- Widget -->
      <div class="col-md-4 widget">
        <div class="product-area">
          <div class="row widget-product-information">
            <div class="col-md-5">
              <img src="${pageContext.request.contextPath}/resources/img/product/luggage/5.jpg" class="product-img">
            </div>
            <div class="col-md-7">
              <a href="#">캐리어</a><br>
              쌤소나이트 캐리어<br>15000<br>
              수량 1개
            </div>
          </div>
          <!--  -->
          <div class="row widget-product-information">
            <div class="col-md-5">
              <img src="${pageContext.request.contextPath}/resources/img/product/luggage/5.jpg" class="product-img">
            </div>
            <div class="col-md-7">
              <a href="#">캐리어</a><br>
              쌤소나이트 캐리어<br>15000<br>
              수량 1개
            </div>
          </div>
          <!--  -->
          <div class="row widget-product-information">
            <div class="col-md-5">
              <img src="${pageContext.request.contextPath}/resources/img/product/luggage/5.jpg" class="product-img">
            </div>
            <div class="col-md-7">
              <a href="#">캐리어</a><br>
              쌤소나이트 캐리어<br>15000<br>
              수량 1개
            </div>
          </div>
          <div class="row widget-product-information">
            <div class="col-md-5">
              <img src="${pageContext.request.contextPath}/resources/img/product/luggage/5.jpg" class="product-img">
            </div>
            <div class="col-md-7">
              <a href="#">캐리어</a><br>
              쌤소나이트 캐리어<br>15000<br>
              수량 1개
            </div>
          </div>
        </div>
        <hr>

        <h2 class="information-headline">결제 세부정보</h2>
        <span class="total-price-title">총 상품 금액</span>
        <span class="total-price">₩150000</span><br>
        <span class="use-point-title">포인트 사용</span>
        <span class="use-point">-1000</span><br>
        <strong class="payment-amount-title">총 결제 금액</strong>
        <strong class="payment-amount">₩140000</strong><br>
        <hr>
        <input type="checkbox">
        <span>(필수) 상품 및 결제 정보를 확인하였으며, 이에 동의합니다.</span>
        <button class="pay-button">결제하기</button>
      </div>
    </div>
  </div>

</body>

</html>