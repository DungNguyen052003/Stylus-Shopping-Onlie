<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Ashion Template">
        <meta name="keywords" content="Ashion, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Cart Contact</title>

        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css2?family=Cookie&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800;900&display=swap" rel="stylesheet">

        <!-- Css Styles -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/jquery-ui.min.css" type="text/css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/magnific-popup.css" type="text/css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/style.css" type="text/css">
    </head>
    <script>
        window.onload = function () {
            var selectedProducts = ${selectedProducts};
            var subtotal = 0;
            selectedProducts.forEach(function (product) {
                subtotal += parseFloat(product.total);
            });
            document.getElementById('subtotal').textContent = '$ ' + subtotal.toFixed(2);
            document.getElementById('grandTotal').textContent = '$ ' + subtotal.toFixed(2);
        };
        function calculateTotals() {
            var totalElements = document.querySelectorAll('.total');
            var grandTotal = 0;

            totalElements.forEach(function(element) {
                var totalText = element.textContent.replace('$', '').trim();
                grandTotal += parseFloat(totalText);
            });

            document.getElementById('subtotal').textContent = '$ ' + grandTotal.toFixed(2);
            document.getElementById('grandTotal').textContent = '$ ' + grandTotal.toFixed(2);
        }

        // Call the function to calculate totals when the page loads
        window.onload = calculateTotals;
    </script>
    <style>
        .gender-options {
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .gender-options input[type="radio"] {
            transform: scale(0.5); /* Giảm kích thước của radio button */
            margin-right: 5px; /* Khoảng cách giữa radio button và label */
        }
        .gender-options label {
            font-size: 1rem; /* Giảm kích thước font của label */
        }
    </style>

    <body>
        <jsp:include page="../layout/header.jsp"></jsp:include>
            <!-- Breadcrumb Begin -->
            <div class="breadcrumb-option">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="breadcrumb__links">
                                <a href="./index.jsp"><i class="fa fa-home"></i> Home</a>
                                <span>Shopping cart</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <section class="checkout spad">
                <div class="container">

                    <form action="#" class="checkout__form">
                        <div class="row">
                        <jsp:include page="../layout/sliderSearch.jsp"></jsp:include>
                            <div class="col-lg-4">
                                <h5>Billing detail</h5>
                                <div class="row">
                                    <div class="col-lg-6 col-md-6 col-sm-6">
                                        <div class="checkout__form__input">
                                            <p>Full name <span>*</span></p>
                                            <input type="text" name="fullname" value="${sessionScope.account.getName()}" required="">
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <div class="checkout__form__input">
                                        <p>Gender <span>*</span></p>
                                        <div class="gender-options">
                                            <input type="radio" name="gender" id="unknown" value="0" ${account.gender == 0 ? 'checked' : ''}>
                                            <label for="unknown">Unknown</label>
                                            <input type="radio" name="gender" id="male" value="1" ${account.gender == 1 ? 'checked' : ''}>
                                            <label for="male">Male</label>
                                            <input type="radio" name="gender" id="female" value="2" ${account.gender == 2 ? 'checked' : ''}>
                                            <label for="female">Female</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="checkout__form__input">
                                        <p>Email <span>*</span></p>
                                        <input type="text" name="email" placeholder="Enter email ID" value="${sessionScope.account.getEmail()}" readonly="">
                                    </div>
                                    <div class="checkout__form__input">
                                        <p>Address <span>*</span></p>
                                        <input type="text" name="address" placeholder="Address" value="${sessionScope.account.getAddress()}" required="">
                                    </div>
                                    <div class="checkout__form__input">
                                        <p>Phone Number <span>*</span></p>
                                        <input type="text" name="phone" placeholder="Enter phone number" value="${sessionScope.account.getPhone()}" required="">
                                    </div>
                                    <div class="checkout__form__input">
                                        <p>Note</p>
                                        <input type="text">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-5">
                            <div class="checkout__order">
                                <h5>Your order</h5>
                                <div class="checkout__order__product">
                                    <ul>
                                        <li>
                                            <span class="top__text">Product</span>
                                            <span class="top__text__right">Total</span>
                                        </li>
                                            <c:forEach var="product" items="${selectedProducts}">
                                                <li>${product.productName}<span>$ ${product.total}</span></li>
                                                </c:forEach>
                                    </ul>
                                </div>
                                <div class="checkout__order__total">
                                    <ul>
                                        <li>Subtotal <span id="subtotal">$ ${subtotal}</span></li>
                                        <li>Total <span id="grandTotal">$ ${subtotal}</span></li>
                                    </ul>
                                </div>
                                <button type="submit" class="site-btn">Place oder</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </section>
        <jsp:include page="../layout/footer.jsp"></jsp:include>
            <div class="search-model">
                <div class="h-100 d-flex align-items-center justify-content-center">
                    <div class="search-close-switch">+</div>
                    <form class="search-model-form">
                        <input type="text" id="search-input" placeholder="Search here.....">
                    </form>
                </div>
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
