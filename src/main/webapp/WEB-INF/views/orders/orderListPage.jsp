<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="org.nulljump.dionysos.product.model.vo.Product"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 주문내역</title>
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
<script type="text/javascript"
	src="${pageContext.servletContext.contextPath}/resources/js/jquery-3.6.3.min.js"></script>
<script type="text/javascript">
$(function(){
	calPrice();
});
	
    function deleteInfoColumn(button, product_id) {
        $.ajax({
            type: "POST",
            url: "deleteCarts.do",
            data: {
            	product_id : product_id
            },
            success: function(result) {
                console.log(result);
                var row = button.closest('tr');
                row.remove();
                calPrice();
            },
            error: function(e) {
                console.log(e.responseText);
            }
        });
    }
    function calPrice(){
        var totalPrice = 0;
        $(".productprice").each(function() {
            totalPrice += Number($(this).text());
        });
        $('#totalPrice').text(totalPrice);
        
    }

    function updateCartInfo(product_id, cart_id, price) {
        var order_qty = $("#cartQty" + product_id).val();
        var updated_price = Number(order_qty) * Number(price);
        $.ajax({
            type: "POST",
            url: "updateQty.do",
            data: {
                cart_id: cart_id,
                product_id: product_id,
                order_qty: order_qty,
                user_id: "${sessionScope.loginUsers.user_id}",
            },
            success: function(result) {
                console.log(result);
                var $product_price = $("#cartQty" + product_id).closest("tr").find(".productprice");
                $product_price.text(updated_price);
                calPrice();
            },
            error: function(e) {
                console.log(e.responseText);
            }
        });
    }

</script>
<link
	href="https://fonts.googleapis.com/css2?family=Spectral:ital,wght@0,200;0,300;0,400;0,500;0,700;0,800;1,200;1,300;1,400;1,500;1,700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/users/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/users/animate.css">
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/users/owl.carousel.min.css">
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/users/owl.theme.default.min.css">
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/users/magnific-popup.css">
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/users/bootstrap-select.min.css">
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/users/flaticon.css">
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/users/style.css">


<style type="text/css">

.cart_page {
	display: inline-block;
	text-decoration: none;
	color: #888
	
	
}

</style>
</head>
<body>
	<c:import url="/WEB-INF/views/common/menubar.jsp" />
	<section class="ftco-section">
	<div class="row no-gutters slider-text align-items-end justify-content-center">
          <div class="col-md-9 ftco-animate mb-5 text-center">
		 <h2 class="mb-0 bread">주문내역</h2>
	</div>
		&nbsp;&nbsp;
    	<div class="container">
    		<div class="row">
    			<div class="table-wrap">
		<table class="table">
			<thead class="thead-primary">
				<tr align="center">	
					<th>주문번호</th>	
					<th>&nbsp;</th>	
					<th>상품</th>				
					<th>수량</th>
					<th>가격</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${requestScope.list}" var="o">
					<tr class="alert" role="alert">
						<td>${o.order_number}</td>
						<td><img src="${pageContext.servletContext.contextPath}${o.product_image}" class="img-fluid" width="150px" height="150px" alt="Colorlib Template"></td>
						<td>${o.product_name}</td>
						<td>${o.order_qty}&nbsp;</td>
						<td class="productprice">${o.order_qty * o.total_price}</td>
					</tr>
					
				</c:forEach>
			</tbody>
		</table>
		
		
	</div>
</div>
</div>
</section>

	<c:import url="/WEB-INF/views/common/footer.jsp" />

	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div>
	
	<script
		src="${pageContext.servletContext.contextPath}/resources/js/users/jquery.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/js/users/jquery-migrate-3.0.1.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/js/users/popper.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/js/users/bootstrap.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/js/users/jquery.easing.1.3.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/js/users/jquery.waypoints.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/js/users/jquery.stellar.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/js/users/owl.carousel.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/js/users/jquery.magnific-popup.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/js/users/jquery.animateNumber.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/js/users/scrollax.min.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/js/users/google-map.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/js/users/bootstrap-select.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/js/users/main.js"></script>
</body>
</html>