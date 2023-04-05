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
							<h4 class="product-select">와인 목록</h4>
						</div>
					</div>
					<div class="row">
						<c:forEach items="${list}" var="product">
							<div class="col-md-3 d-flex">
								<div class="product ftco-animate">
									<div
										class="img d-flex align-items-center justify-content-center"
										style="background-image: url('${pageContext.servletContext.contextPath}${product.product_image}');">
										<div class="desc">

											<a href="#">${product.wine_origin}</a><br>
											<br> <a href="#">${product.wine_type}</a><br>
											<br> <a href="#">${product.grape_type}</a>


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
							<h3>상세 검색</h3>
							<form action="advsearch.do" method="post">
								<fieldset>
									<legend>와인 종류</legend>
									<input name='wine_type' type='checkbox' value='레드'> 레드
									&nbsp; &nbsp; <input name='wine_type' type='checkbox'
										value='화이트'> 화이트 &nbsp; &nbsp; <input name='wine_type'
										type='checkbox' value='스파클링'> 스파클링 &nbsp; &nbsp; <input
										name='wine_type' type='checkbox' value='로제'>로제 &nbsp;
									&nbsp; <input name='wine_type' type='checkbox' value='주정강화'>주정강화
									&nbsp; &nbsp;
								</fieldset>
								<br>
								<fieldset>
									<legend>와인 원산지</legend>
									<input name='wine_origin' type='checkbox' value="프랑스">
									프랑스&nbsp; &nbsp; <input name='wine_origin' type='checkbox'
										value="이탈리아"> 이탈리아&nbsp; &nbsp; <input
										name='wine_origin' type='checkbox' value="스페인">
									스페인&nbsp; &nbsp; <input name='wine_origin' type='checkbox'
										value="포르투갈"> 포르투갈&nbsp; &nbsp; <input
										name='wine_origin' type='checkbox' value="독일">
									독일&nbsp; &nbsp; <br> <input name='wine_origin'
										type='checkbox' value="오스트리아"> 오스트리아&nbsp; &nbsp; <input
										name='wine_origin' type='checkbox' value="미국">
									미국&nbsp; &nbsp; <input name='wine_origin' type='checkbox'
										value="호주"> 호주&nbsp; &nbsp;<br> <input
										name='wine_origin' type='checkbox' value="뉴질랜드">
									뉴질랜드&nbsp; &nbsp; <input name='wine_origin' type='checkbox'
										value="칠레"> 칠레&nbsp; &nbsp;<br> <input
										name='wine_origin' type='checkbox' value="아르헨티나">
									아르헨티나&nbsp; &nbsp; <input name='wine_origin' type='checkbox'
										value="남아프리카"> 남아프리카&nbsp; &nbsp;
								</fieldset>
								<br>
								<fieldset>
									<legend>가격대</legend>
									<input name='product_price' type='radio' value="10000">
									1만원 이하&nbsp;&nbsp; <input name='product_price' type='radio'
										value="30000"> 3만원 이하&nbsp;&nbsp;<br> <input
										name='product_price' type='radio' value="50000"> 5만원
									이하&nbsp;&nbsp; <input name='product_price' type='radio'
										value="70000"> 7만원 이하&nbsp;&nbsp;<br> <input
										name='product_price' type='radio' value="100000"> 10만원
									이하&nbsp;&nbsp; <input name='product_price' type='radio'
										value="200000"> 20만원 이하&nbsp;&nbsp; <br>
									<input name='product_price' type='radio' value="500000">
									50만원 이하&nbsp;&nbsp; <input name='product_price' type='radio'
										value="1000000"> 100만원 이하&nbsp;&nbsp;<br> <input
										name='product_price' type='radio' value="9999999">
									100만원 이상&nbsp;&nbsp;
								</fieldset>

								<br>
								<fieldset>
									<legend>와인 특성</legend>
									당도&nbsp;&nbsp; <input type="checkbox"	onclick="document.getElementById('sweetness').disabled = !document.getElementById('sweetness').disabled;"> 
						<input type="range" id="sweetness" name="sweetness" min="0" max="5" step="1" value="0" oninput="document.getElementById('value1').innerHTML=this.value;" disabled>&nbsp;
						<span id="value1">0</span><br>
					산도&nbsp;&nbsp; <input type="checkbox" onclick="document.getElementById('acidity').disabled = !document.getElementById('acidity').disabled;"> 
						<input type="range" id="acidity" name="acidity" min="0" max="5" step="1" value="0" oninput="document.getElementById('value2').innerHTML=this.value;" disabled>&nbsp;
						<span id="value2">0</span><br>
					바디&nbsp;&nbsp; <input type="checkbox" onclick="document.getElementById('body').disabled = !document.getElementById('body').disabled;"> 
						<input type="range" id="body" name="body" min="0" max="5" step="1" value="0" oninput="document.getElementById('value3').innerHTML=this.value;" disabled>&nbsp;
						<span id="value3">0</span><br>
					타닌&nbsp;&nbsp; <input type="checkbox"	onclick="document.getElementById('tannin').disabled = !document.getElementById('tannin').disabled;"> 
					<input type="range" id="tannin" name="tannin" min="0" max="5" step="1" value="0" oninput="document.getElementById('value4').innerHTML=this.value;" disabled>&nbsp;
					<span id="value4">0</span>
									<button type='reset'>초기화</button>
									<button type='submit'>검색</button>
								</fieldset>
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







	<c:set var="url" value="plistView.do" />
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