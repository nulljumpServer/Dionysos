<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
  <head>
    <title>결제 정보 상세정보</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
   <script type="text/javascript"
	src="${pageContext.servletContext.contextPath}/resources/js/jquery-3.6.3.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Spectral:ital,wght@0,200;0,300;0,400;0,500;0,700;0,800;1,200;1,300;1,400;1,500;1,700&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/users/font-awesome.min.css">
<link rel="stylesheet"	href="${pageContext.servletContext.contextPath}/resources/css/users/animate.css">
<link rel="stylesheet"	href="${pageContext.servletContext.contextPath}/resources/css/users/owl.carousel.min.css">
<link rel="stylesheet"	href="${pageContext.servletContext.contextPath}/resources/css/users/owl.theme.default.min.css">
<link rel="stylesheet"	href="${pageContext.servletContext.contextPath}/resources/css/users/magnific-popup.css">
<link rel="stylesheet"	href="${pageContext.servletContext.contextPath}/resources/css/users/bootstrap-select.min.css">
<link rel="stylesheet"	href="${pageContext.servletContext.contextPath}/resources/css/users/flaticon.css">
<link rel="stylesheet"	href="${pageContext.servletContext.contextPath}/resources/css/users/style.css">
<!-- iamport.payment.js -->
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<meta charset="UTF-8">

<style>
  body {
  font-family: 'Spectral', sans-serif;
  font-size: 24px;
  background-color: #fff6f6;
  color: #555;
  margin: 0;
  padding: 0;
}

