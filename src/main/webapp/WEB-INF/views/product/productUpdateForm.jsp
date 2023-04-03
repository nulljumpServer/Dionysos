<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="currentPage" value="${requestScope.currentPage}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="${pageContext.servletContext.contextPath}/resources/js/jquery-3.6.3.min.js"></script>
<!-- 이미지 미리보기 -->
<script>
	function setThumbnail1(event) {
		var reader = new FileReader();

		reader.onload = function(event) {
			// 기존 이미지 삭제
			var imageContainer1 = document
					.querySelector("div#image_container1");
			while (imageContainer1.firstChild) {
				imageContainer1.removeChild(imageContainer1.firstChild);
			}

			var img = document.createElement("img");
			img.setAttribute("src", event.target.result);
			img.setAttribute("class", "col-lg-6");
			img.style.maxWidth = "300px"; // set maximum width
			img.style.maxHeight = "300px"; // set maximum height
			imageContainer1.appendChild(img);
		};

		reader.readAsDataURL(event.target.files[0]);
	}
	function setThumbnail2(event) {
		var reader = new FileReader();

		reader.onload = function(event) {
			// 기존 이미지 삭제
			var imageContainer2 = document
					.querySelector("div#image_container2");
			while (imageContainer2.firstChild) {
				imageContainer2.removeChild(imageContainer2.firstChild);
			}

			var img = document.createElement("img");
			img.setAttribute("src", event.target.result);
			img.setAttribute("class", "col-lg-6");
			img.style.maxWidth = "300px"; // set maximum width
			img.style.maxHeight = "300px"; // set maximum height
			imageContainer2.appendChild(img);
		};

		reader.readAsDataURL(event.target.files[0]);
	}
