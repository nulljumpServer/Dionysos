<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="url" value="plistView.do" />
<c:set var="currentPage" value="${ requestScope.paging.currentPage }" />
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
input[type="search"] {
  color: black;
}
</style>
<script type="text/javascript"
	src="${pageContext.servletContext.contextPath}/resources/js/jquery-3.6.3.min.js"></script>
<script type="text/javascript">
	$(function() {
		showDiv();

		$('input[name=item]').on('change', function() {
			showDiv();
		});

	}); //document.ready
	function showDiv() {
		if ($('input[name=item]').eq(0).is(':checked')) {
			$('#productDiv').css('display', 'block');
			$('#writerDiv').css('display', 'none');
			
		}
		if ($('input[name=item]').eq(1).is(':checked')) {
			$('#productDiv').css('display', 'none');
			$('#writerDiv').css('display', 'block');
			
		}
			}
</script>
<style>
 .star {
	-webkit-text-fill-color: #ad393a
	}
  .star{
	  font-size: 2.25rem;
	  line-height: 2.5rem;
	  padding: 0 0.2em;
	  text-align: left;
	  width: 5em;
</style>
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
										<h2>리뷰통합관리</h2>
										<p>
											<span class="bread-ntd">리뷰목록</span>
										</p>
									</div>
								</div>
							</div>
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="product-status mg-b-30">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="product-status-wrap">
						<h4>리뷰 관리</h4>
						<table align="center">
							<tr>
								<th>리뷰 번호</th>
								<th>글쓴이</th>
								<th>이미지</th>
								<th>상품명</th>
								<th>리 뷰</th>
								<th>평 점</th>
								<th>작성일</th>
								<th>기 능</th>
							</tr>
							<c:forEach items="${list}" var="review">
								<tr>
									<td>${review.review_id}</td>
									<td>${review.user_id}</td>
									<td><img
										src="${pageContext.servletContext.contextPath}${review.product_image}"
										alt="" /></td>
									<td>${review.product_name}</td>
									<td>
									<c:url var="rdetail" value="rdetail.do">
										<c:param name="review_id" value="${review.review_id}" />
									</c:url>
										<a href="${rdetail}">${review.review_title}</a>
									</td>
									<td class="star">
										<c:if test="${review.review_score eq 0}">&nbsp;</c:if>
										<c:if test="${review.review_score eq 1}">★</c:if>
										<c:if test="${review.review_score eq 2}">★★</c:if>
										<c:if test="${review.review_score eq 3}">★★★</c:if>
										<c:if test="${review.review_score eq 4}">★★★★</c:if>
										<c:if test="${review.review_score eq 5}">★★★★★</c:if>
									</td>
									<td>${review.created_at}</td>
									<td><c:url var="rdel" value="/rdel.do">
											<c:param name="review_id" value="${review.review_id}" />
											<c:param name="page" value="${currentPage}" />
										</c:url>
										<button	onclick="if(confirm('정말로 삭제 하시겠습니까? 삭제 후에는 복구가 불가능합니다.')) {location.href='${rdel}'; }"
											data-toggle="tooltip" class="pd-setting-ed">삭제</button>
									</td>
								</tr>
							</c:forEach>
						</table>
						<div align="center">
						<div>
							<input type="radio" name="item" value="title" checked> 상품명&nbsp; &nbsp; 
							<input type="radio" name="item" value="writer">글쓴이 &nbsp; &nbsp; 
						</div>
						<div id="productDiv">
							<form action="amdrevsearch.do" method="post">
							<input type="hidden" name="action" value="product_name">
								<label>상품명을  입력하세요 : <input type="search"
									name="keyword">
								</label> <input type="submit" class="btn btn-primary" value="검색">
							</form>
						</div>
						<div id="writerDiv">
							<form action="amdrevsearch.do" method="post">
							<input type="hidden" name="action" value="user_id">
								<label>검색할 회원 아이디를 입력하세요 :  <input type="search"
									name="keyword">
								</label>
								<input type="submit" class="btn btn-primary" value="검색">
								
							</form>
						</div>
						</div>
						<c:import url="/WEB-INF/views/admin/paging.jsp" />

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
		src="${pageContext.servletContext.contextPath}/resources/js/admin/jquery-price-slider.js"></script>
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
		src="${pageContext.servletContext.contextPath}/resources/js/admin/scrollbar/mCustomScrollbar-active.js"></script>
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