<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매장 정보</title>
</head>
<body>
<c:import url="/WEB-INF/views/store/menubar.jsp" />
	<h1 align="center">매장 정보</h1>
	<br>
	<table id="tbl" align="center" width="800" height="600" cellspacing="5"
		cellpadding="0" border="1">
		<tr>
			<th width="150">매장 이름</th>
			<td>${ requestScope.store.store_name }</td>
		</tr>
		<tr>
			<th width="150">아이디</th>
			<td>${ store.store_id }</td>
		</tr>
		<tr>
			<th width="150">사업자번호</th>
			<td>${ store.business_number }</td>
		</tr>
		<tr>
			<th width="150">매장주소지</th>
			<td>${ store.address }</td>
		</tr>
		<tr>
			<th width="150">전화번호</th>
			<td>${ store.phone }</td>
		</tr>
		<tr>
			<th width="150">매장매니저</th>
			<td>${ store.manager }</td>
		</tr>
		<tr>
			<th width="150">매장매니저 연락처</th>
			<td>${ store.manager_contact }</td>
		</tr>
		<tr>
			<th width="150">이메일</th>
			<td>${ store.email }</td>
		</tr>
		<tr>
			<th colspan="2"><c:url var="moveup" value="/moveup.do">
					<c:param name="store_id" value="${ store.store_id }" />
				</c:url> <a href="${ moveup }">수정페이지로 이동</a> &nbsp; <c:url var="mdel"
					value="/mdel.do">
					<c:param name="store_id" value="${ store.store_id }" />
				</c:url> <a href="${ mdel }">탈퇴하기</a> &nbsp; <a href="store.do">시작페이지로
					이동</a></th>
		</tr>
	</table>

</body>
</html>
