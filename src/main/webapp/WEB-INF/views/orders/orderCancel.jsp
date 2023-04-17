<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 완료</title>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Hahmlet&display=swap');

@font-face {
	src: url("../fonts/Hahmlet-VariableFont_wght.woff");
	font-family: "Hahmlet";
}

* {
	font-family: 'Hahmlet', serif;
}

table {
	border-collapse: collapse;
	border-spacing: 0;
}

section.notice {
	padding: 80px 0;
}

.page-title {
	margin-bottom: 60px;
}

.page-title h3 {
	font-size: 28px;
	color: #333333;
	font-weight: 400;
	text-align: center;
}

#board-search .search-window {
	padding: 15px 0;
	background-color: #f9f7f9;
}

#board-search .search-window .search-wrap {
	position: relative;
	/*   padding-right: 124px; */
	margin: 0 auto;
	width: 80%;
	max-width: 564px;
}

#board-search .search-window .search-wrap input {
	height: 40px;
	width: 100%;
	font-size: 14px;
	padding: 7px 14px;
	border: 1px solid #ccc;
}

#board-search .search-window .search-wrap input:focus {
	border-color: #333;
	outline: 0;
	border-width: 1px;
}

#board-search .search-window .search-wrap .btn {
	position: absolute;
	right: 0;
	top: 0;
	bottom: 0;
	width: 70px;
	height: 39px;
	padding: 0;
	font-size: 16px;
}

.board-table {
	font-size: 13px;
	width: 60%;
	border-top: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
}

.board-table a {
	color: #333;
	display: inline-block;
	line-height: 1.4;
	word-break: break-all;
	vertical-align: middle;
}

.board-table a:hover {
	text-decoration: underline;
}

.board-table th {
	text-align: center;
}

.board-table .th-num {
	width: 100px;
	text-align: center;
}

.board-table .th-date {
	width: 200px;
}

.board-table th, .board-table td {
	padding: 14px 0;
}

.board-table tbody td {
	border-top: 1px solid #e7e7e7;
	text-align: center;
}

.board-table tbody th {
	padding-left: 28px;
	padding-right: 14px;
	border-top: 1px solid #e7e7e7;
	text-align: left;
}

.board-table tbody th p {
	display: none;
}

.btn {
	display: inline-block;
	padding: 0 30px;
	font-size: 15px;
	font-weight: 400;
	background: transparent;
	text-align: center;
	white-space: nowrap;
	vertical-align: middle;
	-ms-touch-action: manipulation;
	touch-action: manipulation;
	cursor: pointer;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	border: 1px solid transparent;
	text-transform: uppercase;
	-webkit-border-radius: 0;
	-moz-border-radius: 0;
	border-radius: 0;
	-webkit-transition: all 0.3s;
	-moz-transition: all 0.3s;
	-ms-transition: all 0.3s;
	-o-transition: all 0.3s;
	transition: all 0.3s;
}

.btn-dark {
	background: #555;
	color: #fff;
}

.btn-dark:hover, .btn-dark:focus {
	background: #373737;
	border-color: #373737;
	color: #fff;
}

.btn-dark {
	background: #555;
	color: #fff;
}

.btn-dark:hover, .btn-dark:focus {
	background: #373737;
	border-color: #373737;
	color: #fff;
}

.btn2 {
	display: inline-block;
	padding: 0 30px;
	font-size: 15px;
	font-weight: 400;
	background: transparent;
	text-align: center;
	white-space: nowrap;
	vertical-align: middle;
	-ms-touch-action: manipulation;
	touch-action: manipulation;
	cursor: pointer;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	border: 1px solid transparent;
	text-transform: uppercase;
	-webkit-border-radius: 0;
	-moz-border-radius: 0;
	border-radius: 0;
	-webkit-transition: all 0.3s;
	-moz-transition: all 0.3s;
	-ms-transition: all 0.3s;
	-o-transition: all 0.3s;
	transition: all 0.3s;
}

.btn-gray {
	background: #555;
	color: #fff;
}

/* reset */
* {
	list-style: none;
	text-decoration: none;
	padding: 0;
	margin: 0;
	box-sizing: border-box;
}

.clearfix:after {
	content: '';
	display: block;
	clear: both;
}

.container {
	width: 1100px;
	margin: 0 auto;
}

.blind {
	position: absolute;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	margin: -1px;
	width: 1px;
	height: 1px;
}
</style>
</head>
<body>
	<!-- 절대경로로 대상 파일의 위치를 지정한 경우  -->
	<c:import url="/WEB-INF/views/common/menubar.jsp" />
	<section class="notice">
		<div id="board-list" align="center">
			<div class="container">
				<h1 align="center">주문완료</h1>
				<section align="center">
					<div align="center" width="500" height="100"
						border="1px solid gray">고객님의 주문이 정상적으로 완료되었습니다.</div>
					<br> 고객님이 주문하신 주문번호는 ${order.order_number}입니다. <br> <br>
					주문내역 확인은 마이페이지에서 확인하실 수 있습니다.
				</section>
				<!-- 바로 구매 결제 성공시 -->
				<c:if test="${ empty olist }">
					<table align="center" class="board-table">
						<tbody>
							<tr>
								<th colspan="2" scope="col" class="th-title">결제 내역</th>
							</tr>
							<tr>
								<th scope="col" class="th-title">구매하신 상품</th>
								<td><img
									src="${ pageContext.servletContext.contextPath }${product.product_image}"
									width="80" height="80"> ${product.product_name} <br>
									(${product.product_ename})</td>
							</tr>
							<tr>
								<th scope="col" class="th-date">총 결제금액</th>
								<td>수량 : ${order.order_qty}, <fmt:formatNumber
										value="${order.total_price}" type="currency" />
								</td>
							</tr>
							<tr>
								<th scope="col" class="th-date">수령할 매장</th>
								<td>매장명 : ${ store.store_name }<br> 주소 :
									${store.address }
								</td>
							</tr>
						</tbody>
					</table>
				</c:if>
				<!-- 장바구니에서 구매 결제 성공시 -->
				<c:if test="${ !empty olist }">
					<table align="center" class="board-table">
						<tbody>
							<tr>
								<th colspan="2" scope="col" class="th-title">결제 내역</th>
							</tr>
							<c:forEach items="${olist}" var="o">
								<tr>
									<th scope="col" class="th-title">구매하신 상품</th>
									<td><img
										src="${ pageContext.servletContext.contextPath }${o.product_image}"
										width="80" height="80"> ${o.product_name} &nbsp;
										${o.order_qty} 개,  ${o.total_price} 원 <br></td>
								</tr>
								<tr>
									<th scope="col" class="th-date">수령할 매장</th>
									<td>매장명 : ${ o.store_name }<br>
									</td>
								</tr>
							</c:forEach>
							<tr>
								<th scope="col" class="th-date">총 결제금액</th>
								<td>총 수량 : ${order.order_qty}, <fmt:formatNumber value="${order.total_price}" type="currency" />
								</td>
							</tr>

						</tbody>
					</table>
				</c:if>
				<br>
				<div align="center">
					<button class="btn2 btn-gray" onclick="common/main">홈페이지로
						이동</button>
				</div>
			</div>
		</div>
	</section>
	<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>