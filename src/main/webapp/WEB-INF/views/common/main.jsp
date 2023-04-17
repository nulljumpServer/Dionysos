<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="/error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<head>
<title>Dionysos Wine Shop</title>
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
<script type="text/javascript"
	src="${pageContext.servletContext.contextPath}/resources/js/jquery-3.6.3.min.js"></script>
	<script type="text/javascript">
    var alertMessage = "${alertMessage}";
    if (alertMessage) {
      alert(alertMessage);
    }
	</script>
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
	<div class="container">
	<form action="advsearch.do" method="post">
	<div style="display: flex;" align="center">
		
			
				
				<fieldset style="" class="main-filter">
					<legend><img src="${pageContext.servletContext.contextPath}/resources/images/filter1.png" width="150" height="150"></legend>
					<input name='wine_type' type='checkbox' value='레드'><label for="red">레드</label><br> 
					<input name='wine_type' type='checkbox' value='화이트'><label for="white">화이트</label><br>
					<input name='wine_type' type='checkbox'	value='스파클링'><label for="sparkling"> 스파클링</label><br>
					<input name='wine_type' type='checkbox' value='로제'><label for="rose">로제</label><br>
				</fieldset>
				<fieldset>
					<legend><img src="${pageContext.servletContext.contextPath}/resources/images/filter2.png" width="150" height="150"></legend>
					<input name='wine_origin' type='checkbox' value="프랑스"><label for="france">프랑스</label>&nbsp;
					<input name='wine_origin' type='checkbox' value="이탈리아"><label for="italy">이탈리아</label><br>
					<input name='wine_origin' type='checkbox' value="스페인"><label for="spain">스페인</label>&nbsp;
					<input name='wine_origin' type='checkbox' value="포르투갈"><label for="portuguese">포르투갈</label><br>
					<input name='wine_origin' type='checkbox' value="독일"><label for="germany">독일</label>&nbsp;
					<input name='wine_origin' type='checkbox' value="오스트리아"><label for="austria">오스트리아</label><br>
					<input name='wine_origin' type='checkbox' value="미국"><label for="america"> 미국 </label>&nbsp;
					<input name='wine_origin' type='checkbox' value="호주"><label for="austrailia">호주</label><br>
					<input name='wine_origin' type='checkbox' value="뉴질랜드"><label for="newzealand">뉴질랜드</label>&nbsp;
					<input name='wine_origin' type='checkbox' value="칠레"><label for="chile">칠레</label><br>
					<input name='wine_origin' type='checkbox' value="아르헨티나"><label for="argentina">아르헨티나</label><br>
					<input name='wine_origin' type='checkbox' value="남아프리카"><label for="southafrica">남아프리카</label>&nbsp;
				</fieldset>
				<fieldset>
					<legend><img src="${pageContext.servletContext.contextPath}/resources/images/filter3.png" width="150" height="150"></legend>
					<input name='product_price' type='radio' value="10000"><label for="10000"> 1만원 이하</label> &nbsp;
					<input name='product_price' type='radio' value="30000"><label for="30000"> 3만원 이하 </label> <br>
					<input name='product_price' type='radio' value="50000"><label for="50000"> 5만원 이하 </label> &nbsp;
					<input name='product_price' type='radio' value="70000"><label for="70000"> 7만원 이하 </label> <br>
					<input name='product_price' type='radio' value="100000"><label for="100000"> 10만원 이하</label> &nbsp;
					<input name='product_price' type='radio' value="200000"><label for="200000"> 20만원 이하 </label> <br>
					<input name='product_price' type='radio' value="500000"><label for="500000"> 50만원 이하</label> &nbsp;
					<input name='product_price' type='radio' value="1000000"><label for="1000000"> 100만원 이하</label><br>
				</fieldset>
				<fieldset>
					<legend><img src="${pageContext.servletContext.contextPath}/resources/images/filter4.png" width="150" height="150"></legend>
					당도&nbsp;<input type="checkbox" onclick="document.getElementById('sweetness').disabled = !document.getElementById('sweetness').disabled;">
					<input type="range" id="sweetness" name="sweetness" min="0" max="5" step="1" value="0"
						oninput="document.getElementById('value1').innerHTML=this.value;"disabled> 
						<span id="value1">0</span><br>
					산도&nbsp;<input type="checkbox" onclick="document.getElementById('acidity').disabled = !document.getElementById('acidity').disabled;">
					<input type="range" id="acidity" name="acidity" min="0" max="5"	step="1" value="0" 
					oninput="document.getElementById('value2').innerHTML=this.value;" disabled> 
					<span id="value2">0</span><br>
					바디&nbsp;<input type="checkbox" onclick="document.getElementById('body').disabled = !document.getElementById('body').disabled;">
					<input type="range" id="body" name="body" min="0" max="5" step="1"value="0"
						oninput="document.getElementById('value3').innerHTML=this.value;" disabled> 
						<span id="value3">0</span><br>
					타닌&nbsp;<input type="checkbox" onclick="document.getElementById('tannin').disabled = !document.getElementById('tannin').disabled;">
					<input type="range" id="tannin" name="tannin" min="0" max="5" step="1" value="0"
					oninput="document.getElementById('value4').innerHTML=this.value;" disabled> 
					<span id="value4">0</span>
					</fieldset>
					<br>
					</div>
					<br><div align="center">
					<button class="btn btn-primary py-2 px-4" type='reset'>초기화</button>
								<button class="btn btn-primary py-2 px-4" type='submit'>검색</button>
					</div>
			</form>
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
								<p class="meta-prod d-flex">
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
						</div>
						<c:url var="pdetail" value="pdetail.do">
							<c:param name="product_id" value="${product.product_id }" />
						</c:url>
						<a href="${pdetail}">
							<div class="text text-center">
								<span class="category">${product.product_ename}</span>
								<h2>${product.product_name}</h2>
								<p class="mb-0">
									<span class="price"><fmt:formatNumber
											type="currency" value="${product.product_price}"></fmt:formatNumber></span>
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
								</p>
							</div>
						</div>
						<c:url var="pdetail" value="pdetail.do">
							<c:param name="product_id" value="${product.product_id }" />
						</c:url>
						<a href="${pdetail}">
							<div class="text text-center">
								<span class="category">${product.product_ename}</span>
								<h2>${product.product_name}</h2>
								<p class="mb-0">
									<span class="price"><fmt:formatNumber type="currency" value="${product.product_price}"></fmt:formatNumber></span>
									
								</p>
							</div>
						</a>
					</div>
				</div>
			</c:forEach>

			
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