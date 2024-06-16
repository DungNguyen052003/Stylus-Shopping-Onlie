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
        <link href="../../asset/bootstrap.min.css" rel="stylesheet"/>
        <!-- Custom styles for this template -->
        <link href="../../asset/jumbotron-narrow.css" rel="stylesheet">      
        <script src="../../asset/jquery-1.11.3.min.js"></script>

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

            totalElements.forEach(function (element) {
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
        .table {
            width: 100%;
            margin-bottom: 1rem;
            color: #212529;
        }

        .table th,
        .table td {
            padding: 0.75rem;
            vertical-align: top;
            border-top: 1px solid #dee2e6;
        }

        .table thead th {
            vertical-align: bottom;
            border-bottom: 2px solid #dee2e6;
        }

        .table tbody + tbody {
            border-top: 2px solid #dee2e6;
        }

        .list-group-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .site-btn {
            background-color: #f39c12;
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            margin-top: 20px;
            display: block;
            width: 100%;
            text-align: center;
        }

        .site-btn:hover {
            background-color: #e67e22;
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
                    <div class="checkout__form">
                        <form action="/ProjectStylus/vnpayajax" id="frmCreateOrder" method="post">
                            <div class="row">
                                <div class="col-lg-5">

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
                                        <div class="cart__btn">
                                            <a href="cartDetails?id=${sessionScope.account.customerID}">Continue Shopping</a>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <div class="col-lg-7">
                                <div class="checkout__order">
                                    <h5>Your order</h5>
                                    <div class="checkout__order__product">
                                        <table class="table table-bordered">
                                            <thead>
                                                <tr>
                                                    <th>Product</th>
                                                    <th>Price</th>
                                                    <th>Quantity</th>
                                                    <th>Total</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="product" items="${sessionScope.selectedProducts}">
                                                    <tr>
                                                        <td>${product.productName}</td>
                                                        <td>$ ${product.price}</td>
                                                        <td>${product.quantity}</td>
                                                        <td>$ ${product.total}</td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>

                                    <div class="checkout__order__total">
                                        <ul class="list-group">
                                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                                Subtotal 
                                                <span id="subtotal">$ ${subtotal}</span>
                                            </li>
                                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                                Total 
                                                <span id="grandTotal">$ ${subtotal}</span>
                                                <input type="hidden" id="amount" name="amount" value="${subtotal}">  
                                            </li>
                                        </ul>
                                    </div>
                                    <input type="radio" checked="true" id="bankCode" name="bankCode" value="">
                                    <label for="bankCode">Cổng thanh toán VNPAYQR</label><br>

                                    <button type="submit" class="site-btn">Place order</button>


                                </div>
                            </div>
                        </div>
                    </form>
                </div>
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
        <link href="https://pay.vnpay.vn/lib/vnpay/vnpay.css" rel="stylesheet" />
        <script src="https://pay.vnpay.vn/lib/vnpay/vnpay.min.js"></script>
        <script type="text/javascript">
        $(document).ready(function () {
            $("#frmCreateOrder").submit(function (event) {
                event.preventDefault(); // Prevent the form from submitting normally
                var postData = $(this).serialize();
                var submitUrl = $(this).attr("action");

                $.ajax({
                    type: "POST",
                    url: submitUrl,
                    data: postData,
                    dataType: 'JSON',
                    success: function (x) {
                        if (x.code === '00') {
                            if (window.vnpay) {
                                vnpay.open({width: 768, height: 600, url: x.data});
                            } else {
                                location.href = x.data;
                            }
                        } else {
                            alert(x.Message);
                        }
                    },
                    error: function (xhr, status, error) {
                        console.error("AJAX error: ", status, error);
                        alert("There was an error processing your request. Please try again.");
                    }
                });
            });
        });
        </script>      
    </body>

</html>
