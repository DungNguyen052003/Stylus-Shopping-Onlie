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
    </head>

    <body>

        <!-- Header -->
        <jsp:include page="../layout/header.jsp"></jsp:include>

            <!-- Breadcrumb Begin -->
            <div class="breadcrumb-option">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="breadcrumb__links">
                                <a href="index"><i class="fa fa-home"></i> Home</a>
                                <a href="#">${product.cateID.name} </a>
                            <span>${product.productName}</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Breadcrumb End -->

        <!-- Product Details Section Begin -->
        <form action="InfoProduct?action=updateProduct" method="POST">
            <section class="product-details spad">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="product__details__pic">
                                <div class="product__details__pic__left product__thumb nice-scroll">
                                    <c:forEach var="productImage" items="${productList}">
                                        <a class="pt" href="${productImage.productImages}" data-fancybox="gallery">
                                            <img src="${productImage.productImages}" alt="">
                                        </a>
                                    </c:forEach>
                                </div>

                                <div class="product__details__slider__content">
                                    <div class="product__details__pic__slider owl-carousel">
                                        <c:forEach var="product" items="${productList}">
                                            <a href="${product.productImages}" data-fancybox="gallery">
                                                <img class="product__big__img" src="${product.productImages}" alt="">
                                            </a>
                                        </c:forEach>
                                    </div>
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



                        <div class="col-lg-6">
                            <div class="product__details__text">
                                <div name="name">
                                    <input type="text" id="productNameInput" value="${product.productName}" style="color: #C0392B; border: none; background: none; font-size: 25px; width: 100%;font-weight: bold;">
                                </div>
                                <div class="rating">
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <span>( 138 reviews )</span>
                                </div>
                                <div class="product__details__price" name="price">
                                    <span style="color: #C0392B">$</span>
                                    <input type="text" id="salePriceInput" value="${product.salePrice}" style="border: none; background: none; font-size: inherit; width: 100px;color: #C0392B;">
                                    <span>$</span> <span>${product.price}</span>
                                </div>

                                <p name="brief">
                                    <strong>Brief Information:</strong>
                                    <input type="text" id="briefInfoInput" value="${product.briefInfomation}" style="border: none; background: none; font-size: inherit; width: 100%;">
                                </p>
                                <p name="description">
                                    <strong>Description:</strong>
                                    <textarea id="descriptionInput" style="border: none; background: none; font-size: inherit; width: 100%; height: 150px; resize: vertical;">${product.description}</textarea>
                                </p>

                                <form action="UpdateProductDetails" method="post">
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
                                                        <input type="number" id="quantity_${detail.productDetailID}" value="${detail.quantity}" min="0"
                                                               onchange="updateQuantity(${detail.productDetailID}, this.value, 'updateQuantity')" style="width: 60px;">
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        <script>
                                            function updateQuantity(detailId, newQuantity, action) {
                                                var xhr = new XMLHttpRequest();
                                                xhr.open("POST", "InfoProduct", true);
                                                xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                                                xhr.onreadystatechange = function () {
                                                    if (xhr.readyState === 4 && xhr.status === 200) {

                                                    }
                                                };
                                                xhr.send("detailId=" + detailId + "&quantity=" + newQuantity + "&action=" + action);
                                            }
                                        </script>
                                        </tbody>
                                    </table>
                                </form>
                                <br/>
                                <hr class="my-3">
                                <div class="product__details__button" style="display: flex; align-items: center; justify-content: space-between; gap: 20px;">
                                    <div style="display: flex; align-items: center; gap: 20px;">
                                        <form id="statusForm" action="InfoProduct" method="POST">
                                            <div class="text-center align-middle" name="status" data-status="${product.status}">
                                                <span><strong>Status: </strong></span>
                                                <i id="statusToggle" class="fa cursor-pointer
                                                   <c:choose>
                                                       <c:when test="${product.status eq 1}">fa-toggle-on text-secondary</c:when>
                                                       <c:otherwise>fa-toggle-off</c:otherwise>
                                                   </c:choose>"
                                                   data-id="${product.productID}" 
                                                   data-status="${product.status}" 
                                                   onclick="toggleStatus(this)">
                                                </i>
                                            </div>
                                        </form>
                                        <script>
                                            function toggleStatus(element) {
                                                const productId = element.getAttribute('data-id');
                                                let currentStatus = parseInt(element.getAttribute('data-status'));

                                                let newStatus = currentStatus === 1 ? 0 : 1;

                                                element.setAttribute('data-status', newStatus);
                                                if (newStatus === 1) {
                                                    element.classList.remove('fa-toggle-off');
                                                    element.classList.add('fa-toggle-on', 'text-secondary');
                                                } else {
                                                    element.classList.remove('fa-toggle-on', 'text-secondary');
                                                    element.classList.add('fa-toggle-off');
                                                }
                                                $.ajax({
                                                    url: 'InfoProduct',
                                                    type: 'POST',
                                                    data: {
                                                        action: 'updateStatus',
                                                        id: productId,
                                                        status: newStatus
                                                    },
                                                    success: function (response) {
                                                        console.log('Status updated successfully');
                                                    },
                                                    error: function (xhr, status, error) {
                                                        console.error('Error updating status:', error);
                                                    }
                                                });
                                            }
                                        </script>
                                        <form id="statusForm" action="InfoProduct" method="POST">
                                            <ul style="list-style-type: none; padding-left: 80px;" name="feat">
                                                <input type="hidden" value="${product.productID}" name="id"/>
                                                <input type="hidden" value="${product.featured}" name="featured"/>
                                                <li style="margin-left: 10px;">
                                                    <span><strong>Feature: </strong></span>
                                                    <button type="button" style="text-decoration: none; font-size: 24px; border: 0" onclick="toggleFeatured()">
                                                        <i id="heartIcon" class="fa-solid fa-heart${product.featured == 1 ? ' featured' : ''}" style="color:${product.featured == 1 ? '#C0392B' : '#CCC'}"></i>
                                                    </button>
                                                </li>
                                            </ul>
                                        </form>
                                        <script>
                                            function toggleFeatured() {
                                                var heartIcon = document.getElementById('heartIcon');
                                                var currentClass = heartIcon.classList.contains('featured') ? 'featured' : '';

                                                if (currentClass === 'featured') {
                                                    heartIcon.style.color = '#CCC';
                                                    heartIcon.classList.remove('featured');
                                                } else {
                                                    heartIcon.style.color = '#C0392B';
                                                    heartIcon.classList.add('featured');
                                                }

                                                const productId = document.querySelector('input[name="id"]').value;
                                                const newFeature = currentClass === 'featured' ? 0 : 1;

                                                $.ajax({
                                                    url: 'InfoProduct',
                                                    type: 'POST',
                                                    data: {action: 'updateFeatured', id: productId, featured: newFeature},
                                                    success: function (response) {
                                                        console.log('Featured status updated successfully');
                                                        // Update the hidden input value for future updates
                                                        document.querySelector('input[name="featured"]').value = newFeature;
                                                    },
                                                    error: function (xhr, status, error) {
                                                        console.error('Error updating featured status:', error);
                                                    }
                                                });
                                            }
                                        </script>

                                    </div>

                                    <button type="button" onclick="updateProduct()" style="background-color: #C0392B; color: white; padding: 10px 20px; border: none; border-radius: 5px;">Update</button>
                                </div>
                            </div>
                        </div>

                        <script>
                            function updateProduct() {
                                const productName = document.getElementById('productNameInput').value;
                                const salePrice = document.getElementById('salePriceInput').value;
                                const briefInfo = document.getElementById('briefInfoInput').value;
                                const description = document.getElementById('descriptionInput').value;
                                const productId = ${product.productID};
                                const quantities = Array.from(document.getElementsByClassName('quantityInput')).map(input => ({
                                        colorId: input.getAttribute('data-color-id'),
                                        quantity: input.value
                                    }));

                                $.ajax({
                                    url: 'InfoProduct',
                                    type: 'POST',
                                    data: {
                                        action: 'updateProduct',
                                        id: productId,
                                        productName: productName,
                                        salePrice: salePrice,
                                        briefInfomation: briefInfo,
                                        description: description,
                                        quantities: JSON.stringify(quantities)
                                    },
                                    success: function (response) {
                                        alert('Product updated successfully');
                                    },
                                    error: function (xhr, status, error) {
                                        console.error('Error updating product:', error);
                                    }
                                });
                            }
                        </script>


                    </div>
                </div>

                <!-- Cropper.js CSS -->
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/cropperjs/1.5.12/cropper.min.css"/>

                <!-- Cropper.js JS -->
                <script src="https://cdnjs.cloudflare.com/ajax/libs/cropperjs/1.5.12/cropper.min.js"></script>

            </section>
        </form>
        <!-- Product Details Section End -->









        <!-- Footer Section Begin -->
        <jsp:include page="../layout/footer.jsp"/>
        <!-- Footer Section End -->




        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.1/dist/js/bootstrap.bundle.min.js"></script>
    </body>

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
</html>