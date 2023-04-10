<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="currentPage" value="${requestScope.currentPage}" />

<title>${review.user_id} 님의 후기</title>
    
   <script type="text/javascript"
	src="${pageContext.servletContext.contextPath}/resources/js/jquery-3.6.3.min.js"></script>
	<style>
table {
  border-collapse: collapse;
  border-spacing: 0;
}
section.review {
  padding: 80px 0;
}

.page-title {
  margin-bottom: 60px;
}
.page-title h3 {
  font-size: 28px;
  color: #333333;
  font-weight: 400;
  text-align: center;
}

#board-search .search-window {
  padding: 15px 0;
  background-color: #f9f7f9;
}
#board-search .search-window .search-wrap {
  position: relative;
/*   padding-right: 124px; */
  margin: 0 auto;
  width: 80%;
  max-width: 564px;
}
#board-search .search-window .search-wrap input {
  height: 40px;
  width: 100%;
  font-size: 14px;
  padding: 7px 14px;
  border: 1px solid #ccc;
}
#board-search .search-window .search-wrap input:focus {
  border-color: #333;
  outline: 0;
  border-width: 1px;
}
#board-search .search-window .search-wrap .btn {
  position: absolute;
  right: 0;
  top: 0;
  bottom: 0;
  width: 70px;
  height: 39px;
  padding: 0;
  font-size: 16px;
}

.review-table {
  font-size: 13px;
  width: 60%;
  border-top: 1px solid #ccc;
  border-bottom: 1px solid #ccc;
}

.review-table a {
  color: #333;
  display: inline-block;
  line-height: 1.4;
  word-break: break-all;
  vertical-align: middle;
}
.review-table a:hover {
  text-decoration: underline;
}
.review-table th {
  text-align: center;
}

.review-table .th-num {
  width: 100px;
  text-align: center;
}

.review-table .th-date {
  width: 200px;
}

.review-table th, .board-table td {
  padding: 14px 0;
}

.review-table tbody td {
  border-top: 1px solid #e7e7e7;
  text-align: center;
}

.review-table tbody th {
  padding-left: 28px;
  padding-right: 14px;
  border-top: 1px solid #e7e7e7;
  text-align: left;
}

.review-table tbody th p{
  display: none;
}

.btn {
  display: inline-block;
  padding: 0 30px;
  font-size: 15px;
  font-weight: 400;
  background: transparent;
  text-align: center;
  white-space: nowrap;
  vertical-align: middle;
  -ms-touch-action: manipulation;
  touch-action: manipulation;
  cursor: pointer;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
  border: 1px solid transparent;
  text-transform: uppercase;
  -webkit-border-radius: 0;
  -moz-border-radius: 0;
  border-radius: 0;
  -webkit-transition: all 0.3s;
  -moz-transition: all 0.3s;
  -ms-transition: all 0.3s;
  -o-transition: all 0.3s;
  transition: all 0.3s;
}

.btn-dark {
  background: #555;
  color: #fff;
}

.btn-dark:hover, .btn-dark:focus {
  background: #373737;
  border-color: #373737;
  color: #fff;
}

.btn-dark {
  background: #555;
  color: #fff;
}

.btn-dark:hover, .btn-dark:focus {
  background: #373737;
  border-color: #373737;
  color: #fff;
}

.btn2 {
  display: inline-block;
  padding: 0 30px;
  font-size: 15px;
  font-weight: 400;
  background: transparent;
  text-align: center;
  white-space: nowrap;
  vertical-align: middle;
  -ms-touch-action: manipulation;
  touch-action: manipulation;
  cursor: pointer;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
  border: 1px solid transparent;
  text-transform: uppercase;
  -webkit-border-radius: 0;
  -moz-border-radius: 0;
  border-radius: 0;
  -webkit-transition: all 0.3s;
  -moz-transition: all 0.3s;
  -ms-transition: all 0.3s;
  -o-transition: all 0.3s;
  transition: all 0.3s;
}

.btn-gray {
background: #555;
color: #fff;
}

/* reset */

* {
  list-style: none;
  text-decoration: none;
  padding: 0;
  margin: 0;
  box-sizing: border-box;
}
.clearfix:after {
  content: '';
  display: block;
  clear: both;
}
.container {
  width: 1100px;
  margin: 0 auto;
}
.blind {
  position: absolute;
  overflow: hidden;
  clip: rect(0 0 0 0);
  margin: -1px;
  width: 1px;
  height: 1px;
}

</style>
</head>
<body>

<c:import url="/WEB-INF/views/common/menubar.jsp" />
<hr>
<br>
<h2 align="center">${review.user_id} 님의 후기</h2> 
<section class="review">
<div id="review-list" align="center">
	<div class="container">
<table align="center" class="review-table">
<tbody>
	<tr><th scope="col" class="th-title">제 목</th><td>${review.review_title}</td></tr>
	 <tr><th scope="col" class="th-title">평 점</th>
		 <td class="star">
		 	<c:if test="${review.review_score eq 0}">&nbsp;</c:if>
			<c:if test="${review.review_score eq 1}">★</c:if>
			<c:if test="${review.review_score eq 2}">★★</c:if>
			<c:if test="${review.review_score eq 3}">★★★</c:if>
			<c:if test="${review.review_score eq 4}">★★★★</c:if>
			<c:if test="${review.review_score eq 5}">★★★★★</c:if>
		</td>
	 </tr>
	<tr><th scope="col" class="th-title">작성자</th><td>${review.user_id}</td></tr>
	<tr><th scope="col" class="th-date">날 짜</th><td>${review.created_at}</td>
	</tr>
	<tr><th scope="col" class="th-title">내 용</th><td>${review.review_content}</td></tr>
</tbody>
</table>
<br>
<div align="center">
<button class="btn2 btn-gray" onclick="javascript:history.go(-1);">목 록</button> 
		&nbsp; &nbsp;
		<!-- 본인이 작성한 리뷰일 때는 수정과 삭제 기능 제공 -->
		<c:if test="${requestScope.review.user_id eq sessionScope.loginUsers.user_id}">
			<c:url var="rupdate" value="/rupdateView.do">
				<c:param name="review_id" value="${review.review_id}" />
				<c:param name="page" value="${currentPage}" />
			</c:url>
			<button class="btn2 btn-gray" onclick="javascript:location.href='${rupdate}';">수정페이지로 이동</button> 
			&nbsp; &nbsp;
			<c:url var="rdelete" value="/rdelete.do">
				<c:param name="review_id" value="${review.review_id}" />
			</c:url>
			<button class="btn2 btn-gray" onclick="if(confirm('정말로 삭제하시겠습니까?'))javascript:location.href='${rdelete}';">글 삭제</button>
		</c:if>
</div>
</div>
</div>
</section>
<br>
<hr>
<footer>
<c:import url="/WEB-INF/views/common/footer.jsp" />
</footer>
</body>

</html>