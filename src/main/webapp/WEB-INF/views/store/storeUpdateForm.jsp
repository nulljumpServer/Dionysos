<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="currentPage" value="${requestScope.currentPage}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dionysos - ADMIN</title>
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
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/resources/js/jquery-3.6.3.min.js"></script>
<!-- 이미지 미리보기 -->
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
										<h2>상품통합관리</h2>
										<p>
											<span class="bread-ntd">상품정보 수정</span>
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Single pro tab start-->
	<div class="single-product-tab-area mg-b-30">
		<!-- Single pro tab review Start-->
		<div class="single-pro-review-area">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<div class="review-tab-pro-inner">
							<ul id="myTab3" class="tab-review-design">
								<li class="active"><a href="#description"> <i
										class="icon nalika-edit" aria-hidden="true"></i> 매장 정보 수정
								</a></li>
							</ul>
							<!-- 상품 정보 관리 -->
							<form action="storeUpdate.do" method="post"
								enctype="multipart/form-data">
								<input type="hidden" name="page" value="${currentPage}">
								<input type="hidden" name="store_id" value="${store.store_id}">
								<input type="hidden" name="business_number" value="${store.business_number}">
								<div id="myTabContent" class="tab-content custom-product-edit">
									<div class="product-tab-list tab-pane fade active in"
										id="description">
										<div class="row">
											<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
												<div class="review-content-section">
													<div class="input-group mg-b-pro-edt">
														<span class="input-group-addon">매장이름 : </span> <input
															type="text" class="form-control"
															value="${ store.store_name }" name="store_name">
													</div>
													<div class="input-group mg-b-pro-edt">
														<span class="input-group-addon">주소 : </span> <input
															type="text" class="form-control"
															value="${ store.address }" name="address">
													</div>
													<div class="input-group mg-b-pro-edt">
														<span class="input-group-addon">연락처 : </span> <input
															type="text" class="form-control" value="${ store.phone }"
															name="phone">
													</div>
												</div>
											</div>
											<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
												<div class="review-content-section">
													<div class="input-group mg-b-pro-edt">
														<span class="input-group-addon">매니저 이름 : </span> <input
															type="text" class="form-control"
															value="${ store.manager }" name="manager">
													</div>
													<div class="input-group mg-b-pro-edt">
														<span class="input-group-addon">매니저 연락처 : </span> <input
															type="text" class="form-control"
															value="${ store.manager_contact }" name="manager_contact">

													</div>
													<div class="input-group mg-b-pro-edt">
														<span class="input-group-addon">이메일 : </span> <input
															type="text" class="form-control" value="${ store.email }"
															name="email">
													</div>
													<div class="input-group mg-b-pro-edt">
														<span class="input-group-addon">로그인 가능 여부 : </span> <input
															type="text" class="form-control"
															value="${ store.login_ok }" name="login_ok">
													</div>

												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
												<div class="text-center custom-pro-edt-ds">
													<button type="submit"
														class="btn btn-ctl-bt waves-effect waves-light m-r-10">수정
													</button>
													<button type="reset"
														class="btn btn-ctl-bt waves-effect waves-light">취소
													</button>
													<button class="btn btn-ctl-bt waves-effect waves-light"
														onclick="javascript:history.go(-1); return false;">목록</button>
												</div>
											</div>
										</div>
									</div>

								</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>




	<div class="footer-copyright-area">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-12">
					<div class="footer-copy-right">
						<p>
							Copyright © 2018 <a href="https://colorlib.com/wp/templates/">Colorlib</a>
							All rights reserved.
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- jquery
		============================================ -->
	<script	src="${pageContext.servletContext.contextPath}/resources/js/admin/vendor/jquery-1.12.4.min.js"></script>
	<!-- bootstrap JS
		============================================ -->
	<script	src="${pageContext.servletContext.contextPath}/resources/js/admin/bootstrap.min.js"></script>
	<!-- wow JS
		============================================ -->
	<script	src="${pageContext.servletContext.contextPath}/resources/js/admin/wow.min.js"></script>
	<!-- price-slider JS
		============================================ -->
	<script	src="${pageContext.servletContext.contextPath}/resources/js/admin/query-price-slider.js"></script>
	<!-- meanmenu JS
		============================================ -->
	<script	src="${pageContext.servletContext.contextPath}/resources/js/admin/jquery.meanmenu.js"></script>
	<!-- owl.carousel JS
		============================================ -->
	<script	src="${pageContext.servletContext.contextPath}/resources/js/admin/owl.carousel.min.js"></script>
	<!-- sticky JS
		============================================ -->
	<script	src="${pageContext.servletContext.contextPath}/resources/js/admin/jquery.sticky.js"></script>
	<!-- scrollUp JS
		============================================ -->
	<script	src="${pageContext.servletContext.contextPath}/resources/js/admin/jquery.scrollUp.min.js"></script>
	<!-- mCustomScrollbar JS
		============================================ -->
	<script	src="${pageContext.servletContext.contextPath}/resources/js/admin/scrollbar/jquery.mCustomScrollbar.concat.min.js"></script>
	<script	src="${pageContext.servletContext.contextPath}/resources/js/admin/crollbar/mCustomScrollbar-active.js"></script>
	<!-- metisMenu JS
		============================================ -->
	<script	src="${pageContext.servletContext.contextPath}/resources/js/admin/metisMenu/metisMenu.min.js"></script>
	<script	src="${pageContext.servletContext.contextPath}/resources/js/admin/metisMenu/metisMenu-active.js"></script>
	<!-- morrisjs JS
		============================================ -->
	<script	src="${pageContext.servletContext.contextPath}/resources/js/admin/sparkline/jquery.sparkline.min.js"></script>
	<script	src="${pageContext.servletContext.contextPath}/resources/js/admin/sparkline/jquery.charts-sparkline.js"></script>
	<!-- calendar JS
		============================================ -->
	<script	src="${pageContext.servletContext.contextPath}/resources/js/admin/calendar/moment.min.js"></script>
	<script	src="${pageContext.servletContext.contextPath}/resources/js/admin/calendar/fullcalendar.min.js"></script>
	<script	src="${pageContext.servletContext.contextPath}/resources/js/admin/calendar/fullcalendar-active.js"></script>
	<!-- tab JS
		============================================ -->
	<script	src="${pageContext.servletContext.contextPath}/resources/js/admin/tab.js"></script>
	<!-- plugins JS
		============================================ -->
	<script	src="${pageContext.servletContext.contextPath}/resources/js/admin/plugins.js"></script>
	<!-- main JS
		============================================ -->
	<script	src="${pageContext.servletContext.contextPath}/resources/js/admin/main.js"></script>
</body>

</html>