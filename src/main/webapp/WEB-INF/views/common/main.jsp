<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="/error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<head>
<title>Dionysos</title>
<script type="text/javascript"
	src="${pageContext.servletContext.contextPath}/resources/js/jquery-3.6.3.min.js"></script>


</head>
<body>
	<c:import url="/WEB-INF/views/common/menubar.jsp" />

	<div align="center" class="main-filter-layer">
		<div class='main-filter clear'>
			<form action="advsearch.do" method="post">
				<fieldset>
					<legend>와인 종류</legend>
					<input name='wine_type' type='checkbox' value='레드'> 레드
					&nbsp; &nbsp; <input name='wine_type' type='checkbox' value='화이트'>
					화이트 &nbsp; &nbsp; <input name='wine_type' type='checkbox'
						value='스파클링'> 스파클링 &nbsp; &nbsp; <input name='wine_type'
						type='checkbox' value='로제'>로제 &nbsp; &nbsp; <input
						name='wine_type' type='checkbox' value='주정강화'>주정강화 &nbsp;
					&nbsp;
				</fieldset>
				<br>
				<fieldset>
					<legend>와인 원산지</legend>
					<input name='wine_origin' type='checkbox' value="프랑스">
					프랑스&nbsp; &nbsp; <input name='wine_origin' type='checkbox'
						value="이탈리아"> 이탈리아&nbsp; &nbsp; <input name='wine_origin'
						type='checkbox' value="스페인"> 스페인&nbsp; &nbsp; <input
						name='wine_origin' type='checkbox' value="포르투갈">
					포르투갈&nbsp; &nbsp; <input name='wine_origin' type='checkbox'
						value="독일"> 독일&nbsp; &nbsp; <input name='wine_origin'
						type='checkbox' value="오스트리아"> 오스트리아&nbsp; &nbsp; <input
						name='wine_origin' type='checkbox' value="미국"> 미국&nbsp;
					&nbsp; <input name='wine_origin' type='checkbox' value="호주">
					호주&nbsp; &nbsp; <input name='wine_origin' type='checkbox'
						value="뉴질랜드"> 뉴질랜드&nbsp; &nbsp; <input name='wine_origin'
						type='checkbox' value="칠레"> 칠레&nbsp; &nbsp; <input
						name='wine_origin' type='checkbox' value="아르헨티나">
					아르헨티나&nbsp; &nbsp; <input name='wine_origin' type='checkbox'
						value="남아프리카"> 남아프리카&nbsp; &nbsp;
				</fieldset>
				<br>
				<fieldset>
					<legend>가격대</legend>
					<input name='product_price' type='radio' value="10000"> 1만원
					이하&nbsp;&nbsp; <input name='radio' type='radio' value="30000">
					3만원 이하&nbsp;&nbsp; <input name='product_price' type='radio'
						value="50000"> 5만원 이하&nbsp;&nbsp; <input
						name='product_price' type='radio' value="70000"> 7만원
					이하&nbsp;&nbsp; <input name='product_price' type='radio'
						value="100000"> 10만원 이하&nbsp;&nbsp; <input
						name='product_price' type='radio' value="200000"> 20만원
					이하&nbsp;&nbsp; <input name='product_price' type='radio'
						value="500000"> 50만원 이하&nbsp;&nbsp; <input
						name='product_price' type='radio' value="1000000"> 100만원
					이하&nbsp;&nbsp; <input name='product_price' type='radio'
						value="9999999"> 100만원 이상&nbsp;&nbsp;
				</fieldset>

				<br>
				<fieldset>
					<legend>와인 특성</legend>
					당도&nbsp;&nbsp; <input type="checkbox"
						onclick="document.getElementById('sweetness').disabled = !document.getElementById('sweetness').disabled;">
					<input type="range" id="sweetness" name="sweetness" min="0" max="5"
						step="1" value="0"
						oninput="document.getElementById('value1').innerHTML=this.value;"
						disabled>&nbsp; <span id="value1">0</span>&nbsp;&nbsp;
					산도&nbsp;&nbsp; <input type="checkbox"
						onclick="document.getElementById('acidity').disabled = !document.getElementById('acidity').disabled;">
					<input type="range" id="acidity" name="acidity" min="0" max="5"
						step="1" value="0"
						oninput="document.getElementById('value2').innerHTML=this.value;"
						disabled>&nbsp; <span id="value2">0</span> &nbsp;&nbsp;
					바디&nbsp;&nbsp; <input type="checkbox"
						onclick="document.getElementById('body').disabled = !document.getElementById('body').disabled;">
					<input type="range" id="body" name="body" min="0" max="5" step="1"
						value="0"
						oninput="document.getElementById('value3').innerHTML=this.value;"
						disabled>&nbsp; <span id="value3">0</span> &nbsp;&nbsp;
					타닌&nbsp;&nbsp; <input type="checkbox"
						onclick="document.getElementById('tannin').disabled = !document.getElementById('tannin').disabled;">
					<input type="range" id="tannin" name="tannin" min="0" max="5"
						step="1" value="0"
						oninput="document.getElementById('value4').innerHTML=this.value;"
						disabled>&nbsp; <span id="value4">0</span>
					<button type='reset'>초기화</button>
					<button type='submit'>검색</button>
				</fieldset>
			</form>
		</div>
	</div>

	<!-- end .main-filter -->


	<section class="ftco-section">
		<div class="container">
			<hr>
			<div class="row justify-content-center pb-5">
				<div class="col-md-7 heading-section text-center ftco-animate">
					<h3>베스트 상품</h3>
				</div>
			</div>
		</div>
		<div class="row">
			<c:forEach items="${list1}" var="product">
				<div class="col-md-3 d-flex">
					<div class="product ftco-animate">
						<div class="img d-flex align-items-center justify-content-center"
							style="background-image: url('${pageContext.servletContext.contextPath}${product.product_image}');">
							<div class="desc">

								<a href="#">${product.wine_origin}</a><br> <br> <a
									href="#">${product.wine_type}</a><br> <br> <a
									href="#">${product.grape_type}</a>


							</div>
						</div>
						<c:url var="pdetail" value="pdetail.do">
							<c:param name="product_id" value="${product.product_id }" />
						</c:url>
						<a href="${pdetail}">
							<div class="text text-center">
								<span class="sale">${product.wine_type}</span> <span
									class="category">${product.product_ename}</span>
								<h2>${product.product_name}</h2>
								<p class="mb-0">
									<span class="price price-sale"><fmt:formatNumber
											type="currency" value="${product.product_price}"></fmt:formatNumber></span>
									<span class="price"><fmt:formatNumber type="currency"
											value="${product.product_price * 0.8}"></fmt:formatNumber></span>
								</p>
							</div>
						</a>
					</div>
				</div>
			</c:forEach>
		</div>
		<hr>
		<div class="row justify-content-center pb-5">
			<div class="col-md-7 heading-section text-center ftco-animate">
				<h3>신상품</h3>
			</div>
		</div>
		<div class="row">
			<c:forEach items="${list2}" var="product">
				<div class="col-md-3 d-flex">
					<div class="product ftco-animate">
						<div class="img d-flex align-items-center justify-content-center"
							style="background-image: url('${pageContext.servletContext.contextPath}${product.product_image}');">
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
						<a href="${pdetail}">
							<div class="text text-center">
								<span class="sale">${product.wine_type}</span> <span
									class="category">${product.product_ename}</span>
								<h2>${product.product_name}</h2>
								<p class="mb-0">
									<span class="price price-sale"><fmt:formatNumber
											type="currency" value="${product.product_price}"></fmt:formatNumber></span>
									<span class="price"><fmt:formatNumber type="currency"
											value="${product.product_price * 0.8}"></fmt:formatNumber></span>
								</p>
							</div>
						</a>
					</div>
				</div>
			</c:forEach>

			<div class="row justify-content-center">
				<div class="col-md-4">
					<c:url var="plistView" value="/plistView.do">
					</c:url>
					<a href="${plistView}" class="btn btn-primary d-block">모든 상품
						보러가기<span class="fa fa-long-arrow-right"></span>
					</a>
				</div>
			</div>
		</div>
	</section>



	<footer>
		<c:import url="/WEB-INF/views/common/footer.jsp" />
	</footer>

	<!-- loader -->



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