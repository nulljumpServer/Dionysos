<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<c:set var="startPage" value="${ requestScope.paging.startPage }" />
<c:set var="currentPage" value="${requestScope.paging.currentPage}" />
<c:set var="endPage" value="${ requestScope.paging.endPage }" />
<c:set var="maxPage" value="${ requestScope.paging.maxPage }" />
<c:set var="url" value="${requestScope.paging.url }" />
<!-- 관리자페이지 페이징 기능 뷰  -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<!-- 페이징 처리 -->
<div class="custom-pagination" style="text-align:center;"> <!-- 페이지 표시 영역 -->
<ul class="pagination">
	<!-- 1페이지로 이동하는 버튼 -->
	
	<c:if test="${ currentPage eq 1 }">
	<li class="page-item">
		<a class="page-link">[맨처음]</a> &nbsp;
		</li>
	</c:if>
		
	<c:if test="${ currentPage > 1 }">
	<li class="page-item">
		<c:url var="p1" value="${url}">
			<c:param name="action" value="${ param.action }" />
    		<c:param name="keyword" value="${ param.keyword }" />
			<c:param name="page" value="1" />
		</c:url>
		<a class="page-link" href="${ p1 }">[맨처음]</a> &nbsp;
		</li>
	</c:if>

	<!-- 이전 페이지그룹으로 이동하는 버튼 -->
	<c:if test="${ !((currentPage - 10) <= startPage and (currentPage - 10) >= 1) }">
	<li class="page-item">	
	<a class="page-link">[이전그룹]</a> &nbsp;
	</li>
	</c:if>
	<c:if test="${ (currentPage - 10) <= startPage and (currentPage - 10) >= 1 }">
	<li class="page-item">
		<c:url var="pbefore" value="${url}">
		<c:param name="action" value="${ param.action }" />
    		<c:param name="keyword" value="${ param.keyword }" />
			<c:param name="page" value="${ maxPage - 10 }" />
		</c:url>
		<a class="page-link" href="${ pbefore }">[이전그룹]</a> &nbsp;
		</li>
		</c:if>
	
	
	<!-- 현재 페이지가 속한 페이지 그룹 페이지 숫자 출력 -->
	
	<c:forEach var="p" begin="${ startPage }" end="${ endPage }" step="1">
		<c:if test="${ p eq currentPage }">
		<li class="page-item">
			<a class="page-link"><font color="red">[${ p }]</font></a>
			</li>
		</c:if>
		<c:if test="${ p ne currentPage }">
		<li class="page-item">
			<c:url var="pp" value="${url}">
			<c:param name="action" value="${ param.action }" />
    		<c:param name="keyword" value="${ param.keyword }" />
				<c:param name="page" value="${ p }" />
			</c:url>
			<a class="page-link" href="${ pp }">${ p }</a>
			</li>
		</c:if>
		
	</c:forEach>
	
	<!-- 다음 페이지그룹으로 이동하는 버튼 -->
	
	<c:if test="${ !((currentPage + 10) >= endPage and (currentPage + 10) <= maxPage) }">
	<li class="page-item">
	<a class="page-link">[다음그룹]</a> &nbsp;
	</li>
	</c:if>
	<c:if test="${ (currentPage + 10) >= endPage and (currentPage + 10) <= maxPage }">
	<li class="page-item">
		<c:url var="pafter" value="${url}">
		<c:param name="action" value="${ param.action }" />
    		<c:param name="keyword" value="${ param.keyword }" />
			<c:param name="page" value="${ startPage + 10 }" />
		</c:url>
		<a class="page-link" href="${ pafter }">[다음그룹]</a> &nbsp;
		</li>
	</c:if>
	
	
	<!-- 끝 페이지로 이동하는 버튼 -->
	<c:if test="${ currentPage eq maxPage }">
	<li class="page-item">
	<a class="page-link">[맨끝]</a> &nbsp;
		</li>
	</c:if>
	<c:if test="${ currentPage < maxPage }">
	<li class="page-item">
		<c:url var="pmax" value="${url}">
			<c:param name="action" value="${ param.action }" />
    		<c:param name="keyword" value="${ param.keyword }" />
			<c:param name="page" value="${ maxPage }" />
		</c:url>
		<a class="page-link" href="${ pmax }">[맨끝]</a>
		</li>
	</c:if>
	</ul>
</div>

</body>
</html>