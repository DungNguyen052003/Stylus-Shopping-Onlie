<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="zxx">

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
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
        <link rel="stylesheet" href="asset/css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="asset/css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="asset/css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="asset/css/jquery-ui.min.css" type="text/css">
        <link rel="stylesheet" href="asset/css/magnific-popup.css" type="text/css">
        <link rel="stylesheet" href="asset/css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="asset/css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="asset/css/style.css?id=11" type="text/css">
        <!-- Css Styles -->
        <style>
            .price_box {
                float: left;
            }

            .price_box span {
                line-height: 16px;
            }

            .price_box span.old_price {
                text-decoration: line-through;
                font-weight: 400;
                font-size: 15px;
                margin-right: 5px;
            }

            @media only screen and (max-width: 767px) {
                .price_box span.old_price {
                    font-size: 13px;
                }
            }
            .price_box span.current_price {
                font-weight: 700;
                font-size: 17px;
                color: #000;
            }

            @media only screen and (max-width: 767px) {
                .price_box span.current_price {
                    font-size: 13px;
                }
            }
            .search-box {
                position: relative;
                display: inline-block;
            }

            .search-box input[type="text"] {
                width: 250px;
                padding: 8px 30px 8px 10px;
                border: 1px solid #ccc;
                border-radius: 20px;
                outline: none;
            }

            .search-box input[type="text"]:focus {
                transition: none;
            }

            .search-box button {
                position: absolute;
                top: 50%;
                right: 10px;
                transform: translateY(-50%);
                background: none;
                border: none;
                outline: none;
                cursor: pointer;
            }

            .search-box button i {
                font-size: 18px;
                color: #888;
            }
            .feedback-item {
                margin-bottom: 20px;
                padding-bottom: 20px;
                border-bottom: 1px solid #ddd;
            }
            .rating {
                margin-top: 5px;
            }
            .fa-star {
                color: #ffcc00;
            }
            .product__details__name{
                margin-top: 20px;
            }
            .product__details__tab{
                margin-top: 20px;
            }
            .sidebar__filter{
                margin-top: 40px;
                margin-bottom: 20px;
            }
            .sidebar__options {
                display: flex;
                justify-content: space-between; /* Dịch chuyển các phần tử ra hai bên của div cha */
            }
            .sidebar__size,
            .sidebar__color {
                flex: 1; /* Phần tử con chiếm toàn bộ không gian trong div cha */
                margin-right: 20px; /* Khoảng cách giữa các phần tử */
            }
        </style>
    </head>

    <body>

        <!-- Page Preloder -->
        <jsp:include page="../layout/header.jsp"></jsp:include><br>
        <c:set value="${products}" var="product"/>
        <!-- Header Section End -->

        <!-- Breadcrumb Begin -->
        <div class="breadcrumb-option">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="breadcrumb__links">
                            <a href="index"><i class="fa fa-home"></i> Home</a>
                            <a href="#">${category.name} </a>
                            <span>${product.productName}</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Breadcrumb End -->

        <!-- Product Details Section Begin -->
        <section class="product-details spad">
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
                                        </div>


                                        <div class="section-title" style=" margin-bottom: 20px;">
                                            <h4>Search By Name</h4>
                                        </div>

                                        <form action="productlist" method="get" >
                                            <div class="search-box">
                                                <input type="text" name="keyword" placeholder="Search...">
                                                <button type="submit" onclick="return validateKeyword()"><i class="fa fa-search"></i></button>

                                            </div>
                                        </form> 

                                    </div>
                                </div>
                                <div class="sidebar__filter">
                                    <div class="section-title">
                                        <h4>Shop by price</h4>
                                    </div>
                                    <div class="filter-range-wrap">
                                        <div class="price-range ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content"
                                             data-min="33" data-max="99"></div>
                                        <div class="range-slider">
                                            <div class="price-input">
                                                <p>Price:</p>
                                                <input type="text" id="minamount">
                                                <input type="text" id="maxamount">
                                            </div>
                                        </div>
                                    </div>
                                    <a href="#">Filter</a>
                                </div>
                                <div class="sidebar__options">


                                    <div class="sidebar__sizes" style="
                                         width: 70px;
                                         padding-right: 80px;
                                         margin-right: 20px;
                                         " >
                                        <div class="section-title"  style=" width: 230px;  margin-top: 20px;">
                                            <h4>Shop by size/color</h4>
                                        </div>
                                        <div class="size__list" style="width: 75px;">
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
                                            <label for="xss">
                                                xs-s
                                                <input type="checkbox" id="xss">
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
                                            <label for="ml">
                                                m-l
                                                <input type="checkbox" id="ml">
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
                                    <div class="sidebar__color"  style="
                                         margin-bottom: 0px;
                                         padding-bottom: 0px;
                                         border-top-width: 60px;
                                         padding-top: 78px;
                                         padding-right: 20px;
                                         ">

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
                        </div>
                    </div>


                    <div class="col-lg-9 col-md-9">
                        <div class="product__details__pic">
                            <div class="product__details__pic__left product__thumb nice-scroll">

                                <c:forEach var="product" items="${productList}">
                                    <a class="pt" href="#">
                                        <img src="${product.productImages}" alt="">
                                    </a>
                                </c:forEach>
                            </div>
                            <div class="product__details__slider__content">
                                <div class="product__details__pic__slider owl-carousel">

                                    <c:forEach var="product" items="${productList}">
                                        <img  class="product__big__img" src="${product.productImages}" alt="">

                                    </c:forEach>
                                </div>  
                            </div>
                        </div>

                        <c:set value="${products}" var="product"/>
                        <div class="product__details__text">
                            <div class="product__details__name"> <h5>${product.productName}</h5></div>
                            <div class="product__details__price" style="margin-top: 10px; margin-bottom: 10px;">
                                <c:forEach items="${productSaleInfos}" var="productSaleInfo" varStatus="status">
                                    <c:if test="${status.index == 0}">
                                        $${productSaleInfo.salePrice}
                                        <span>$${productSaleInfo.product.price}</span><br>
                                    </c:if>
                                </c:forEach>
                            </div>

                            <h5></span></h5>
                            <div class="rating">

                                <c:set var="numstar" value="${product.starRating}"/>
                                <c:forEach begin="1" end="${numstar}" step="1">

                                    <i class="fa fa-star"></i>
                                </c:forEach>
                                <c:if test="${numstar != 5}">
                                    <c:forEach begin="${numstar + 1}" end="5" step="1">

                                        <i class="fa fa-star"></i>
                                    </c:forEach>
                                </c:if>
                            </div>
                            <p>${product.briefInfomation}</p>
                            <div class="product__details__button">
                                <div class="quantity">
                                    <span>Quantity:</span>
                                    <div class="pro-qty">
                                        <input type="text" value="1">
                                    </div>
                                </div>
                                <a href="#" class="cart-btn"><span class="icon_bag_alt"></span> Add to cart</a>
                                <ul>
                                    <li><a href="#"><span class="icon_heart_alt"></span></a></li>
                                    <li><a href="#"><span class="icon_adjust-horiz"></span></a></li>
                                </ul>
                            </div>
                            <div class="product__details__widget">
                                <ul>
                                    <li>
                                        <span>Available color:</span>
                                        <div class="color__checkbox">

                                            <c:forEach var="color" items="${color}">
                                                <label for="${color.id}">
                                                    <input type="radio" name="color__radio" id="${color.id}" >
                                                    <span class="checkmark
                                                          <c:choose>
                                                              <c:when test="${color.id == 1}">black-bg</c:when>
                                                              <c:when test="${color.id == 2}">white-bg</c:when>
                                                              <c:when test="${color.id == 3}">red-bg</c:when>
                                                              <c:when test="${color.id == 4}">pink-bg</c:when>
                                                              <c:when test="${color.id == 5}">green-bg</c:when>
                                                              <c:when test="${color.id == 6}">blue-bg</c:when>
                                                              <c:otherwise></c:otherwise>
                                                          </c:choose>
                                                          "></span>
                                                </label>
                                            </c:forEach>
                                        </div>
                                    </li>
                                    <li>
                                        <span>Available size:</span>
                                        <div class="size__btn">
                                            <c:forEach var="size" items="${size}">
                                                <label for="size-${size.id}" >
                                                    <input value="" type="radio" id="size-${size.id}">
                                                    ${size.name}
                                                </label>
                                            </c:forEach>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-12">
                        <div class="product__details__tab" style="
                             margin-top: 0px;
                             padding-top: 0px;
                             ">
                            <ul class="nav nav-tabs" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab">Description</a>
                                </li>

                                <li class="nav-item">
                                    <a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab">Reviews</a>
                                </li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane active" id="tabs-1" role="tabpanel">
                                    <h6>Description</h6>
                                    <p>${product.description}</p>
                                </div>

                                <div class="tab-pane" id="tabs-3" role="tabpanel">
                                    <h5>Reviews</h5>
                                    <div></div>
                                    <!-- Assuming you have a list of feedbacks for this product -->
                                    <c:forEach items="${listFB}" var="feedback">
                                        <div class="feedback-item">
                                            <h6>UserName: ${feedback.customerName}</h6>
                                            <h6>Date: ${feedback.createDate}</h6>
                                            <div>
                                                <h6>Star Rating</h6>
                                                <div class="rating">
                                                    <c:set var="numstar" value="${feedback.rateStar}"/>
                                                    <c:forEach begin="1" end="${numstar}" step="1">
                                                        <i class="fa fa-star"></i>
                                                    </c:forEach>
                                                    <c:if test="${numstar != 5}">
                                                        <c:forEach begin="${numstar + 1}" end="5" step="1">
                                                            <i class="fa fa-star"></i>
                                                        </c:forEach>
                                                    </c:if>
                                                </div>
                                            </div>
                                            <h4>Comment: ${feedback.comment}</h4>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <div class="related__title">
                            <h5>LASTEST PRODUCTS</h5>
                        </div>
                    </div>

                    <c:forEach var="product" items="${latestProducts}" varStatus="loop">

                        <c:if test="${loop.index < 4}">
                            <div class="col-lg-3 col-md-4 col-sm-6">
                                <div class="product__item">
                                    <div class="product__item__pic set-bg"  >
                                        <a class="pt" href="#">
                                            <img src="${product.thumbnail}" alt="">
                                        </a>

                                        <ul class="product__hover">
                                            <li>
                                                <a href=""${product.thumbnail}" class="image-popup">
                                                    <span class="arrow_expand"></span>
                                                </a>
                                            </li>
                                            <li><a href="#"><span class="icon_heart_alt"></span></a></li>
                                            <li><a href="#"><span class="icon_bag_alt"></span></a></li>
                                        </ul>
                                    </div>
                                    <div class="product__item__text">
                                        <h6><a href="productdetail?productId=${product.productID}"><h7>${product.productName}</h7></a></h6>
                                        <div class="rating">
                                            <c:set var="numstar" value="${product.starRating}"/>
                                            <c:forEach begin="1" end="${numstar}" step="1">
                                                <i class="fa fa-star"></i>
                                            </c:forEach>
                                            <c:if test="${numstar != 5}">
                                                <c:forEach begin="${numstar + 1}" end="5" step="1">
                                                    <i class="fa fa-star"></i>
                                                </c:forEach>
                                            </c:if>
                                        </div>
                                        <div class="product__details__price"><p>${product.price}</p></div>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
            </div>
        </section>
        <!-- Product Details Section End -->

        <!-- Instagram Begin -->
        <div class="instagram">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                        <div class="instagram__item set-bg" data-setbg="asset/img/instagram/insta-1.jpg">
                            <div class="instagram__text">
                                <i class="fa fa-instagram"></i>
                                <a href="#">@ stylus_shop</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                        <div class="instagram__item set-bg" data-setbg="asset/img/instagram/insta-2.jpg">
                            <div class="instagram__text">
                                <i class="fa fa-instagram"></i>
                                <a href="#">@ stylus_shop</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                        <div class="instagram__item set-bg" data-setbg="asset/img/instagram/insta-3.jpg">
                            <div class="instagram__text">
                                <i class="fa fa-instagram"></i>
                                <a href="#">@ stylus_shop</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                        <div class="instagram__item set-bg" data-setbg="asset/img/instagram/insta-4.jpg">
                            <div class="instagram__text">
                                <i class="fa fa-instagram"></i>
                                <a href="#">@ stylus_shop</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                        <div class="instagram__item set-bg" data-setbg="asset/img/instagram/insta-5.jpg">
                            <div class="instagram__text">
                                <i class="fa fa-instagram"></i>
                                <a href="#">@ stylus_shop</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                        <div class="instagram__item set-bg" data-setbg="asset/img/instagram/insta-6.jpg">
                            <div class="instagram__text">
                                <i class="fa fa-instagram"></i>
                                <a href="#">@ stylus_shop</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Instagram End -->

        <!-- Footer Section Begin -->
        <footer class="footer">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4 col-md-6 col-sm-7">
                        <div class="footer__about">
                            <div class="footer__logo">
                                <a href="./index.html"><img src="asset/img/logo.png" alt=""></a>
                            </div>

                            <div class="footer__payment">
                                <a href="#"><img src="asset/img/payment/payment-1.png" alt=""></a>
                                <a href="#"><img src="asset/img/payment/payment-2.png" alt=""></a>
                                <a href="#"><img src="asset/img/payment/payment-3.png" alt=""></a>
                                <a href="#"><img src="asset/img/payment/payment-4.png" alt=""></a>
                                <a href="#"><img src="asset/img/payment/payment-5.png" alt=""></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-3 col-sm-5">
                        <div class="footer__widget">
                            <h6>Quick links</h6>
                            <ul>
                                <li><a href="#">About</a></li>
                                <li><a href="#">Blogs</a></li>
                                <li><a href="#">Contact</a></li>
                                <li><a href="#">FAQ</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-3 col-sm-4">
                        <div class="footer__widget">
                            <h6>Account</h6>
                            <ul>
                                <li><a href="#">My Account</a></li>
                                <li><a href="#">Orders Tracking</a></li>
                                <li><a href="#">Checkout</a></li>
                                <li><a href="#">Wishlist</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-8 col-sm-8">
                        <div class="footer__newslatter">
                            <h6>NEWSLETTER</h6>
                            <form action="#">
                                <input type="text" placeholder="Email">
                                <button type="submit" class="site-btn">Subscribe</button>
                            </form>
                            <div class="footer__social">
                                <a href="#"><i class="fa fa-facebook"></i></a>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                                <a href="#"><i class="fa fa-youtube-play"></i></a>
                                <a href="#"><i class="fa fa-instagram"></i></a>
                                <a href="#"><i class="fa fa-pinterest"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="footer__copyright__text">
                            <p>Copyright &copy; <script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- Footer Section End -->
        <!-- Search Begin -->
        <div class="search-model">
            <div class="h-100 d-flex align-items-center justify-content-center">
                <div class="search-close-switch">+</div>
                <form class="search-model-form">
                    <input type="text" id="search-input" placeholder="Search here.....">
                </form>
            </div>
        </div>
        <script>
            function validateKeyword() {
                var keyword = document.getElementsByName("keyword")[0].value.trim();
                if (keyword === "") {
                    alert("Please enter a keyword.");
                    return false; // Ngăn form được gửi đi nếu keyword là rỗng
                }
                return true;
            }
        </script>
    </body>
    <script src="asset/js/bootstrap.min.js"></script>
    <script src="asset/js/jquery.magnific-popup.min.js"></script>
    <script src="asset/js/jquery-ui.min.js"></script>
    <script src="asset/js/mixitup.min.js"></script>
    <script src="asset/js/jquery.countdown.min.js"></script>
    <script src="asset/js/jquery.slicknav.js"></script>
    <script src="asset/js/owl.carousel.min.js"></script>
    <script src="asset/js/jquery.nicescroll.min.js"></script>
    <script src="asset/js/main.js"></script>
</html>