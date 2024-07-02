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
        <jsp:include page="../layout/header4ad.jsp"></jsp:include>
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
<style>
            .modal-content {
                border-radius: 10px;
                overflow: hidden;
            }

            .modal-header {
                background-color: #007bff;
                color: #fff;
                border-bottom: none;
            }

            .modal-header .close {
                color: #fff;
                opacity: 1;
            }

            .modal-body {
                padding: 20px;
            }

            /* Form styles */
            #profileForm .container {
                max-width: 100%;
                padding: 0;
            }

            #profileForm .card {
                border: none;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
                margin-bottom: 20px;
            }

            #profileForm .card-body {
                padding: 20px;
            }

            #profileForm .form-group {
                margin-bottom: 20px;
            }

            #profileForm .form-group label {
                font-weight: 600;
            }

            #profileForm .form-control {
                border-radius: 5px;
                border: 1px solid #ccc;
                padding: 10px;
                font-size: 14px;
            }

            #profileForm .form-control:focus {
                border-color: #007bff;
                box-shadow: none;
            }

            #profileForm .text-primary {
                color: #007bff !important;
            }

            /* Gender radio buttons */
            #profileForm .form-check-inline {
                margin-right: 10px;
            }

            #profileForm .form-check-label {
                font-weight: 400;
                margin-left: 5px;
            }

            /* Buttons */
            #profileForm .btn {
                border-radius: 5px;
                padding: 10px 20px;
                font-size: 14px;
            }

            #profileForm .btn-primary {
                background-color: #007bff;
                border-color: #007bff;
            }

            #profileForm .btn-secondary {
                background-color: #6c757d;
                border-color: #6c757d;
            }

            /* Media Queries */
            @media (max-width: 767.98px) {
                #profileForm .row.gutters {
                    flex-direction: column;
                }

                #profileForm .col-xl-3,
                #profileForm .col-xl-9 {
                    max-width: 100%;
                    flex: 0 0 100%;
                }
            }
            
        </style>
        </head>

        <body>

            <!-- Header -->


            <!-- Breadcrumb Begin -->
            <div class="breadcrumb-option">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="breadcrumb__links">
                                <a href="index"><i class="fa fa-home"></i> Home</a>
                                <a href="ManageProduct">Manage Product </a>
                            <span>${product.productName}</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <form action="InfoProduct?action=updateProduct" method="POST" enctype="multipart/form-data">
            <section class="product-details spad">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="product__details__pic">
                                <div class="product__details__pic__left product__thumb nice-scroll">
                                    <c:forEach var="productImage" items="${productList}" varStatus="status">
                                        <div class="userProfile">
                                            <div class="profile-pic">
                                                <label class="-label" for="file${status.index}">
                                                    <span class="glyphicon glyphicon-camera"></span>
                                                    <span>Change Image</span>
                                                </label>
                                                <input id="file${status.index}" type="file" 
                                                       onchange="updateImage(event, ${status.index}, '${productImage.id}', '${productImage.productImages}')" />
                                                <img src="${productImage.productImages}" alt="" id="output${status.index}" style="border-radius: 0;">
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                                <div class="product__details__slider__content"> 
                                    <div class="product__details__pic__slider owl-carousel">
                                        <div class="userProfile">
                                            <div class="userProfile2">
                                                <div class="profile-pic">
                                                    <label class="-label" for="fileTN">
                                                        <span class="glyphicon glyphicon-camera"></span>    
                                                        <span>Change Thumbnail</span>
                                                    </label>
                                                    <input id="fileTN" type="file" onchange="loadFile2(event)" name="thumbnail" " />

                                                    <img src="${product.thumbnail}" alt="" id="outputTN" style="border-radius: 0; position: static; height: auto;" class="product__big__img_">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="product__details__text">
                                <input type="hidden" value="${product.productID}" name="productID">
                                <input type="hidden" value="${product.thumbnail}" name="currentThumbnail">
                                <div >
                                    <input type="text" name="name" id="productNameInput" value="${product.productName}" style="color: #C0392B; border: none; background: none; font-size: 25px; width: 100%;font-weight: bold;">
                                </div>
                                <div class="rating">
                                    <c:forEach var="i" begin="1" end="5">
                                        <i class="fa fa-star" style="color: <c:out value='${i <= product.starRating ? "#FFD700" : "#CCCCCC"}'/>;"></i>
                                    </c:forEach>
                                </div>
                                <div class="product__details__price" >
                                    <span style="color: #C0392B">$</span>
                                    <input type="text" id="priceInput" value="${product.price}" name="price" style="border: none; background: none; font-size: inherit; width: 100px;color: #C0392B;">
                                </div>
                                <p >
                                    <strong>Brief Information:</strong>
                                    <input type="text" id="briefInfoInput" name="brief" value="${product.briefInfomation}" style="border: none; background: none; font-size: inherit; width: 100%;">
                                </p>
                                <p >
                                    <strong>Description:</strong>
                                    <textarea id="descriptionInput" name="description" style="border: none; background: none; font-size: inherit; width: 100%; height: 150px; resize: vertical;">${product.description}</textarea>
                                </p>

                                <label for="category">Category:</label>
                                <div class="form-group">
                                    <select class="custom-select" name="category" id="cateInput">
                                        <optgroup label="Women">
                                            <c:forEach items="${categoriesWomen}" var="category">
                                                <option value="${category.cateID}" <c:if test="${category.cateID == product.cateID.cateID}">selected</c:if>>${category.name}</option>
                                            </c:forEach>
                                        </optgroup>
                                        <optgroup label="Men">
                                            <c:forEach items="${categoriesMen}" var="category">
                                                <option value="${category.cateID}" <c:if test="${category.cateID == product.cateID.cateID}">selected</c:if>>${category.name}</option>
                                            </c:forEach>
                                        </optgroup>
                                    </select>
                                </div>
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

                                    <button type="submit"  style="background-color: #C0392B; color: white; padding: 10px 20px; border: none; border-radius: 5px;">Update</button>
                                </div>
                            </div>
                        </div>


                    </div>
                </div>
                <!-- Cropper.js CSS -->
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/cropperjs/1.5.12/cropper.min.css"/>
                <!-- Cropper.js JS -->
                <script src="https://cdnjs.cloudflare.com/ajax/libs/cropperjs/1.5.12/cropper.min.js"></script>
            </section>
        </form>
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
    <script>
                                            function updateImage(event, index, productImageId, currentImage) {
                                                var image = document.getElementById("output" + index);
                                                image.src = URL.createObjectURL(event.target.files[0]);
                                                const category = ${product.cateID.cateID};
                                                // Gửi form bằng JavaScript
                                                var formData = new FormData();
                                                formData.append('image', event.target.files[0]);
                                                formData.append('productImageId', productImageId);
                                                formData.append('category', category);
                                                formData.append('currentImage', currentImage);
                                                formData.append('action', "updateImage");
                                                fetch('InfoProduct', {
                                                    method: 'POST',
                                                    body: formData
                                                }).then(response => response.text())
                                                        .then(result => {
                                                            console.log('Success:', result);
                                                        })
                                                        .catch(error => {
                                                            console.error('Error:', error);
                                                        });
                                            }
                                            var loadFile2 = function (event) {
                                                var image = document.getElementById("outputTN");
                                                image.src = URL.createObjectURL(event.target.files[0]);
                                            };
    </script>
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
</html>