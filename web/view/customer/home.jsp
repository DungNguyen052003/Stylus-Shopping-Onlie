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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .customSlide .container {
                padding: 2rem;
            }
            .customSlide .slider-wrapper {
                position: relative;
                max-width: 48rem;
                margin: 0 auto;
            }
            .customSlide .slider {
                display: flex;
                aspect-ratio: 16/9;
                overflow-x: auto;
                scroll-snap-type: x mandatory;
                scroll-behavior: smooth;
                box-shadow: 0 1.5rem 3rem -0.75rem hsla(0, 0%, 0%, 0.25);
                border-radius: 0.5rem;
            }
            .customSlide .slider img {
                flex: 1 0 100%;
                scroll-snap-align: start;
                object-fit: cover;
            }
            .customSlide .slider-nav {
                display: flex;
                column-gap: 1rem;
                position: absolute;
                bottom: 1.25rem;
                left: 50%;
                transform: translateX(-50%);
                z-index: 1;
            }
            .customSlide .slider-nav a {
                width: 0.5rem;
                height: 0.5rem;
                border-radius: 50%;
                background-color: #fff;
                opacity: 0.75;
                transition: opacity ease 250ms;
            }
            .customSlide .slider-nav a:hover {
                opacity: 1;
            }





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
        <jsp:include page="../layout/header.jsp"/>
        <!-- Categories Section Begin -->
        <!--        <section class="categories">-->
        <section class="shop spad">
            <div class="container-fluid">
                <!--                <div class="row">-->
                <div class="col-lg-3 col-md-3">
                    <div class="shop__sidebar">
                        <div class="sidebar__categories">
                            <div class="section-title">
                                <a href="#new-product"><h4>New Product</h4></a>
                            </div>
                            <div class="section-title">
                                <a href="#hot-trend"><h4>Hot Trend</h4></a>
                            </div>
                            <div class="section-title">
                                <a href="#feature-products"><h4>Feature Products</h4></a>
                            </div>
                            <div class="section-title">
                                <a href="#sale-product"><h4>Sale Product</h4></a>
                            </div>
                            <div class="section-title">
                                <a href="#contact"><h4>Contact</h4></a>
                            </div>
                            <div class="section-title">
                                <a href="#new-post"><h4>New Post</h4></a>
                            </div>
                            <div class="new-posts">

                                <div class="new-post-item">
                                    <img src="${blog.thumbNail}" alt="${blog.blogTitle}">
                                    <div class="new-post-content">
                                        <h5>${blog.blogTitle}</h5>
                                        <p>${blog.briefInformation}</p>
                                    </div>
                                </div>


                            </div>
                        </div>


                    </div>

                </div>
                <!--                </div>-->
                <div class="col-lg-9 col-md-9">
                    <div class="categories__item categories__large__item set-bg"
                         data-setbg="asset/image/categories/category-1.jpg" style="background-image: url('asset/image/categories/category-1.jpg');">
                        <div class="categories__text">
                            <h1>Women’s fashion</h1>
                            <p>Sitamet, consectetur adipiscing elit, sed do eiusmod tempor incidid-unt labore
                                edolore magna aliquapendisse ultrices gravida.</p>
                            <a href="#">Shop now</a>
                        </div>
                    </div>
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

                                <div class="col-lg-3 col-md-4 col-sm-6 mix women">
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
                    <section class="banner set-bg" data-setbg="asset/image/banner-1.jpg">
                        <div class="container">
                            <div class="row">
                                <div class="col-xl-7 col-lg-8 m-auto">
                                    <div class="banner__slider owl-carousel">
                                        <div class="banner__item">
                                            <div class="banner__text">
                                                <span>The Chloe Collection</span>
                                                <h1>The Project Jacket</h1>
                                                <a href="#">Shop now</a>
                                            </div>
                                        </div>
                                        <div class="banner__item">
                                            <div class="banner__text">
                                                <span>The Chloe Collection</span>
                                                <h1>The Project Jacket</h1>
                                                <a href="#">Shop now</a>
                                            </div>
                                        </div>
                                        <div class="banner__item">
                                            <div class="banner__text">
                                                <span>The Chloe Collection</span>
                                                <h1>The Project Jacket</h1>
                                                <a href="#">Shop now</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
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
                                        <c:forEach items="${requestScope.listFeature}" var="pd">
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
                                        </c:forEach>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6">
                                    <div class="trend__content">
                                        <div class="section-title">
                                            <h4>Sale</h4>
                                        </div>
                                        <c:forEach items="${requestScope.listFeature}" var="pd">
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
                                        </c:forEach>    
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6">
                                    <div class="trend__content">
                                        <div class="section-title">
                                            <h4>Feature</h4>
                                        </div>
                                        <c:forEach items="${requestScope.listSale}" var="pd">
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
                                    <!-- Giới hạn hiển thị chỉ 3 bài blog -->
                                    <c:if test="${status.index < 3}">
                                        <div class="col-lg-4 col-md-6 mb-4">
                                            <div class="card h-100">
                                                <a href="BlogDetail?id=${blogs.blogID}" class="trend__item">
                                                    <img src="${blogs.thumbNail}" class="card-img-top" alt="${blogs.blogTitle}">
                                                    <div class="card-body">
                                                        <h5 class="card-title">${blogs.blogTitle}</h5>
                                                        <p class="card-text">${blogs.description}</p>
                                                        <a href="/blog/${blogs.blogID}" class="btn btn-primary">Read More</a>
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
                    <!-- Services Section End -->

                    <!-- Instagram Begin -->

                </div>
        </section>

        <!-- Instagram End -->
        <jsp:include page="../layout/success.jsp"/>
        <jsp:include page="../layout/footer.jsp"/>
        <script>
            let slideIndex = 0;
            showSlides();

            // Function to show the slides
            function showSlides() {
                let i;
                let slides = document.getElementsByClassName("slide");
                let dots = document.getElementsByClassName("dot");

                // Hide all slides
                for (i = 0; i < slides.length; i++) {
                    slides[i].style.display = "none";
                }

                // Remove active class from all dots
                for (i = 0; i < dots.length; i++) {
                    dots[i].className = dots[i].className.replace(" active", "");
                }

                // Increment slide index
                slideIndex++;

                // Reset slide index if it exceeds the number of slides
                if (slideIndex > slides.length) {
                    slideIndex = 1
                }

                // Display the current slide and add active class to the corresponding dot
                slides[slideIndex - 1].style.display = "block";
                slides[slideIndex - 1].classList.add("fade");
                dots[slideIndex - 1].className += " active";

                // Change slide every 3 seconds
                setTimeout(showSlides, 3000);
            }

            // Function to show a specific slide
            function currentSlide(n) {
                let slides = document.getElementsByClassName("slide");
                let dots = document.getElementsByClassName("dot");

                // Hide all slides
                for (let i = 0; i < slides.length; i++) {
                    slides[i].style.display = "none";
                }

                // Remove active class from all dots
                for (let i = 0; i < dots.length; i++) {
                    dots[i].className = dots[i].className.replace(" active", "");
                }

                // Display the selected slide and add active class to the corresponding dot
                slides[n - 1].style.display = "block";
                slides[n - 1].classList.add("fade");
                dots[n - 1].className += " active";

                // Update slideIndex
                slideIndex = n;
            }

            // Add event listeners to dots for manual navigation
            document.querySelectorAll('.dot').forEach((dot, index) => {
                dot.addEventListener('click', () => {
                    currentSlide(index + 1);
                });
            });
        </script>
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
