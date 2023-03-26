<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>dionysos</title>
</head>
<body>
<!-- <h1>spring dionysos project</h1> -->
<!-- 첫페이지 접속 요청이 오면, 실제 보여질 메인 페이지를 포워딩함 -->
<%-- <%
     RequestDispatcher view = request.getRequestDispatcher("main.do");
     view.forward(request, response);
%> --%>
<jsp:forward page="main.do" />  <!-- 뒤에 / 붙여서 뒤에 닫기 태그 없게 함 -->
</body>
</html>