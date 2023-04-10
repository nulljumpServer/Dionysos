<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<c:set var="currentPage" value="${requestScope.paging.currentPage}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 작성</title>
<script type="text/javascript"
	src="${pageContext.servletContext.contextPath}/resources/js/jquery-3.6.3.min.js"></script>  
   
<style type="text/css">
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
	.star-rating {
  display: flex;
  flex-direction: row-reverse;
  font-size: 2.25rem;
  line-height: 2.5rem;
  justify-content: space-around;
  padding: 0 0.2em;
  width: 5em;
}
 
.star-rating input {
  display: none;
}
 
.star-rating label {
  -webkit-text-fill-color: transparent; /* Will override color (regardless of order) */
  -webkit-text-stroke-width: 2.3px;
  -webkit-text-stroke-color: #2b2a29;
  cursor: pointer;
}
 
.star-rating :checked ~ label {
  -webkit-text-fill-color: #ad393a;
}
 
.star-rating label:hover,
.star-rating label:hover ~ label {
  -webkit-text-fill-color: #ad393a;
}
</style>
</head>
<body>
<c:import url="/WEB-INF/views/common/menubar.jsp" />

<section class="review">
  <div class="page-title">
        <div class="container">
            <h1 align="center">${review.user_id }님의 ${ review.review_id } 리뷰 수정페이지</h1>
        </div>
    </div>
<!-- 원글 수정 폼 -->
<div id="review-list" align="center">
	<div class="container">
<form action="rupdate.do" method="post" enctype="multipart/form-data">
<input type="hidden" name="review_id" value="${ review.review_id }">
	<input type="hidden" name="page" value="${ currentPage }">
<table align="center" class="review-table">
<tbody>
	<tr><th scope="col" class="th-title">제 목</th>
			<td><input type="text" name="review_title" value="${review.review_title}"></td>
	</tr>
	<tr><th>별 점</th>
		<td><div class="star-ratings" name="review_score">
		<div class="star-rating space-x-4 mx-auto">
		<input type="radio" id="5-stars" name="review_score" value="5" v-model="ratings"/>
		<label for="5-stars" class="star pr-4">★</label>
		<input type="radio" id="4-stars" name="review_score" value="4" v-model="ratings"/>
		<label for="4-stars" class="star">★</label>
		<input type="radio" id="3-stars" name="review_score" value="3" v-model="ratings"/>
		<label for="3-stars" class="star">★</label>
		<input type="radio" id="2-stars" name="review_score" value="2" v-model="ratings"/>
		<label for="2-stars" class="star">★</label>
		<input type="radio" id="1-star" name="review_score" value="1" v-model="ratings" />
		<label for="1-star" class="star">★</label>
		</div>
		</td>
	</tr>
	<div>
		<input type="hidden" name="product_id" value="${review.product_id}" readonly>
	</div>
	<tr>
		<th scope="col" class="th-title">작성자</th>
			<td><input type="text" name="user_id" value="${ sessionScope.loginUsers.user_id }" readonly></td>
	</tr>
	<tr>
		<th scope="col" class="th-title">내 용</th>
			<td><textarea name="review_content" rows="5" cols="60">${review.review_content}</textarea></td>
	</tr>
</table>
<br>
<div align="center">
	<button class="btn2 btn-gray" onclick="javascript:history.go(-1); return false;">이전 페이지로 이동</button>
	&nbsp;
	<input class="btn2 btn-gray" type="submit" value="수정하기"> &nbsp;
	<input class="btn2 btn-gray" type="reset" value="수정취소">
</div>
</form>
 </div>
</div>
</section>
<br>
<hr>
<%-- <c:import url="/WEB-INF/views/common/footer.jsp" /> --%>

</body>
</html>