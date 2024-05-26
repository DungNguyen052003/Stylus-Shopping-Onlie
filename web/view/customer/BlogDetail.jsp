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
                                <a href="./blog">Blog</a>
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

                    <div class="col-lg-9">
                        <section class="blog-details spad">
                            <div class="container">
                                <div class="row">
                                    <div class="col-lg-8 col-md-8">
                                        <div class="blog__details__content">
                                            <div class="blog__details__item">
                                                <img src="${blogdetail.thumbNail}" >
                                                <div class="blog__details__item__title">

                                                    <h4>${blogdetail.briefInformation}</h4>
                                                    <ul>
                                                        <li>by <span>${blogdetail.author}</span></li>
                                                        <li>${blogdetail.createDate}</li>

                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="blog__details__desc">
                                                <p>${blogdetail.description}</p>

                                            </div>


                                            <!--                            <div class="blog__details__btns">
                                                                            <div class="row">
                                                                                <div class="col-lg-6 col-md-6 col-sm-6">
                                                                                    <div class="blog__details__btn__item">
                                                                                        <h6><a href="#"><i class="fa fa-angle-left"></i> Previous posts</a></h6>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="col-lg-6 col-md-6 col-sm-6">
                                                                                    <div class="blog__details__btn__item blog__details__btn__item--next">
                                                                                        <h6><a href="#">Next posts <i class="fa fa-angle-right"></i></a></h6>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>-->

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
                                                    <img src="${pro.thumbNail}">
                                                    <div class="product__item__text blog__item">
                                                        <h6><a href="#">${pro.productName}</a></h6>
                                                        <div class="rating">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                        </div>
                                                        <div class="product__price">$ ${pro.price}</div>
                                                    </div>
                                                </div>

                                            </div>
                                            <!--Feature posts-->
                                            <div class="blog__sidebar__item">
                                                <div class="section-title">
                                                    <h4>Feature posts</h4>
                                                </div>
                                                <c:forEach var="feat" items="${featureBlogs}">
                                                    <a href="blogdetail?mode=1&id=${feat.getBlogID()}" class="blog__feature__item" style="height: 200px">
                                                        <div class="blog__feature__item__pic blog__feature__item__text">
                                                            <img style="height: 50%; width: 50%" src="${feat.thumbNail}" >
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
