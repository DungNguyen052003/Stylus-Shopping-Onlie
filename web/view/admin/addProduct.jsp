<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Modal -->


<!DOCTYPE html>

<html lang="en" class="light-style layout-menu-fixed layout-compact " dir="ltr" data-theme="theme-default" data-assets-path="../../assets/" data-template="horizontal-menu-template">

    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

        <meta name="description" content="Most Powerful &amp; Comprehensive Bootstrap 5 HTML Admin Dashboard Template built for developers!" />
        <meta name="keywords" content="dashboard, bootstrap 5 dashboard, bootstrap 5 design, bootstrap 5">
        <!-- Canonical SEO -->
        <link rel="canonical" href="https://themeselection.com/item/sneat-aspnet-core-admin-template/">

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

        <!-- Favicon -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css2?family=Cookie&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800;900&display=swap"
              rel="stylesheet">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" media="screen" href="search_box.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <link rel="stylesheet" href="asset/css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="asset/css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="asset/css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="asset/css/jquery-ui.min.css" type="text/css">
        <link rel="stylesheet" href="asset/css/magnific-popup.css" type="text/css">
        <link rel="stylesheet" href="asset/css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="asset/css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="asset/css/style.css?id=11" type="text/css">

        <!-- Quill CSS -->
        <link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

        <style>
            body {
                margin: 0;
                padding: 0;
                overflow-x: hidden; /* Prevent horizontal scrollbar */
            }
            .container-xxl, .content-wrapper, .layout-page, .layout-container {
                max-width: 100%; /* Ensure container does not exceed viewport width */
                overflow-x: hidden; /* Prevent horizontal scrollbar */
            }
        </style>
    </head>

    <body>
        <!-- Header -->
        <jsp:include page="../layout/header4ad.jsp"></jsp:include>
        <div class="breadcrumb-option">
                
            <div class="row" style="padding: 15px;">
                        <div class="col-lg-12">
                            <div class="breadcrumb__links">
                                <a href="index"><i class="fa fa-home"></i> Home</a>
                                <a href="ManageProduct">Manage Product </a>
                            <span>Add New Product</span>
                        </div>
                    </div>
                
            </div>
        </div>

            <form action="AddProduct" method="POST" id="addProductForm" enctype="multipart/form-data">
                <!--                <input type="hidden" name="action" value="addProduct">-->
                <!-- Layout container -->
                <div class="layout-page"style="padding: 15px;">
                    <!-- Content wrapper -->
                    <div class="content-wrapper">
                        <!-- Content -->
                        <div class="container-xxl flex-grow-1 container-p-y">
                            <div class="app-ecommerce">
                                <!-- Add Product -->
                                <div class="d-flex flex-wrap justify-content-center align-items-center mb-3">
                                    <div class="d-flex flex-column justify-content-center text-center mx-auto">
                                        <h4 class="mb-1 mt-3">Add New Product</h4>
                                        <p class="text-muted">The order is placed on your store</p>
                                    </div>
                                </div>
                                <div class="row">
                                    <!-- Cột đầu tiên-->
                                    <div class="col-12 col-lg-8">
                                        <!-- Thông tin sản phẩm -->
                                        <div class="card mb-4">
                                            <div class="card-header">
                                                <h5 class="card-title mb-0">Product information</h5>
                                            </div>
                                            <div class="card-body">
                                                <div class="mb-3">
                                                    <label class="form-label" for="ecommerce-product-name">Name</label>
                                                    <input type="text" class="form-control" id="nameInput" placeholder="Product Name" name="productTitle" aria-label="Tên sản phẩm">
                                                    <div id="nameError" class="error" style="color: red"></div>
                                                </div>
                                                <!-- Thông tin ngắn gọn -->
                                                <div class="mb-3">
                                                    <label class="form-label">Brief Information <span class="text-muted">(Option)</span></label>
                                                    <textarea id="ecommerce-category-description" class="form-control" rows="4" placeholder="Enter your brief information here..." name="brief"></textarea>
                                                </div>
                                                <!-- Mô tả -->
                                                <div class="mb-3">
                                                    <label class="form-label">Description <span class="text-muted">(Option)</span></label>
                                                    <textarea id="ecommerce-category-description" class="form-control" rows="4" placeholder="Enter your description here..." name="description"></textarea>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- /Thông tin sản phẩm -->

                                        <!-- Hình ảnh -->
                                        <div class="card mb-4">
                                            <div class="card-header d-flex justify-content-between align-items-center">
                                                <h5 class="mb-0 card-title">Image</h5>
                                            </div>
                                            <div class="card-body">
                                                <div class="dz-message needsclick my-5">
                                                    <div class="custom-file">
                                                        <input type="file" class="custom-file-input" id="imageEdit" name="image" onchange="displayImage(this)">
                                                        <label class="custom-file-label">Choose file</label>
                                                    </div>
                                                    <img id="previewImage2" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="Preview" style="display: none; max-width: 300px; max-height: 300px;">
                                                    <input type="hidden" id="currentImage" name="currentImage" value="">
                                                </div>
                                            </div>
                                        </div>
                                        <!-- /Hình ảnh -->
                                        <!-- Biến thể -->
                                        <div class="card mb-4">
                                            <div class="card-header">
                                                <h5 class="card-title mb-0">Variant</h5>
                                            </div>
                                            <div class="card-body">
                                                <div id="variant-container">
                                                    <div class="variant-item">
                                                        <div class="row mb-3">
                                                            <div class="mb-3 col-4">
                                                                <label class="form-label" for="size-0">Size</label>
                                                                <select id="size-0" class="form-select" name="size">

                                                                    <option value="">Choose size</option>
                                                                <c:forEach var="size" items="${listSize}">
                                                                    <option value="${size.id}">${size.name}</option>
                                                                </c:forEach>

                                                            </select>
                                                        </div>
                                                        <div class="mb-3 col-4">
                                                            <label class="form-label" for="color-0">Color</label>
                                                            <select id="color-0" class="form-select" name="color">
                                                                <option value="">Choose color</option>
                                                                <c:forEach var="color" items="${listColor}">
                                                                    <c:choose>
                                                                        <c:when test="${color.id == 1}">
                                                                            <option value="${color.id}" style="background-color: red; color: white;">${color.name}</option>
                                                                        </c:when>
                                                                        <c:when test="${color.id == 2}">
                                                                            <option value="${color.id}" style="background-color: green; color: white;">${color.name}</option>
                                                                        </c:when>
                                                                        <c:when test="${color.id == 3}">
                                                                            <option value="${color.id}" style="background-color: blue; color: white;">${color.name}</option>
                                                                        </c:when>
                                                                        <c:when test="${color.id == 4}">
                                                                            <option value="${color.id}" style="background-color: pink; color: black;">${color.name}</option>
                                                                        </c:when>
                                                                        <c:when test="${color.id == 5}">
                                                                            <option value="${color.id}" style="background-color: black; color: white;">${color.name}</option>
                                                                        </c:when>
                                                                        <c:when test="${color.id == 6}">
                                                                            <option value="${color.id}" style="background-color: white; border: 1px solid black; color: black;">${color.name}</option>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <option value="${color.id}" style="background-color: gray; color: white;">${color.name}</option>
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                        <div class="mb-3 col-4" style="display: flex; align-items: center;">
                                                            <label class="form-label" for="quantity-0" style="margin-right: 10px;">Quantity</label>
                                                            <input type="number" id="quantity-0" class="form-control" name="quantity" placeholder="Quantity"/>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <button type="button" id="add-variant" class="btn btn-primary">Add more options</button>
                                        </div>
                                    </div>
                                    <!-- Các phần khác của form -->
                                    <script>
                                        $(document).ready(function () {
                                            let sizeOptions = $('#size-0').html();
                                            let colorOptions = $('#color-0').html();
                                            let variantCount = 1;
                                            $('#add-variant').click(function () {
                                                let variantItem = `
                                                    <div class="variant-item">
                                                        <div class="row mb-3">
                                                            <div class="mb-3 col-4">
                                                                <label class="form-label" for="size-` + variantCount + `">Size</label>
                                                                <select id="size-` + variantCount + `" class="form-select" name="size">
                                                                   ` +
                                                        sizeOptions + `
                                                                </select>
                                                            </div>
                                                            <div class="mb-3 col-4">
                                                                <label class="form-label" for="color-` + variantCount + `">Color</label>
                                                                <select id="color-` + variantCount + `" class="form-select" name="color">
                                                                   ` +
                                                        colorOptions + `
                                                                </select>
                                                            </div>
                                                            <div class="mb-3 col-4" style="display: flex; align-items: center;">
                                                                <label class="form-label" for="quantity-` + variantCount + `" style="margin-right: 10px;">Quantity</label>
                                                                <input type="number" id="quantity-` + variantCount + `" class="form-control" name="quantity" placeholder="Quantity"/>
                                                            </div>
                                                        </div>
                                                    </div>`;
                                                $('#variant-container').append(variantItem);
                                                variantCount++;
                                            });
                                        });
                                    </script>
                                </div>
                                <!-- /Cột đầu tiên -->
                                <!-- Cột thứ hai -->
                                <div class="col-12 col-lg-4">
                                    <!-- Thẻ Giá -->
                                    <div class="card mb-4">
                                        <div class="card-header">
                                            <h5 class="card-title mb-0">Other</h5>
                                        </div>
                                        <div class="card-body">
                                            <!-- Giá cơ bản -->
                                            <div class="mb-3">
                                                <label class="form-label" for="ecommerce-product-price">Price</label>
                                                <input type="text" class="form-control" id="priceInput" placeholder="Price" name="productPrice" aria-label="Giá sản phẩm">
                                                <div id="priceError" class="error" style="color: red"></div>
                                            </div>
                                            <!-- Trạng thái -->
                                            <div class="d-flex justify-content-between align-items-center border-top pt-3">
                                                <label class="form-label">Status</label>
                                                <div class="d-flex justify-content-end">
                                                    <label class="switch switch-primary switch-sm me-4 pe-2">
                                                        <input type="checkbox" class="switch-input" checked="" name="status">
                                                        <span class="switch-toggle-slider">
                                                            <span class="switch-on">
                                                                <span class="switch-off"></span>
                                                            </span>
                                                        </span>
                                                    </label>
                                                </div>
                                            </div>
                                            <!-- Tính năng -->
                                            <div class="d-flex justify-content-between align-items-center border-top pt-3">
                                                <label class="form-label">Feature</label>
                                                <div class="d-flex justify-content-end">
                                                    <label class="switch switch-primary switch-sm me-4 pe-2">
                                                        <input type="checkbox" class="switch-input" checked="" name="feature">
                                                        <span class="switch-toggle-slider">
                                                            <span class="switch-on">
                                                                <span class="switch-off"></span>
                                                            </span>
                                                        </span>
                                                    </label>
                                                </div>
                                            </div>
                                            <!-- Danh mục -->
                                            <div class="d-flex justify-content-between align-items-center border-top pt-3">
                                                <label class="form-label">Category</label>
                                                <div class="d-flex justify-content-end">
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
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /Thẻ Giá -->
                                </div>
                                <!-- /Cột thứ hai -->
                            </div>
                        </div>
                    </div>
                    <!--/ Nội dung -->
                </div>
                <!--/ Khung nội dung -->
            </div>
            <!--/ Khung bố trí -->
            <div class="d-flex justify-content-center my-4">
                <button type="submit" class="btn btn-danger" form="addProductForm" onclick="validateForm(event)">Add Product</button>
            </div>
        </form>


        <!--Footer-->
        <jsp:include page="../layout/footer.jsp"/>

        <!-- Overlay -->
        <div class="layout-overlay layout-menu-toggle"></div>

        <!-- Khu vực kéo để SlideIn Menu trên màn hình nhỏ -->
        <div class="drag-target"></div>
        <script>
            function validateForm(event) {
                let name = $('#nameInput').val();
                let price = $('#priceInput').val();

                // Xóa thông báo lỗi hiện tại
                $('.error').html('');

                let isValid = true;

                if (name === '') {
                    $('#nameError').html('Tên không được để trống').addClass('error');
                    isValid = false;
                }

                if (price === '') {
                    $('#priceError').html('Giá không được để trống').addClass('error');
                    isValid = false;
                } else if (!$.isNumeric(price) || parseFloat(price) < 0) {
                    $('#priceError').html('Giá phải là số và không được nhỏ hơn 0').addClass('error');
                    isValid = false;
                }

                // Kiểm tra nếu không có lỗi thì submit form
                if (isValid) {
                    // Hiển thị thông báo thành công
                    setTimeout(() => alert('Cập nhật thành công!'), 1000)
//                    window.location.href = 'ManageProduct'; // Thay 'trang-khac.html' bằng URL trang bạn muốn chuyển đến

                    // Ngăn chặn hành động mặc định của sự kiện để đảm bảo chuyển hướng trước khi form được submit
//                    event.preventDefault();
                } else {
//                    event.preventDefault();
                }
            }

            function displayImage(input) {
                var previewImage = document.getElementById("previewImage2");
                var file = input.files[0];
                var reader = new FileReader();

                reader.onload = function (e) {
                    previewImage.src = e.target.result;
                    previewImage.style.display = "block";
                }
                reader.readAsDataURL(file);
            }
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
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.repeater/1.2.1/jquery.repeater.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
        <!-- Quill JS -->
        <script src="https://cdn.quilljs.com/1.3.6/quill.min.js"></script>

    </body>


</html>

<!-- beautify ignore:end -->