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
										<h2>재고관리</h2>
										<p>
											<span class="bread-ntd">재고정보 수정</span>
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
										class="icon nalika-edit" aria-hidden="true"></i> 재고 정보 수정
								</a></li>
							</ul>
							<!-- 재고 정보 관리 -->
							<form action="stockUpdate.do" method="post">
								<input type="hidden" name="page" value="${currentPage}">
								<input type="hidden" name="store_id" value="${stock.store_id}">
								<input type="hidden" name="stock_id" value="${stock.stock_id}">
								<input type="hidden" name="sales_amount"
									value="${stock.sales_amount}">
								<div id="myTabContent" class="tab-content custom-product-edit">
									<div class="product-tab-list tab-pane fade active in"
										id="description">
										<div class="row">
											<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
												<div class="review-content-section">
													<div class="input-group mg-b-pro-edt">
														<span class="input-group-addon">상품명 : </span> <input
															type="text" class="form-control"
															value="${ stock.product_name }" name="product_name"
															readonly>
													</div>
													<div class="input-group mg-b-pro-edt">
														<span class="input-group-addon">상품번호 : </span> <input
															type="text" class="form-control"
															value="${ stock.product_id }" name="product_id" readonly>
													</div>
													<div class="input-group mg-b-pro-edt">
														<span class="input-group-addon">재고량 : </span> <input
															type="text" class="form-control"
															value="${ stock.stock_amount }" name="stock_amount">
													</div>
													<div class="input-group mg-b-pro-edt">
														<span class="input-group-addon">재고 업데이트 일자 : </span> <input
															type="text" class="form-control"
															value="${ stock.update_date }" name="update_date">
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
							</form>
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