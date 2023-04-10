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
			$('#nameDiv').css('display', 'block');
			$('#managerDiv').css('display', 'none');
			
		}
		if ($('input[name=item]').eq(1).is(':checked')) {
			$('#nameDiv').css('display', 'none');
			$('#managerDiv').css('display', 'block');
			
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
										<h2>회원관리</h2>
										<p>
											<span class="bread-ntd">회원목록</span>
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
						<h4>회원 관리</h4>
						<table>
							<tr>
								<th>회원 아이디</th>
								<th>회원 이름</th>
								<th>생년월일</th>
								<th>연락처</th>
								<th>이메일</th>
							</tr>
							<c:forEach items="${list}" var="users">
								<tr>
									<td>${users.user_id }</td>
									<td>${users.name }</td>
									<td>${users.birthday}</td>
									<td>${users.phone}</td>
									<td>${users.email }</td>
									<td>
									<c:url var="userDelete" value="/userDelete.do">
											<c:param name="user_id" value="${user.user_id}" />
											<c:param name="page" value="${currentPage}" />
										</c:url>
										<button	onclick="if(confirm('정말로 삭제 하시겠습니까? 삭제 후에는 복구가 불가능합니다.')) {location.href='${userDelete}'; }"
											data-toggle="tooltip" class="pd-setting-ed">삭제</button>
									</td>
								</tr>
							</c:forEach>
						</table>
						<div align="center">
						<div>
							<input type="radio" name="item" value="title" checked> 사용자명 &nbsp; &nbsp; 
							<input type="radio" name="item" value="writer"> 사용자 아이디 &nbsp; &nbsp; 
						</div>
						<div id="nameDiv">
							<form action="userSearch.do" method="post">
							<input type="hidden" name="action" value=name>
								<label>검색할 사용자 이름을 입력하세요 : <input type="search"
									name="keyword">
								</label> <input type="submit" class="btn btn-primary" value="검색">
							</form>
						</div>
						<div id="managerDiv">
							<form action="userSearch.do" method="post">
							<input type="hidden" name="action" value="user_id">
								<label>검색할 사용자 아이디를 입력하세요 :  <input type="search"
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
	<footer>
		<c:import url="/WEB-INF/views/admin/footer.jsp" />
	</footer>



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