<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="${pageContext.servletContext.contextPath}/resources/js/jquery-3.6.3.min.js"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Spectral:ital,wght@0,200;0,300;0,400;0,500;0,700;0,800;1,200;1,300;1,400;1,500;1,700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/users/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/users/animate.css">
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/users/owl.carousel.min.css">
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/users/owl.theme.default.min.css">
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/users/magnific-popup.css">
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/users/bootstrap-select.min.css">
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/users/flaticon.css">
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/users/style.css">
</head>
<body>
	<c:import url="/WEB-INF/views/common/menubar.jsp" />

	<section class="ftco-section">
		<div class="container">
			<div class="row">
				<div class="col-md-9">
					<div class="row mb-4">
						<div
							class="col-md-12 d-flex justify-content-between align-items-center">
							<h4 class="product-select">Select Types of Products</h4>
							<select class="selectpicker" multiple>
								<option>Brandy</option>
								<option>Gin</option>
								<option>Rum</option>
								<option>Tequila</option>
								<option>Vodka</option>
								<option>Whiskey</option>
							</select>
						</div>
					</div>
					<div class="row">
						<c:forEach items="${list}" var="product">
							<div class="col-md-3 d-flex">
								<div class="product ftco-animate">
									<div
										class="img d-flex align-items-center justify-content-center"
										style="background-image: url(${product.product_image});">
										<div class="desc">
											<p class="meta-prod d-flex">
												<a href="#"
													class="d-flex align-items-center justify-content-center"><span
													class="flaticon-shopping-bag"></span></a> <a href="#"
													class="d-flex align-items-center justify-content-center"><span
													class="flaticon-heart"></span></a> <a href="#"
													class="d-flex align-items-center justify-content-center"><span
													class="flaticon-visibility"></span></a>
											</p>
										</div>
									</div>
									<c:url var="pdetail" value="pdetail.do">
										<c:param name="product_id" value="${product.product_id }" />
									</c:url>
									<a href="${pdetail}"><div class="text text-center">
											<span class="sale">${product.wine_type}</span> <span
												class="category">${product.product_ename}</span>
											<h2>${product.product_name}</h2>
											<p class="mb-0">
												<span class="price price-sale"><fmt:formatNumber
														type="currency" value="${product.product_price}"></fmt:formatNumber></span>
												<span class="price"><fmt:formatNumber type="currency"
														value="${product.product_price * 0.8}"></fmt:formatNumber></span>
											</p>
										</div></a>
								</div>
							</div>
						</c:forEach>
					</div>
					<div class="row mt-5">
						<div class="col text-center">
							<div class="block-27">
								<c:import url="/WEB-INF/views/common/paging.jsp" />
							</div>
						</div>
					</div>
				</div>

				<div class="col-md-3">
					<div class="sidebar-box ftco-animate">
						<div class="categories">
							<h3>Product Types</h3>
							<form action="${pageContext.servletContext.contextPath}/psearch.do">
							<input type="hidden" name="action" value="wine_type">
							<ul class="p-0">
								
								<li><a href="${psearch}">레드와인 <span
										class="fa fa-chevron-right"></span></a></li>
								<c:url var="psearchType" value="/psearch.do">
									<c:param name="keyword" value="화이트" />
								</c:url>
								<li><a href="${psearch}">화이트와인 <span
										class="fa fa-chevron-right"></span></a></li>
								<c:url var="psearch" value="/psearch.do">
									<c:param name="keyword" value="스파클링" />
								</c:url>
								<li><a href="${psearch}">스파클링 <span
										class="fa fa-chevron-right"></span></a></li>
								<c:url var="psearch" value="/psearch.do">
									<c:param name="keyword" value="로제" />
								</c:url>
								<li><a href="${psearch}">로제 <span
										class="fa fa-chevron-right"></span></a></li>
								<c:url var="psearch" value="/psearch.do">
									<c:param name="keyword" value="주정강화" />
								</c:url>
								<li><a href="${psearch}">주정강화 <span
										class="fa fa-chevron-right"></span></a></li>
								<c:url var="psearch" value="/psearch.do">
									<c:param name="keyword" value="기타" />
								</c:url>
								<li><a href="${psearch}">기타 <span
										class="fa fa-chevron-right"></span></a></li>
							</ul>
							</form>
						</div>
					</div>


				</div>
			</div>
		</div>
	</section>



	<footer>
		<c:import url="/WEB-INF/views/common/footer.jsp" />
	</footer>








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