<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Hahmlet&display=swap');

@font-face{
 src:url("../fonts/Hahmlet-VariableFont_wght.woff");
 font-family : "Hahmlet";
}

* {
font-family: 'Hahmlet', serif;
}

.pc_hidden {
	display: block !important
}

.input_row {
	position: relative;
	display: block;
	height: 100%;
	padding: 16px 18px 15px;
	border-radius: 6px;
	box-sizing: border-box;
	text-align: center;
}

.btn_txt {
	display: block;
	width: 100%;
	height: 50px;
	line-height: 50px;
	border: 1px solid #ac8b68;
	border-radius: 4px;
	color: #ac8b68
}

.btn_txt.btn_black {
	background: #ac8b68;
	border: 1px solid #ac8b68;
	color: #fff
}

.btn_area {
	text-align: center
}

.btn_area.col2::after, .btn_area.col3::after {
	content: "";
	display: block;
	clear: both
}

.btn_area.col2 .btn_txt {
	float: left;
	width: 49%;
	margin-right: 2%
}

.btn_area.col3 .btn_txt {
	float: left;
	width: 32%;
	margin-right: 2%
}

.find_text {
	display: inline-block;
	text-decoration: none;
	color: #888;
	margin-right: 10px;
	font-size : 18px;
}

.btn_area.col2 .btn_txt:last-child, .btn_area.col3 .btn_txt:last-child {
	margin-right: 0
}

.btn_txt:disabled {
	background: #999 !important;
	border: 1px solid #999 !important;
	cursor: default
}

.h0 {
	font-size: 32px;
	font-weight: 500
}

.h1 {
	font-size: 24px;
	font-weight: 500
}

.h2 {
	font-size: 20px;
	font-weight: 500
}

.content {
	padding: 40px 20px
}

.pc_hidden {
	display: none !important
}

.btn_txt {
	display: inline-block;
	width: 180px
}

.btn_area.col2 .btn_txt, .btn_area.col3 .btn_txt {
	float: none;
	width: 260px;
	margin-right: 7px
}

.content {
	max-width: 1200px;
	margin: 0 auto;
	padding: 65px 60px 60px
}

.btn_txt {
	text-align: center
}

.content.minigame_page {
	display: table;
	padding: 0 20px;
	width: 100vh;
	height: 100vh;
}

.minigame_page .minigame_area {
	display: table-cell;
	vertical-align: middle
}

.minigame_page .minigame_area .txt_area .inner_box {
	padding: 20px;
	box-sizing: border-box;
	background: rgba(255, 255, 255, .8);
	border: 1px solid #ac8b68;
	text-size: 30;
}

.minigame_page .minigame_area .txt_area .inner_box h2.logo {
	margin: 0 auto;
	width: 200px
}

.minigame_page .minigame_area .txt_area .inner_box h2.logo a {
	display: block
}

.minigame_page .minigame_area .txt_area .inner_box h2.logo a img {
	width: 100%
}

.minigame_page .minigame_area .txt_area .inner_box .btn_area {
	margin-top: 30px
}

.minigame_page .minigame_area .txt_area .inner_box .btn_area .btn_txt.btn_black
	{
	background: #ac8b68
}

.minigame_page .minigame_area .txt_area .inner_box .btn_area .btn_txt {
	background: #fff
}

.btn2 {
  display: inline-block;
  padding: 80px 80px;
  font-size: 30px;
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
background: #ac8b68;
color: #555;
}
</style>
</head>
<body>
<c:import url="/WEB-INF/views/common/menubar.jsp" />
<hr>
<br>
<div class="content myinfo_page">
		<div class="myinfo_area">
			<div class="txt_area">
				<div class="inner_box" id="myinfoForm">
					<h1 align="center">
						Mini Game
					</h2>
					<br>
					<div class="btn_area col2">
					
					<button class="btn2 btn-gray" onclick="location.href='${ pageContext.servletContext.contextPath }/moveRouletteGame.do'">룰렛 게임</button>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button class="btn2 btn-gray" onclick="location.href='${ pageContext.servletContext.contextPath }/moveDrawGame.do'">뽑기 게임</button>
					
					</div>
				</div>
				<br>		
				<div align="center">
				<a href="main.do" class="find_text">시작페이지로 이동</a>
				</div>
			</div>
		</div>
	</div>

<hr>
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>