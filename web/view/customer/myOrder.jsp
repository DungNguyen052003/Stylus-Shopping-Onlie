<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
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
    <body>
        <jsp:include page="../layout/header.jsp"></jsp:include><br>
        <div class="breadcrumb-option">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="breadcrumb__links">
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
                    <div class="col-lg-2 col-md-3">
                        <div class="shop__sidebar">
                            <div class="sidebar__categories">
                                <div class="section-title">
                                    <a href="last">Latest Product</a>
                                </div>
                                <div class="section-title">
                                    <h4>Categories</h4>
                                </div>
                                <div class="categories__accordion">
                                    <div class="accordion" id="accordionExample">
                                        <c:forEach items="${listCate}" var="l">
                                            <div class="card">
                                                <div class="card-heading active">
                                                    <a data-target="#collapseOne" href="last?category=1&id=${l.getCateID()}">${l.name}</a>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div><br>
                                
<!--                                   <div class="categories__accordion">
                                    <div class="accordion" id="accordionExample">


                                        <div class="card">
                                            <div class="card-heading active">
                                                <a data-toggle="collapse" data-target="#collapseOne">Women</a>
                                            </div>
                                            <div id="collapseOne" class="collapse show" data-parent="#accordionExample">
                                                <div class="card-body">
                                                    <c:forEach items="${categoriesWomen}" var="category">
                                                        <li><a href="productlist?categoryId=${category.cateID}">${category.name}</a></li>
                                                        </c:forEach>

                                                </div>
                                            </div>
                                        </div>

                                        <div class="card">
                                            <div class="card-heading active">
                                                <a data-toggle="collapse" data-target="#collapseOne">Men</a>
                                            </div>
                                            <div id="collapseOne" class="collapse show" data-parent="#accordionExample">
                                                <div class="card-body">
                                                    <c:forEach items="${categoriesMen}" var="category">
                                                        <li><a href="productlist?categoryId=${category.cateID}">${category.name}</a></li>
                                                        </c:forEach>

                                                </div>
                                            </div>
                                        </div>-->

                                
                                <div class="section-title" style="margin-bottom: 20px;">
                                    <h4>Search By Name</h4>
                                </div>
                                <form action="last" method="get">
                                    <div class="search-box">
                                        <input type="text" name="search" placeholder="Search...">
                                        <button type="submit"><i class="fa fa-search"></i></button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                   <div class="col-lg-10 col-md-9">
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
                                                    <tr>
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





 