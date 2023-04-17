<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- favicon
		============================================ -->
    <link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">
    <!-- Google Fonts
		============================================ -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,700,900" rel="stylesheet">
    <!-- Bootstrap CSS
		============================================ -->
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/admin/bootstrap.min.css">
    <!-- Bootstrap CSS
		============================================ -->
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/admin/font-awesome.min.css">
	<!-- nalika Icon CSS
		============================================ -->
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/admin/nalika-icon.css">
    <!-- owl.carousel CSS
		============================================ -->
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/admin/owl.carousel.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/admin/owl.theme.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/admin/owl.transitions.css">
    <!-- animate CSS
		============================================ -->
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/admin/animate.css">
    <!-- normalize CSS
		============================================ -->
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/admin/normalize.css">
    <!-- meanmenu icon CSS
		============================================ -->
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/admin/meanmenu.min.css">
    <!-- main CSS
		============================================ -->
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/admin/main.css">
    <!-- morrisjs CSS
		============================================ -->
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/morrisjs/morris.css">
    <!-- mCustomScrollbar CSS
		============================================ -->
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/admin/scrollbar/jquery.mCustomScrollbar.min.css">
    <!-- metisMenu CSS
		============================================ -->
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/admin/metisMenu/metisMenu.min.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/admin/metisMenu/metisMenu-vertical.css">
    <!-- calendar CSS
		============================================ -->
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/admin/calendar/fullcalendar.min.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/admin/calendar/fullcalendar.print.min.css">
    <!-- style CSS
		============================================ -->
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/admin/style.css">
    <!-- responsive CSS
		============================================ -->
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/admin/responsive.css">
    <!-- modernizr JS
		============================================ -->
    <script src="${pageContext.servletContext.contextPath}/resources/js/admin/vendor/modernizr-2.8.3.min.js"></script>
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
					
					<h2>${loginUsers.name}님 &nbsp;<span class="min-dtn"></span></h2>
				</div>
				
			</div>
            <div class="left-custom-menu-adp-wrap comment-scrollbar">
                <nav class="sidebar-nav left-sidebar-menu-pro">
                    <ul class="metismenu" id="menu1">
                        <li class="active">
                            <a class="has-arrow" href="admin.do">
								   <i class="icon nalika-home icon-wrap"></i>
								   <span class="mini-click-non">H O M E</span>
								</a>
                            
                        </li>
                        <li>
                            <a class="has-arrow" href="mailbox.html" aria-expanded="false"><i class="icon nalika-diamond icon-wrap"></i> <span class="mini-click-non">회 원 관 리</span></a>
                            <ul class="submenu-angle" aria-expanded="false">
                            	<li><a title="Users" href="adminUsersListView.do"><span class="mini-sub-pro">사용자 관리</span></a></li>
                                <li><a title="Store" href="adminStoreListView.do"><span class="mini-sub-pro">매장관리</span></a></li>
                                
                            </ul>
                        </li>
                        <li>
                            <a class="has-arrow" href="mailbox.html" aria-expanded="false"><i class="icon nalika-diamond icon-wrap"></i> <span class="mini-click-non">상 품 관 리</span></a>
                            <ul class="submenu-angle" aria-expanded="false">
                                <li><a title="Product" href="adminplistView.do"><span class="mini-sub-pro">상품통합관리</span></a></li>
                                <li><a title="Review" href="adminrlistView.do"><span class="mini-sub-pro">리뷰관리</span></a></li>
                            </ul>
                        </li>
                        
                        <li>
                            <a class="has-arrow" href="mailbox.html" aria-expanded="false"><i class="icon nalika-diamond icon-wrap"></i> <span class="mini-click-non">고 객 센 터</span></a>
                            <ul class="submenu-angle" aria-expanded="false">
                                <li><a title="notice" href="${pageContext.servletContext.contextPath}/nplist.do"><span class="mini-sub-pro">공지사항</span></a></li>
                                <li><a title="faq" href="${pageContext.servletContext.contextPath}/flist.do"><span class="mini-sub-pro">자주하는 질문</span></a></li>
                                <li><a title="qna" href="${pageContext.servletContext.contextPath}/qlist.do"><span class="mini-sub-pro">1:1 문의</span></a></li>
                            </ul>
                        </li>
                        
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
                                                   <i class="icon nalika-user"></i><a title="Inbox" href="logout.do"><span class="mini-sub-pro">logout</span></a>
															
															
															
														
                                                   
                                                </li>
                                                
                                            </ul>
                                        </div>
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