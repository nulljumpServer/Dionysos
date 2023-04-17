<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>first</title>
<style type="text/css">
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
  width: 40%;
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
	color: #888
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

.content.myinfo_page {
	display: table;
	padding: 0 20px;
	width: 100vh;
	height: 100vh;
}

.myinfo_page .myinfo_area {
	display: table-cell;
	vertical-align: middle
}

.myinfo_page .myinfo_area .txt_area .inner_box {
	padding: 20px;
	box-sizing: border-box;
	background: rgba(255, 255, 255, .8);
	border: 1px solid #ac8b68;
	text-size: 30;
}

.myinfo_page .myinfo_area .txt_area .inner_box h2.logo {
	margin: 0 auto;
	width: 200px
}

.myinfo_page .myinfo_area .txt_area .inner_box h2.logo a {
	display: block
}

.myinfo_page .myinfo_area .txt_area .inner_box h2.logo a img {
	width: 100%
}

.myinfo_page .myinfo_area .txt_area .inner_box .btn_area {
	margin-top: 30px
}

.myinfo_page .myinfo_area .txt_area .inner_box .btn_area .btn_txt.btn_black
	{
	background: #ac8b68
}

.myinfo_page .myinfo_area .txt_area .inner_box .btn_area .btn_txt {
	background: #fff
}

.btn2 {
  display: inline-block;
  padding: 0 30px;
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
	<div class="content myinfo_page">
		<div class="myinfo_area">
			<div class="txt_area">
				<div class="inner_box" id="myinfoForm">
					<h1 align="center">
						MY INFORMATION
					</h2>
					<div class="btn_area col2">
					<form method="post" class="input_row">
					<table align="center" class="board-table">
						<tr><th scope="col" class="th-title">이름</th><td>${users.name}</td></tr>
						<tr><th scope="col" class="th-title">아이디</th><td>${users.user_id}</td></tr>	
						<tr><th scope="col" class="th-date">생일</th>
							<td><fmt:formatDate value="${users.birthday}" type="date" pattern="yyyy-MM-dd"/></td>
						</tr>
						<tr><th scope="col" class="th-title">연락처</th><td>${users.phone}</td></tr>
						<tr><th scope="col" class="th-title">이메일 주소</th><td>${users.email}</td></tr>
					</table>
					</form>
						<c:url var="moveup" value="/moveup.do">
							<c:param name="user_id" value="${ users.user_id }" />
						</c:url>
						<a href="${ moveup }" class="find_text">수정페이지로 이동</a> &nbsp; &nbsp; &nbsp;
						<c:url var="mdel" value="/mdel.do">
							<c:param name="user_id" value="${ users.user_id }" />
						</c:url>
						<a href="${ mdel }" class="find_text">탈퇴하기</a> &nbsp; &nbsp; &nbsp;
						<a href="main.do" class="find_text">시작페이지로 이동</a>	
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="mypage_container">
		<div class="mypage_contents">

		</div>
	</div>
</body>
</html>