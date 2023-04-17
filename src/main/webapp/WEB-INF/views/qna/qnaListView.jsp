<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="listCount" value="${requestScope.paging.listCount}" />
<c:set var="currentPage" value="${ requestScope.paging.currentPage }" />
<c:set var="url" value="qlist.do"></c:set>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/resources/js/jquery-3.6.3.min.js"></script>
<script>

	function showWriteForm() {
		//게시 원글 쓰기 페이지로 이동 처리
		location.href = "${pageContext.servletContext.contextPath}/qwform.do";
	}
	
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
		}
		if ($('input[name=item]').eq(1).is(':checked')) {
			$('#titleDiv').css('display', 'none');
			$('#writerDiv').css('display', 'block');
		}
	}

</script>
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
            <h1 align="center">1:1문의</h1>
        </div>
    </div>
<!-- 검색 항목 영역 -->
<center>
    <div id="board-search">
        <div class="container">
        <input type="radio" name="item" value="title" checked> 제목
		&nbsp; &nbsp; <input type="radio" name="item" value="user_id">작성자
            <div class="search-window">
            <div id="titleDiv">
                <form action="qsearch.do" method="post">
                	<input type="hidden" name="action" value="title">
                    <div class="search-wrap">	
                        <label for="search" class="blind"></label>
                        <input id="search" type="search" name="keyword" placeholder="검색어를 입력하세요.">
                        <button type="submit" class="btn btn-dark">검색</button> 
                        <br>
                    </div>
                </form>
             </div>
             <div id="writerDiv">
             	<form action="qsearch.do" method="post">
             		<input type="hidden" name="action" value="user_id">
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
    </div>
</center>
<br>
<!-- 목록 출력 영역 -->
<div id="board-list">
	<div class="container">
<div align="right">
	<c:if test="${!empty sessionScope.loginUsers}">
		<button class="btn2 btn-gray" onclick="showWriteForm();">글쓰기</button>
	</c:if>
</div>
<table align="center" class="board-table">
<!-- 로그인한 회원만 게시글 등록(글쓰기) 버튼이 보이게 함 -->
<br>
<thead>
	<tr>
		<th scope="col" class="th-num">번호</th>
		<th scope="col" class="th-title">문의유형</th>
		<th scope="col" class="th-title">제목</th>
		<th scope="col" class="th-title">작성자</th>
		<th scope="col" class="th-date">문의상태</th>
		<th scope="col" class="th-date">날짜</th>
	</tr>
	</thead>
<tbody>
	<c:forEach items="${requestScope.list}" var="q">
			<tr align="center">
				<td>${q.qna_no}</td>
				<!-- 게시글 제목 클릭시 해당 게시글의 상세보기로 넘어가게 함 -->
				<c:url var="qdt" value="/qdetail.do">
					<c:param name="qna_no" value="${q.qna_no}" />
					<c:param name="page" value="${currentPage}" />
				</c:url>
				<td>
				<c:if test="${q.inquiry_type == 0}">상품문의</c:if>
				<c:if test="${q.inquiry_type == 1}">픽업문의</c:if>
				<c:if test="${q.inquiry_type == 2}">교환문의</c:if>
				<c:if test="${q.inquiry_type == 3}">환불문의</c:if>
				<c:if test="${q.inquiry_type == 4}">기타문의</c:if>
				</td>
				
				<td align="center">
					<!-- 제목 글자 앞에 댓글과 대댓글 표시 기호 붙임, 들여쓰기 처리 : 원글과 구분지음 --> 
					<c:if test="${q.qna_lev eq 2}">&nbsp; ┗ Re : </c:if>
					<c:if test="${!empty sessionScope.loginUsers}">
						<a href="${qdt}">${q.title}</a>
					</c:if>
					<!-- 비회원 또는 내 글이 아니면 제목만 볼 수 있음 -->
					<c:if test="${empty sessionScope.loginUsers}">
						${q.title}
					</c:if>
				</td>
				<td>${q.user_id}</td>
				<td><c:if test="${q.inquiry_state == 0 && q.qna_lev eq 1}">처리 중</c:if> 
					<c:if test="${q.inquiry_state == 1 && q.qna_lev eq 1}">처리 완료</c:if>
				</td>
				<td>
					<c:if test="${q.qna_lev == 2}">
						<fmt:formatDate value="${q.answered_at}" pattern="yyyy-MM-dd" />
					</c:if>
					<c:if test="${q.qna_lev == 1}">
						<fmt:formatDate value="${q.created_at}" pattern="yyyy-MM-dd" />
					</c:if>
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<!-- 목록 출력 영역 -->
<br>
<div align="left">
<button class="btn2 btn-gray" onclick="javascript:location.href='${pageContext.servletContext.contextPath}/qlist.do';">목록</button>
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




