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
							<h3 class="mb-4">와인 목록</h3>
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
							<c:param name="keyword" value="${product.wine_origin }" />
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
										<c:param name="product_id" value="${product.product_id }" />
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
						<div align="center" class="categories">
						
							<h3 class="mb-4">카테고리별 검색</h3>
							<form action="psearch.do" method="post">
							<input type="hidden" name="action" value="wine_type">
							
								<fieldset>
									<legend>와인 종류</legend>
									<input name='keyword' id="red" type='radio' value='레드'><label for="red">레드&nbsp; &nbsp;</label>  
									<input name='keyword' id="white" type='radio' value='화이트'><label for="white"> 화이트 &nbsp; &nbsp;</label><br> 
									<input name='keyword' id="sparkling" type='radio'	value='스파클링'><label for="sparkling"> 스파클링 &nbsp; &nbsp; </label>
									<input name='keyword' id="rose" type='radio' value='로제'><label for="rose">로제 &nbsp; &nbsp; </label>
								</fieldset>
								<button type='reset'>초기화</button>
								<button type='submit'>검색</button>
								</form>
								<hr>
								<form action="psearch.do" method="post">
								<input type="hidden" name="action" value="wine_origin">
								<fieldset>
									<legend>와인 원산지</legend>
									<input name='keyword' id="france" type='radio' value="프랑스"><label for="france"> 프랑스&nbsp; &nbsp;</label>
									<input name='keyword' id="italy" type='radio' value="이탈리아"><label for="italy"> 이탈리아&nbsp; &nbsp;</label><br>
									<input name='keyword' id="spain" type='radio' value="스페인"><label for="spain"> 스페인&nbsp; &nbsp;</label>
									<input name='keyword' id="portuguese" type='radio' value="포르투갈"><label for="portuguese"> 포르투갈&nbsp; &nbsp; </label><br>
									<input name='keyword' id="germany" type='radio' value="독일"><label for="germany"> 독일&nbsp; &nbsp;</label>
									<input name='keyword' id="austria" type='radio' value="오스트리아"><label for="austria"> 오스트리아&nbsp; &nbsp;</label><br>
									<input name='keyword' id="america" type='radio' value="미국"><label for="america"> 미국&nbsp;&nbsp; </label>
									<input name='keyword' id="austrailia" type='radio' value="호주"><label for="austrailia"> 호주&nbsp; &nbsp;</label><br>
									<input name='keyword' id="newzealand" type='radio' value="뉴질랜드"><label for="newzealand"> 뉴질랜드&nbsp; &nbsp;</label>
									<input name='keyword' id="argentina" type='radio' value="아르헨티나"><label for="argentina"> 아르헨티나&nbsp; &nbsp;</label>
									<input name='keyword' id="chile" type='radio' value="칠레"><label for="chile"> 칠레&nbsp; &nbsp; </label>
									<input name='keyword' id="southafrica" type='radio' value="남아프리카"><label for="southafrica"> 남아프리카&nbsp; &nbsp;</label>
								</fieldset>
								<button type='reset'>초기화</button>
								<button type='submit'>검색</button>
								</form>
								<hr>
								<form action="psearch.do" method="post">
								<input type="hidden" name="action" value="product_price">
								<fieldset>
									<legend>가격대</legend>
									<input name='keyword' id="10000" type='radio' value="10000"><label for="10000"> 1만원 이하&nbsp;&nbsp;</label> 
									<input name='keyword' id="30000" type='radio' value="30000"><label for="30000"> 3만원 이하&nbsp;&nbsp; </label> <br>
									<input name='keyword' id="50000" type='radio' value="50000"><label for="50000"> 5만원 이하&nbsp;&nbsp; </label> 
									<input name='keyword' id="70000" type='radio' value="70000"><label for="70000"> 7만원 이하&nbsp;&nbsp; </label>  <br>
									<input name='keyword' id="100000" type='radio' value="100000"><label for="100000"> 10만원 이하&nbsp;&nbsp;</label>  <br>
									<input name='keyword' id="200000" type='radio' value="200000"><label for="200000"> 20만원 이하&nbsp;&nbsp; </label> <br>
									<input name='keyword' id="500000" type='radio' value="500000"><label for="500000"> 50만원 이하&nbsp;&nbsp;</label> <br>
									<input name='keyword' id="1000000" type='radio' value="1000000"><label for="1000000"> 100만원 이하&nbsp;&nbsp;</label> <br>

								</fieldset>
								<button type='reset'>초기화</button>
								<button type='submit'>검색</button>
								</form>
								<hr>
							
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