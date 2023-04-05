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
<title>admin - productList</title>
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
			$('#titleDiv').css('display', 'block');
			$('#writerDiv').css('display', 'none');
			$('#dateDiv').css('display', 'none');
		}
		if ($('input[name=item]').eq(1).is(':checked')) {
			$('#titleDiv').css('display', 'none');
			$('#writerDiv').css('display', 'block');
			$('#dateDiv').css('display', 'none');
		}
		if ($('input[name=item]').eq(2).is(':checked')) {
			$('#titleDiv').css('display', 'none');
			$('#writerDiv').css('display', 'none');
			$('#dateDiv').css('display', 'block');
		}
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
											<span class="bread-ntd">상품목록</span>
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

	<div class="product-status mg-b-30">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="product-status-wrap">
						<h4>상품 관리</h4>
						<div class="add-product">
							<a href="pinsertForm.do">상품 추가하기</a>
						</div>
						<table>
							<tr>
								<th>이미지</th>
								<th>상품 번호</th>
								<th>상품명</th>
								<th>상품 영문명</th>
								<th>가격</th>
								<th>설정</th>
							</tr>
							<c:forEach items="${list}" var="product">
								<tr>
									<td><img
										src="${pageContext.servletContext.contextPath}${product.product_image}"
										alt="" /></td>
									<td>${product.product_id }</td>
									<td>${product.product_name}</td>
									<td>${product.product_ename}</td>

									<td>${product.product_price}원</td>
									<td><c:url var="pupdate" value="/pupdateForm.do">
											<c:param name="product_id" value="${product.product_id}" />
											<c:param name="page" value="${currentPage}" />
										</c:url>
										<button onclick="location.href='${pupdate}'"
											data-toggle="tooltip" title="수정" class="pd-setting-ed">수정</button>
										<c:url var="pdelete" value="/pdelete.do">
											<c:param name="product_id" value="${product.product_id}" />
											<c:param name="page" value="${currentPage}" />
										</c:url>
										<button
											onclick="if(confirm('정말로 삭제 하시겠습니까? 삭제 후에는 복구가 불가능합니다.')) {location.href='${pdelete}'; }"
											data-toggle="tooltip" title="삭제" class="pd-setting-ed">삭제</button>

									</td>
								</tr>
							</c:forEach>

						</table>

						<div>
							<input type="radio" name="item" value="title" checked> 제목
							&nbsp; &nbsp; <input type="radio" name="item" value="writer">
							작성자 &nbsp; &nbsp; <input type="radio" name="item" value="date">
							날짜
						</div>
						<div id="titleDiv">
							<form action="psearch.do" method="post">
							<input type="hidden" name="action" value="product_name">
								<label>검색할 상품명을 입력하세요 : <input type="search"
									name="keyword">
								</label> <input type="submit" value="검색">
							</form>
						</div>
						<div id="writerDiv">
							<form action="psearch.do" method="post">
							<input type="hidden" name="action" value="product_ename">
								<label>검색할 상품 영문명을 입력하세요 :  <input type="search"
									name="keyword">
								</label> <input type="submit" value="검색">
							</form>
						</div>
						<div id="dateDiv">
							<form action="psearch.do" method="post">
							
								<label>검색할 등록날짜를 입력하세요 : <input type="date" name="begin">
									~ <input type="date" name="end">
								</label> <input type="submit" value="검색">
							</form>
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