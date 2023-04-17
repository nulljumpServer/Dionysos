<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<c:set var="startPage" value="${ requestScope.paging.startPage }" />
<c:set var="currentPage" value="${requestScope.paging.currentPage}" />
<c:set var="endPage" value="${ requestScope.paging.endPage }" />
<c:set var="maxPage" value="${ requestScope.paging.maxPage }" />
<c:set var="url" value="${requestScope.paging.url }" />
<!-- 유저페이지 페이징 기능 뷰  -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
</head>
<body>
<!-- 페이징 처리 -->
<div class="col text-center">
<div class="block-27">
<ul> <!-- 페이지 표시 영역 -->
	<!-- 1페이지로 이동하는 버튼 -->
	<c:if test="${ currentPage eq 1 }">
	<li><a>
		◀◀</a></li>&nbsp;
	</c:if>
	<c:if test="${ currentPage > 1 }">
		<c:url var="p1" value="${url}">
			<c:param name="action" value="${ param.action }" />
    		<c:param name="keyword" value="${ param.keyword }" />
			<c:param name="page" value="1" />
		</c:url><li>
		<a href="${ p1 }">◀◀</a></li>&nbsp;
	</c:if>
	<!-- 이전 페이지그룹으로 이동하는 버튼 -->
	<c:if test="${ !((currentPage - 10) <= startPage and (currentPage - 10) >= 1) }">
		<li><a>&lt;&lt;</a></li> &nbsp;
	</c:if>
	<c:if test="${ (currentPage - 10) <= startPage and (currentPage - 10) >= 1 }">
		<c:url var="pbefore" value="${url}">
			<c:param name="action" value="${ param.action }" />
    			<c:param name="keyword" value="${ param.keyword }" />
			<c:param name="page" value="${ maxPage - 10 }" />
		</c:url><li>
		<a href="${ pbefore }">&lt;&lt;</a></li> &nbsp;
	</c:if>
	
	<!-- 현재 페이지가 속한 페이지 그룹 페이지 숫자 출력 -->
	<c:forEach var="p" begin="${ startPage }" end="${ endPage }" step="1">
		<c:if test="${ p eq currentPage }">
			<li class="active"><a><font size="4" color="red">${ p }</font></a></li>
		</c:if>
		<c:if test="${ p ne currentPage }">
			<c:url var="pp" value="${url}">
				<c:param name="action" value="${ param.action }" />
    			<c:param name="keyword" value="${ param.keyword }" />
				<c:param name="page" value="${ p }" />
			</c:url><li>
			<a href="${ pp }">${ p }</a></li>
		</c:if>
	</c:forEach>
	
	<!-- 다음 페이지그룹으로 이동하는 버튼 -->
	<c:if test="${ !((currentPage + 10) >= endPage and (currentPage + 10) <= maxPage) }">
		<li><a>&gt;&gt;</a></li> &nbsp;
	</c:if>
	<c:if test="${ (currentPage + 10) >= endPage and (currentPage + 10) <= maxPage }">
		<c:url var="pafter" value="${url}">
			<c:param name="action" value="${ param.action }" />
    			<c:param name="keyword" value="${ param.keyword }" />
			<c:param name="page" value="${ startPage + 10 }" />
		</c:url>
		<li>
		<a href="${ pafter }">&gt;&gt;</a></li> &nbsp;
	</c:if>
	
	<!-- 끝 페이지로 이동하는 버튼 -->
	<c:if test="${ currentPage eq maxPage }">
		<li><a>▶▶</a></li>
	</c:if>
	<c:if test="${ currentPage < maxPage }">
		<c:url var="pmax" value="${url}">
			<c:param name="action" value="${ param.action }" />
    			<c:param name="keyword" value="${ param.keyword }" />
			<c:param name="page" value="${ maxPage }" />
		</c:url>
		<li>
		<a href="${ pmax }">▶▶</a></li>
	</c:if>
	</ul>
</div>
</div>
</body>
</html>