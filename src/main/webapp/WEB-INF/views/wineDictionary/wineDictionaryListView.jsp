<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>wineDictionary</title>
<script type="text/javascript"
	src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.3.min.js"></script>
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
  font-size: 30px;
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
  font-size: 14px;
}

.board-table {
  font-size: 15px;
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

</style>
</head>
<body>
<c:import url="/WEB-INF/views/common/menubar.jsp" />
<hr>
<br>
	<h1 align="center">와인사전</h1>
	<br>
	<hr>
    <center>
 <div id="board-search">
        <div class="container">
            <div class="search-window">
    <form action="wdsearchTitle.do" method="post">
    	<div class="search-wrap">	
            <label for="search" class="blind"></label>
            <input id="search" type="search" name="keyword" placeholder="검색할 포도품종을 입력하세요">
            <button type="submit" class="btn btn-dark">검색</button> 
            <br>
        </div>
<!--          <label>검색할 포도품종을 입력하세요 :
              <input type="search" name="keyword">
         </label>
         <input type="submit" value="검색"> -->
    </form>
          </div>
        </div>
    </div>
	<hr>
	<!-- 목록 출력 영역 -->
<div id="board-list">
	<div class="container">
	<table align="center" class="board-table">
	<thead>
		<tr align="center">
			<th>포도품종</th>
			<th>당도</th>
			<th>바디</th>
			<th>산도</th>
			<th>타닌</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${ requestScope.list }" var="wdt">
			<tr align="center">
				<c:url var="wddt" value="/wddetail.do">
                   <c:param name="wine" value="${wdt.grape_type}"></c:param>
               </c:url>
               <td><a href="${ wddt }">${wdt.grape_type}</a></td>
				<td><img src="resources/images/graph_${ wdt.sweetness }.png" width="80" height="80"></td>
				<td><img src="resources/images/graph_${ wdt.body }.png" width="80" height="80"></td>
				<td><img src="resources/images/graph_${ wdt.acidity }.png" width="80" height="80"></td>
				<td><img src="resources/images/graph_${ wdt.tannin }.png" width="80" height="80"></td>
			</tr>
		</c:forEach>
	</tbody>
	</table>
	</center>
<br>
<br>
<br>
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>