</script>
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
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
								<div class="breadcomb-report">
									<button data-toggle="tooltip" data-placement="left"
										title="Download Report" class="btn">
										<i class="icon nalika-download"></i>
									</button>
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
								<li class="active"><a href="#description"><i
										class="icon nalika-edit" aria-hidden="true"></i> 상품 정보 수정</a></li>
								<li><a href="#IMAGES"><i class="icon nalika-picture"
										aria-hidden="true"></i> 이미지</a></li>

							</ul>
							<!-- 상품 정보 관리 -->
							<form action="pupdate.do" method="post" enctype="multipart/form-data">
							<input type="hidden" name="product_id" value="${product.product_id}">
   							<input type="hidden" name="page" value="${currentPage}">
								<div id="myTabContent" class="tab-content custom-product-edit">
									<div class="product-tab-list tab-pane fade active in"
										id="description">
										<div class="row">
											<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
												<div class="review-content-section">
													<div class="input-group mg-b-pro-edt">
														<span class="input-group-addon">상품명(영문) : </span> <input
															type="text" class="form-control"
															value="${ product.product_ename }" name="product_ename">
													</div>
													<div class="input-group mg-b-pro-edt">
														<span class="input-group-addon">상품명 : </span> <input
															type="text" class="form-control"
															value="${ product.product_name }" name="product_name">
													</div>
													<div class="input-group mg-b-pro-edt">
														<span class="input-group-addon">가격 : </span> <input
															type="text" class="form-control"
															value="${ product.product_price }" name="product_price">
													</div>
													<div class="input-group mg-b-pro-edt">
														<span class="input-group-addon">와인 종류 : </span> <input
															type="text" class="form-control"
															value="${ product.wine_type }" name="wine_type">
													</div>
													<div class="input-group mg-b-pro-edt">
														<span class="input-group-addon">포도 종류 : </span> <input
															type="text" class="form-control"
															value="${ product.grape_type }" name="grape_type">
													</div>
													<div class="input-group mg-b-pro-edt">
														<span class="input-group-addon">원산지 : </span> <input
															type="text" class="form-control"
															value="${ product.wine_origin }" name="wine_origin">

													</div>
													<div class="input-group mg-b-pro-edt">
														<span class="input-group-addon">설명 : </span> <input
															type="text" class="form-control"
															value="${ product.description }" name="description">
													</div>
												</div>
											</div>
											<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
												<div class="review-content-section">

													<div class="input-group mg-b-pro-edt">
														<span class="input-group-addon">알콜 도수 : </span> <input
															type="text" class="form-control"
															value="${ product.alcohol }" name="alcohol">
													</div>
													<div class="input-group mg-b-pro-edt">
														<span class="input-group-addon">산도 : </span> <input
															type="text" class="form-control"
															value="${ product.acidity }" name="acidity">

													</div>
													<div class="input-group mg-b-pro-edt">
														<span class="input-group-addon">당도 : </span> <input
															type="text" class="form-control"
															value="${ product.sweetness }" name="sweetness">
													</div>
													<div class="input-group mg-b-pro-edt">
														<span class="input-group-addon">바디 : </span> <input
															type="text" class="form-control"
															value="${ product.body }" name="body">
													</div>
													<div class="input-group mg-b-pro-edt">
														<span class="input-group-addon">타닌 : </span> <input
															type="text" class="form-control"
															value="${ product.tannin }" name="tannin">
													</div>
													<div class="input-group mg-b-pro-edt">
														<span class="input-group-addon">와인 용량 : </span> <input
															type="text" class="form-control"
															value="${ product.wine_volume }" name="wine_volume">
													</div>
													<div class="input-group mg-b-pro-edt">
														<span class="input-group-addon">와인 생산일자 : </span> <input
															type="date" class="form-control"
															value="${ product.production_date }"
															name="production_date">
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
												</div>
											</div>
										</div>
									</div>
									<div class="product-tab-list tab-pane fade" id="IMAGES">
										<div class="row">
											<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
												<div class="review-content-section">
													<div class="row">
														<div class="col-lg-4">
															기존 이미지
															<div class="pro-edt-img">
																<img
																	src="${pageContext.servletContext.contextPath}${product.product_image}.png"
																	alt="" />
															</div>
														</div>

														<div class="col-lg-4">
															변경될 상품 이미지
															<div class="pro-edt-img">
																<div id="image_container1"></div>

															</div>
														</div>

														<div class="input-group">
															<span class="input-group-addon">상품 이미지 : </span>
															<div class="form-group">
																<input class="form-control form-control-user"
																	type="file" name="upfile1" id="product_image"
																	onchange="setThumbnail1(event);">
															</div>
														</div>
													</div>
													<div class="row">
														<div class="col-lg-4">
															기존 이미지
															<div class="pro-edt-img">
																<img
																	src="${pageContext.servletContext.contextPath}${product.wine_detail}.png"
																	alt="" />
															</div>
														</div>

														<div class="col-lg-4">
															변경될 상세 이미지
															<div class="pro-edt-img">
																<div id="image_container2"></div>

															</div>
														</div>

														<div class="input-group">
															<span class="input-group-addon">상품 이미지 : </span>
															<div class="form-group">
																<input class="form-control form-control-user"
																	type="file" name="upfile2" id="wine_detail"
																	onchange="setThumbnail2(event);">
															</div>
														</div>
													</div>
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
	<script
		src="${pageContext.servletContext.contextPath}/resources/js/admin/vendor/jquery-1.12.4.min.js"></script>
	<!-- bootstrap JS
		============================================ -->
	<script
		src="${pageContext.servletContext.contextPath}/resources/js/admin/bootstrap.min.js"></script>
	<!-- wow JS
		============================================ -->
	<script
		src="${pageContext.servletContext.contextPath}/resources/js/admin/wow.min.js"></script>
	<!-- price-slider JS
		============================================ -->
	<script
		src="${pageContext.servletContext.contextPath}/resources/js/admin/query-price-slider.js"></script>
	<!-- meanmenu JS
		============================================ -->
	<script
		src="${pageContext.servletContext.contextPath}/resources/js/admin/jquery.meanmenu.js"></script>
	<!-- owl.carousel JS
		============================================ -->
	<script
		src="${pageContext.servletContext.contextPath}/resources/js/admin/owl.carousel.min.js"></script>
	<!-- sticky JS
		============================================ -->
	<script
		src="${pageContext.servletContext.contextPath}/resources/js/admin/jquery.sticky.js"></script>
	<!-- scrollUp JS
		============================================ -->
	<script
		src="${pageContext.servletContext.contextPath}/resources/js/admin/jquery.scrollUp.min.js"></script>
	<!-- mCustomScrollbar JS
		============================================ -->
	<script
		src="${pageContext.servletContext.contextPath}/resources/js/admin/scrollbar/jquery.mCustomScrollbar.concat.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/js/admin/crollbar/mCustomScrollbar-active.js"></script>
	<!-- metisMenu JS
		============================================ -->
	<script
		src="${pageContext.servletContext.contextPath}/resources/js/admin/metisMenu/metisMenu.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/js/admin/metisMenu/metisMenu-active.js"></script>
	<!-- morrisjs JS
		============================================ -->
	<script
		src="${pageContext.servletContext.contextPath}/resources/js/admin/sparkline/jquery.sparkline.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/js/admin/sparkline/jquery.charts-sparkline.js"></script>
	<!-- calendar JS
		============================================ -->
	<script
		src="${pageContext.servletContext.contextPath}/resources/js/admin/calendar/moment.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/js/admin/calendar/fullcalendar.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/js/admin/calendar/fullcalendar-active.js"></script>
	<!-- tab JS
		============================================ -->
	<script
		src="${pageContext.servletContext.contextPath}/resources/js/admin/tab.js"></script>
	<!-- plugins JS
		============================================ -->
	<script
		src="${pageContext.servletContext.contextPath}/resources/js/admin/plugins.js"></script>
	<!-- main JS
		============================================ -->
	<script
		src="${pageContext.servletContext.contextPath}/resources/js/admin/main.js"></script>
</body>

</html>