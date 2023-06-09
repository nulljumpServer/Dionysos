<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript"
	src="${pageContext.servletContext.contextPath}/resources/js/jquery-3.6.3.min.js"></script>
</head>
<body>
<h1>에러 페이지</h1>
<%-- 에러메세지 출력을 담당하는 페이지 
    page 지시자 태그에 isErrorPage="true" 라고 지정하면 
   jsp 내장객체인 exception 객체를 사용할 수 있게됨
--%>
<%-- 다른 jsp 페이지에서 발생된 에러가 넘어오는 경우 --%>
<c:if test="${ not empty exception }">
        <h2>jsp 페이지 오류 : ${ exception.message }</h2>
</c:if>

<%-- 컨트롤러에서 에러 메세지와 내보낼 페이지로 리턴한 경우 --%>
<c:if test="${ not empty message }">
        <h2>컨트롤러 요청 실패 메세지 : ${ message }</h2>
</c:if>
<hr>
<%-- 링크(연결) 정보를 미리 변수로 지정함 
     jsp 페이지에서 컨트롤러를 요청할 때는 반드시 context root 에서
     실행되도록 해야 함 (context root == content directory)
     context : web application 을 의미함
     context root : first/src/main/webapp 을 의미함
     root 에서 출발하는 경로를 웹에서 절대경로라고 함
     * taglib 에서 절대경로는 / 만 표기하면 됨
     * html, javascript 에서의 절대 경로는
     ${ pageContext.servletContext.contextPath } 로 표기함
--%>

<a href="#" onclick="history.back(); return false;">이전페이지로 이동</a>
<%-- 
      상대경로 : 현재 문서를 기준으로 대상까지의 경로
      같은 폴더에 있으면 : 파일명.확장자, 촐더명/파일명.확장자
      다른폴더에 있으면 : ./(현재폴더), ../(한단계 위로)
 --%>
</body>
</html>