<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- favicon
		============================================ -->
<link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">
<!-- Google Fonts
		============================================ -->
<link
	href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,700,900"
	rel="stylesheet">
<!-- Bootstrap CSS
		============================================ -->
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/store/bootstrap.min.css">
<!-- Bootstrap CSS
		============================================ -->
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/store/font-awesome.min.css">
<!-- nalika Icon CSS
		============================================ -->
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/store/nalika-icon.css">
<!-- owl.carousel CSS
		============================================ -->
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/store/owl.carousel.css">
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/store/owl.theme.css">
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/store/owl.transitions.css">
<!-- animate CSS
		============================================ -->
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/store/animate.css">
<!-- normalize CSS
		============================================ -->
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/store/normalize.css">
<!-- meanmenu icon CSS
		============================================ -->
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/store/meanmenu.min.css">
<!-- main CSS
		============================================ -->
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/store/main.css">
<!-- morrisjs CSS
		============================================ -->
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/morrisjs/morris.css">
<!-- mCustomScrollbar CSS
		============================================ -->
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/store/scrollbar/jquery.mCustomScrollbar.min.css">
<!-- metisMenu CSS
		============================================ -->
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/store/metisMenu/metisMenu.min.css">
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/store/metisMenu/metisMenu-vertical.css">
<!-- calendar CSS
		============================================ -->
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/store/calendar/fullcalendar.min.css">
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/store/calendar/fullcalendar.print.min.css">
<!-- style CSS
		============================================ -->
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/store/style.css">
<!-- responsive CSS
		============================================ -->
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/store/responsive.css">
<!-- modernizr JS
		============================================ -->
<script
	src="${pageContext.servletContext.contextPath}/resources/js/store/vendor/modernizr-2.8.3.min.js"></script>

<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Hahmlet&display=swap');

@font-face{
 src:url("../fonts/Hahmlet-VariableFont_wght.woff");
 font-family : "Hahmlet";
}

* {
font-family: 'Hahmlet', serif;
}
</style>
</head>

<body>
	<!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->

	<div class="left-sidebar-pro">
        <nav id="sidebar" class="">
            <div class="sidebar-header">
                <a href="admin.do"><img class="main-logo" src="resources/images/users/logo.png" alt="" /></a>
                <strong><img src="img/logo/logosn.png" alt="" /></strong>
            </div>
			<div class="nalika-profile">
				<div class="profile-dtl">
					
					<h2>${loginStore.store_name}님 &nbsp;<span class="min-dtn"></span></h2>
				</div>
				
			</div>
            <div class="left-custom-menu-adp-wrap comment-scrollbar">
                <nav class="sidebar-nav left-sidebar-menu-pro">
                    <ul class="metismenu" id="menu1">
                        <li class="active">
                            <a class="has-arrow" href="store.do">
								   <i class="icon nalika-home icon-wrap"></i>
								   <span class="mini-click-non">H O M E</span>
								</a></li>
						<li><a class="has-arrow" href="mailbox.html"
							aria-expanded="false"><i class="icon nalika-table icon-wrap"></i>
								<span class="mini-click-non">매 장 관 리</span></a>
							<ul class="submenu-angle" aria-expanded="false">
								<c:url var="callstoreinfo" value="/storeinfo.do">
									<c:param name="store_id" value="${ loginStore.store_id }" />
								</c:url>
								<li><a title="Inbox" href="${ callstoreinfo }"><span
										class="mini-sub-pro">매장 정보</span></a></li>
								<c:url var="stocklist" value="/adminStockListView.do">
									<c:param name="store_id" value="${ loginStore.store_id }" />
								</c:url>
								<li><a title="View Mail" href="${stocklist}"><span
										class="mini-sub-pro">재고 관리</span></a></li>
							</ul></li>
					</ul>
				</nav>
			</div>
		</nav>
	</div>
	<!-- Start Welcome area -->
	 <div class="all-content-wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="logo-pro">
                        <a href="index.html"><img class="main-logo" src="img/logo/logo.png" alt="" /></a>
                    </div>
                </div>
            </div>
        </div>
        <div class="header-advance-area">
            <div class="header-top-area">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="header-top-wraper">
                                <div class="row">
                                    <div class="col-lg-1 col-md-0 col-sm-1 col-xs-12">
                                        <div class="menu-switcher-pro">
                                            <button type="button" id="sidebarCollapse" class="btn bar-button-pro header-drl-controller-btn btn-info navbar-btn">
													<i class="icon nalika-menu-task"></i>
												</button>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-7 col-sm-6 col-xs-12">
                                        
                                    </div>
                                    <div class="col-lg-5 col-md-5 col-sm-12 col-xs-12">
                                        <div class="header-right-info">
                                            <ul class="nav navbar-nav mai-top-nav header-right-menu">
                                                <li class="nav-item">
                                                    <a href="logout.do">
				<i class="icon nalika-user"></i>
				<span class="store-name">LogOut</span></a>
															
	
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
</body>
</html>