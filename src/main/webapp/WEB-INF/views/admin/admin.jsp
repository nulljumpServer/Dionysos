<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Dionysos - ADMIN</title>
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
<c:import url="/WEB-INF/views/admin/menubar.jsp" />
 
            <div class="breadcome-area">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="breadcome-list">
                                <div class="row">
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                        <div class="breadcomb-wp">
											<div class="breadcomb-icon">
												<i class="icon nalika-home"></i>
											</div>
											<div class="breadcomb-ctn">
												<h2>Dionysos - ADMIN</h2>
												<p>Dionysos <span class="bread-ntd">관리자 페이지</span></p>
											</div>
										</div>
                                    </div>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

    <!-- jquery
		============================================ -->
    <script src="${pageContext.servletContext.contextPath}/resources/js/admin/vendor/jquery-1.12.4.min.js"></script>
    <!-- bootstrap JS
		============================================ -->
    <script src="${pageContext.servletContext.contextPath}/resources/js/admin/bootstrap.min.js"></script>
    <!-- wow JS
		============================================ -->
    <script src="${pageContext.servletContext.contextPath}/resources/js/admin/wow.min.js"></script>
    <!-- price-slider JS
		============================================ -->
    <script src="${pageContext.servletContext.contextPath}/resources/js/admin/jquery-price-slider.js"></script>
    <!-- meanmenu JS
		============================================ -->
    <script src="${pageContext.servletContext.contextPath}/resources/js/admin/jquery.meanmenu.js"></script>
    <!-- owl.carousel JS
		============================================ -->
    <script src="${pageContext.servletContext.contextPath}/resources/js/admin/owl.carousel.min.js"></script>
    <!-- sticky JS
		============================================ -->
    <script src="${pageContext.servletContext.contextPath}/resources/js/admin/jquery.sticky.js"></script>
    <!-- scrollUp JS
		============================================ -->
    <script src="${pageContext.servletContext.contextPath}/resources/js/admin/jquery.scrollUp.min.js"></script>
    <!-- mCustomScrollbar JS
		============================================ -->
    <script src="${pageContext.servletContext.contextPath}/resources/js/admin/scrollbar/jquery.mCustomScrollbar.concat.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/resources/js/admin/scrollbar/mCustomScrollbar-active.js"></script>
    <!-- metisMenu JS
		============================================ -->
    <script src="${pageContext.servletContext.contextPath}/resources/js/admin/metisMenu/metisMenu.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/resources/js/admin/metisMenu/metisMenu-active.js"></script>
    <!-- sparkline JS
		============================================ -->
    <script src="${pageContext.servletContext.contextPath}/resources/js/admin/sparkline/jquery.sparkline.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/resources/js/admin/sparkline/jquery.charts-sparkline.js"></script>
    <!-- calendar JS
		============================================ -->
    <script src="${pageContext.servletContext.contextPath}/resources/js/admin/calendar/moment.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/resources/js/admin/calendar/fullcalendar.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/resources/js/admin/calendar/fullcalendar-active.js"></script>
	<!-- float JS
		============================================ -->
    <script src="${pageContext.servletContext.contextPath}/resources/js/admin/flot/jquery.flot.js"></script>
    <script src="${pageContext.servletContext.contextPath}/resources/js/admin/flot/jquery.flot.resize.js"></script>
    <script src="${pageContext.servletContext.contextPath}/resources/js/admin/flot/curvedLines.js"></script>
    <script src="${pageContext.servletContext.contextPath}/resources/js/admin/flot/flot-active.js"></script>
    <!-- plugins JS
		============================================ -->
    <script src="${pageContext.servletContext.contextPath}/resources/js/admin/plugins.js"></script>
    <!-- main JS
		============================================ -->
    <script src="${pageContext.servletContext.contextPath}/resources/js/admin/main.js"></script>
</body>

</html>