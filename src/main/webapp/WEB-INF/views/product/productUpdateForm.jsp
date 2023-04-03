<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:import url="/WEB-INF/views/admin/menubar.jsp" />
<div class="breadcome-area">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="breadcome-list">
                                <div class="row">
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                        <div class="breadcomb-wp">
											<div class="breadcomb-icon">
												<i class="icon nalika-home"></i>
											</div>
											<div class="breadcomb-ctn">
												<h2>Product Edit</h2>
												<p>Dionysos <span class="bread-ntd">Product Edit</span></p>
											</div>
										</div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                        <div class="breadcomb-report">
											<button data-toggle="tooltip" data-placement="left" title="Download Report" class="btn"><i class="icon nalika-download"></i></button>
										</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
      
        <!-- Single pro tab start-->
        <div class="single-product-tab-area mg-b-30">
            <!-- Single pro tab review Start-->
            <div class="single-pro-review-area">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="review-tab-pro-inner">
                                <ul id="myTab3" class="tab-review-design">
                                    <li class="active"><a href="#description"><i class="icon nalika-edit" aria-hidden="true"></i> 상품 정보 수정</a></li>
                                    <li><a href="#REVIEW"><i class="icon nalika-chat" aria-hidden="true"></i> 리뷰</a></li>
                                </ul>
                                <!-- 상품 정보 관리 -->
                                <div id="myTabContent" class="tab-content custom-product-edit">
                                    <div class="product-tab-list tab-pane fade active in" id="description">
                                        <div class="row">
                                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                                <div class="review-content-section">
                                                <div class="input-group mg-b-pro-edt">
                                                        <span class="input-group-addon">상품 이미지(첨부파일) : </span>
                                                        <input type="text" class="form-control" value="${ product.product_ename }">
                                                    </div>
                                                    <div class="input-group mg-b-pro-edt">
                                                        <span class="input-group-addon">상품명(영문) : </span>
                                                        <input type="text" class="form-control" value="${ product.product_ename }">
                                                    </div>
                                                    <div class="input-group mg-b-pro-edt">
                                                        <span class="input-group-addon">상품명 : </span>
                                                        <input type="text" class="form-control" value="${ product.product_name }">
                                                    </div>
                                                    <div class="input-group mg-b-pro-edt">
                                                        <span class="input-group-addon">가격 : </span>
                                                        <input type="text" class="form-control" value="${ product.product_price }">
                                                    </div>
                                                    <div class="input-group mg-b-pro-edt">
                                                        <span class="input-group-addon">와인 종류 : </span>
                                                        <input type="text" class="form-control" value="${ product.wine_type }">
                                                    </div>
                                                    <div class="input-group mg-b-pro-edt">
                                                        <span class="input-group-addon">포도 종류 : </span>
                                                        <input type="text" class="form-control" value="${ product.grape_type }">
                                                    </div>
                                                    <div class="input-group mg-b-pro-edt">
                                                        <span class="input-group-addon">원산지 : </span>
                                                        <input type="text" class="form-control" value="${ product.wine_origin }">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                                <div class="review-content-section">
                                                    <div class="input-group mg-b-pro-edt">
                                                        <span class="input-group-addon">알콜 도수 : </span>
                                                        <input type="text" class="form-control" value="${ product.alcohol }">
                                                    </div>
                                                    <div class="input-group mg-b-pro-edt">
                                                        <span class="input-group-addon">산도 : </span>
                                                        <input type="text" class="form-control" value="${ product.acidity }">
                                                    </div>
                                                    <div class="input-group mg-b-pro-edt">
                                                        <span class="input-group-addon">당도 : </span>
                                                        <input type="text" class="form-control" value="${ product.sweetness }">
                                                    </div>
                                                    <div class="input-group mg-b-pro-edt">
                                                        <span class="input-group-addon">바디 : </span>
                                                        <input type="text" class="form-control" value="${ product.body }">
                                                    </div>
                                                    <div class="input-group mg-b-pro-edt">
                                                        <span class="input-group-addon">타닌 : </span>
                                                        <input type="text" class="form-control" value="${ product.tannin }">
                                                    </div>
                                                    <select name="select" class="form-control pro-edt-select form-control-primary">
															<option value="opt1">Select One Value Only</option>
															<option value="opt2">2</option>
															<option value="opt3">3</option>
															<option value="opt4">4</option>
															<option value="opt5">5</option>
															<option value="opt6">6</option>
														</select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <div class="text-center custom-pro-edt-ds">
                                                    <button type="button" class="btn btn-ctl-bt waves-effect waves-light m-r-10">수정
														</button>
                                                    <button type="button" class="btn btn-ctl-bt waves-effect waves-light">취소
														</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- 리뷰 관리  -->
                                    <div class="product-tab-list tab-pane fade" id="REVIEW">
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <div class="review-content-section">
                                                    <div class="card-block">
                                                        <div class="text-muted f-w-400">
                                                            <p>No reviews yet.</p>
                                                        </div>
                                                        <div class="m-t-10">
                                                            <div class="txt-primary f-18 f-w-600">
                                                                <p>Your Rating</p>
                                                            </div>
                                                            <div class="stars stars-example-css detail-stars">
                                                                <div class="review-rating">
                                                                    <fieldset class="rating">
                                                                        <input type="radio" id="star5" name="rating" value="5">
                                                                        <label class="full" for="star5"></label>
                                                                        <input type="radio" id="star4half" name="rating" value="4 and a half">
                                                                        <label class="half" for="star4half"></label>
                                                                        <input type="radio" id="star4" name="rating" value="4">
                                                                        <label class="full" for="star4"></label>
                                                                        <input type="radio" id="star3half" name="rating" value="3 and a half">
                                                                        <label class="half" for="star3half"></label>
                                                                        <input type="radio" id="star3" name="rating" value="3">
                                                                        <label class="full" for="star3"></label>
                                                                        <input type="radio" id="star2half" name="rating" value="2 and a half">
                                                                        <label class="half" for="star2half"></label>
                                                                        <input type="radio" id="star2" name="rating" value="2">
                                                                        <label class="full" for="star2"></label>
                                                                        <input type="radio" id="star1half" name="rating" value="1 and a half">
                                                                        <label class="half" for="star1half"></label>
                                                                        <input type="radio" id="star1" name="rating" value="1">
                                                                        <label class="full" for="star1"></label>
                                                                        <input type="radio" id="starhalf" name="rating" value="half">
                                                                        <label class="half" for="starhalf"></label>
                                                                    </fieldset>
                                                                </div>
                                                                <div class="clear"></div>
                                                            </div>
                                                        </div>
                                                        <div class="input-group mg-b-15 mg-t-15">
                                                            <span class="input-group-addon"><i class="icon nalika-user" aria-hidden="true"></i></span>
                                                            <input type="text" class="form-control" placeholder="User Name">
                                                        </div>
                                                        <div class="input-group mg-b-15">
                                                            <span class="input-group-addon"><i class="icon nalika-user" aria-hidden="true"></i></span>
                                                            <input type="text" class="form-control" placeholder="Last Name">
                                                        </div>
                                                        <div class="input-group mg-b-15">
                                                            <span class="input-group-addon"><i class="icon nalika-mail" aria-hidden="true"></i></span>
                                                            <input type="text" class="form-control" placeholder="Email">
                                                        </div>
                                                        <div class="form-group review-pro-edt mg-b-0-pt">
                                                            <button type="submit" class="btn btn-ctl-bt waves-effect waves-light">Submit
																</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer-copyright-area">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="footer-copy-right">
                            <p>Copyright © 2018 <a href="https://colorlib.com/wp/templates/">Colorlib</a> All rights reserved.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    

    <!-- jquery
		============================================ -->
    <script src="${pageContext.servletContext.contextPath}/resources/js/admin/vendor/jquery-1.12.4.min.js"></script>
    <!-- bootstrap JS
		============================================ -->
    <script src="${pageContext.servletContext.contextPath}/resources/js/admin/bootstrap.min.js"></script>
    <!-- wow JS
		============================================ -->
    <script src="${pageContext.servletContext.contextPath}/resources/js/admin/wow.min.js"></script>
    <!-- price-slider JS
		============================================ -->
    <script src="${pageContext.servletContext.contextPath}/resources/js/admin/query-price-slider.js"></script>
    <!-- meanmenu JS
		============================================ -->
    <script src="${pageContext.servletContext.contextPath}/resources/js/admin/jquery.meanmenu.js"></script>
    <!-- owl.carousel JS
		============================================ -->
    <script src="${pageContext.servletContext.contextPath}/resources/js/admin/owl.carousel.min.js"></script>
    <!-- sticky JS
		============================================ -->
    <script src="${pageContext.servletContext.contextPath}/resources/js/admin/jquery.sticky.js"></script>
    <!-- scrollUp JS
		============================================ -->
    <script src="${pageContext.servletContext.contextPath}/resources/js/admin/jquery.scrollUp.min.js"></script>
    <!-- mCustomScrollbar JS
		============================================ -->
    <script src="${pageContext.servletContext.contextPath}/resources/js/admin/scrollbar/jquery.mCustomScrollbar.concat.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/resources/js/admin/crollbar/mCustomScrollbar-active.js"></script>
    <!-- metisMenu JS
		============================================ -->
    <script src="${pageContext.servletContext.contextPath}/resources/js/admin/metisMenu/metisMenu.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/resources/js/admin/metisMenu/metisMenu-active.js"></script>
    <!-- morrisjs JS
		============================================ -->
    <script src="${pageContext.servletContext.contextPath}/resources/js/admin/sparkline/jquery.sparkline.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/resources/js/admin/sparkline/jquery.charts-sparkline.js"></script>
    <!-- calendar JS
		============================================ -->
    <script src="${pageContext.servletContext.contextPath}/resources/js/admin/calendar/moment.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/resources/js/admin/calendar/fullcalendar.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/resources/js/admin/calendar/fullcalendar-active.js"></script>
    <!-- tab JS
		============================================ -->
    <script src="${pageContext.servletContext.contextPath}/resources/js/admin/tab.js"></script>
    <!-- plugins JS
		============================================ -->
    <script src="${pageContext.servletContext.contextPath}/resources/js/admin/plugins.js"></script>
    <!-- main JS
		============================================ -->
    <script src="${pageContext.servletContext.contextPath}/resources/js/admin/main.js"></script>
</body>

</html>