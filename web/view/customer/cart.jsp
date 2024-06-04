<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zxx">

    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Ashion Template">
        <meta name="keywords" content="Ashion, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Cart</title>

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
        function updateQuantity(index, cartID, quantity) {
            updateTotal(index); // Update the total when the quantity changes
            console.log('Updating quantity:', {index, cartID, quantity}); // Debug line
            const xhr = new XMLHttpRequest();
            xhr.open('POST', 'updateCartQuantity', true);
            xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4) {
                    if (xhr.status === 200) {
                        console.log('Update successful');
                    } else {
                        console.error('Update failed');
                    }
                }
            };
            xhr.send("cartID=" + encodeURIComponent(cartID) + "&quantity=" + encodeURIComponent(quantity));

        }

        function updateTotal(rowId) {
            var quantity = document.getElementById('quantity-' + rowId).value;
            var price = document.getElementById('price-' + rowId).innerText;
            var total = parseFloat(price.replace('$', '')) * parseInt(quantity);
            document.getElementById('total-' + rowId).innerText = '$ ' + total.toFixed(2);
            updateGrandTotal(); // Update the grand total whenever an individual total is updated
        }

        function updateGrandTotal() {
            var selectedCheckboxes = document.querySelectorAll('input[name="selectedProducts"]:checked');
            var grandTotal = 0;
            selectedCheckboxes.forEach(function (checkbox) {
                var row = checkbox.closest('tr');
                var total = parseFloat(row.querySelector('.cart__total').textContent.replace('$', '').trim());
                grandTotal += total;
            });
            document.getElementById('grandTotal').textContent = '$ ' + grandTotal.toFixed(2);
            document.getElementById('subtotal').textContent = '$ ' + grandTotal.toFixed(2);
        }

        window.onload = function () {
            updateGrandTotal();
        };

        function proceedToCheckout() {
            var selectedCheckboxes = document.querySelectorAll('input[name="selectedProducts"]:checked');
            if (selectedCheckboxes.length === 0) {
                alert('Please select at least one product to proceed.');
                return;
            }

            var selectedProducts = [];
            var subtotal = 0;
            selectedCheckboxes.forEach(function (checkbox) {
                var row = checkbox.closest('tr');
                var product = {
                    cartID: checkbox.value,
                    productName: row.querySelector('.cart__product__item__title h6').innerText,
                    sizeName: row.querySelector('.cart__size').innerText,
                    colorName: row.querySelector('.cart__color').innerText,
                    price: row.querySelector('.cart__price').innerText.replace('$', '').trim(),
                    quantity: row.querySelector('.cart__quantity input').value,
                    total: row.querySelector('.cart__total').innerText.replace('$', '').trim()
                };
                subtotal += parseFloat(product.total);
                selectedProducts.push(product);
            });

            var form = document.createElement('form');
            form.method = 'POST';
            form.action = 'cartContact'; // Submit to the servlet

            var input = document.createElement('input');
            input.type = 'hidden';
            input.name = 'selectedProducts';
            input.value = JSON.stringify(selectedProducts);
            form.appendChild(input);

            var subtotalInput = document.createElement('input');
            subtotalInput.type = 'hidden';
            subtotalInput.name = 'subtotal';
            subtotalInput.value = subtotal.toFixed(2);
            form.appendChild(subtotalInput);

            document.body.appendChild(form);
            form.submit();
        }
    </script>

    <body>
        <!-- Page Preloader -->

        <!-- Header Section Begin -->
        <jsp:include page="../layout/header.jsp" />
        <!-- Header Section End -->

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
        <section class="shop-cart spad">
            <div class="container">
                <div class="row">
                    <jsp:include page="../layout/sliderSearch.jsp"></jsp:include>
                        <div class="col-lg-9">
                            <div class="shop__cart__table">
                                <table>
                                    <thead>
                                        <tr>
                                            <th>Select</th>
                                            <th>Product</th>
                                            <th>Size</th>
                                            <th>Color</th>
                                            <th>Price</th>
                                            <th>Quantity</th>
                                            <th>Total</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${cartDetail}" var="c" varStatus="status">
                                        <tr>
                                            <td class="cart__select">
                                                <input type="checkbox" name="selectedProducts" value="${c.cartID}" onchange="updateGrandTotal()">
                                            </td>
                                            <td class="cart__product__item">
                                                <img src="img/shop-cart/cp-1.jpg" alt="">
                                                <div class="cart__product__item__title">
                                                    <h6>${c.productName}</h6>
                                                    <div class="rating">
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                    </div>
                                                </div>
                                            </td>
                                            <td class="cart__size">${c.sizeName}</td>
                                            <td class="cart__color">${c.colorName}</td>
                                            <td class="cart__price" id="price-${status.index}">$ ${c.price}</td>
                                            <td class="cart__quantity">
                                                <div class="pro-qty">
                                                    <input type="number" id="quantity-${status.index}" name="quantity" value="${c.quantity}" min="1" max="${c.remainingAmount}" onchange="updateQuantity(${status.index}, ${c.cartID}, this.value)">
                                                </div>
                                            </td>
                                            <td class="cart__total" id="total-${status.index}">$ <c:out value="${c.price * c.quantity}" /></td>
                                            <td class="cart__close">
                                                <a href="deleteCartDetail?cartID=${c.cartID}">
                                                    <span class="icon_close"></span>
                                                </a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-6">
                                <div class="cart__btn">
                                    <a href="Home">Continue Shopping</a>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="discount__content">
                                    <h6>Discount codes</h6>
                                    <form action="#">
                                        <input type="text" placeholder="Enter your coupon code">
                                        <button type="submit" class="site-btn">Apply</button>
                                    </form>
                                </div>
                            </div>
                            <div class="col-lg-4 offset-lg-2">
                                <div class="cart__total__procced">
                                    <h6>Cart total</h6>
                                    <ul>
                                        <li>Subtotal <span id="subtotal">$ 0.0</span></li>
                                        <li>Total <span id="grandTotal">$ 0.0</span></li>
                                    </ul>
                                    <button type="button" class="primary-btn" onclick="proceedToCheckout()">Proceed to checkout</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Shop Cart Section End -->

        <!-- Footer Section Begin -->
        <footer class="footer">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-md-6 col-sm-6">
                        <div class="footer__about">
                            <div class="footer__logo">
                                <a href="./index.jsp"><img src="img/logo.png" alt=""></a>
                            </div>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt cilisis.</p>
                            <a href="#"><img src="img/payment.png" alt=""></a>
                        </div>
                    </div>
                    <div class="col-lg-2 offset-lg-1 col-md-3 col-sm-6">
                        <div class="footer__widget">
                            <h6>Quick links</h6>
                            <ul>
                                <li><a href="#">About</a></li>
                                <li><a href="#">Blog</a></li>
                                <li><a href="#">Contact</a></li>
                                <li><a href="#">FAQ</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-3 col-sm-6">
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
                    <div class="col-lg-4 col-md-8 col-sm-6">
                        <div class="footer__newslatter">
                            <h6>NEWSLETTER</h6>
                            <form action="#">
                                <input type="text" placeholder="Email">
                                <button type="submit" class="site-btn">Subscribe</button>
                            </form>
                            <div class="footer__social">
                                <a href="#"><i class="fa fa-facebook"></i></a>
                                <a href="#"><i class="fa fa-instagram"></i></a>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                                <a href="#"><i class="fa fa-pinterest"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- Footer Section End -->

        <!-- Js Plugins -->
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
