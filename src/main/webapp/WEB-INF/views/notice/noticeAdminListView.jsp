<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="listCount" value="${requestScope.paging.listCount}" />
<c:set var="currentPage" value="${ requestScope.paging.currentPage }" />
<c:set var="url" value="nplist.do"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin - noticeList</title>
<script type="text/javascript"
	src="${pageContext.servletContext.contextPath}/resources/js/jquery-3.6.3.min.js"></script>
<script type="text/javascript">
$(function(){
	showDiv();
	
	$('input[name=item]').on('change', function(){
		showDiv();
	});
	
});  //document.ready

function showDiv(){
	if($('input[name=item]').eq(0).is(':checked')){
		$('#titleDiv').css('display', 'block');
		$('#dateDiv').css('display', 'none');
	}
	if($('input[name=item]').eq(1).is(':checked')){
		$('#titleDiv').css('display', 'none');
		$('#dateDiv').css('display', 'block');
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
												<h2>Notice List</h2>
												<p>Dionysos <span class="bread-ntd">Admin Page</span></p>
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
     
        <div class="product-status mg-b-30">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="product-status-wrap">
                            <h4>공지사항 관리</h4>                                   
                            <div class="add-product">
 <!-- 검색 항목 영역 -->
 <div style="color:white;" align="center">
	<input type="radio" name="item" value="title" checked> 제목
	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
	<input type="radio" name="item" value="date"> 날짜
</div>
<div align="center" id="titleDiv">
	<form action="nsearchTitle.do" method="post">
		<input type="search" name="title" placeholder="검색어를 입력하세요.">&nbsp;
		<input type="submit" value="검색">
	</form>
</div>
<div align="center" id="dateDiv">
	<form action="nsearchDate.do" method="post">
		<label>
			<input type="date" name="begin"> ~ 
			<input type="date" name="end">
		</label>
		<input type="submit" value="검색">
	</form>
</div>
<button align="right" onclick="javascript:location.href='${pageContext.servletContext.contextPath}/nplist.do';">목록</button>
   <a href="javascript:location.href='${pageContext.servletContext.contextPath}/nwform.do'">글 등록하기</a>
</div>
<h4 align="left">${listCount} 개</h4>
<table>
                                <tr>
                                    <th>번호</th>
									<th>제목</th>
									<th>작성자</th>
									<th>날짜</th>
									<th>조회수</th>
                                </tr>
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
							</table>                            
<!-- 페이징 처리 -->
<c:import url="/WEB-INF/views/admin/paging.jsp" />     
                        </div>
                    </div>
                </div>
            </div>
        </div>

    <!-- jquery
		============================================ -->
    <script src="${pageContext.servletContext.contextPath}/resources/js/admin/vendor/jquery-1.12.4.min.js"></script>
    <!-- bootstrap JS
		============================================ -->
    <script src="${pageContext.servletContext.contextPath}/resources/js/admin/bootstrap.min.js"></script>
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
    <!-- plugins JS
		============================================ -->
    <script src="${pageContext.servletContext.contextPath}/resources/js/admin/plugins.js"></script>
    <!-- main JS
		============================================ -->
    <script src="${pageContext.servletContext.contextPath}/resources/js/admin/main.js"></script>



</body>

</html>