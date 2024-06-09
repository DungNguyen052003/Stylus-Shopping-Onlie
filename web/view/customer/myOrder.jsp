<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <jsp:include page="../layout/header.jsp"></jsp:include><br>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/style.css" type="text/css">
</head>
<style>
    body {
        overflow-x: hidden; 
    }
</style>

<body>

    <div class="breadcrumb-option">

        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb__links" style="margin-left: 48px;">
                    <a href="./index.html"><i class="fa fa-home"></i> Home</a>
                    <span>My Order</span>
                </div>
            </div>
        </div>
    </div>
</div>
<section class="blog spad">
    <div class="container">       
        <div class="row">
            <div class="col-lg-3 col-md-3">
                <div class="shop__sidebar">
                    <div class="sidebar__categories">
                        <div class="section-title">
                            <form action="ProductServlet" method="get" style="display: inline;">
                                <input type="hidden" name="action" value="newest">
                                <button type="submit" style="background: none; border: none; color: black; font-size: 1.25em;">
                                    <h4>New</h4>
                                </button>
                            </form>
                        </div>
                        <div class="Trang">
                            <div class="search-box">
                                <form action="ProductServlet" method="get" style="margin-bottom: 10px;">
                                    <input type="hidden" name="action" value="search">
                                    <input type="text" id="search-input" placeholder="Search here....." name="keyword" style="height: 25px;
                                           width: 150px;">
                                    <button type="submit" style="height: 25px;"><i class="fa fa-search"></i></button>
                                </form>
                            </div>
                        </div>

                        <div class="section-title">
                            <h4>Categories</h4>
                        </div>
                        <div class="categories__accordion">
                            <div class="accordion" id="accordionExample">

                                <div class="card">
                                    <div class="card-heading ">
                                        <a data-toggle="collapse" data-target="#collapseOne">Women</a>
                                    </div>
                                    <div id="collapseOne" class="collapse " data-parent="#accordionExample">
                                        <div class="card-body">
                                            <c:forEach items="${categoriesWomen}" var="cW">
                                                <ul>
                                                    <li><a href="ProductServlet?id=${cW.cateID}" value="${cW.cateID}">${cW.name}</a></li>
                                                </ul>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>

                                <div class="card">
                                    <div class="card-heading">
                                        <a data-toggle="collapse" data-target="#collapseTwo">Men</a>
                                    </div>
                                    <div id="collapseTwo" class="collapse" data-parent="#accordionExample">
                                        <div class="card-body">
                                            <c:forEach items="${categoriesMen}" var="cM">
                                                <ul>
                                                    <li><a href="ProductServlet?id=${cM.cateID}">${cM.name}</a></li>
                                                </ul>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>  
                    <form action="ProductServlet" method="get" id="productForm">
                        <div class="sidebar__filter">
                            <div class="section-title" style="margin-bottom: 20px">
                                <h4>Shop by price</h4>
                            </div>
                            <div class="filter-range-wrap">
                                <input type="hidden" name="action" value="sortByPrice">
                                <div class="price-range ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content"
                                     data-min="10" data-max="500"></div>
                                <div class="range-slider">
                                    <div class="price-input">
                                        <p>Price:</p>
                                        <input type="text" id="minamount" name="mini">
                                        <input type="text" id="maxamount" name="max">
                                    </div>
                                </div>
                                </form>
                            </div>
                            <a href="#" onclick="document.getElementById('productForm').submit();">Filter</a>
                        </div>
                    </form>
                </div>
            </div>
            <div class="col-lg-9 col-md-9">
                <section class="shop-cart spad">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="shop__cart__table">
                                    <table>
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Order Date</th>
                                                <th>Product</th>
                                                <th>Price</th>
                                                <th>Status</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${orders}" var="order">
                                                <tr style="font-size: 18px;">
                                                    <td><a href="orderInfo?orderId=${order.orderId}">${order.orderId}</a></td>
                                                    <td>${order.orderDate}</td>
                                                    <td>${order.productName} 
                                                        <c:if test="${order.countOtherproduct > 0}">
                                                            , ${order.countOtherproduct} other products
                                                        </c:if>
                                                    </td>
                                                    <td>${order.totalAmount}</td>
                                                    <td>${order.status}</td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6 col-md-6">
                                <div class="cart__btn">
                                    <a href="#">Continue Shopping</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </div>
</section>
<script src="${pageContext.request.contextPath}/asset/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/asset/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/asset/js/jquery.magnific-popup.min.js"></script>
<script src="${pageContext.request.contextPath}/asset/js/jquery-ui.min.js"></script>
<script src="${pageContext.request.contextPath}/asset/js/mixitup.min.js"></script>
<script src="${pageContext.request.contextPath}/asset/js/jquery.countdown.min.js"></script>
<script src="${pageContext.request.contextPath}/asset/js/jquery.slicknav.js"></script>
<script src="${pageContext.request.contextPath}/asset/js/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}/asset/js/jquery.nicescroll.min.js"></script>
<script src="${pageContext.request.contextPath}/asset/js/main.js"></script>
</body>
</html>





