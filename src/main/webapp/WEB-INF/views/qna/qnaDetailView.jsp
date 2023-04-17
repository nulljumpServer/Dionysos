<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="qna_no" value="${requestScope.qna.qna_no}" />
<c:set var="currentPage" value="${requestScope.paging.currentPage}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
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
  top: 0;
  bottom: 0;
  width: 70px;
  height: 39px;
  padding: 0;
  font-size: 16px;
}

.board-table {
  font-size: 13px;
  width: 60%;
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
<div id="board-list" align="center">
	<div class="container">
<table align="center" class="board-table">
<tbody>
	<tr><th scope="col" class="th-title">제목</th><td>${qna.title}</td></tr>
	<tr><th scope="col" class="th-title">작성자</th><td>${qna.user_id}</td></tr>
	<tr><th scope="col" class="th-date">날짜</th>
		<td><fmt:formatDate value="${qna.created_at}" type="date" pattern="yyyy-MM-dd"/></td>
	</tr>
	<tr><th scope="col" class="th-date">문의유형</th>
		<td>
			<c:if test="${qna.inquiry_type == 0}">상품문의</c:if>
			<c:if test="${qna.inquiry_type == 1}">픽업문의</c:if>
			<c:if test="${qna.inquiry_type == 2}">교환문의</c:if>
			<c:if test="${qna.inquiry_type == 3}">환불문의</c:if>
			<c:if test="${qna.inquiry_type == 4}">기타문의</c:if>
		</td>
	</tr>
	<tr><th scope="col" class="th-date">첨부파일</th>
		<td>
			<!-- 첨부파일이 있다면 파일명 클릭시 다운로드 실행 처리 -->
			<c:if test="${!empty qna.qna_original_filename}">
				<c:url var="qfd" value="qfdown.do">
					<c:param name="ofile" value="${qna.qna_original_filename}" />
					<c:param name="rfile" value="${qna.qna_rename_filename}" />
				</c:url>
				<a href="${qfd}">${qna.qna_original_filename}</a>
			</c:if>
			<!-- 첨부파일이 없다면 공백 처리 -->
			<c:if test="${empty qna.qna_original_filename}">
				&nbsp;
			</c:if>
		</td>
	</tr>
	<tr><th scope="col" class="th-title">내용</th><td>${qna.content}</td></tr>
</tbody>
</table>
<br>
<div align="center">
<button class="btn2 btn-gray" onclick="javascript:location.href='qlist.do';">목록</button>
		&nbsp; &nbsp;
		<!-- 본인이 등록한 게시글일 때는 수정과 삭제 기능 제공 -->
		<c:if test="${sessionScope.loginUsers.user_id eq qna.user_id}">
			<c:url var="qup" value="/qupview.do">
				<c:param name="qna_no" value="${qna.qna_no}" />
			</c:url>
			<button class="btn2 btn-gray" onclick="javascript:location.href='${qup}';">수정페이지로 이동</button>
		</c:if>
			
		&nbsp; &nbsp;
		<c:if test="${sessionScope.loginUsers.user_id eq qna.user_id}">
			<c:url var="qdel" value="/qdel.do">
				<c:param name="qna_no" value="${qna.qna_no}" />
				<c:param name="qna_lev" value="${qna.qna_lev}" />
				<c:param name="qna_rename_filename" value="${qna.qna_rename_filename}" />
			</c:url>
			<button class="btn2 btn-gray" onclick="if(confirm('정말로 삭제하시겠습니까?'))javascript:location.href='${qdel}';">글삭제</button>
		</c:if>
			
</div>
 </div>
</div>
</section>
<br>
<hr>
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>





