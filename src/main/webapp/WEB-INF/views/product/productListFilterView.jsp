<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="listCount" value="${requestScope.listCount}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dionysos Wine Shop</title>
<script type="text/javascript"
	src="${pageContext.servletContext.contextPath}/resources/js/jquery-3.6.3.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Spectral:ital,wght@0,200;0,300;0,400;0,500;0,700;0,800;1,200;1,300;1,400;1,500;1,700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"	href="${pageContext.servletContext.contextPath}/resources/css/users/font-awesome.min.css">
<link rel="stylesheet"	href="${pageContext.servletContext.contextPath}/resources/css/users/animate.css">
<link rel="stylesheet"	href="${pageContext.servletContext.contextPath}/resources/css/users/owl.carousel.min.css">
<link rel="stylesheet"	href="${pageContext.servletContext.contextPath}/resources/css/users/owl.theme.default.min.css">
<link rel="stylesheet"	href="${pageContext.servletContext.contextPath}/resources/css/users/magnific-popup.css">
<link rel="stylesheet"	href="${pageContext.servletContext.contextPath}/resources/css/users/bootstrap-select.min.css">
<link rel="stylesheet"	href="${pageContext.servletContext.contextPath}/resources/css/users/flaticon.css">
<link rel="stylesheet"	href="${pageContext.servletContext.contextPath}/resources/css/users/style.css">
</head>
<body>
	<c:import url="/WEB-INF/views/common/menubar.jsp" />
	<section class="ftco-section">
		<div class="container">
			<div class="row">
				<div class="col-md-9">
					<div class="row mb-4">
						<div class="col-md-12 d-flex justify-content-between align-items-center">
							<h3 class="mb-4">와인 필터링 검색</h3>
							총 ${listCount} 개
						</div>
					</div>
					<div class="row">
						<c:forEach items="${list}" var="product">
							<div class="col-md-4 d-flex">
								<div class="product ftco-animate">
									<div
										class="img d-flex align-items-center justify-content-center"
										style="background-image: url('${pageContext.servletContext.contextPath}${product.product_image}');">
										<div class="desc">
										<c:url var="pdt1" value="psearch.do">
							<c:param name="action" value="wine_origin" />
							<c:param name="keyword" value="${product.wine_origin}" />
							</c:url>
							<h4 class="mb-4"><a href="${pdt1}">#${product.wine_origin}</a></h4><br>
							<c:url var="pdt2" value="psearch.do">
							<c:param name="action" value="wine_type" />
							<c:param name="keyword" value="${product.wine_type}" />
							</c:url>
							<h4 class="mb-4"><a href="${pdt2}">#${product.wine_type}</a></h4><br>
							<c:url var="pdt3" value="psearch.do">
							<c:param name="action" value="grape_type" />
							<c:param name="keyword" value="${product.grape_type}" />
							</c:url> 
							<h4 class="mb-4"><a href="${pdt3}">#${product.grape_type}</a></h4>
										</div>
									</div>
									<c:url var="pdetail" value="pdetail.do">
										<c:param name="product_id" value="${product.product_id}" />
									</c:url>
									<a href="${pdetail}"><div class="text text-center">
											<span class="category">${product.product_ename}</span>
											<h2>${product.product_name}</h2>
											<p class="mb-0">
												<span class="price">
												<fmt:formatNumber type="currency" value="${product.product_price}"></fmt:formatNumber></span>
											</p>
										</div></a>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>

				<div class="col-md-3">
					<div class="sidebar-box ftco-animate">
						<div align="center" class="categories">
						<form action="advsearch.do" method="post">
							<ul>
							<li>
								<fieldset>
									<legend>와인 종류</legend>
									<input name='wine_type' id="red" type='checkbox' value='레드'><label for="red">레드&nbsp; &nbsp;</label>  
									<input name='wine_type' id="white" type='checkbox' value='화이트'><label for="white"> 화이트 &nbsp; &nbsp;</label><br> 
									<input name='wine_type' id="sparkling" type='checkbox'	value='스파클링'><label for="sparkling"> 스파클링 &nbsp; &nbsp; </label>
									<input name='wine_type' id="rose" type='checkbox' value='로제'><label for="rose">로제 &nbsp; &nbsp; </label><br>

								</fieldset>
								</li>
								
								<li>
								<fieldset>
									<legend>와인 원산지</legend>
									<input name='wine_origin' id="france" type='checkbox' value="프랑스"><label for="france"> 프랑스&nbsp; &nbsp;</label>
									<input name='wine_origin' id="italy" type='checkbox' value="이탈리아"><label for="italy"> 이탈리아&nbsp; &nbsp;</label><br>
									<input name='wine_origin' id="spain" type='checkbox' value="스페인"><label for="spain"> 스페인&nbsp; &nbsp;</label>
									<input name='wine_origin' id="portuguese" type='checkbox' value="포르투갈"><label for="portuguese"> 포르투갈&nbsp; &nbsp; </label><br>
									<input name='wine_origin' id="germany" type='checkbox' value="독일"><label for="germany"> 독일&nbsp; &nbsp;</label>
									<input name='wine_origin' id="austria" type='checkbox' value="오스트리아"><label for="austria"> 오스트리아&nbsp; &nbsp;</label><br>
									<input name='wine_origin' id="america" type='checkbox' value="미국"><label for="america"> 미국&nbsp;&nbsp; </label>
									<input name='wine_origin' id="austrailia" type='checkbox' value="호주"><label for="austrailia"> 호주&nbsp; &nbsp;</label><br>
									<input name='wine_origin' id="newzealand" type='checkbox' value="뉴질랜드"><label for="newzealand"> 뉴질랜드&nbsp; &nbsp;</label>
									<input name='wine_origin' id="argentina" type='checkbox' value="아르헨티나"><label for="argentina"> 아르헨티나&nbsp; &nbsp;</label>
									<input name='wine_origin' id="chile" type='checkbox' value="칠레"><label for="chile"> 칠레&nbsp; &nbsp; </label>
									<input name='wine_origin' id="southafrica" type='checkbox' value="남아프리카"><label for="southafrica"> 남아프리카&nbsp; &nbsp;</label>
								</fieldset>
								</li>
								
								<li>
								<fieldset>
									<legend>가격대</legend>
									<input name='product_price' id="10000" type='radio' value="10000"><label for="10000"> 1만원 이하&nbsp;&nbsp;</label> 
									<input name='product_price' id="30000" type='radio' value="30000"><label for="30000"> 3만원 이하&nbsp;&nbsp; </label> <br>
									<input name='product_price' id="50000" type='radio' value="50000"><label for="50000"> 5만원 이하&nbsp;&nbsp; </label> 
									<input name='product_price' id="70000" type='radio' value="70000"><label for="70000"> 7만원 이하&nbsp;&nbsp; </label>  <br>
									<input name='product_price' id="100000" type='radio' value="100000"><label for="100000"> 10만원 이하&nbsp;&nbsp;</label>  <br>
									<input name='product_price' id="200000" type='radio' value="200000"><label for="200000"> 20만원 이하&nbsp;&nbsp; </label> <br>
									<input name='product_price' id="500000" type='radio' value="500000"><label for="500000"> 50만원 이하&nbsp;&nbsp;</label> <br>
									<input name='product_price' id="1000000" type='radio' value="1000000"><label for="1000000"> 100만원 이하&nbsp;&nbsp;</label> <br>
									 
								</fieldset>
								</li>
								
								<li>
								<fieldset>
									<legend>와인 특성</legend>
					당도&nbsp;&nbsp; <input type="checkbox"	onclick="document.getElementById('sweetness').disabled = !document.getElementById('sweetness').disabled;"> 
						<input type="range" id="sweetness" name="sweetness" min="0" max="5" step="1" value="0" oninput="document.getElementById('value1').innerHTML=this.value;" disabled>
						<span id="value1">0</span><br>
					산도&nbsp;&nbsp; <input type="checkbox" onclick="document.getElementById('acidity').disabled = !document.getElementById('acidity').disabled;"> 
						<input type="range" id="acidity" name="acidity" min="0" max="5" step="1" value="0" oninput="document.getElementById('value2').innerHTML=this.value;" disabled>
						<span id="value2">0</span><br>
					바디&nbsp;&nbsp; <input type="checkbox" onclick="document.getElementById('body').disabled = !document.getElementById('body').disabled;"> 
						<input type="range" id="body" name="body" min="0" max="5" step="1" value="0" oninput="document.getElementById('value3').innerHTML=this.value;" disabled>
						<span id="value3">0</span><br>
					타닌&nbsp;&nbsp; <input type="checkbox"	onclick="document.getElementById('tannin').disabled = !document.getElementById('tannin').disabled;"> 
						<input type="range" id="tannin" name="tannin" min="0" max="5" step="1" value="0" oninput="document.getElementById('value4').innerHTML=this.value;" disabled>
						<span id="value4">0</span>
									
								</fieldset>
								</li>
								<li><button type='reset'>초기화</button>
									<button type='submit'>검색</button>
								</li>
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







	<script	src="${pageContext.servletContext.contextPath}/resources/js/users/jquery.min.js"></script>
	<script	src="${pageContext.servletContext.contextPath}/resources/js/users/jquery-migrate-3.0.1.min.js"></script>
	<script	src="${pageContext.servletContext.contextPath}/resources/js/users/popper.min.js"></script>
	<script	src="${pageContext.servletContext.contextPath}/resources/js/users/bootstrap.min.js"></script>
	<script	src="${pageContext.servletContext.contextPath}/resources/js/users/jquery.easing.1.3.js"></script>
	<script	src="${pageContext.servletContext.contextPath}/resources/js/users/jquery.waypoints.min.js"></script>
	<script	src="${pageContext.servletContext.contextPath}/resources/js/users/jquery.stellar.min.js"></script>
	<script	src="${pageContext.servletContext.contextPath}/resources/js/users/owl.carousel.min.js"></script>
	<script	src="${pageContext.servletContext.contextPath}/resources/js/users/jquery.magnific-popup.min.js"></script>
	<script	src="${pageContext.servletContext.contextPath}/resources/js/users/jquery.animateNumber.min.js"></script>
	<script	src="${pageContext.servletContext.contextPath}/resources/js/users/scrollax.min.js"></script>
	<script	src="${pageContext.servletContext.contextPath}/resources/js/users/main.js"></script>
</body>
</html>