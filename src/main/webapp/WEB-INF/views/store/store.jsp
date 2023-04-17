<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Dionysos - Store</title>
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
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/store/bootstrap.min.css">
    <!-- Bootstrap CSS
		============================================ -->
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/store/font-awesome.min.css">
	<!-- nalika Icon CSS
		============================================ -->
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/store/nalika-icon.css">
    <!-- owl.carousel CSS
		============================================ -->
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/store/owl.carousel.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/store/owl.theme.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/store/owl.transitions.css">
    <!-- animate CSS
		============================================ -->
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/store/animate.css">
    <!-- normalize CSS
		============================================ -->
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/store/normalize.css">
    <!-- meanmenu icon CSS
		============================================ -->
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/store/meanmenu.min.css">
    <!-- main CSS
		============================================ -->
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/store/main.css">
    <!-- morrisjs CSS
		============================================ -->
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/morrisjs/morris.css">
    <!-- mCustomScrollbar CSS
		============================================ -->
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/store/scrollbar/jquery.mCustomScrollbar.min.css">
    <!-- metisMenu CSS
		============================================ -->
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/store/metisMenu/metisMenu.min.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/store/metisMenu/metisMenu-vertical.css">
    <!-- calendar CSS
		============================================ -->
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/store/calendar/fullcalendar.min.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/store/calendar/fullcalendar.print.min.css">
    <!-- style CSS
		============================================ -->
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/store/style.css">
    <!-- responsive CSS
		============================================ -->
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/store/responsive.css">
    <!-- modernizr JS
		============================================ -->
    <script src="${pageContext.servletContext.contextPath}/resources/js/store/vendor/modernizr-2.8.3.min.js"></script>
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
<c:import url="/WEB-INF/views/store/menubar.jsp" />
 
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
										<h2>매장 관리자 페이지</h2>
										<p>
											<span class="bread-ntd">매장관리</span>
										</p>
									</div>
								</div>
							</div>
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<footer>
		<c:import url="/WEB-INF/views/admin/footer.jsp" />
	</footer>
    <!-- jquery
		============================================ -->
    <script src="${pageContext.servletContext.contextPath}/resources/js/store/vendor/jquery-1.12.4.min.js"></script>
    <!-- bootstrap JS
		============================================ -->
    <script src="${pageContext.servletContext.contextPath}/resources/js/store/bootstrap.min.js"></script>
    <!-- wow JS
		============================================ -->
    <script src="${pageContext.servletContext.contextPath}/resources/js/store/wow.min.js"></script>
    <!-- price-slider JS
		============================================ -->
    <script src="${pageContext.servletContext.contextPath}/resources/js/store/jquery-price-slider.js"></script>
    <!-- meanmenu JS
		============================================ -->
    <script src="${pageContext.servletContext.contextPath}/resources/js/store/jquery.meanmenu.js"></script>
    <!-- owl.carousel JS
		============================================ -->
    <script src="${pageContext.servletContext.contextPath}/resources/js/store/owl.carousel.min.js"></script>
    <!-- sticky JS
		============================================ -->
    <script src="${pageContext.servletContext.contextPath}/resources/js/store/jquery.sticky.js"></script>
    <!-- scrollUp JS
		============================================ -->
    <script src="${pageContext.servletContext.contextPath}/resources/js/store/jquery.scrollUp.min.js"></script>
    <!-- mCustomScrollbar JS
		============================================ -->
    <script src="${pageContext.servletContext.contextPath}/resources/js/store/scrollbar/jquery.mCustomScrollbar.concat.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/resources/js/store/scrollbar/mCustomScrollbar-active.js"></script>
    <!-- metisMenu JS
		============================================ -->
    <script src="${pageContext.servletContext.contextPath}/resources/js/store/metisMenu/metisMenu.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/resources/js/store/metisMenu/metisMenu-active.js"></script>
    <!-- sparkline JS
		============================================ -->
    <script src="${pageContext.servletContext.contextPath}/resources/js/store/sparkline/jquery.sparkline.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/resources/js/store/sparkline/jquery.charts-sparkline.js"></script>
    <!-- calendar JS
		============================================ -->
    <script src="${pageContext.servletContext.contextPath}/resources/js/store/calendar/moment.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/resources/js/store/calendar/fullcalendar.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/resources/js/store/calendar/fullcalendar-active.js"></script>
	<!-- float JS
		============================================ -->
    <script src="${pageContext.servletContext.contextPath}/resources/js/store/flot/jquery.flot.js"></script>
    <script src="${pageContext.servletContext.contextPath}/resources/js/store/flot/jquery.flot.resize.js"></script>
    <script src="${pageContext.servletContext.contextPath}/resources/js/store/flot/curvedLines.js"></script>
    <script src="${pageContext.servletContext.contextPath}/resources/js/store/flot/flot-active.js"></script>
    <!-- plugins JS
		============================================ -->
    <script src="${pageContext.servletContext.contextPath}/resources/js/store/plugins.js"></script>
    <!-- main JS
		============================================ -->
    <script src="${pageContext.servletContext.contextPath}/resources/js/store/main.js"></script>
</body>

</html>