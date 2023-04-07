<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 완료 페이지</title>
</head>
<body>
	<div>
		<header>
			<h2>${order_seq_num}</h2>
		</header>
		<hr>
		<h2>주문이 완료되었습니다</h2>
		<hr>
		<table style="width: 50%; margin: auto; border-bottom: 1px solid #D5D5D5;">
			<c:url var="callMyInfo" value="/myinfo.do">
				<c:param name="user_id" value="${loginUsers.user_id}"></c:param>
			</c:url>
			<a href="${callMyInfo}">My Page</a>상세페이지로 이동 </a>
			<a href="main.do" class="move_text">메인페이지로 이동</a>
		</table>
	</div>
</body>
</html>