<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="listCount" value="${requestScope.paging.listCount}" />
<c:set var="currentPage" value="${ requestScope.paging.currentPage }" />
<c:set var="url" value="nplist.do"></c:set>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/resources/js/jquery-3.6.3.min.js"></script>

<style>
@import url('https://fonts.googleapis.com/css2?family=Hahmlet&display=swap');

@font-face{
 src:url("../fonts/Hahmlet-VariableFont_wght.woff");
 font-family : "Hahmlet";
}

* {
font-family: 'Hahmlet', serif;
} 

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
  top: 2;
  bottom: 0;
  width: 70px;
  height: 40px;
  padding: 0;
  font-size: 16px;
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

</style>

</head>
<body>
<!-- 상대경로로 대상 파일의 위치를 지정한 경우 -->
<c:import url="../common/menubar.jsp" />
<section class="notice">
  <div class="page-title">
        <div class="container">
            <h1 align="center">공지사항</h1>
        </div>
    </div>
<!-- 검색 항목 영역 -->
<center>
    <div id="board-search">
        <div class="container">
            <div class="search-window">
                <form action="nsearch.do" method="post">
                	<input type="hidden" name="action" value="title">
                    <div class="search-wrap">	
                        <label for="search" class="blind"></label>
                        <input id="search" type="search" name="keyword" placeholder="검색어를 입력하세요.">
                        <button type="submit" class="btn btn-dark">검색</button> 
                        <br>
                    </div>
                </form>
            </div>
        </div>
    </div>
</center>

<!-- 목록 출력 영역 -->
<div id="board-list">
	<div class="container">
<table align="center" class="board-table">
<thead>
	<tr>
		<th scope="col" class="th-num">번호</th>
		<th scope="col" class="th-title">제목</th>
		<th scope="col" class="th-title">작성자</th>
		<th scope="col" class="th-date">날짜</th>
		<th scope="col" class="th-date">조회수</th>
	</tr>
	</thead>
<tbody>
	<c:forEach items="${requestScope.list}" var="n">
		<tr align="center">
			<td align="center">${n.notice_no}</td>
			<!-- 공지 제목 클릭시 해당 공지의 상세보기로 넘어가게 함 -->
			<c:url var="ndt" value="/ndetail.do">
				<c:param name="notice_no" value="${n.notice_no}" />
			</c:url>
			<td align="center"><a href="${ndt}">${n.title}</a></td>
			<td>${n.user_id}</td>
			<td align="center">
				<fmt:formatDate value="${n.created_at}" pattern="yyyy-MM-dd" />
			</td>
			<td align="center">
				${n.read_count}
			</td>
		</tr>
	</c:forEach>
	</tbody>
</table>
<!-- 목록 출력 영역 -->
<br>
<div align="left">
<button class="btn2 btn-gray" onclick="javascript:location.href='${pageContext.servletContext.contextPath}/nplist.do';">목록</button>
 </div>
 </div>
</div>
</section>
<!-- 페이징 처리 -->
<c:import url="/WEB-INF/views/common/paging.jsp" />
<hr>
<c:import url="/WEB-INF/views/common/footer.jsp"></c:import>
</body>
</html>




