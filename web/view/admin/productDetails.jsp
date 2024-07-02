<%-- 
    Document   : ProductDetails
    Created on : Jun 17, 2024, 3:20:58 AM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css2?family=Cookie&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800;900&display=swap"
              rel="stylesheet">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" media="screen" href="search_box.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <link rel="stylesheet" href="asset/css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="asset/css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="asset/css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="asset/css/jquery-ui.min.css" type="text/css">
        <link rel="stylesheet" href="asset/css/magnific-popup.css" type="text/css">
        <link rel="stylesheet" href="asset/css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="asset/css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="asset/css/style.css?id=11" type="text/css">
<jsp:include page="../layout/header4ad.jsp"></jsp:include>
    </head>
    <body>
        <!-- Header -->
    
            <!-- End Header-->

            <!-- Single Product Start -->
            <div class="container-fluid">
                <div class="container py-5">
                    <div class="row g-4 mb-5">
                        <div class="col-lg-7">
                            <div class="product__details__pic">
                                <div class="product__details__pic__left product__thumb nice-scroll" style="display: flex; flex-direction: column; gap: 10px;">
                                <c:forEach var="productImage" items="${productList}">
                                    <a class="pt" href="${productImage.productImages}" data-fancybox="gallery">
                                        <img src="${productImage.productImages}" alt="Product Image" style="width: 100px; height: auto; object-fit: cover; cursor: pointer;">
                                    </a>
                                </c:forEach>
                            </div>
                            <div class="product__details__slider__content">
                                <div class="product__details__pic__slider owl-carousel">
                                    <c:forEach var="productImage" items="${productList}">
                                        <a href="${productImage.productImages}" data-fancybox="gallery">
                                            <img class="product__big__img" src="${productImage.productImages}" alt="Product Image" style="width: 100%; height: auto; object-fit: cover;">
                                        </a>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                        <!-- FancyBox CSS -->
                        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fancyapps/ui/dist/fancybox.css" />

                        <!-- FancyBox JS -->
                        <script src="https://cdn.jsdelivr.net/npm/@fancyapps/ui/dist/fancybox.umd.js"></script>
                        <script>
                            document.addEventListener('DOMContentLoaded', function () {
                                // FancyBox configuration
                                Fancybox.bind("[data-fancybox='gallery']", {
                                    Toolbar: {
                                        display: [
                                            "close"
                                        ],
                                    },
                                    Thumbs: {
                                        autoStart: true,
                                    },
                                });
                            });
                        </script>
                    </div>
                    <div class="col-lg-5">
                        <h4 class="fw-bold mb-3" style="font-weight: bold; color: #333;">${product.productName}</h4>
                        <p class="mb-3" style="font-size: 18px; color: #666;">Category: ${product.cateID.name}</p>

                        <div style="display: flex; align-items: center; margin-bottom: 15px;">
                            <span style="font-size: 18px; font-weight: bold; color: #C0392B;">$</span>
                            <span style="color: #C0392B; font-size: 24px; font-weight: bold;">${product.salePrice}</span>
                            <span style="font-size: 18px; font-weight: bold; color: #999; margin-left: 10px;">$</span>
                            <span style="text-decoration: line-through; color: #999; font-size: 20px; margin-left: 10px;">${product.price}</span>
                        </div>

                        <div class="rating d-flex mb-4">
                            <c:forEach var="i" begin="1" end="5">
                                <i class="fa fa-star" style="color: <c:out value='${i <= product.starRating ? "#FFD700" : "#CCCCCC"}'/>;"></i>
                            </c:forEach>
                        </div>


                        <div style="margin-bottom: 15px;">
                            <span style="font-size: 18px; font-weight: bold;">Status: </span>
                            <i id="statusToggle" class="fa cursor-pointer
                               <c:choose>
                                   <c:when test="${product.status eq 1}">fa-toggle-on text-secondary</c:when>
                                   <c:otherwise>fa-toggle-off</c:otherwise>
                               </c:choose>"
                               style="font-size: 24px; margin-left: 10px; cursor: pointer;">
                            </i>
                        </div>

                        <div style="margin-bottom: 15px;">
                            <span style="font-size: 18px; font-weight: bold;">Feature: </span>
                            <i id="heartIcon" class="fa-solid fa-heart${product.featured == 1 ? ' featured' : ''}" style="font-size: 24px; cursor: pointer; color:${product.featured == 1 ? '#C0392B' : '#CCC'};"></i>
                        </div>
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>Size</th>
                                    <th>Color</th>
                                    <th>Quantity</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="detail" items="${detailList}">
                                    <tr>
                                        <td><c:out value="${detail.size.name}" /></td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${detail.color.id == 1}">
                                                    <div style="background-color: red; width: 20px; height: 20px; display: inline-block; margin-right: 10px;"></div>
                                                </c:when>
                                                <c:when test="${detail.color.id == 2}">
                                                    <div style="background-color: green; width: 20px; height: 20px; display: inline-block; margin-right: 10px;"></div>
                                                </c:when>
                                                <c:when test="${detail.color.id == 3}">
                                                    <div style="background-color: blue; width: 20px; height: 20px; display: inline-block; margin-right: 10px;"></div>
                                                </c:when>
                                                <c:when test="${detail.color.id == 4}">
                                                    <div style="background-color: pink; width: 20px; height: 20px; display: inline-block; margin-right: 10px;"></div>
                                                </c:when>
                                                <c:when test="${detail.color.id == 5}">
                                                    <div style="background-color: black; width: 20px; height: 20px; display: inline-block; margin-right: 10px;"></div>
                                                </c:when>
                                                <c:when test="${detail.color.id == 6}">
                                                    <div style="background-color: white; border: 1px solid black; width: 20px; height: 20px; display: inline-block; margin-right: 10px;"></div>
                                                </c:when>
                                                <c:otherwise>
                                                    <div style="background-color: gray; width: 20px; height: 20px; display: inline-block; margin-right: 10px;"></div>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>
                                            ${detail.quantity}
                                        </td>
                                    </tr>
                                </c:forEach>

                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="col-lg-12">
                    <p>${product.briefInfomation}</p>
                    <p>${product.description}</p>

                </div>
            </div>
        </div>
    </div>
    <!-- Single Product End -->





    <!-- Footer Section Begin -->

    <!-- Footer Section End -->

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
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- jQuery and Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
<!-- Font Awesome -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/js/all.min.js"></script>
</html>