<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript"
	src="${pageContext.servletContext.contextPath}/resources/js/jquery-3.6.3.min.js"></script>
<script type="text/javascript">

	$(document).ready(function() {
		
		var user_id = $("#user_id").val();
		var product_id = $("#product_id").val();
		
		$("input[name='cal_info']").click(function() {
			
			var qty = $(".order_quantity").val();
			var price = "<c:out value='${product.product_price}'/>";
			
			var amount = price * qty;
			
			order_price = amount;
			$("#price").html(order_price);
			$("#totalprice").html(order_price);
			$("#amount").val(order_price);

		});
		
});
</script>
<link
	href="https://fonts.googleapis.com/css2?family=Spectral:ital,wght@0,200;0,300;0,400;0,500;0,700;0,800;1,200;1,300;1,400;1,500;1,700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/animate.css">
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/owl.theme.default.min.css">
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/magnific-popup.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/css/bootstrap-select.min.css">
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/flaticon.css">
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/style.css">
</head>
<body>
	<c:import url="/WEB-INF/views/common/menubar.jsp" />
	<div class="row qnas" style="text-align: center;">
		<h1 class="page-header">주문하기</h1>
		<table class="table table-hover"
			style="width: 70%; margin: auto; border-bottom: 1px solid #D5D5D5;">
			<thead>
				<tr>
					<th colspan="2" style="text-align: center;">상품명</th>
					<th>가격</th>
					<th>수량</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><img alt="thumbnail" src="" width="40%"> <input
						type="hidden" value="${product.product_id}" name="product_id"
						id="productId"></td>
					<td>${product.product_name}<br>${product.description}</td>
					<td><fmt:formatNumber type="number"
							value="${product.product_price}" />&nbsp;원</td>
				</tr>
			</tbody>
		</table>
	</div>

	<div class="row" style="text-align: center; margin: 80px 0;">
		<c:set value="${myinfo}" var="vo" />
		<h1 class="page-header">주문정보 확인</h1>
		<h4 style="color: red;">주문자 정보와 다른 경우 직접 입력해주세요.</h4>
	</div>
	<div class="row">
		<div class="form-horizontal">
			<div class="form-group">
				<label for="user_id" class="col-sm-2 control-label">ID</label>
				<div class="col-sm-10">
					<input class="form-control" id="user_id" placeholder="ID"
						name="userid" value="${users.user_id}" readonly>
				</div>
			</div>

			<div class="form-group">
				<label for="Name" class="col-sm-2 control-label">Name</label>
				<div class="col-sm-10">
					<input class="form-control" id="Name" placeholder="이름" name="name"
						value="${users.name}">
				</div>
			</div>
			<div class="form-group">
				<label for="Email" class="col-sm-2 control-label">Email</label>
				<div class="col-sm-10">
					<input type="email" class="form-control" id="Email"
						placeholder="Email" name="email" value="${users.email}">
				</div>
			</div>
			<div class="form-group">
				<label for="phone" class="col-sm-2 control-label">Tel</label>
				<div class="col-sm-10">
					<input type="tel" class="form-control" id="phone"
						placeholder="전화번호" name="tel" value="${users.phone}">
				</div>
			</div>

		</div>
	</div>
	<!-- class=row -->

	<div class="row" style="text-align: center; margin: 80px 0;">
		<h1 class="page-header">결제수단 확인</h1>
		<div style="text-align: center;">
			<input type="radio" name="cal_info" value="no_bankingBook"><label style="margin-right: 50px;">&nbsp;무통장 입금</label> 
			<input type="radio" name="cal_info" value="card"><label>&nbsp;카드 결제</label>
		</div>
		<hr>
		<div class="row" style="text-align: center; margin: 50px 0;">
			<label>상품가격 :&nbsp; <span id="product_price"></span>&nbsp;원
			</label> <span class="glyphicon glyphicon-plus" aria-hidden="true"></span> 
			 <span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span>
			<label style="font-size: 1.5em;">총 결제금액 : 
			<span id="totalprice"></span>&nbsp;원 
			<input type="hidden" id="amount" name="order_price">
			</label>
		</div>
		<div>
			<button class="btn btn-default cal-btn" type="submit">결제하기</button>
			<button class="btn btn-default back_btn">돌아가기</button>
		</div>
	</div>
	</form>
	</div>


	</section>
	<footer>
		<c:import url="/WEB-INF/views/common/footer.jsp" />
	</footer>
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div>
	<script
		src="${pageContext.servletContext.contextPath}/resources/js/jquery.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/js/jquery-migrate-3.0.1.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/js/popper.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/js/jquery.easing.1.3.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/js/jquery.waypoints.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/js/jquery.stellar.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/js/owl.carousel.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/js/jquery.magnific-popup.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/js/jquery.animateNumber.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/js/scrollax.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/js/main.js"></script>
</body>
</body>
</html>