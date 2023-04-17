<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="currentPage" value="${requestScope.currentPage}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
</style>
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
												<h2>공지사항 관리 상세보기</h2>
											</div>
										</div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                        <div class="breadcomb-report">
											<button data-toggle="tooltip" data-placement="left" title="Download Report" class="btn"><i class="icon nalika-download"></i></button>
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
<section class="notice"> 
<div id="board-list" align="center">
	<div class="container">
                        <table class="board-table" style="color:white;">
	<tr>
		<th scope="col" class="th-title">제 목</th><td>${notice.title}</td>
	</tr>
	<tr>
		<th scope="col" class="th-title">작성자</th><td>${notice.user_id}</td>
	</tr>
	<tr>
		<th scope="col" class="th-title">날 짜</th><td>${notice.created_at}</td>
	</tr>
	<tr>
		<th scope="col" class="th-title">첨부파일</th>
		<td>
			<!-- 첨부파일이 있다면 파일명 클릭시 다운로드 실행되게 함 -->
			<c:if test="${!empty notice.notice_original_filename}">
			<c:url var="nfd" value="/nfdown.do">
				<c:param name="ofile" value="${notice.notice_original_filename}" />
				<c:param name="rfile" value="${notice.notice_rename_filename}" />
			</c:url>
				<a href="${nfd}">${notice.notice_original_filename}</a>
			</c:if>
			<!-- 첨부파일이 없다면 공백 출력 처리 -->
			<c:if test="${empty notice.notice_original_filename}">
				&nbsp;
			</c:if>
		</td>
	</tr>
	<tr>
		<th scope="col" class="th-title">내 용</th><td>${notice.content}</td>
	</tr>
	<tr>
		<th colspan="2">
			<button style="color:black;" onclick="javascript:history.go(-1);">목록</button>
			<!-- 수정 페이지로 이동 버튼 -->
			<c:url var="moveup" value="/nmoveup.do">
				<c:param name="notice_no" value="${notice.notice_no}" />
			</c:url>
			<button style="color:black;" onclick="javascript:location.href='${moveup}';">수정페이지로 이동</button>
			<!-- 삭제하기 버튼 -->
			<c:url var="ndel" value="/ndel.do">
				<c:param name="notice_no" value="${notice.notice_no}" />
				<c:param name="rfile" value="${notice.notice_rename_filename}" />
			</c:url>
			<button style="color:black;" onclick="if(confirm('정말로 삭제하시겠습니까?'))javascript:location.href='${ndel}';">공지글 삭제</button>
		</th>
	</tr>
</table>
 </div>
</div>
</section> 
        


    <!-- jquery
		============================================ -->
    <script src="${pageContext.servletContext.contextPath}/resources/js/admin/vendor/jquery-1.12.4.min.js"></script>
    <!-- bootstrap JS
		============================================ -->
    <script src="js/bootstrap.min.js"></script>
    <!-- wow JS
		============================================ -->
    <script src="${pageContext.servletContext.contextPath}/resources/js/admin/wow.min.js"></script>
    <!-- price-slider JS
		============================================ -->
    <script src="${pageContext.servletContext.contextPath}/resources/js/admin/jquery-price-slider.js"></script>
    <!-- meanmenu JS
		============================================ -->
    <script src="${pageContext.servletContext.contextPath}/resources/js/admin/jquery.meanmenu.js"></script>
    <!-- owl.carousel JS
		============================================ -->
    <script src="${pageContext.servletContext.contextPath}/resources/js/admin/owl.carousel.min.js"></script>
    <!-- sticky JS
		============================================ -->
    <script src="${pageContext.servletContext.contextPath}/resources/js/admin/jquery.sticky.js"></script>
    <!-- scrollUp JS
		============================================ -->
    <script src="${pageContext.servletContext.contextPath}/resources/js/admin/jquery.scrollUp.min.js"></script>
    <!-- mCustomScrollbar JS
		============================================ -->
    <script src="${pageContext.servletContext.contextPath}/resources/js/admin/scrollbar/jquery.mCustomScrollbar.concat.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/resources/js/admin/scrollbar/mCustomScrollbar-active.js"></script>
    <!-- metisMenu JS
		============================================ -->
    <script src="${pageContext.servletContext.contextPath}/resources/js/admin/metisMenu/metisMenu.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/resources/js/admin/metisMenu/metisMenu-active.js"></script>
    <!-- morrisjs JS
		============================================ -->
    <script src="${pageContext.servletContext.contextPath}/resources/js/admin/sparkline/jquery.sparkline.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/resources/js/admin/sparkline/jquery.charts-sparkline.js"></script>
    <!-- calendar JS
		============================================ -->
    <script src="${pageContext.servletContext.contextPath}/resources/js/admin/calendar/moment.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/resources/js/admin/calendar/fullcalendar.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/resources/js/admin/calendar/fullcalendar-active.js"></script>
    <!-- tab JS
		============================================ -->
    <script src="${pageContext.servletContext.contextPath}/resources/js/admin/tab.js"></script>
    <!-- plugins JS
		============================================ -->
    <script src="${pageContext.servletContext.contextPath}/resources/js/admin/plugins.js"></script>
    <!-- main JS
		============================================ -->
    <script src="${pageContext.servletContext.contextPath}/resources/js/admin/main.js"></script>
</body>

</html>