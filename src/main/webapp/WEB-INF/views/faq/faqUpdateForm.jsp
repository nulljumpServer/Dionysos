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
										<h2>자주하는 질문 수정하기</h2>
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
	</div>
	<!-- 상세 내용-->
	<div class="product-status mg-b-30">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="product-status-wrap">
						<form action="fupdate.do" method="post"
							enctype="multipart/form-data">
							<input type="hidden" name="faq_no" value="${faq.faq_no}">
							<table align="center" width="500" border="1" cellspacing="0"
								cellpadding="5">
								<tr>
									<th>작성자</th>
									<td><input style="color: black;" name="user_id"
										value="${faq.user_id}" readonly></td>
								</tr>
								<tr>
									<th>날 짜</th>
									<td>${faq.registration_date}</td>
								</tr>
								<tr>
									<th>질 문</th>
									<td><textarea style="color:black;" name="question" rows="3" 
									cols="100">${faq.question}</textarea></td>
								</tr>
								<tr>
									<th>답 변</th>
									<td><textarea style="color: black;" name="answer" rows="5"
											cols="100">${faq.answer}</textarea></td>
								</tr>
								<tr>
									<th colspan="2">
										<button style="color: black;"
											onclick="javascript:history.go(-1); return false;">이전
											페이지로 이동</button> &nbsp; 
											<input style="color: black;" type="submit" value="수정하기"> &nbsp; 
											<input style="color: black;" type="reset" value="수정취소">
									</th>
								</tr>
							</table>
						</form>
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
	<script src="js/bootstrap.min.js"></script>
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
	<!-- tab JS
		============================================ -->
	<script
		src="${pageContext.servletContext.contextPath}/resources/js/admin/tab.js"></script>
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