h2,
h3 {
  text-align: center;
  margin-top: 30px;
  margin-bottom: 30px;
  color: #A05C5C;
  font-size: 42px;
  font-weight: bold;
}

  table {
  margin: 0 auto;
  width: 90%;
  border-collapse: separate;
  border-spacing: 0;
  border-radius: 10px;
  overflow: hidden;
  background-color: #fff;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

  table,
  th,
  td {
    border: 2px solid #A05C5C;
    padding: 16px;
    font-size: 28px; 
    font-weight: normal;
    text-align: center;
    border-radius: 10px;
  }


th {
  background-color: #f2d8d8;
  text-align: left;
  color: #A05C5C;
  font-weight: bold;
}

input[readonly] {
  background-color: #f2d8d8;
  border: none;
  font-size: 20px;
  color: #444444;
}


    button {
    background-color: #A05C5C;
    border: none;
    color: #fff;
    padding: 20px 40px; 
    text-align: center;
    display: inline-block;
    margin: 20px 5px;
    cursor: pointer;
    font-size: 20px; 
    border-radius: 10px;
    transition: all 0.3s ease-in-out;
    width: 200px; 
  }


  button:hover {
    background-color: #8C4444;
  }

  hr {
  border: 0;
  height: 2px;
  background-image: linear-gradient(to right, rgba(0, 0, 0, 0.1), rgba(0, 0, 0, 0.75), rgba(0, 0, 0, 0.1));
  margin: 70px 0;
}

div.col-md-8 {
  font-size: 20px;
}

button.btn-primary {
  font-size: 20px;
}

button.btn-secondary {
  font-size: 18px;
}

</style> 

</head>
<body>
<c:import url="/WEB-INF/views/common/menubar.jsp" />
<hr><br>

<div class="container">
  <div class="row justify-content-center">
    <div class="col-md-8">
      <div class="card">
        <div class="card-header">
          <h2 class="text-center">결제 정보 상세정보</h2>
        </div>
        <div class="card-body">
          <h3 class="card-title">구매자 정보</h3>
          <div class="row">
            <div class="col-md-4">이름 :</div>
            <div class="col-md-8">${requestScope.users.name}</div>
          </div>
          <div class="row">
            <div class="col-md-4">이메일 :</div>
            <div class="col-md-8">${requestScope.users.email}</div>
          </div>
          <div class="row">
            <div class="col-md-4">전화번호 :</div>
            <div class="col-md-8">${requestScope.users.phone}</div>
          </div>
          <hr>
          <h3 class="card-title">주문 정보</h3>
          <div class="row">
            <div class="col-md-4">상품명 :</div>
            <div class="col-md-8">${product.product_name}</div>
          </div>
          <div class="row">
            <div class="col-md-4">수량 :</div>
            <div class="col-md-8">${order.order_qty} 개</div>
          </div>
          <div class="row">
            <div class="col-md-4">총 상품 금액 :</div>
            <div class="col-md-8">${order.total_price} 원</div>
          </div>
          <hr>
          <h3 class="card-title">결제 정보</h3>
          <div class="row">
            <div class="col-md-4">총상품 금액 :</div>
            <div class="col-md-8">${order.total_price} 원</div>
          </div>
          <div class="row">
            <div class="col-md-4">총 결제 금액 :</div>
            <div class="col-md-8">${order.total_price} 원</div>
          </div>
          <hr>
          <div class="text-center">
            <button class="btn btn-primary" onclick="requestPay();">결제하기</button>
            <button class="btn btn-secondary" onclick="history.back();">결제 취소</button>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- 결제 api -->
<script type="text/javascript">
	function requestPay() {
		 var IMP = window.IMP;
	        IMP.init('imp24866027');   // 가맹점 식별코드       
	        IMP.request_pay({
            pg: 'kcp',
            pay_method: 'card',
            merchant_uid: "${order.order_number}", // 주문 번호로 변경
            amount: 10,//"${order.total_price}", // 주문 총 금액으로 변경 
            buyer_name: "${ sessionScope.loginUsers.name }", // 사용자 이름으로 변경
            buyer_email: "${ sessionScope.loginUsers.email }", // 사용자 이메일
            
        }, function(rsp) {
				console.log(rsp);
				if (rsp.success) {
					var msg = '결제가 완료되었습니다.';
					msg += '고유ID : ' + rsp.imp_uid;
					msg += '상점 거래ID : ' + rsp.merchant_uid;
					msg += '결제 금액 : ' + rsp.paid_amount;
					msg += '카드 승인번호 : ' + rsp.apply_num;
					
					var clist="${ requestScope.clist }";
					if(clist == null){
						location.href = "${pageContext.servletContext.contextPath}/moveSuccess.do?product_id=${product.product_id}&user_id=${loginUsers.user_id}&order_qty=${order.order_qty}&store_id=${store.store_id}";
					}else{
						location.href = "${pageContext.servletContext.contextPath}/movelistSuccess.do?user_id=${loginUsers.user_id}&order_number=${order.order_number}";
					}
				} else {
					var msg = '결제에 실패하였습니다.';
					msg += '에러내용 : ' + rsp.error_msg;
				}
				alert(msg);
			});
		}
	</script>
	<br>
<hr>
  <footer>
     	<c:import url="/WEB-INF/views/common/footer.jsp" />
    </footer>
 <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>

		<script src="${pageContext.servletContext.contextPath}/resources/js/jquery.min.js"></script>
		<script src="${pageContext.servletContext.contextPath}/resources/js/jquery-migrate-3.0.1.min.js"></script>
		<script src="${pageContext.servletContext.contextPath}/resources/js/popper.min.js"></script>
		<script src="${pageContext.servletContext.contextPath}/resources/js/bootstrap.min.js"></script>
		<script src="${pageContext.servletContext.contextPath}/resources/js/jquery.easing.1.3.js"></script>
		<script src="${pageContext.servletContext.contextPath}/resources/js/jquery.waypoints.min.js"></script>
		<script src="${pageContext.servletContext.contextPath}/resources/js/jquery.stellar.min.js"></script>
		<script src="${pageContext.servletContext.contextPath}/resources/js/owl.carousel.min.js"></script>
		<script src="${pageContext.servletContext.contextPath}/resources/js/jquery.magnific-popup.min.js"></script>
		<script src="${pageContext.servletContext.contextPath}/resources/js/jquery.animateNumber.min.js"></script>
		<script src="${pageContext.servletContext.contextPath}/resources/js/scrollax.min.js"></script>
		<script src="${pageContext.servletContext.contextPath}/resources/js/main.js"></script>		
</body>
</html>