<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Ashion Template">
        <meta name="keywords" content="Ashion, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Order Info</title>
        <jsp:include page="../layout/header.jsp"></jsp:include>
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
    <style>
        .gender-options {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .gender-options input[type="radio"] {
            transform: scale(0.5);
            margin-right: 5px;
        }

        .gender-options label {
            font-size: 1.3rem;
        }

        .btn-primary,
        .btn-secondary {
            margin: 2px;
        }
    </style>

    <body>


        <div class="breadcrumb-option">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="breadcrumb__links">
                            <a href="./index.jsp"><i class="fa fa-home"></i> Home</a>
                            <span>Order Info</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <section class="checkout spad">
            <div class="container">
                <form action="#" class="checkout__form">
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

                                </div>
                                <form action="ProductServlet" method="get" id="productForm">
                                    <div class="sidebar__filter">
                                        <div class="section-title" style="margin-bottom: 20px">
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
                            <h5>Order Details</h5>
                            <c:forEach var="entry" items="${groupedOrderDetails}">
                                <div class="order">
                                    <div class="row order-header">
                                        <div class="col-lg-6 col-md-6 col-sm-6">
                                            <div class="checkout__form__input">
                                                <p>Order ID: <span>${entry.key}</span></p>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-6">
                                            <div class="checkout__form__input">
                                                <p>Order Date: <span>${entry.value[0].orderDate}</span></p>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-md_6 col-sm-6">
                                            <div class="checkout__form__input">
                                                <p>Total Cost: <span>${entry.value[0].totalAmount}</span></p>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-6">
                                            <div class="checkout__form__input">
                                                <p>Status: <span>${orderStatus}</span></p>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-6">
                                            <div class="checkout__form__input">
                                                <p>Full Name <span>*</span></p>
                                                <input type="text" name="fullname" value="${entry.value[0].fullName}" required>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-6">
                                            <div class="checkout__form__input">
                                                <p>Gender <span>*</span></p>
                                                <div class="gender-options" >
                                                    <input type="radio" name="gender${entry.key}" value="true" ${entry.value[0].gender == 1 ? 'checked' : ''}>
                                                    <label for="female">Female</label>
                                                    <input type="radio" name="gender${entry.key}" value="false" ${entry.value[0].gender == 0 ? 'checked' : ''}>
                                                    <label for="male">Male</label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-lg-6 col-md-6 col-sm-6">
                                            <div class="checkout__form__input">
                                                <p>Email <span>*</span></p>
                                                <input type="text" name="email" value="${entry.value[0].email}" readonly>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-6">
                                            <div class="checkout__form__input">
                                                <p>Mobile <span>*</span></p>
                                                <input type="text" name="mobile" value="${entry.value[0].phone}" required>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="order-products">
                                        <h5>Ordered Products</h5>
                                        <table class="table table-striped">
                                            <thead>
                                                <tr>
                                                    <th>Thumbnail</th>
                                                    <th>Name</th>
                                                    <th>Category</th>
                                                    <th>Unit Price</th>
                                                    <th>Quantity</th>
                                                    <th>Total Cost</th>
                                                    <th>Actions</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="product" items="${entry.value}">
                                                    <tr>
                                                        <td><img src="${pageContext.request.contextPath}/${product.productThumbnail}" style="width:50px;height:50px;"></td>
                                                        <td>${product.productName}</td>
                                                        <td>${product.productCategory}</td>
                                                        <td>${product.price}</td>
                                                        <td>${product.quantity}</td>
                                                        <td>${product.totalPrice}</td>
                                                        <td>
                                                            <button type="button" class="btn btn-primary" onclick="window.location.href = 'ProductDetail?productId=${product.productID}'">Re-Buy</button>
                                                            <c:if test="${orderStatus == 'Delivered'}">
                                                                <c:choose>
                                                                    <c:when test="${entry.value[0].checkFeedback}">
                                                                        <button type="button" class="btn btn-secondary" onclick="window.location.href = 'FeedBack?action=view&id=${entry.value[0].id}'">View Feedback</button>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <button type="button" class="btn btn-secondary" onclick="window.location.href = 'FeedBack?id=${entry.value[0].id}'">Send Feedback</button>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </c:if>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="order-actions">
                                        <button type="button" class="btn btn-secondary" onclick="window.location.href = 'order?orderId=${entry.key}'">Back to order</button>
                                        <c:if test="${entry.value[0].status == '1' }">
                                            <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#cancelModal" data-orderid="${entry.key}">Cancel Order</button>
                                        </c:if>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </form>
            </div>
        </section>

        <!-- Modal -->
        <div class="modal fade" id="cancelModal" tabindex="-1" role="dialog" aria-labelledby="cancelModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="cancelModalLabel">Cancel Order</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        Are you sure you want to cancel this order?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
                        <button type="button" class="btn btn-danger" id="confirmCancel">Yes</button>
                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="../layout/footer.jsp"></jsp:include>

            <script src="${pageContext.request.contextPath}/asset/js/jquery-3.3.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/asset/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/asset/js/main.js"></script>
        <script>
                                            $(document).ready(function () {
                                                $('#cancelModal').on('show.bs.modal', function (event) {
                                                    var button = $(event.relatedTarget);
                                                    var orderId = button.data('orderid');
                                                    var modal = $(this);
                                                    modal.find('#confirmCancel').data('orderid', orderId);
                                                });

                                                $('#confirmCancel').click(function () {
                                                    var orderId = $(this).data('orderid');
                                                    window.location.href = 'orderInfo?action=cancelOrder&orderId=' + orderId;
                                                });
                                            });
        </script>
    </body>
</html>