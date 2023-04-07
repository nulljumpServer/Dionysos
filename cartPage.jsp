<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="row qnas" style="text-align: center;">
		<h1 class="page-header">주문하기</h1>
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
	
	</div>
		<tbody>
			<c:forEach items="${clist}" var="p">
				<tr>
					<td>
						<img alt="thumbnail" src="" width="40%"> 
						<input type="hidden" value="${p.product_id}" name="clist_id[]">
					</td>
					<td>${p.product_name}</td>
					<td>${p.product_price}&nbsp;원</td>
					<td><input type="checkbox" name="selected_product_ids[]" value="${p.product_id}"></td>
				</tr>
			</c:forEach>
		</tbody>
	<table align="center" border="1" cellspacing="0" cellpadding="3">	
</body>
</html>