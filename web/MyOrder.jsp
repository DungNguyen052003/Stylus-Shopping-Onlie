<%-- 
    Document   : ShopCart
    Created on : May 22, 2024, 2:24:30 PM
    Author     : ngock
--%>

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
    <style>
        .cart__quantity {
            vertical-align: middle; /* Aligns the content vertically */
        }

        .cart__quantity div {
            display: flex; /* Make the container a flexbox */
            align-items: center; /* Align items vertically */
            justify-content: center; /* Align items horizontally */
            height: 100%; /* Ensures the container fills the entire cell height */
        }
    </style>
    <body>
        <!-- Page Preloder -->
        <div id="preloder">
            <div class="loader"></div>
        </div>

        <!-- Offcanvas Menu Begin -->
        <div class="offcanvas-menu-overlay"></div>
        <div class="offcanvas-menu-wrapper">
            <!--            <div class="offcanvas__close">+</div>-->
            <ul class="offcanvas__widget">
                <li><span class="icon_search search-switch"></span></li>
                <li><a href="#"><span class="icon_heart_alt"></span>
                        <div class="tip">2</div>
                    </a></li>
                <li><a href="#"><span class="icon_bag_alt"></span>
                        <div class="tip">2</div>
                    </a></li>
            </ul>
            <div class="offcanvas__logo">
                <a href="./index.html"><img src="img/logo.png" alt=""></a>
            </div>
            <div id="mobile-menu-wrap"></div>
            <div class="offcanvas__auth">
                <a href="#">Login</a>
                <a href="#">Register</a>
            </div>
        </div>
        <!-- Offcanvas Menu End -->

        <!-- Header Section Begin -->
        <header class="header">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-xl-3 col-lg-2">
                        <div class="header__logo">
                            <a href="./index.html"><img src="img/logo.png" alt=""></a>
                        </div>
                    </div>
                    <div class="col-xl-6 col-lg-7">
                        <nav class="header__menu">
                            <ul>
                                <li><a href="./index.html">Home</a></li>
                                <li><a href="#">Women’s</a></li>
                                <li><a href="#">Men’s</a></li>
                                <li class="active"><a href="./shop.html">Shop</a></li>
                                <li><a href="#">Pages</a>
                                    <ul class="dropdown">
                                        <li><a href="./product-details.html">Product Details</a></li>
                                        <li><a href="./shop-cart.html">Shop Cart</a></li>
                                        <li><a href="./checkout.html">Checkout</a></li>
                                        <li><a href="./blog-details.html">Blog Details</a></li>
                                    </ul>
                                </li>
                                <li><a href="./blog.html">Blog</a></li>
                                <li><a href="./contact.html">My Order</a></li>
                            </ul>
                        </nav>
                    </div>
                    <div class="col-lg-3">
                        <div class="header__right">
                            <div class="header__right__auth">
                                <a href="#">Login</a>
                                <a href="#">Register</a>
                            </div>
                            <ul class="header__right__widget">
                                <li><span class="icon_search search-switch"></span></li>
                                <li><a href="#"><span class="icon_heart_alt"></span>
                                        <div class="tip">2</div>
                                    </a></li>
                                <li><a href="#"><span class="icon_bag_alt"></span>
                                        <div class="tip">2</div>
                                    </a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="canvas__open">
                    <i class="fa fa-bars"></i>
                </div>
            </div>
        </header>
        <!-- Header Section End -->

        <!-- Breadcrumb Begin -->
        <div class="breadcrumb-option">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="breadcrumb__links">
                            <a href="./index.html"><i class="fa fa-home"></i> Home</a>
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
                                                    <ul>
                                                        <li><a href="#">Shirts</a></li>
                                                        <li><a href="#">T-shirts</a></li>
                                                        <li><a href="#">Jeans</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="card">
                                            <div class="card-heading">
                                                <a data-toggle="collapse" data-target="#collapseTwo">Men</a>
                                            </div>
                                            <div id="collapseTwo" class="collapse" data-parent="#accordionExample">
                                                <div class="card-body">
                                                    <ul>
                                                        <li><a href="#">Shirts</a></li>
                                                        <li><a href="#">T-shirts</a></li>
                                                        <li><a href="#">Jeans</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
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
                            <div class="sidebar__sizes">
                                <div class="section-title">
                                    <h4>Shop by size</h4>
                                </div>
                                <div class="size__list">
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
                                    <h4>Shop by Color</h4>
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

                                </div>
                            </div>
                        </div>
                    </div>
                    <!--product cart-->
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
                                                        <th>Create Date</th>
                                                        <th>Product</th>
                                                        <th>Price</th>
                                                        <th>Quantity</th>
                                                        <th>Total</th>
                                                        <th></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td class="cart__product__item cart__product__item__title">Viet</td>
                                                        <td class="cart__product__item cart__product__item__title">crete0</td>
                                                        <td class="cart__product__item">
                                                            <img src="img/shop-cart/cp-1.jpg" alt="">
                                                            <div class="cart__product__item__title">
                                                                <h6>Chain bucket bag</h6>
                                                                <div class="rating">
                                                                    <i class="fa fa-star"></i>
                                                                    <i class="fa fa-star"></i>
                                                                    <i class="fa fa-star"></i>
                                                                    <i class="fa fa-star"></i>
                                                                    <i class="fa fa-star"></i>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td class="cart__price">$ 150.0</td>
                                                        <td class="cart__quantity">
                                                            <div>
                                                                <p>1</p>
                                                            </div>
                                                        </td>
                                                        <td class="cart__total">$ 300.0</td>
                                                        <!-- <td class="cart__close"><span class="icon_close"></span></td> -->
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                    </div>


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
