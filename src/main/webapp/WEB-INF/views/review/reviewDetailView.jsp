<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="currentPage" value="${requestScope.currentPage }" />

<html lang="ko">
  <head>
    <title></title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
   <script type="text/javascript"
	src="${pageContext.servletContext.contextPath}/resources/js/jquery-3.6.3.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Spectral:ital,wght@0,200;0,300;0,400;0,500;0,700;0,800;1,200;1,300;1,400;1,500;1,700&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/users/font-awesome.min.css">
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
<hr>
<h2 align="center">${requestScope.review.review_id} 번 리뷰 상세보기</h2>
<br>
<table align="center" width="600" border="1" cellspacint="0" cellpadding="5" text-color="black">
	<tr><th>제 목</th><td>${review.review_title }</td></tr>
	<tr><th>작성자</th><td>${review.user_id }</td></tr>
	<tr><th>날 짜</th>
		<td><fmt:formatDate value="${review.created_at}" type="date" pattern="yyyy-MM-dd" /></td>
	</tr>
	<tr><th>사 진</th>
		<td>${review.review_image}</td>
	</tr>
	<tr><th>내 용</th><td>${review.review_content}</td></tr>
	<tr><th colspan="2">
		<button onclick="javascript:location.href='pdetail.do?page=${currentPage}';">목 록</button>
		&nbsp;
		<!-- 본인이 작성한 리뷰일 때는 수정과 삭제 기능 제공 -->
		<c:if test="${requestScope.review.user_id eq sessionScope.loginMember.user_id}">
			<c:url var="rupdate" value="/rupdate.do">
				<c:param name="review_id" value="${review.review_id}" />
				<c:param name="page" value="${currentPage}" />
			</c:url>
			<a href="${rupdate}">[수정페이지로 이동]</a> &nbsp;
			
			<c:url var="rdelete" value="/rdelete.do">
				<c:param name="review_id" value="${review.review_id}" />
			</c:url>
			<a href="${rdelete}">[글 삭제]</a> &nbsp;
		</c:if>
	</th></tr>
</table>
<br>

<hr>
  <footer>
     	<c:import url="/WEB-INF/views/common/footer.jsp" />
    </footer>
 <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>

		<script src="${pageContext.servletContext.contextPath}/resources/js/jquery.min.js"></script>
		<script src="${pageContext.servletContext.contextPath}/resources/js/jquery-migrate-3.0.1.min.js"></script>
		<script src="${pageContext.servletContext.contextPath}/resources/js/popper.min.js"></script>
		<script src="${pageContext.servletContext.contextPath}/resources/js/bootstrap.min.js"></script>
		<script src="${pageContext.servletContext.contextPath}/resources/js/jquery.easing.1.3.js"></script>
		<script src="${pageContext.servletContext.contextPath}/resources/js/jquery.waypoints.min.js"></script>
		<script src="${pageContext.servletContext.contextPath}/resources/js/jquery.stellar.min.js"></script>
		<script src="${pageContext.servletContext.contextPath}/resources/js/owl.carousel.min.js"></script>
		<script src="${pageContext.servletContext.contextPath}/resources/js/jquery.magnific-popup.min.js"></script>
		<script src="${pageContext.servletContext.contextPath}/resources/js/jquery.animateNumber.min.js"></script>
		<script src="${pageContext.servletContext.contextPath}/resources/js/scrollax.min.js"></script>
		<script src="${pageContext.servletContext.contextPath}/resources/js/main.js"></script>		
  </body>
</html>
</html>