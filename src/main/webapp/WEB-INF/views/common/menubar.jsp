<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="error.jsp" %>
<%-- <%@ page import="org.ict.first.User.model.vo.User" %> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%-- <%
	User loginUser = (User)session.getAttribute("loginUser");
%> --%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
#topBtn {
	position: fixed;
	right: 25px;
	bottom: 25px;
	display: none;
	z-index: 9;
}
</style>
<script type="text/javascript"
	src="${pageContext.servletContext.contextPath}/resources/js/jquery-3.6.3.min.js"></script>
<script>
	$(function() {
		$(window).scroll(function() {
			if ($(this).scrollTop() > 200) {
				$('#topBtn').fadeIn();
			} else {
				$('#topBtn').fadeOut();
			}
		});
		$("#topBtn").click(function() {
			$('html, body').animate({
				scrollTop : 0
			}, 300);
			return false;
		});
	});
</script>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/users/animate.css">
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/users/owl.carousel.min.css">
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/users/owl.theme.default.min.css">
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/users/magnific-popup.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/css/bootstrap-select.min.css">

<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/users/flaticon.css">
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/users/style.css">
</head>
<body>
	<div class="wrap">
		<div class="container">
			<div class="row">
				<div class="col-md-6 d-flex align-items-center">
					<div align="center" class="top-total-sch main-sch-section">
						<form
							action="psearch.do"
							class="input-box">
							<input type="hidden" name="action" value="product_name">
							<input type="search" size="20" name="keyword" placeholder="상품검색">
							<!-- <p class="input-box"><input type="text" id="wingSearch" placeholder="통합검색" onkeydown="onInputSearchKeyDown(event);" value=""> -->
							<input type='submit' class='btn-search' value="검색">
						</form>
					</div>
				</div>
				<div class="col-md-6 d-flex justify-content-md-end">
					<div class="social-media mr-4"></div>
					<div class="reg">
						<p class="mb-0">

							<c:if test="${empty loginUsers}">
								<a
									href="${pageContext.servletContext.contextPath}/enrollPage.do"
									class="mr-2">Sign Up</a>
								<a href="${pageContext.servletContext.contextPath}/loginPage.do">Log
									In</a>
							</c:if>
							<c:if test="${!empty loginUsers and loginUsers.admin ne 'Y'}">
		        	 		${loginUsers.name}님 &nbsp;
		        	 		<a
									href="${pageContext.servletContext.contextPath}/logout.do">Log
									out</a>
		        	 		&nbsp;
		        	 		<c:url var="callMyInfo" value="/myinfo.do">
									<c:param name="user_id" value="${loginUsers.user_id}"></c:param>
								</c:url>
								<a href="${callMyInfo}">My Page</a>
							</c:if>

						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 비로그인 상태 -->
	<c:if test="${empty loginUsers}">
		<nav
			class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
			id="ftco-navbar">
			<div class="container">
				<a class="navbar-brand" href="main.do">Dionysos <span>store</span></a>


				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#ftco-nav" aria-controls="ftco-nav"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="oi oi-menu"></span> Menu
				</button>



				<div class="collapse navbar-collapse" id="ftco-nav">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item active"><a href="main.do"
							class="nav-link">Home</a></li>
						<li class="nav-item"><a href="about.html" class="nav-link">와인사전</a></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="dropdown04"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">추천상품</a>
							<div class="dropdown-menu" aria-labelledby="dropdown04">
								<a class="dropdown-item" href="product.html">와인 종류</a> <a
									class="dropdown-item" href="product-single.html">원산지</a> <a
									class="dropdown-item" href="cart.html">가격대</a> <a
									class="dropdown-item" href="checkout.html">특성</a>
							</div></li>
						<li class="nav-item"><a href="blog.html" class="nav-link">미니게임</a></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="dropdown04"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">고객센터</a>
							<div class="dropdown-menu" aria-labelledby="dropdown04">
								<a class="dropdown-item"
									href="${pageContext.servletContext.contextPath}/nlist.do">공지사항</a>
								<a class="dropdown-item"
									href="${pageContext.servletContext.contextPath}/flist.do">자주하는
									질문</a> <a class="dropdown-item"
									href="${pageContext.servletContext.contextPath}/qalist.do">1:1
									문의</a>
							</div></li>
					</ul>
				</div>
			</div>
		</nav>
	</c:if>
	<!-- 로그인(일반 유저) -->
	<c:if test="${!empty loginUsers and loginUsers.admin eq 'N'}">
		<nav
			class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
			id="ftco-navbar">
			<div class="container">
				<a class="navbar-brand" href="main.do">Liquor <span>store</span></a>
				

				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#ftco-nav" aria-controls="ftco-nav"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="oi oi-menu"></span> Menu
				</button>

				<div class="collapse navbar-collapse" id="ftco-nav">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item active"><a href="main.do"
							class="nav-link">Home</a></li>
						<li class="nav-item"><a href="about.html" class="nav-link">와인사전</a></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="dropdown04"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">추천상품</a>
							<div class="dropdown-menu" aria-labelledby="dropdown04">
								<a class="dropdown-item" href="product.html">와인 종류</a> <a
									class="dropdown-item" href="product-single.html">원산지</a> <a
									class="dropdown-item" href="cart.html">가격대</a> <a
									class="dropdown-item" href="checkout.html">특성</a>
							</div></li>
						<li class="nav-item"><a href="blog.html" class="nav-link">미니게임</a></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="dropdown04"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">고객센터</a>
							<div class="dropdown-menu" aria-labelledby="dropdown04">
								<a class="dropdown-item"
									href="${pageContext.servletContext.contextPath}/nlist.do">공지사항</a>
								<a class="dropdown-item"
									href="${pageContext.servletContext.contextPath}/flist.do">자주하는
									질문</a> <a class="dropdown-item"
									href="${pageContext.servletContext.contextPath}/qalist.do">1:1
									문의</a>
							</div></li>
					</ul>
				</div>
			</div>
		</nav>
	</c:if>

	<div class="hero-wrap"
		style="background-image: url('resources/images/users/bg_5.jpg');">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-8 ftco-animate d-flex align-items-end">
					<div class="text w-100 text-center">
						<h1 class="mb-4">
							Dionysos <span>Wine</span> Shop<span>&</span> Dictionary
						</h1>
					</div>
				</div>
			</div>
		</div>
	</div>
	<img id="topBtn"
		src="${pageContext.servletContext.contextPath}/resources/images/users/top.png"
		align="right">
	<script
		src="${pageContext.servletContext.contextPath}/resources/js/users/jquery.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/js/users/jquery-migrate-3.0.1.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/js/users/popper.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/js/users/bootstrap.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/js/users/jquery.easing.1.3.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/js/users/jquery.waypoints.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/js/users/jquery.stellar.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/js/users/owl.carousel.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/js/users/jquery.magnific-popup.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/js/users/jquery.animateNumber.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/js/users/scrollax.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/js/users/main.js"></script>

</body>

</html>