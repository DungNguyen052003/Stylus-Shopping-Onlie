<%-- 
    Document   : BlogDetail
    Created on : May 21, 2024, 6:02:19 PM
    Author     : ngock
--%>

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
<body>


    <div class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__links">
                        <a href="Home"><i class="fa fa-home"></i> Home</a>
                        <a href="BlogServlet">Blog</a>
                        <span>${blogdetail.blogTitle}</span>
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
                            <div class="section-title" style="margin-bottom: 20px;">
                                <h4>Search Post</h4>
                            </div>
                            <form action="last" method="get" style="padding-bottom: 15px;">
                                <div class="search-box">
                                    <input type="text" name="search" placeholder="Search...">
                                    <button type="submit"><i class="fa fa-search"></i></button>
                                </div>
                            </form>
                            <br>
                            <div class="section-title">
                                <h4>Categories</h4>
                            </div>
                            <div class="categories__accordion" style="padding-bottom:25px;">
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
                    </div>
                </div>

                <div class="col-lg-9">
                    <section class="blog-details spad">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-8 col-md-8">
                                    <div class="blog__details__content">
                                        <div class="blog__details__item">
                                            <img src="${blogdetail.thumbnail}" >
                                            <div class="blog__details__item__title">

                                                <h4>${blogdetail.brief_info}</h4>
                                                <ul>
                                                    <li>by <span>${blogdetail.author}</span></li>
                                                    <li>${blogdetail.createDate}</li>

                                                </ul>
                                            </div>
                                        </div>
                                        <div class="blog__details__desc">
                                            <p>${blogdetail.description}</p>

                                        </div>

                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4">
                                    <div class="blog__sidebar">
                                        <!--Product-->
                                        <div class="blog__sidebar__item">
                                            <div class="section-title">
                                                <h4>Product</h4>
                                            </div>
                                            <div class="blog__item">
                                                <a href="ProductDetail?productId=${pro.productID}">
                                                    <img src="${pro.thumbnail}">
                                                    <div class="product__item__text blog__item">
                                                        <h6><a href="#">${pro.productName}</a></h6>
                                                            <c:choose>
                                                                <c:when test="${pro.saleStatus eq 1}">
                                                                <div class="product__price">$ ${pro.salePrice} <span>$${pro.price} </span></div>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <div class="product__price">$ ${pro.price}</div>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </div>
                                                </a>
                                            </div>

                                        </div>
                                        <!--Feature posts-->
                                        <div class="blog__sidebar__item">
                                            <div class="section-title">
                                                <h4>Feature posts</h4>
                                            </div>
                                            <c:forEach var="feat" items="${featureBlogs}">
                                                <a href="BlogDetail?mode=1&id=${feat.getBlogID()}" class="blog__feature__item" style="height: 200px">
                                                    <div class="blog__feature__item__pic blog__feature__item__text">
                                                        <img style="height: 50%; width: 50%" src="${feat.thumbnail}" >
                                                        <h6 style="font-size: 10px">${feat.blogTitle}</h6>
                                                        <span style="color: black">${feat.createDate}</span>
                                                        <hr>
                                                    </div>
                                                </a>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
        </div>

        <div class="col-lg-12 text-center">
            <a href="#" class="primary-btn load-btn">Load more posts</a>
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
<jsp:include page="../layout/footer.jsp"></jsp:include>

</body>

</html>
