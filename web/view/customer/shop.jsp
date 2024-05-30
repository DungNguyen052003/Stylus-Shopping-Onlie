<%-- 
    Document   : shop
    Created on : May 21, 2024, 3:07:24 PM
    Author     : ASUS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Ashion Template">
        <meta name="keywords" content="Ashion, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Ashion | Template</title>

        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css2?family=Cookie&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800;900&display=swap"
              rel="stylesheet">


    </head>
    <body>
        <!-- Header -->
        <jsp:include page="../layout/header.jsp"></jsp:include><br>


            <!-- Breadcrumb Begin -->
            <div class="breadcrumb-option">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="breadcrumb__links">
                                <a href="./index.jsp"><i class="fa fa-home"></i> Home</a>
                                <span>Shop</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Breadcrumb End -->

            <!-- Shop Section Begin -->
            <section class="shop spad">
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
                                            <form action="ProductServlet" method="get">
                                                <input type="hidden" name="action" value="search">
                                                <input type="text" id="search-input" placeholder="Search here....." name="keyword">
                                                <button type="submit"><i class="fa fa-search"></i></button>
                                            </form>
                                        </div>
                                    </div>

                                    <div class="section-title">
                                        <h4>Categories</h4>
                                    </div>
                                    <div class="categories__accordion">
                                        <div class="accordion" id="accordionExample">
                                            <input type="hidden" name="action" value="cate">
                                            <div class="card">
                                                <div class="card-heading active">
                                                    <a data-toggle="collapse" data-target="#collapseOne">Women</a>
                                                </div>
                                                <div id="collapseOne" class="collapse show" data-parent="#accordionExample">
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
                                    <div class="section-title">
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
                            <div class="sidebar__sizes">
                                <div class="section-title">
                                    <h4>Shop by size</h4>
                                </div>
                                <div class="size__list">
                                    <label for="xxs">
                                        xxs
                                        <input type="checkbox" id="xxs">
                                        <span class="checkmark"></span>
                                    </label>
                                    <label for="xs">
                                        xs
                                        <input type="checkbox" id="xs">
                                        <span class="checkmark"></span>
                                    </label>
                                    <label for="s">
                                        s
                                        <input type="checkbox" id="s">
                                        <span class="checkmark"></span>
                                    </label>
                                    <label for="m">
                                        m
                                        <input type="checkbox" id="m">
                                        <span class="checkmark"></span>
                                    </label>
                                    <label for="l">
                                        l
                                        <input type="checkbox" id="l">
                                        <span class="checkmark"></span>
                                    </label>
                                    <label for="xl">
                                        xl
                                        <input type="checkbox" id="xl">
                                        <span class="checkmark"></span>
                                    </label>
                                </div>
                            </div>
                            <div class="sidebar__color">
                                <div class="section-title">
                                    <h4>Shop by size</h4>
                                </div>
                                <div class="size__list color__list">
                                    <label for="black">
                                        Blacks
                                        <input type="checkbox" id="black">
                                        <span class="checkmark"></span>
                                    </label>
                                    <label for="whites">
                                        Whites
                                        <input type="checkbox" id="whites">
                                        <span class="checkmark"></span>
                                    </label>
                                    <label for="reds">
                                        Reds
                                        <input type="checkbox" id="reds">
                                        <span class="checkmark"></span>
                                    </label>
                                    <label for="greys">
                                        Greys
                                        <input type="checkbox" id="greys">
                                        <span class="checkmark"></span>
                                    </label>
                                    <label for="blues">
                                        Blues
                                        <input type="checkbox" id="blues">
                                        <span class="checkmark"></span>
                                    </label>
                                    <label for="beige">
                                        Beige Tones
                                        <input type="checkbox" id="beige">
                                        <span class="checkmark"></span>
                                    </label>
                                    <label for="greens">
                                        Greens
                                        <input type="checkbox" id="greens">
                                        <span class="checkmark"></span>
                                    </label>
                                    <label for="yellows">
                                        Yellows
                                        <input type="checkbox" id="yellows">
                                        <span class="checkmark"></span>
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-9 col-md-9">
                        <div class="row">
                            <c:forEach items="${listProduct}" var="p">
                                <div class="col-lg-4 col-md-6">
                                    <div class="product__item">
                                        <div class="product__item__pic set-bg" data-setbg="${p.thumbnail}"
                                             style="background-image: url(${p.thumbnail});">
                                            <div class="label new">New</div>
                                            <ul class="product__hover">
                                                <li><a href="${p.thumbnail}" class="image-popup"><span class="arrow_expand"></span></a></li>
                                                <li><a href="#"><span class="icon_heart_alt"></span></a></li>
                                                <li><a href="#"><span class="icon_bag_alt"></span></a></li>
                                            </ul>
                                        </div>
                                        <div class="product__item__text">
                                            <h5><a href="ProductDetail?productId=${p.productID}">${p.productName}</a></h5>
                                            <h6>${p.briefInfomation}</h6>
                                            <div class="rating">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                            </div>
                                            <c:choose>
                                                <c:when test="${p.saleStatus eq 1}">
                                                    <div class="product__price">$ ${p.price} <span>$ ${p.salePrice}</span></div>
                                                </c:when>
                                                <c:otherwise>
                                                    <div class="product__price">$ ${p.price}</div>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                            <div class="col-lg-12 text-center">
                                <div class="pagination__option">
                                    <c:forEach begin="1" end="${pageControl.totalPage}" var="pageNumber">
                                        <a href="${pageControl.urlPattern}page=${pageNumber}">${pageNumber}</a>
                                    </c:forEach>
