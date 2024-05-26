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
            .customSlide{
                .slider-container {
                    position: relative;
                    width: 100%;
                    max-width: 800px;
                    margin: 0 auto;
                    overflow: hidden;
                }
                .slide {
                    display: none; /* Ẩn slide ban đầu */
                    width: 100%;
                }
                .slide img {
                    width: 100%;
                    height: auto;
                }
                .slider-nav {
                    position: absolute;
                    bottom: 10px;
                    left: 50%;
                    transform: translateX(-50%);
                    z-index: 1000;
                }
                .slider-nav button {
                    background-color: #fff;
                    border: 2px solid #333;
                    width: 10px;
                    height: 10px;
                    border-radius: 50%;
                    margin: 0 5px;
                    cursor: pointer;
                }
                .slider-nav button.active {
                    background-color: #333;
                }
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
                                <a href="ProductDetail?productId=${pd.productID}" class="trend__item">
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
                                                <h6><a href="#">${pd.productName}</a></h6>
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
                                </a>
                            </c:forEach> 

                        </div>
                    </div>
                    <!--        </section>-->
                    <!-- Product Section End -->

                    <!-- Banner Section Begin -->
                    <div class='customeSlide'>
                        <section class="slider-container">
                            <!-- Các Slide -->
                            <center>
                                <c:forEach items="${requestScope.listSlider}" var="slide" varStatus="status">
                                    <div class="slide">
                                        <a href="/searchbyslide?id=${slide.id}">
                                            <img src="${slide.image}" alt="${slide.title}">
                                            <h3>${slide.title}</h3>
                                        </a>
                                    </div>
                                </c:forEach>
                                <!-- Dấu chấm điều hướng -->
                                <div class="slider-nav">
                                    <c:forEach items="${requestScope.listSlider}" var="slide" varStatus="status">
                                        <button class="dot"></button>
                                    </c:forEach>
                                </div>
                            </center>
                        </section>
                    </div>
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
            const slides = document.querySelectorAll('.slide');
            const dots = document.querySelectorAll('.dot');

            let index = 0;

            // Hiển thị slide đầu tiên và dấu chấm tương ứng
            const showSlide = (slideIndex) => {
                // Ẩn tất cả các slide
                slides.forEach((slide) => {
                    slide.style.display = 'none';
                });

                // Loại bỏ lớp active từ tất cả các dấu chấm
                dots.forEach((dot) => {
                    dot.classList.remove('active');
                });

                // Hiển thị slide và dấu chấm tương ứng
                slides[slideIndex].style.display = 'block';
                dots[slideIndex].classList.add('active');
            };

            // Tự động lướt qua các slide
            const autoSlide = () => {
                // Tăng chỉ số slide lên một đơn vị
                index++;
                // Nếu chỉ số vượt quá số lượng slide, quay lại slide đầu tiên
                if (index >= slides.length) {
                    index = 0;
                }
                showSlide(index);
            };

            // Tự động chuyển slide mỗi 3 giây
            setInterval(autoSlide, 3000);

            // Xác định slide khi người dùng click vào dấu chấm
            dots.forEach((dot, dotIndex) => {
                dot.addEventListener('click', () => {
                    showSlide(dotIndex);
                    index = dotIndex;
                });
            });
        </script>
    </body>
</html>
