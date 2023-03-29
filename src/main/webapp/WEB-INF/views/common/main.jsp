<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<head>
<title>Dionysos</title>
<script type="text/javascript">
        document.querySelector('#ex-in').addEventListener('input',e=>{
            document.querySelector('#ex-out').innerHTML= e.target.value;
        });
    </script>

</head>
<body>


	<c:import url="/WEB-INF/views/common/menubar.jsp" />
	<div class="hero-wrap"
		style="background-image: url('resources/images/bg_5.jpg');">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-8 ftco-animate d-flex align-items-end">
					<div class="text w-100 text-center">
						<h1 class="mb-4">
							Dionysos <span>Wine</span> Shop<span> &</span> Dictionary
						</h1>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br>

	
	<div align="center" class="main-filter-layer">
		<div class='main-filter clear'>
		<form action="avdsearch.do">
			<fieldset>
				<legend>와인 종류</legend>
				<input name='wine_type' type='checkbox' value='red'> 레드
				&nbsp; &nbsp; <input name='wine_type' type='checkbox' value='white'>
				화이트 &nbsp; &nbsp; <input name='wine_type' type='checkbox'
					value='sparkling'> 스파클링 &nbsp; &nbsp; <input
					name='wine_type' type='checkbox' value='rose'>로제 &nbsp;
				&nbsp; <input name='wine_type' type='checkbox' value='fortified'>주정강화
				&nbsp; &nbsp;
			</fieldset>
			<br>
			<fieldset>
				<legend>와인 원산지</legend>
				<input name='wine_origin' type='checkbox' value=""> 프랑스&nbsp;
				&nbsp; <input name='wine_origin' type='checkbox' value=""> 이탈리아&nbsp;
				&nbsp; <input name='wine_origin' type='checkbox' value=""> 스페인&nbsp;
				&nbsp; <input name='wine_origin' type='checkbox' value=""> 포르투갈&nbsp;
				&nbsp; <input name='wine_origin' type='checkbox' value=""> 독일&nbsp;
				&nbsp; <input name='wine_origin' type='checkbox' value=""> 오스트리아&nbsp;
				&nbsp; <input name='wine_origin' type='checkbox' value=""> 미국&nbsp;
				&nbsp; <input name='wine_origin' type='checkbox' value=""> 호주&nbsp;
				&nbsp; <input name='wine_origin' type='checkbox' value=""> 뉴질랜드&nbsp;
				&nbsp; <input name='wine_origin' type='checkbox' value=""> 칠레&nbsp;
				&nbsp; <input name='wine_origin' type='checkbox' value=""> 아르헨티나&nbsp;
				&nbsp; <input name='wine_origin' type='checkbox' value=""> 남아프리카&nbsp;
				&nbsp;
			</fieldset>
			<br>
			<fieldset>
			<legend>가격대</legend>
				<input name='product_price' type='checkbox' value="10000"> 1만원 이하&nbsp;&nbsp;
				<input name='product_price' type='checkbox' value="30000"> 1만원 ~ 3만원&nbsp;&nbsp;
				<input name='product_price' type='checkbox' value="50000"> 3만원 ~ 5만원&nbsp;&nbsp;
				<input name='product_price' type='checkbox' value="70000"> 5만원 ~ 7만원&nbsp;&nbsp;
				<input name='product_price' type='checkbox' value="100000"> 7만원 ~ 10만원&nbsp;&nbsp;
				<input name='product_price' type='checkbox' value="200000"> 10만원 ~ 20만원&nbsp;&nbsp;
				<input name='product_price' type='checkbox' value="500000"> 20만원 ~ 50만원&nbsp;&nbsp;
				<input name='product_price' type='checkbox' value="1000000"> 50만원 ~ 100만원&nbsp;&nbsp;
				<input name='product_price' type='checkbox'	value=""> 100만원 이상&nbsp;&nbsp;
			</fieldset>
			<br>
			<fieldset>
			<legend>음식</legend>
			<input name='food_id' type='checkbox' value=""> 스테이크 (소)&nbsp;&nbsp;
			<input name='food_id' type='checkbox' value=""> 삼겹살 (돼지)&nbsp;&nbsp;
			<input name='food_id' type='checkbox' value=""> 치킨 (닭)&nbsp;&nbsp;
			<input name='food_id' type='checkbox' value=""> 생선회 (생선)&nbsp;&nbsp;
			<input name='food_id' type='checkbox' value=""> 해산물 (조개)&nbsp;&nbsp;
			<input name='food_id' type='checkbox' value=""> 샐러드&nbsp;&nbsp;
			<input name='food_id' type='checkbox' value=""> 튀김&nbsp;&nbsp;
			<input name='food_id' type='checkbox' value=""> 치즈&nbsp;&nbsp;
			<input name='food_id' type='checkbox' value=""> 과일&nbsp;&nbsp;
			<input name='food_id' type='checkbox' value=""> 디저트&nbsp;&nbsp;
			<input name='food_id' type='checkbox' value=""> 족발 (한식)&nbsp;&nbsp;
			<input name='food_id' type='checkbox' value=""> 피자 (양식)&nbsp;&nbsp;
			</fieldset>
			<br>
			<fieldset>
			<legend>와인 특성</legend>
			당도&nbsp;&nbsp;
			<input type="checkbox" id="checkbox" onclick="sweetness.disabled=!this.checked;"> 
			<input type="range" id="sweetness" name="sweetness" min="1" max="5"	step="1" list="tick" disabled>
			
			&nbsp;&nbsp;산도&nbsp;&nbsp;
			 <input type="checkbox" id="checkbox" onclick="acidity.disabled=!this.checked;"> 
			 <input type="range" id="acidity" name="acidity" min="1" max="5" step="1" disabled>
			&nbsp;&nbsp;바디&nbsp;&nbsp;
			<input type="checkbox" id="checkbox" onclick="wbody.disabled=!this.checked;">
			<input type="range" id="wbody" name="body" min="1" max="5" step="1" disabled> 
			&nbsp;&nbsp;타닌&nbsp;&nbsp;
			<input type="checkbox" id="checkbox" onclick="tannin.disabled=!this.checked;"> 
			<input type="range"	id="tannin" name="tannin" min="1" max="5" step="1" disabled>
				<br><button type='reset' onclick="mainCategoryInit();">초기화</button>
				<button type='submit' onclick="mainCategoryGo();">검색</button>
			</fieldset>
			</form>
			</div>
			</div>

		<!-- end .main-filter -->



		<section class="ftco-section">
			<div class="container">
				<div class="row justify-content-center pb-5">
					<div class="col-md-7 heading-section text-center ftco-animate">
						<span class="subheading">베스트 상품</span>
					</div>
				</div>
				<div class="row">
					<div class="col-md-3 d-flex">
						<div class="product ftco-animate">
							<a href="#"><div
									class="img d-flex align-items-center justify-content-center"
									style="background-image: url(resources/images/prod-1.jpg);">
									<div class="desc" align="left">
										<a href="#" class="d-flex align-items-center ">키워드1</a><br>
										<a href="#"
											class="d-flex align-items-center justify-content-center">키워드2</a><br>
										<a href="#"
											class="d-flex align-items-center justify-content-center">키워드3</a><br>

									</div>
								</div>
								<div class="text text-center">
									<span class="sale">Sale</span> <span class="category">Brandy</span>
									<h2>Bacardi 151</h2>
									<p class="mb-0">
										<span class="price price-sale">$69.00</span> <span
											class="price">$49.00</span>
									</p>
								</div>
						</div>
					</div>
					<div class="col-md-3 d-flex">
						<div class="product ftco-animate">
							<div class="img d-flex align-items-center justify-content-center"
								style="background-image: url(resources/images/prod-2.jpg);">
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
							<div class="text text-center">
								<span class="seller">Best Seller</span> <span class="category">Gin</span>
								<h2>Jim Beam Kentucky Straight</h2>
								<span class="price">$69.00</span>
							</div>
						</div>
					</div>
					<div class="col-md-3 d-flex">
						<div class="product ftco-animate">
							<div class="img d-flex align-items-center justify-content-center"
								style="background-image: url(resources/images/prod-3.jpg);">
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
							<div class="text text-center">
								<span class="new">New Arrival</span> <span class="category">Rum</span>
								<h2>Citadelle</h2>
								<span class="price">$69.00</span>
							</div>
						</div>
					</div>
					<div class="col-md-3 d-flex">
						<div class="product ftco-animate">
							<div class="img d-flex align-items-center justify-content-center"
								style="background-image: url(resources/images/prod-4.jpg);">
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
							<div class="text text-center">
								<span class="category">Rum</span>
								<h2>The Glenlivet</h2>
								<span class="price">$69.00</span>
							</div>
						</div>
					</div>


					<div class="col-md-3 d-flex">
						<div class="product ftco-animate">
							<div class="img d-flex align-items-center justify-content-center"
								style="background-image: url(resources/images/prod-5.jpg);">
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
							<div class="text text-center">
								<span class="category">Whiskey</span>
								<h2>Black Label</h2>
								<span class="price">$69.00</span>
							</div>
						</div>
					</div>
					<div class="col-md-3 d-flex">
						<div class="product ftco-animate">
							<div class="img d-flex align-items-center justify-content-center"
								style="background-image: url(resources/images/prod-6.jpg);">
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
							<div class="text text-center">
								<span class="category">Tequila</span>
								<h2>Macallan</h2>
								<span class="price">$69.00</span>
							</div>
						</div>
					</div>
					<div class="col-md-3 d-flex">
						<div class="product ftco-animate">
							<div class="img d-flex align-items-center justify-content-center"
								style="background-image: url(resources/images/prod-7.jpg);">
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
							<div class="text text-center">
								<span class="category">Vodka</span>
								<h2>Old Monk</h2>
								<span class="price">$69.00</span>
							</div>
						</div>
					</div>
					<div class="col-md-3 d-flex">
						<div class="product ftco-animate">
							<div class="img d-flex align-items-center justify-content-center"
								style="background-image: url(resources/images/prod-8.jpg);">
								<div class="desc">
									<p class="meta-prod d-flex">
										<a href="   "
											class="d-flex align-items-center justify-content-center"><span
											class="flaticon-shopping-bag"></span></a> <a href="#"
											class="d-flex align-items-center justify-content-center"><span
											class="flaticon-heart"></span></a> <a href="#"
											class="d-flex align-items-center justify-content-center"><span
											class="flaticon-visibility"></span></a>
									</p>
								</div>
							</div>
							<div class="text text-center">
								<span class="category">Whiskey</span>
								<h2>Jameson Irish Whiskey</h2>
								<span class="price">$69.00</span>
							</div>
						</div>
					</div>
				</div>
				<div class="row justify-content-center">
					<div class="col-md-4">
						<a href="product.html" class="btn btn-primary d-block">모든 상품
							보러 가기<span class="fa fa-long-arrow-right"></span>
						</a>
					</div>
				</div>
			</div>
		</section>



		<footer>
			<c:import url="/WEB-INF/views/common/footer.jsp" />
		</footer>

		<!-- loader -->
		<div id="ftco-loader" class="show fullscreen">
			<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
					stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
					stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
		</div>


		<script src="resources/js/jquery.min.js"></script>
		<script src="resources/js/jquery-migrate-3.0.1.min.js"></script>
		<script src="resources/js/popper.min.js"></script>
		<script src="resources/js/bootstrap.min.js"></script>
		<script src="resources/js/jquery.easing.1.3.js"></script>
		<script src="resources/js/jquery.waypoints.min.js"></script>
		<script src="resources/js/jquery.stellar.min.js"></script>
		<script src="resources/js/owl.carousel.min.js"></script>
		<script src="resources/js/jquery.magnific-popup.min.js"></script>
		<script src="resources/js/jquery.animateNumber.min.js"></script>
		<script src="resources/js/scrollax.min.js"></script>
		<script
			src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
		<script src="resources/js/google-map.js"></script>
		<script src="resources/js/main.js"></script>
</body>
</html>