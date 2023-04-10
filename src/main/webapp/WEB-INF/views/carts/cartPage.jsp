<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="org.nulljump.dionysos.product.model.vo.Product" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="${pageContext.servletContext.contextPath}/resources/js/jquery-3.6.3.min.js"></script>
</head>
<body>
	<div class="row qnas" style="text-align: center;">
		<h1 class="page-header">장바구니 페이지</h1>
		<table class="table table-hover" style="width: 70%; margin: auto; border-bottom: 1px solid #D5D5D5;">
			<thead>
				<tr>
					<th colspan="2" style="text-align: center;">상품명</th>
					<th>가격</th>
					<th>수량</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<img alt="thumbnail" src="" width="40%"> <input
						type="hidden" value="${product.product_id}" name="product_id"
						id="product_id">
					</td>
					<td>${product.product_name}</td>
					<td>${product.product_price}&nbsp;원</td>
					<td></td>
					<td><input type="checkbox" name="id" value="2"></td>
				</tr>
			</tbody>
		</table>
	
	</div><table class="table table-hover">
   
</table>
	
</table>
<table class="table table-striped table-hover table-condensed">
    <thead>
        <tr>
            <th>상품명</th>
            <th>수량</th>
            <th>가격</th>
            <th>합계</th>
            <th></th>
        </tr>
    </thead>
    <tbody>
        <c:set var="totalPrice" value="0" />
        <c:forEach var="ca" items="${clist}">
            <tr>
                <td>${ca.product_name}</td>
                <td>${ca.cart_quantity}</td>
                <td>${ca.product_price}</td>
                <td>${ca.cart_quantity * ca.product_price}</td>
                <td><button onclick="deleteInfoColumn(this, ${ca.cart_id})">삭제</button></td>
            </tr>
            <c:set var="totalPrice" value="${totalPrice + (ca.cart_quantity * ca.product_price)}" />
        </c:forEach>
        <tr>
            <td colspan="3" align="right"><strong>총 합계:</strong></td>
            <td>${totalPrice}</td>
            <td></td>
        </tr>
    </tbody>
</table>

<script type="text/javascript">
    function deleteInfoColumn(button, cart_id) {
        // cart_id에 해당하는 레코드를 cart 테이블에서 삭제합니다.
        $.ajax({
            type: "POST",
            url: "deleteCarts.do",
            data: {
                cart_id : cart_id
            },
            success: function(result) {
                console.log(result);
                // 삭제된 row를 화면에서 제거합니다.
                var row = button.closest('tr');
                row.remove();
            },
            error: function(e) {
                console.log(e.responseText);
            }
        });
    }
</script>

		
</body>
</html>