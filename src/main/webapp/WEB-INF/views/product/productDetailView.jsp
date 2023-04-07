<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="listCount" value="${ requestScope.paging.listCount }" />
<c:set var="currentPage" value="${ requestScope.paging.currentPage }" />

<!DOCTYPE html>
<html lang="ko">
<head>
<title></title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
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

<style>
  .slist {
    width: 100%;
    border-top: 1px solid #444444;
    border-collapse: collapse;
  }
  .slist th {
    border-bottom: 1px solid #444444;
    padding: 10px;
  }
  
  .rlist {
    width: 100%;
    border-top: 1px solid #444444;
    border-collapse: collapse;
  }
  .rlist th {
    border-bottom: 1px solid #444444;
    padding: 10px;
  }
</style>

</head>
<body>

	<c:import url="/WEB-INF/views/common/menubar.jsp" />

	<section class="ftco-section">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-end justify-content-center">
				<div class="col-md-9 ftco-animate mb-5 text-center">
					<p class="breadcrumbs mb-0">
						<span class="mr-2"><a href="main.do">Home <i
								class="fa fa-chevron-right"></i></a></span> <span><a href="plistView.do">Products
								<i class="fa fa-chevron-right"></i>
						</a></span>
					</p>
					<h2 class="mb-0 bread">상세정보</h2>
				</div>
			</div>
		</div>
		&nbsp;
		<div class="container">
			<div class="row">
				<div class="col-lg-6 mb-5 ftco-animate">
					<a
						href="${pageContext.servletContext.contextPath}${ product.product_image }"
						class="image-popup prod-img-bg"><img
						src="${pageContext.servletContext.contextPath}${product.product_image}"
						class="img-fluid" alt="Colorlib Template"></a>
				</div>
				<div class="col-lg-6 product-details pl-md-5 ftco-animate">
					<h2>${ product.product_name }</h2>
					<h4><div style="color : #ad393a">${ product.product_ename }</div></h4>
					<h6>${product.description}</h6>
					<div class="rating d-flex">
						<p class="text-left mr-4">
							<a href="#" class="mr-2">5.00${ review.review_score }</a> <a
								href="#"><span class="fa fa-star"></span></a> <a href="#"><span
								class="fa fa-star"></span></a> <a href="#"><span
								class="fa fa-star"></span></a> <a href="#"><span
								class="fa fa-star"></span></a> <a href="#"><span
								class="fa fa-star"></span></a>
						</p>
					</div>
					
					<table>
						<tr align="center">
							<th>바디</th>
							<th>탄닌</th>
							<th>당도</th>
							<th>산도</th>
						</tr>
						<tr>
							<td><img
								src="resources/images/admin/graphs/graph_${ product.body }.png"
								width="75" height="75">&nbsp;</td>
							<td><img
								src="resources/images/admin/graphs/graph_${ product.tannin }.png"
								width="75" height="75">&nbsp;</td>
							<td><img
								src="resources/images/admin/graphs/graph_${ product.sweetness }.png"
								width="75" height="75">&nbsp;</td>
							<td><img
								src="resources/images/admin/graphs/graph_${ product.acidity }.png"
								width="75" height="75">&nbsp;</td>
						</tr>

					</table>
					
					<div class="row mt-4">
						<div class="input-group col-md-6 d-flex mb-3">
							<span class="input-group-btn mr-2">
								<button type="button" class="quantity-left-minus btn"
									data-type="minus" data-field="">
									<i class="fa fa-minus"></i>
								</button>
							</span> <input type="text" id="quantity" name="quantity"
								class="quantity form-control input-number" value="1" min="1"
								max="100"> <span class="input-group-btn ml-2">
								<button type="button" class="quantity-right-plus btn"
									data-type="plus" data-field="">
									<i class="fa fa-plus"></i>
								</button>
							</span>
						</div>
						<div class="w-100"></div>
					</div>
					<div>
					<p class="price">
						<span>가격 : ${ product.product_price } 원</span>
					</p>	
					</div>
					<p>
						<a href="clistView.do" class="btn btn-primary py-3 px-5 mr-2">카트에 담기</a><a
							href="cart.html" class="btn btn-primary py-3 px-5">바로 구매</a>
					</p>
				</div>
			</div>

			<div class="row mt-5">
				<div class="col-md-12 nav-link-wrap">
					<div class="nav nav-pills d-flex text-center" id="v-pills-tab"
						role="tablist" aria-orientation="vertical">
						<a class="nav-link ftco-animate active mr-lg-1" id="v-pills-1-tab"
							data-toggle="pill" href="#v-pills-1" role="tab"
							aria-controls="v-pills-1" aria-selected="true">상세정보</a> <a
							class="nav-link ftco-animate mr-lg-1" id="v-pills-2-tab"
							data-toggle="pill" href="#v-pills-2" role="tab"
							aria-controls="v-pills-2" aria-selected="false">판매처</a> <a
							class="nav-link ftco-animate" id="v-pills-3-tab"
							data-toggle="pill" href="#v-pills-3" role="tab"
							aria-controls="v-pills-3" aria-selected="false">리 뷰</a>

					</div>
				</div>
				<div class="col-md-12 tab-wrap">

					<div class="tab-content bg-light" id="v-pills-tabContent">

						<div class="tab-pane fade show active" id="v-pills-1"
							role="tabpanel" aria-labelledby="day-1-tab">
							<div class="p-4">
								<p>
									<img
										src="${pageContext.servletContext.contextPath}${product.wine_detail}">
								</p>
							</div>
						</div>

						<div class="tab-pane fade" id="v-pills-2" role="tabpanel"
							aria-labelledby="v-pills-day-2-tab">
							<div class="p-4">
								<table align="center" class="slist">
									<tr align="center" style="color : #ad393a">
										<th>매장명</th>
										<th>주소</th>
										<th>전화번호</th>
									</tr>
									<c:forEach items="${requestScope.slist}" var="s">
													<tr align="center">
														<th>${s.store_name}</th>
														<th>${s.address}</th>
														<th>${s.phone}</th>
													</tr>
												</c:forEach>
									
								</table>
							</div>
						</div>
						<div class="tab-pane fade" id="v-pills-3" role="tabpanel"
							aria-labelledby="v-pills-day-3-tab">
							<div class="row p-4">
							
							<button>
								<c:url var="rr" value="/rwriteForm.do">
								    <c:param name="product_id" value="${product.product_id}"/>
								</c:url>
								<a href="${rr}">리뷰 쓰기</a>
							</button>
											<div class="review" style="display:none;">
											<table align="center" class="rlist">
												<c:forEach items="${requestScope.rlist}" var="r">
													<tr align="center">
														<th style="color : #90001f"><a href="${pageContext.servletContext.contextPath}/rdetailView.do">${r.review_title}</a></th>
														<th>${r.user_id}</th>
														<th>${r.review_score}</th>
														<th><fmt:formatDate value="${r.created_at}" pattern="yyyy-MM-dd" /></th>
													</tr>
												</c:forEach>
											</table> 
											</div>
							</div>
						</div>
	</section>

	<script>
      $(document).ready(function(){

      var quantitiy=0;
         $('.quantity-right-plus').click(function(e){
              
              // Stop acting like a button
              e.preventDefault();
              // Get the field name
              var quantity = parseInt($('#quantity').val());
              
              // If is not undefined
                  
                  $('#quantity').val(quantity + 1);

                
                  // Increment
              
          });

           $('.quantity-left-minus').click(function(e){
              // Stop acting like a button
              e.preventDefault();
              // Get the field name
              var quantity = parseInt($('#quantity').val());
              
              // If is not undefined
            
                  // Increment
                  if(quantity>0){
                  $('#quantity').val(quantity - 1);
                  }
          });
           
           //리뷰 버튼 클릭시 리뷰 출력
           $('#v-pills-3-tab').click(function(e){
        	   //alert("리뷰 클릭");
        	   
        	  $('div.review').css("display", "block"); 
           });
          
      });
   </script>

	<c:import url="/WEB-INF/views/common/footer.jsp" />

	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div>


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
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/js/users/google-map.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/js/users/bootstrap-select.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/js/users/main.js"></script>

</body>
</html>