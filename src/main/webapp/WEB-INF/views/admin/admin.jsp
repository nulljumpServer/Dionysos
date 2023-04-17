<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="listCount" value="${requestScope.paging.listCount}" />
<c:set var="currentPage" value="${ requestScope.paging.currentPage }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Dionysos - ADMIN</title>
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
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- favicon
		============================================ -->
    <link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">
    <!-- Google Fonts
		============================================ -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,700,900" rel="stylesheet">
    <!-- Bootstrap CSS
		============================================ -->
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/admin/bootstrap.min.css">
    <!-- Bootstrap CSS
		============================================ -->
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/admin/font-awesome.min.css">
	<!-- nalika Icon CSS
		============================================ -->
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/admin/nalika-icon.css">
    <!-- owl.carousel CSS
		============================================ -->
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/admin/owl.carousel.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/admin/owl.theme.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/admin/owl.transitions.css">
    <!-- animate CSS
		============================================ -->
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/admin/animate.css">
    <!-- normalize CSS
		============================================ -->
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/admin/normalize.css">
    <!-- meanmenu icon CSS
		============================================ -->
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/admin/meanmenu.min.css">
    <!-- main CSS
		============================================ -->
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/admin/main.css">
    <!-- morrisjs CSS
		============================================ -->
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/morrisjs/morris.css">
    <!-- mCustomScrollbar CSS
		============================================ -->
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/admin/scrollbar/jquery.mCustomScrollbar.min.css">
    <!-- metisMenu CSS
		============================================ -->
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/admin/metisMenu/metisMenu.min.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/admin/metisMenu/metisMenu-vertical.css">
    <!-- calendar CSS
		============================================ -->
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/admin/calendar/fullcalendar.min.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/admin/calendar/fullcalendar.print.min.css">
    <!-- style CSS
		============================================ -->
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/admin/style.css">
    <!-- responsive CSS
		============================================ -->
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/admin/responsive.css">
    <!-- modernizr JS
		============================================ -->
    <script src="${pageContext.servletContext.contextPath}/resources/js/admin/vendor/modernizr-2.8.3.min.js"></script>
    
<script type="text/javascript"
	src="${pageContext.servletContext.contextPath}/resources/js/jquery-3.6.3.min.js"></script>

<script>
$(function(){
	//최근 공지글 5개 출력되게 함 : ajax 사용
	//body table(#newnotice)에 출력시킬 문장에 대한 문자열 준비
	var values = $('#newqna').html();
	console.log("values : " + values);
	
	$.ajax({
		url: "qtop5.do",
		type: "post",
		dataType: "json",
		success: function(data){
			console.log("success : " + data);   //Object 로 출력
			
			//받은 object => string 으로 바꿈
			var jsonStr = JSON.stringify(data);
			//string => json 객체로 바꿈
			var json = JSON.parse(jsonStr);
			
			//for in 문 : 인덱스 변수를 0에서 자동 1씩 증가시키는 루프문
			for(var i in json.list){
				values += "<tr><td>" + json.list[i].qna_no
						+ "</td><td><a href='qdetail.do?qna_no="
						+ json.list[i].qna_no + "'>" 
						+ decodeURIComponent(json.list[i].title).replace(/\+/gi, " ")
						+"</a></td><td>"
						+ json.list[i].user_id
						+ "</td><td>" + json.list[i].created_at
						+"</td></tr>";
			}   //for in
			
			$('#newqna').html(values);
		},
		error: function(jqXHR, textStatus, errorThrown){
			console.log("qtop5.do error : " + jqXHR + ", " + textStatus + ", " + errorThrown);
		}
	});   //qtop5 ajax
});
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
												<h2>Dionysos - ADMIN</h2>
												<p>Dionysos <span class="bread-ntd">관리자 페이지</span></p>
											</div>
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
<!-- 최근 등록 신규 공지글 5개 조회 출력 : ajax -->
<div style="color:white" align="center">
		<h4>새로 접수된 문의</h4>
		<table id="newqna" align="center">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>날짜</th>
			</tr>
		</table>
</div>
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