<!--                                    <a href"${pageControl.urlPattern}&page=${pageControl.page + 1}"><i class="fa fa-angle-right"></i></a>-->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </section>
        <!-- Shop Section End -->


        <!-- Instagram Begin -->
        <div class="instagram">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                        <div class="instagram__item set-bg" data-setbg="asset/img/instagram/insta-1.jpg">
                            <div class="instagram__text">
                                <i class="fa fa-instagram"></i>
                                <a href="#">@ ashion_shop</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                        <div class="instagram__item set-bg" data-setbg="asset/img/instagram/insta-2.jpg">
                            <div class="instagram__text">
                                <i class="fa fa-instagram"></i>
                                <a href="#">@ ashion_shop</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                        <div class="instagram__item set-bg" data-setbg="asset/img/instagram/insta-3.jpg">
                            <div class="instagram__text">
                                <i class="fa fa-instagram"></i>
                                <a href="#">@ ashion_shop</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                        <div class="instagram__item set-bg" data-setbg="asset/img/instagram/insta-4.jpg">
                            <div class="instagram__text">
                                <i class="fa fa-instagram"></i>
                                <a href="#">@ ashion_shop</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                        <div class="instagram__item set-bg" data-setbg="asset/img/instagram/insta-5.jpg">
                            <div class="instagram__text">
                                <i class="fa fa-instagram"></i>
                                <a href="#">@ ashion_shop</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                        <div class="instagram__item set-bg" data-setbg="asset/img/instagram/insta-6.jpg">
                            <div class="instagram__text">
                                <i class="fa fa-instagram"></i>
                                <a href="#">@ ashion_shop</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Instagram End -->


        <!--Footer-->
        <jsp:include page="../layout/footer.jsp"/>
        <!--             Search Begin 
                    <div class="search-model">
                        <div class="h-100 d-flex align-items-center justify-content-center">
                            <div class="search-close-switch">+</div>
                            <form class="search-model-form">    
                                <input type="hidden" name="action" value="search">
                                <input type="text" id="search-input" placeholder="Search here....." name="keyword">
                                <a href="#" onclick="return this.closest('form').submit"></a>
                            </form>
                        </div>
                    </div>
                     Search End -->





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
