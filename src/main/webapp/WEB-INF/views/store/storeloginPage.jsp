<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>first</title>
<style type="text/css">
.pc_hidden {
	display: block !important;
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
	color: #ac8b68;
}

.btn_txt.btn_black {
	background: #ac8b68;
	border: 1px solid #ac8b68;
	color: #fff;
}

.btn_area {
	text-align: center;
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
	margin-top: 30px;
}

.btn_area .btn_txt {
	display: inline-block;
	width: 120px; /* 수정 */
	height: 50px;
	margin-right: 10px;
}

.btn_area .btn_txt:last-child {
	margin-right: 0;
}

.find_text {
	display: inline-block;
	text-decoration: none;
	color: #888;
	margin-right: 10px;
}

.h0 {
	font-size: 32px;
	font-weight: 500;
}

.h1 {
	font-size: 24px;
	font-weight: 500;
}

.h2 {
	font-size: 20px;
	font-weight: 500;
}

.content {
	padding: 40px 20px;
	max-width: 1200px;
	margin: 0 auto;
}

.pc_hidden {
	display: none !important;
}

.content.login_page {
	display: table;
	padding: 0 20px;
	width: 100vh;
	height: 100vh;
	background: url(resources/images/users/bg_6.jpg) center no-repeat;
	background-size: 100% 100%;
}

.login_page .login_area {
	display: table-cell;
	vertical-align: middle;
}

.login_page .login_area .txt_area .inner_box {
	padding: 20px;
	box-sizing: border-box;
	background: rgba(255, 255, 255, .8);
	border: 1px solid #ac8b68;
	text-size: 30;
}

.login_page .login_area .txt_area .inner_box h2.logo {
	margin: 0 auto;
	width: 200px;
}

.login_page .login_area .txt_area .inner_box h2.logo a {
	display: block;
}

.login_page .login_area .txt_area .inner_box h2.logo a img {
	width: 100%;
}

.login_page .login_area .store_login_btns {
	display: flex;
	justify-content: center;
	margin-bottom: 30px;
}

.login_page .login_area .store_login_btns button {
	margin-right: 10px;
	width: 120px; /* 수정 */
	height: 50px;
}
</style>

</head>
<body>
    <div class="content login_page">
        <div class="login_area">
            <div class="txt_area">
                <div class="inner_box" id="loginForm">
                    <h2 class="logo">
                        <a href="#"><img src="resources/images/logo.jpg"></a>
                    </h2>
                    <div class="store_login_btns">
                        <button class="btn_txt" onclick="location.href='loginPage.do'">일반 로그인</button>
                        <button class="btn_txt" onclick="location.href='storeloginPage.do'">매장 로그인</button>
                    </div>
                    <div class="btn_area col2">
                        <form action="storelogin.do" method="post" class="input_row">
                             <input type="text" name="store_id" id="store_id" class="pos" placeholder="매장 아이디" title="아이디" style="width: 250px; height: 50px;">
                            <br><br>
                            <input type="password" name="password" class="pos" placeholder="매장 비밀번호" title="비밀번호" style="width: 250px; height: 50px;">
                            <br><br>
                            <input type="submit" value="매장 로그인" class="btn_txt btn_black">
                             <br>
                             
                             <div class="btn_area">
                            
                            <a href="${pageContext.servletContext.contextPath}/storeenrollPage.do" class="find_text">회원가입</a>
                        </div>
                        </form>
                      
                    </div>
                </div>
            </div>
        </div>
    </div>
    <hr>
</body>
</html>