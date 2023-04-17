<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="listCount" value="${requestScope.paging.listCount}" />
<c:set var="currentPage" value="${ requestScope.paging.currentPage }" />
<c:set var="url" value="qlist.do"></c:set>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 리뷰 관리</title>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/resources/js/jquery-3.6.3.min.js"></script>
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
<style>

table {
  border-collapse: collapse;
  border-spacing: 0;
}
section.notice {
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


.board-table {
  font-size: 13px;
  width: 100%;
  border-top: 1px solid #ccc;
  border-bottom: 1px solid #ccc;
}

.board-table a {
  color: #333;
  display: inline-block;
  line-height: 1.4;
  word-break: break-all;
  vertical-align: middle;
}
.board-table a:hover {
  text-decoration: underline;
}
.board-table th {
  text-align: center;
}

.board-table .th-num {
  width: 100px;
  text-align: center;
}

.board-table .th-date {
  width: 200px;
}

.board-table th, .board-table td {
  padding: 14px 0;
}

.board-table tbody td {
  border-top: 1px solid #e7e7e7;
  text-align: center;
}

.board-table tbody th {
  padding-left: 28px;
  padding-right: 14px;
  border-top: 1px solid #e7e7e7;
  text-align: left;
}

.board-table tbody th p{
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

.star {
	-webkit-text-fill-color: #ad393a
	}
.star{
	  font-size: 2.25rem;
	  line-height: 2.5rem;
	  padding: 0 0.2em;
	  text-align: left;
	  width: 5em;
}
</style>
</head>
<body>
<c:import url="/WEB-INF/views/common/menubar.jsp" />
<br>
<hr>

<section class="notice">
	<div class="page-title">
        <div class="container">
            <h1 align="center">내 리뷰 관리</h1>
        </div>
    </div>
    
 <div id="board-list">   
 	<div class="container">
<table align="center" class="board-table">
<br>
<thead>
	<tr align="center">
		<th>제품명</th>
		<th>제 목</th>
		<th>평 점</th>
		<th>작성일</th>
	</tr>
	</thead>
<tbody>
	<c:forEach items="${requestScope.list}" var="r">
			<tr align="center">
			 <td>${r.product_name}</td>
			 <td>
				<c:url var="rdetail" value="rdetail.do">
					<c:param name="review_id" value="${r.review_id}" /> 
				</c:url>
				<a href="${rdetail}">${r.review_title}</a>
			</td>
				<td class="star" align="left">
					<c:if test="${r.review_score eq 0}">&nbsp;</c:if>
					<c:if test="${r.review_score eq 1}">★</c:if>
					<c:if test="${r.review_score eq 2}">★★</c:if>
					<c:if test="${r.review_score eq 3}">★★★</c:if>
					<c:if test="${r.review_score eq 4}">★★★★</c:if>
					<c:if test="${r.review_score eq 5}">★★★★★</c:if>
				</td>
				<td>${r.created_at}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
 	</div>
 </div>
</section>

<br>
<hr>
<br>
<c:import url="/WEB-INF/views/review/pagingReview.jsp" />
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>