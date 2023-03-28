<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ page import="org.ict.first.member.model.vo.Member" %> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%
	Member loginMember = (Member)session.getAttribute("loginMember");
%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link
	href="https://fonts.googleapis.com/css2?family=Spectral:ital,wght@0,200;0,300;0,400;0,500;0,700;0,800;1,200;1,300;1,400;1,500;1,700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/css/animate.css">
<link rel="stylesheet" href="resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="resources/css/owl.theme.default.min.css">
<link rel="stylesheet" href="resources/css/magnific-popup.css">
<link rel="stylesheet" href="resources/css/flaticon.css">
<link rel="stylesheet" href="resources/css/style.css">
</head>
<body>
	<div class="wrap">
		<div class="container">
			<div class="row">
				<div class="col-md-6 d-flex align-items-center">
					<div align="center" class="top-total-sch main-sch-section">
						<form action="" class="input-box">
							<input type="text" size="20" id="Search" placeholder="상품검색"
								onkeydown=";" value="">
							<!-- <p class="input-box"><input type="text" id="wingSearch" placeholder="통합검색" onkeydown="onInputSearchKeyDown(event);" value=""> -->
							<input type='submit' class='btn-search' value="검색">
						</form>
					</div>
				</div>
				<div class="col-md-6 d-flex justify-content-md-end">
					<div class="social-media mr-4"></div>
					<div class="reg">
						<p class="mb-0">

							<c:if test="${empty loginMember}">
								<a
									href="${pageContext.servletContext.contextPath}/enrollPage.do"
									class="mr-2">Sign Up</a>
								<a href="${pageContext.servletContext.contextPath}/loginPage.do">Log
									In</a>
							</c:if>
							<c:if test="${!empty loginMember and loginMember ne 'Y'}">
		        	 		${loginMember.username}님 &nbsp;
		        	 		<a
									href="${pageContext.servletContext.contextPath}/logout.do">Log
									out</a>
		        	 		&nbsp;
		        	 		<c:url var="callMyInfo" value="/myinfo.do">
									<c:param name="userid" value="${loginMember.userid}"></c:param>
								</c:url>
								<a href="${callMyInfo}">My Page</a>
							</c:if>
							<c:if test="${!empty loginMember and loginMember eq 'Y'}">
		        	 		${loginMember.username}님 &nbsp;
		        	 		<a
									href="${pageContext.servletContext.contextPath}/logout.do">Log
									out</a>
		        	 		&nbsp;
		        	 		<c:url var="callMyInfo" value="/myinfo.do">
									<c:param name="userid" value="${loginMember.userid}"></c:param>
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
	<c:if test="${empty loginMember}">
		<nav
			class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
			id="ftco-navbar">
			<div class="container">
				<a class="navbar-brand" href="index.html">Dionysos <span>store</span></a>


				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#ftco-nav" aria-controls="ftco-nav"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="oi oi-menu"></span> Menu
				</button>



				<div class="collapse navbar-collapse" id="ftco-nav">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item active"><a href="index.html"
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
						<li class="nav-item"><a href="contact.html" class="nav-link">공지사항</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</c:if>
	<!-- 로그인(일반 유저) -->
	<c:if test="${!empty loginMember and loginMember.admin ne 'Y'}">
		<nav
			class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
			id="ftco-navbar">
			<div class="container">
				<a class="navbar-brand" href="index.html">Liquor <span>store</span></a>
				<div class="order-lg-last btn-group">
					<a href="#" class="btn-cart dropdown-toggle dropdown-toggle-split"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						<span class="flaticon-shopping-bag"></span>
						<div class="d-flex justify-content-center align-items-center">
							<small>3</small>
						</div>
					</a>
					<div class="dropdown-menu dropdown-menu-right">
						<div class="dropdown-item d-flex align-items-start" href="#">
							<div class="img"
								style="background-image: url(images/prod-1.jpg);"></div>
							<div class="text pl-3">
								<h4>Bacardi 151</h4>
								<p class="mb-0">
									<a href="#" class="price">$25.99</a><span class="quantity ml-3">Quantity:
										01</span>
								</p>
							</div>
						</div>
						<div class="dropdown-item d-flex align-items-start" href="#">
							<div class="img"
								style="background-image: url(images/prod-2.jpg);"></div>
							<div class="text pl-3">
								<h4>Jim Beam Kentucky Straight</h4>
								<p class="mb-0">
									<a href="#" class="price">$30.89</a><span class="quantity ml-3">Quantity:
										02</span>
								</p>
							</div>
						</div>
						<div class="dropdown-item d-flex align-items-start" href="#">
							<div class="img"
								style="background-image: url(images/prod-3.jpg);"></div>
							<div class="text pl-3">
								<h4>Citadelle</h4>
								<p class="mb-0">
									<a href="#" class="price">$22.50</a><span class="quantity ml-3">Quantity:
										01</span>
								</p>
							</div>
						</div>
						<a class="dropdown-item text-center btn-link d-block w-100"
							href="cart.html"> View All <span
							class="ion-ios-arrow-round-forward"></span>
						</a>
					</div>
				</div>

				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#ftco-nav" aria-controls="ftco-nav"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="oi oi-menu"></span> Menu
				</button>

				<div class="collapse navbar-collapse" id="ftco-nav">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item active"><a href="index.html"
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
						<li class="nav-item"><a href="contact.html" class="nav-link">공지사항</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</c:if>
	<!-- 로그인(관리자) -->
	<c:if test="${!empty loginMember and loginMember.admin eq 'Y'}">
		<!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->

		<div class="left-sidebar-pro">
			<nav id="sidebar" class="">
				<div class="sidebar-header">
					<a href="index.html"><img class="main-logo"
						src="resources/images/logo/logo.png" alt="" /></a>
				</div>
				<div class="nalika-profile">
					<div class="profile-social-dtl">
						<ul class="dtl-social">
							<li><a
								href="${ pageContext.servletContext.contextPath }/loginPage.do"><i
									class="icon nalika-facebook"></i></a></li>
						</ul>
					</div>
				</div>
				<div class="left-custom-menu-adp-wrap comment-scrollbar">
					<nav class="sidebar-nav left-sidebar-menu-pro">
						<ul class="metismenu" id="menu1">
							<li class="active"><a href="index.html"> <i
									class="icon nalika-home icon-wrap"></i> <span
									class="mini-click-non">관리자 Home</span>
							</a></li>
							<li><a href="mailbox.html" aria-expanded="false"><i
									class="icon nalika-mail icon-wrap"></i> <span
									class="mini-click-non">공지사항</span></a></li>
							<li><a href="mailbox.html" aria-expanded="false"><i
									class="icon nalika-diamond icon-wrap"></i> <span
									class="mini-click-non">메인사이트로 바로가기</span></a></li>
							<li><a class="has-arrow" href="mailbox.html"
								aria-expanded="false"><i
									class="icon nalika-pie-chart icon-wrap"></i> <span
									class="mini-click-non">회원관리</span></a>
								<ul class="submenu-angle" aria-expanded="false">
									<li><a title="File Manager" href="file-manager.html"><span
											class="mini-sub-pro">회원목록</span></a></li>
								</ul></li>
							<li><a class="has-arrow" href="mailbox.html"
								aria-expanded="false"><i
									class="icon nalika-bar-chart icon-wrap"></i> <span
									class="mini-click-non">상품 관리</span></a>
								<ul class="submenu-angle" aria-expanded="false">
									<li><a title="Bar Charts" href="bar-charts.html"><span
											class="mini-sub-pro">상품 통합 등록</span></a></li>
									<li><a title="Line Charts" href="line-charts.html"><span
											class="mini-sub-pro">리뷰 관리</span></a></li>
									<li><a title="Area Charts" href="area-charts.html"><span
											class="mini-sub-pro">Area Charts</span></a></li>
								</ul></li>
							<li><a class="has-arrow" href="mailbox.html"
								aria-expanded="false"><i class="icon nalika-table icon-wrap"></i>
									<span class="mini-click-non">문의 관리</span></a>
								<ul class="submenu-angle" aria-expanded="false">
									<li><a title="Peity Charts" href="static-table.html"><span
											class="mini-sub-pro">QnA 관리</span></a></li>
									<li><a title="Data Table" href="data-table.html"><span
											class="mini-sub-pro">1대1 문의 관리</span></a></li>
								</ul></li>
							<li><a class="has-arrow" href="mailbox.html"
								aria-expanded="false"><i class="icon nalika-forms icon-wrap"></i>
									<span class="mini-click-non">매출 관리</span></a>
								<ul class="submenu-angle" aria-expanded="false">
									<li><a title="Basic Form Elements"
										href="basic-form-element.html"><span class="mini-sub-pro">결제
												설정</span></a></li>
									<li><a title="Advance Form Elements"
										href="advance-form-element.html"><span
											class="mini-sub-pro">주문 목록</span></a></li>
									<li><a title="Password Meter" href="password-meter.html"><span
											class="mini-sub-pro">주문 취소목록</span></a></li>
									<li><a title="Multi Upload" href="multi-upload.html"><span
											class="mini-sub-pro">수정 취소 관리</span></a></li>
								</ul></li>

						</ul>
					</nav>
				</div>
			</nav>
		</div>
	</c:if>
</body>
</html>