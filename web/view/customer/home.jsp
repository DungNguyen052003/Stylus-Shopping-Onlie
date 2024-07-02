<%-- 
    Document   : home
    Created on : May 20, 2024, 3:27:50 PM
    Author     : TienP
--%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <jsp:include page="../layout/header.jsp"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/jquery-ui.min.css" type="text/css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/magnific-popup.css" type="text/css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/style.css?id=123" type="text/css">
        <style>
            .hotPost .card {
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                transition: all 0.3s ease;
            }

            .hotPost .card:hover {
                transform: translateY(-10px);
            }

            .hotPost .card-img-top {
                height: 200px;
                object-fit: cover;
            }

            .hotPost .card-body {
                padding: 20px;
            }

            .hotPost .card-footer {
                background-color: #f8f9fa;
                border-top: 1px solid rgba(0, 0, 0, 0.125);
            }

        </style>
    </head>
    <body>

        <!-- Categories Section Begin -->
        <!--        <section class="categories">-->
    <center>
        <section class="banner set-bg" data-setbg="asset/image/banner-1.jpg" style="height: 450px; width: 88%; display: flex; justify-content: center; align-items: center;">
            <div class="banner__slider owl-carousel" style="max-width: 100%; padding: 0;">
                <c:forEach  items="${listSlider}" var="slider">
                    <div class="banner__item">
                        <a href="${slider.backlink}"><img src="${slider.image}" style="width: 100%; height: 450px;"></a>
                    </div>
                </c:forEach>
            </div>
        </section>
    </center>
    <section class="shop spad">
        <div class="container-fluid">
            <!--                <div class="row">-->
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
                        <br>
                        <div class="section-title">
                            <a href="#new-post"><h4>New Post</h4></a>
                        </div>
                        <div class="new-posts">
                            <div class="new-post-item">
                                <img src="${blog.thumbnail}" alt="${blog.blogTitle}">
                                <div class="new-post-content">
                                    <h5>${blog.blogTitle}</h5>
                                    <p>${blog.brief_info}</p>
                                </div>
                            </div>
                        </div>
                    </div>


                </div>

            </div>
            <!--                </div>-->
            <div class="col-lg-9 col-md-9">
                <!--        </section>-->
                <!-- Categories Section End -->

                <!-- Product Section Begin -->
                <!--        <section class="product spad">-->
                <div class="container">
                    <div class="row">
                        <div class="col-lg-4 col-md-4">
                            <div class="section-title">
                                <h4>New product</h4>
                            </div>
                        </div>
                        <div class="col-lg-8 col-md-8">
                            <ul class="filter__controls">
                                <li class="active" data-filter="*">All</li>
                                <li data-filter=".women">Women’s</li>
                                <li data-filter=".men">Men’s</li>
                            </ul>
                        </div>
                    </div>
                    <div class="row property__gallery">
                        <c:forEach items="${requestScope.listbyAll}" var="pd" varStatus="loop">
                            <div class="col-lg-4 col-md-4 col-sm-6 mix women">
                                <div class="product__item">
                                    <div class="product__item__pic set-bg" data-setbg="${pd.thumbnail}"
                                         style="background-image: url(${pd.thumbnail});">

                                        <div class="label new">New</div>
                                        <ul class="product__hover">
                                            <li><a href="${pd.thumbnail}" class="image-popup"><span class="arrow_expand"></span></a></li>
                                        </ul>
                                    </div>
                                    <div class="product__item__text">
                                        <h6><a href="ProductDetail?productId=${pd.productID}">${pd.productName}</a></h6>
                                        <div class="rating">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <c:choose>
                                            <c:when test="${pd.saleStatus eq 1}">
                                                <div class="product__price">$ ${pd.salePrice} <span>$ ${pd.price}</span></div>
                                            </c:when>
                                            <c:otherwise>
                                                <div class="product__price">$ ${pd.price}</div>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                            </div>
                        </c:forEach> 
                    </div>
                </div>
                <!--        </section>-->
                <!-- Product Section End -->

                <!-- Banner Section Begin -->

                <!-- Banner Section End -->

                <!-- Trend Section Begin -->
                <section class="trend spad">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-6">
                                <div class="trend__content">
                                    <div class="section-title">
                                        <h4>Hot Trend</h4>
                                    </div>
                                    <c:forEach items="${requestScope.listFeature}" var="pd" varStatus="status">
                                        <c:if test="${status.index < 2}">
                                            <a href="ProductDetail?productId=${pd.productID}" class="trend__item">
                                                <div class="trend__item">
                                                    <div class="trend__item__pic">
                                                        <img src="${pd.thumbnail}" alt="lol">
                                                    </div>
                                                    <div class="trend__item__text">
                                                        <h6>${pd.productName}</h6>
                                                        <div class="rating">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                        </div>
                                                        <c:choose>
                                                            <c:when test="${pd.saleStatus eq 1}">
                                                                <div class="product__price">$ ${pd.salePrice} <span>$ ${pd.price}</span></div>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <div class="product__price">$ ${pd.price}</div>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </div>
                                                </div>
                                            </a>
                                        </c:if>
                                    </c:forEach>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6">
                                <div class="trend__content">
                                    <div class="section-title">
                                        <h4>Sale</h4>
                                    </div>
                                    <c:forEach items="${requestScope.listFeature}" var="pd" varStatus="status">
                                        <c:if test="${status.index < 2}">
                                            <a href="ProductDetail?productId=${pd.productID}" class="trend__item">
                                                <div class="trend__item">
                                                    <div class="trend__item__pic">
                                                        <img src="${pd.thumbnail}" alt="lol">
                                                    </div>
                                                    <br>
                                                    <div class="trend__item__text">
                                                        <h6>${pd.productName}</h6>
                                                        <div class="rating">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                        </div>
                                                        <c:choose>
                                                            <c:when test="${pd.saleStatus eq 1}">
                                                                <div class="product__price">$ ${pd.salePrice} <span>$ ${pd.price}</span></div>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <div class="product__price">$ ${pd.price}</div>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </div>
                                                </div>
                                            </a>
                                        </c:if>
                                    </c:forEach>    
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6">
                                <div class="trend__content">
                                    <div class="section-title">
                                        <h4>Feature</h4>
                                    </div>
                                    <c:forEach items="${requestScope.listSale}" var="pd" varStatus="status">
                                        <c:if test="${status.index < 2}">
                                            <a href="ProductDetail?productId=${pd.productID}" class="trend__item">
                                                <div class="trend__item">
                                                    <div class="trend__item__pic">
                                                        <img src="${pd.thumbnail}" alt="lol">
                                                    </div>
                                                    <div class="trend__item__text">
                                                        <h6>${pd.productName}</h6>
                                                        <div class="rating">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                        </div>
                                                        <div class="product__price">$ ${pd.price} <span>$ ${pd.salePrice}</span></div>
                                                    </div>
                                                </div>
                                            </a>
                                        </c:if>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- Trend Section End -->

                <!-- Discount Section Begin -->
                <section class="discount">
                    <div class="section-title">
                        <h4>Hot Post</h4>
                    </div>
                    <div class="container">
                        <div class="row">
                            <c:forEach items="${requestScope.blogList}" var="blogs" varStatus="status">
                                <c:if test="${status.index < 3}">
                                    <div class="col-lg-4 col-md-6 mb-4">
                                        <div class="card h-100">
                                            <a href="BlogDetail?id=${blogs.blogID}" class="trend__item">
                                                <img src="${blogs.thumbnail}" class="card-img-top" alt="${blogs.blogTitle}">
                                                <div class="card-body">
                                                    <h5 class="card-title">${blogs.blogTitle}</h5>
                                                    <p class="card-text" style="overflow: hidden;
                                                       display: -webkit-box;
                                                       -webkit-line-clamp: 3;
                                                       -webkit-box-orient: vertical;
                                                       width: 250px;
                                                       word-wrap: break-word;">
                                                        ${blogs.brief_info}
                                                    </p>
                                                    <a href="BlogDetail?id=${blogs.blogID}" class="btn btn-primary">Read More</a>
                                                </div>
                                                <div class="card-footer text-muted">
                                                    <small>Posted on ${blogs.createDate} by ${blogs.author}</small>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </div>
                    </div>
                </section>

                <!-- Discount Section End -->

                <!-- Services Section Begin -->
                <section class="services spad">

                    <div class="container">
                        <div class="row">
                            <div class="col-lg-3 col-md-4 col-sm-6">
                                <div class="services__item">
                                    <i class="fa fa-car"></i>
                                    <h6>Free Shipping</h6>
                                    <p>For all oder over $99</p>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-4 col-sm-6">
                                <div class="services__item">
                                    <i class="fa fa-money"></i>
                                    <h6>Money Back Guarantee</h6>
                                    <p>If good have Problems</p>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-4 col-sm-6">
                                <div class="services__item">
                                    <i class="fa fa-support"></i>
                                    <h6>Online Support 24/7</h6>
                                    <p>Dedicated support</p>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-4 col-sm-6">
                                <div class="services__item">
                                    <i class="fa fa-headphones"></i>
                                    <h6>Payment Secure</h6>
                                    <p>100% secure payment</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
    </section>

    <!-- Instagram End -->
    <jsp:include page="../layout/success.jsp"/>
    <jsp:include page="../layout/footer.jsp"/>
    <script src="asset/js/jquery-3.3.1.min.js"></script>
    <script src="asset/js/bootstrap.min.js"></script>
    <script src="asset/js/jquery.magnific-popup.min.js"></script>
    <script src="asset/js/jquery-ui.min.js"></script>
    <script src="asset/js/mixitup.min.js"></script>
    <script src="asset/js/jquery.countdown.min.js"></script>
    <script src="asset/js/jquery.slicknav.js"></script>
    <script src="asset/js/owl.carousel.min.js"></script>
    <script src="asset/js/jquery.nicescroll.min.js"></script>
    <script src="asset/js/main.js"></script>
</body>
</html>
