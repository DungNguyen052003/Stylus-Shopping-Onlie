

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Stylus</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/jquery-ui.min.css" type="text/css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/magnific-popup.css" type="text/css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/style.css" type="text/css">
        <style type="text/css">
            .body {
                margin-top: 20px;
                background: #f8f8f8
            }
            .thumbnail-img {
                width: 300px; /* Adjust the width as needed */
                height: auto;
                max-height: 100px !important; /* Adjust the max-height as needed */
                object-fit: cover;
            }

            .align-middle img {
                max-width: 100%;
                max-height: 100px;
            }

        </style>

    </head>

    <body>
        <!-- Header -->

        <jsp:include page="../layout/header.jsp"></jsp:include>


            <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.1/dist/css/bootstrap.min.css" rel="stylesheet">
            <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">

            <div class="container" style="max-width: 100%">
                <div class="row flex-lg-nowrap">
                    <div class="col">

                        <div class="row flex-lg-nowrap">
                            <div class="col">
                                <div class="e-panel card">
                                    <div class="card-body">
                                        <div class="card-title">
                                            <h6 class="mr-2"><span>Manager Customer List</span></h6>
                                        </div>
                                        <div class="e-table">
                                            <div class="table table-lg">
                                                <table class="table table-bordered" style="width: 100%">
                                                    <thead>
                                                        <tr>
                                                            <th class="align-middle">ID</th>
                                                            <th class="align-middle">Thumbnail</th>
                                                            <th class="align-middle">Title</th>
                                                            <th class="align-middle">Category</th>
                                                            <th class="align-middle">Price</th>
                                                            <th class="align-middle">Sale Price</th>
                                                            <th class="align-middle">Information</th>
                                                            <th class="align-middle">Status</th>
                                                            <th class="align-middle">Actions</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                    <c:forEach items="${manageProduct}" var="m">
                                                        <tr>
                                                            <td class="align-middle" name="id">${m.productID}</td>
                                                            <td class="align-middle text-center" style="max-width: 150px" name="image">
                                                                <div class="bg-light d-inline-flex justify-content-center align-items-center align-top">
                                                                    <img id="yourImageId" class="thumbnail-img" style="max-width: 100%; max-height: 100%;" src="${m.thumbnail}?v=<%= System.currentTimeMillis() %>">
                                                                </div>
                                                            </td>
                                                            <td class="align-middle" style="white-space: normal;" name="name">${m.productName}</td>
                                                            <td class="align-middle" name="cate">${m.cateID.name}</td>
                                                            <td class="align-middle" name="price">$${m.price}</td>
                                                            <td class="align-middle" name="sale">
                                                                <c:choose>
                                                                    <c:when test="${m.saleStatus eq 1}">
                                                                        <div class="product__price">$${m.salePrice}</div>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <div class="product__price">$${m.price}</div>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </td>
                                                            <td class="align-middle" name="info" >
                                                                <p style="overflow: hidden;
                                                                   display: -webkit-box;
                                                                   -webkit-line-clamp: 3;
                                                                   -webkit-box-orient: vertical;
                                                                   width: 250px;
                                                                   word-wrap: break-word;">
                                                                    ${m.briefInfomation}
                                                                </p>
                                                                <form action="ManageProduct" method="POST">
                                                                    <td class="text-center align-middle" name="status" data-status="${m.status}">
                                                                        <i class="fa cursor-pointer
                                                                           <c:choose>
                                                                               <c:when test="${m.status eq 1}">fa-toggle-on text-secondary</c:when>
                                                                               <c:otherwise>fa-toggle-off</c:otherwise>
                                                                           </c:choose>"
                                                                           data-id="${m.productID}" 
                                                                           data-status="${m.status}" 
                                                                           onclick="toggleStatus(this)">
                                                                        </i>
                                                                    </td>
                                                                </form>
                                                                <script>

                                                                    function toggleStatus(icon) {
                                                                        // Lấy trạng thái hiện tại từ lớp của biểu tượng
                                                                        const currentClass = $(icon).hasClass('fa-toggle-on') ? 'fa-toggle-on' : 'fa-toggle-off';

                                                                        // Chuyển đổi trạng thái
                                                                        if (currentClass === 'fa-toggle-on') {
                                                                            $(icon).removeClass('fa-toggle-on text-secondary').addClass('fa-toggle-off');
                                                                        } else {
                                                                            $(icon).removeClass('fa-toggle-off').addClass('fa-toggle-on text-secondary');
                                                                        }

                                                                        // Gửi yêu cầu AJAX để cập nhật trạng thái trên máy chủ
                                                                        const productId = $(icon).data('id');
                                                                        const newStatus = currentClass === 'fa-toggle-on' ? 0 : 1;

                                                                        $.ajax({
                                                                            url: 'ManageProduct', // URL để xử lý yêu cầu cập nhật
                                                                            type: 'POST',
                                                                            data: {action: 'updateStatus', id: productId, status: newStatus},
                                                                            success: function (response) {
                                                                                console.log('Status updated successfully');
                                                                            },
                                                                            error: function (xhr, status, error) {
                                                                                console.error('Error updating status:', error);
                                                                            }
                                                                        });
                                                                    }
                                                                </script>
                                                            <td class="text-center align-middle">
                                                                <div class="btn-group align-top">
                                                                    <button class="btn btn-sm btn-outline-secondary badge" type="button" 
                                                                            data-toggle="modal" data-target="#user-form-modal"
                                                                            onclick="editProduct(this)">
                                                                        <i class="fa fa-edit"></i> Edit
                                                                    </button>
                                                                    <button class="btn btn-sm btn-outline-secondary badge" type="button">
                                                                        <i class="fa-regular fa-eye"></i> View
                                                                    </button>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>

                                        </div>
                                        <div class="d-flex justify-content-center">
                                            <ul class="pagination mt-3 mb-0">
                                                <c:forEach begin="1" end="${pageControl.totalPage}" var="pageNumber">
                                                    <li class="page-item"><a href="${pageControl.urlPattern}page=${pageNumber}" class="page-link">${pageNumber}</a></li>
                                                    </c:forEach>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-lg-3 mb-3">
                            <div class="card">
                                <div class="card-body">
                                    <div class="search-container">
                                        <div class="form-group" id="searchDropdown">
                                            <form id="sortForm" action="ManageProduct" method="GET">
                                                <!-- Sort Section -->
                                                <div class="search-input">
                                                    <label for="sortSelect">Sort:</label>
                                                    <select id="sortSelect" class="form-control" name="sort" onchange="document.getElementById('sortForm').submit();">
                                                        <option value="sort" <%= "sort".equals(request.getParameter("sort")) ? "selected" : "" %>>Sort by ....</option>
                                                        <option value="title" <%= "title".equals(request.getParameter("sort")) ? "selected" : "" %>>Sort by Title</option>
                                                        <option value="category" <%= "category".equals(request.getParameter("sort")) ? "selected" : "" %>>Sort by Category</option>
                                                        <option value="price" <%= "price".equals(request.getParameter("sort")) ? "selected" : "" %>>Sort by Price</option>
                                                        <option value="sale" <%= "sale".equals(request.getParameter("sort")) ? "selected" : "" %>>Sort by Sale Price</option>
                                                        <option value="feature" <%= "feature".equals(request.getParameter("sort")) ? "selected" : "" %>>Sort by Feature</option>
                                                        <option value="status" <%= "status".equals(request.getParameter("sort")) ? "selected" : "" %>>Sort by Status</option>
                                                    </select>
                                                </div>
                                            </form>   

                                            <form action="ManageProduct" method="get">
                                                <input type="hidden" name="action" value="filterProduct">
                                                <!--Price Filter Section--> 
                                                <hr class="my-3">
                                                <div class="search-container">
                                                    <div class="form-group" id="priceDropdown">
                                                        <div class="search-input" value="price">
                                                            <label>Price:</label>
                                                            <input type="number" class="form-control" name="priceMin" placeholder="Min Price">
                                                            <input type="number" class="form-control mt-2" name="priceMax" placeholder="Max Price">
                                                        </div>
                                                    </div>
                                                </div>

                                                <!--Search Section--> 
                                                <hr class="my-3">
                                                <div class="search-container">
                                                    <div class="form-group" id="searchDropdown">
                                                        <div class="search-input" value="search">
                                                            <label>Search:</label>
                                                            <input class="form-control w-100" type="text" placeholder="Search" name="search">
                                                        </div>
                                                    </div>
                                                </div>

                                                <!--Category Filter Section--> 
                                                <hr class="my-3">
                                                <div class="search-container">
                                                    <div class="form-group" id="categoryDropdown">
                                                        <div class="search-input" value="cate">
                                                            <label>Category:</label>
                                                            <div class="px-2">
                                                                <div class="custom-control custom-radio">
                                                                    <input type="radio" class="custom-control-input" name="category" id="category-women" onclick="toggleCategory('women')">
                                                                    <label class="custom-control-label" for="category-women">Women</label>
                                                                </div>
                                                            </div>
                                                            <div class="px-2">
                                                                <div class="custom-control custom-radio">
                                                                    <input type="radio" class="custom-control-input" name="category" id="category-men" onclick="toggleCategory('men')">
                                                                    <label class="custom-control-label" for="category-men">Men</label>
                                                                </div>
                                                            </div>


                                                            <div class="px-2" id="sub-categories-women" style="display: none; margin-top: 10px;">
                                                                <c:forEach items="${categoriesWomen}" var="cW">
                                                                    <div class="custom-control custom-checkbox" style="margin-bottom: 5px;">
                                                                        <input type="checkbox" class="custom-control-input" id="sub-category-${cW.cateID}" name="subCategory" value="${cW.cateID}" style="margin-right: 10px;">
                                                                        <label class="custom-control-label" for="sub-category-${cW.cateID}" style="font-weight: bold;">${cW.name}</label>
                                                                    </div>
                                                                </c:forEach>
                                                            </div>
                                                            <div class="px-2" id="sub-categories-men" style="display: none; margin-top: 10px;">
                                                                <c:forEach items="${categoriesMen}" var="cM">
                                                                    <div class="custom-control custom-checkbox" style="margin-bottom: 5px;">
                                                                        <input type="checkbox" class="custom-control-input" id="sub-category-${cM.cateID}" name="subCategory" value="${cM.cateID}" style="margin-right: 10px;">
                                                                        <label class="custom-control-label" for="sub-category-${cM.cateID}" style="font-weight: bold;">${cM.name}</label>
                                                                    </div>
                                                                </c:forEach>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <script>
                                                    function toggleCategory(category) {
                                                        document.getElementById('sub-categories-women').style.display = 'none';
                                                        document.getElementById('sub-categories-men').style.display = 'none';

                                                        if (category === 'women') {
                                                            document.getElementById('sub-categories-women').style.display = 'block';
                                                        } else if (category === 'men') {
                                                            document.getElementById('sub-categories-men').style.display = 'block';
                                                        }
                                                    }

                                                    // Automatically show subcategories if already selected on page load
                                                    window.onload = function () {
                                                        var category = '<%= request.getParameter("category") %>';
                                                        if (category === 'women') {
                                                            document.getElementById('sub-categories-women').style.display = 'block';
                                                        } else if (category === 'men') {
                                                            document.getElementById('sub-categories-men').style.display = 'block';
                                                        }
                                                    }
                                                </script>

                                                <!--Status Filter Section--> 
                                                <hr class="my-3">
                                                <div value="status">
                                                    <label>Status:</label>
                                                    <div class="px-2">
                                                        <div class="custom-control custom-radio">
                                                            <input type="radio" class="custom-control-input" name="status" id="users-status-active" value="active" />
                                                            <label class="custom-control-label" for="users-status-active">Active</label>
                                                        </div>
                                                    </div>
                                                    <div class="px-2">
                                                        <div class="custom-control custom-radio">
                                                            <input type="radio" class="custom-control-input" name="status" id="users-status-any" value="inactive" />
                                                            <label class="custom-control-label" for="users-status-any">Inactive</label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <hr class="my-3">
                                                <div>
                                                    <button type="submit" class="btn btn-primary w-100">Filter</button>
                                                </div>
                                            </form>


                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>

                </div>


                <div class="modal fade" id="user-form-modal" tabindex="-1" role="dialog" aria-labelledby="userFormModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg" role="document">
                        <div class="modal-content">
                            <div class="modal-header" style="background-color: transparent">
                                <h5 class="modal-title" style="color:black">Edit Product</h5>
                                <button type="button" class="close" data-dismiss="modal">
                                    <span aria-hidden="true">×</span>
                                </button>
                            </div>

                            <form id="editProduct" action="ManageProduct?action=editProduct" method="POST" enctype="multipart/form-data">
                                <div class="modal-body" name="filter">
                                    <!--id-->
                                    <div class="form-group" style="display: none">
                                        <input type="text" class="form-control" id="idEditInput" name="id">
                                    </div>
                                    <!--Name-->
                                    <div class="form-group">
                                        <label for="name">Title:</label>
                                        <input type="text" class="form-control" id="nameEditInput" name="name">
                                        <div id="nameEditError" class="error"></div>
                                    </div>
                                    <!--Price-->
                                    <div class="form-group">
                                        <label for="price">Price:</label>
                                        <input type="text" class="form-control" id="priceEditInput" name="price">
                                        <div id="priceEditError" class="error"></div>
                                    </div>

                                    <!--Category-->
                                    <div class="form-group">
                                        <label for="category">Category: </label>
                                        <div class="input-group">
                                            <select class="custom-select" id="categoryEditInput" name="category">
                                                <optgroup label="Women">
                                                    <c:forEach items="${categoriesWomen}" var="category">
                                                        <option value="${category.cateID}">${category.name}</option>
                                                    </c:forEach>
                                                </optgroup>
                                                <optgroup label="Men">
                                                    <c:forEach items="${categoriesMen}" var="category">
                                                        <option value="${category.cateID}">${category.name}</option>
                                                    </c:forEach>
                                                </optgroup>
                                            </select>

                                            <div class="input-group-append">
                                                <button class="btn btn-outline-secondary" type="button">Category</button>
                                            </div>
                                        </div>
                                    </div>


                                    <!--Image-->
                                    <div class="form-group">
                                        <label for="image">Image: </label>
                                        <div class="input-group mb-3">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">Upload</span>
                                            </div>
                                            <div class="custom-file">
                                                <input type="file" class="custom-file-input" id="imageEdit" name="image"
                                                       onchange="displayImage2(this)">
                                                <label class="custom-file-label">Choose file</label>
                                            </div>
                                        </div>
                                        <img id="previewImage2" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="Preview"
                                             style="display: none; max-width: 300px; max-height: 300px;">
                                        <input type="hidden" id="currentImage" name="currentImage" value="">
                                    </div>

                                    <!--Description-->
                                    <div class="form-group">
                                        <label for="descriptionEditInput">Brief Information:</label>
                                        <textarea class="form-control brief-info" id="descriptionEdit" name="description"
                                                  ></textarea>
                                    </div>

                                    <!--Status-->
                                    <div class="form-group">
                                        <label for="status">Status: </label>
                                        <div>
                                            <input type="radio" id="statusActive" name="status" value="1" />
                                            <label for="statusActive">Active</label><br/>
                                            <input type="radio" id="statusInactive" name="status" value="0"/>
                                            <label for="statusInactive">Inactive</label>
                                        </div>
                                    </div>
                                </div>
                            </form>

                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" id="btn-cancel" data-dismiss="modal" ng-click="$hide()">Cancel</button>
                                <button type="submit" class="btn btn-primary" form="editBookForm"
                                        onclick="validateForm2(event)">Update</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.1/dist/js/bootstrap.bundle.min.js"></script>
        <script>
// Hàm kiểm tra và gửi form cập nhật sản phẩm
                                            function validateForm2(event) {
                                                event.preventDefault(); // Ngăn chặn hành vi mặc định của form

                                                let name = $('#nameEditInput').val();
                                                let price = $('#priceEditInput').val();

// Xóa thông báo lỗi hiện tại
                                                $('.error').html('');

// Kiểm tra đầu vào
                                                if (name === '') {
                                                    $('#nameEditError').html('Name cannot be blank');
                                                }

                                                if (price === '') {
                                                    $('#priceEditError').html('Price cannot be empty');
                                                } else if (!$.isNumeric(price) || parseFloat(price) < 0) {
                                                    $('#priceEditError').html('The product price must be a number and cannot be less than 0');
                                                }

// Nếu không có lỗi thì submit form bằng AJAX
                                                let error = '';
                                                $('.error').each(function () {
                                                    error += $(this).html();
                                                });

                                                if (error === '') {
                                                    let formData = new FormData($('#editProduct')[0]); // Lấy dữ liệu từ form

                                                    $.ajax({
                                                        url: 'ManageProduct?action=editProduct',
                                                        type: 'POST',
                                                        data: formData,
                                                        processData: false,
                                                        contentType: false,
                                                        success: function (response) {

                                                            let id = $('#idEditInput').val();
                                                            let updatedRow = $('td[name="id"]').filter(function () {
                                                                return $(this).text().trim() == id;
                                                            }).closest('tr');

                                                            updatedRow.find('td[name="name"]').text($('#nameEditInput').val());
                                                            updatedRow.find('td[name="price"]').text('$' + $('#priceEditInput').val());
                                                            updatedRow.find('td[name="cate"]').text($('#categoryEditInput option:selected').text());
                                                            updatedRow.find('td[name="info"]').text($('#descriptionEdit').val());
                                                            updatedRow.find('td[name="image"] img').attr('src', $('#previewImage2').attr('src'));

                                                            let status = $('input[name="status"]:checked').val();
                                                            let statusIcon = updatedRow.find('td[name="status"] i');
                                                            statusIcon.removeClass('fa-toggle-on fa-toggle-off text-secondary');
                                                            if (status == 1) {
                                                                statusIcon.addClass('fa-toggle-on text-secondary');
                                                            } else {
                                                                statusIcon.addClass('fa-toggle-off');
                                                            }
//setInterval(() => {
//        $(`#${id}`) =  
//    })


                                                            // Loại bỏ backdrop thừa
//                            $('.modal-backdrop').remove();
//                            $('body').removeClass('modal-open');
                                                            setTimeout(() => {
                                                                location.reload();
                                                            }, 1500)
                                                        },

                                                        error: function (xhr, status, error) {
                                                            console.error('Error updating product:', error);
                                                        }
                                                    });
                                                }
                                            }



                                            function displayImage2(input) {
                                                var previewImage = document.getElementById("previewImage2");
                                                var file = input.files[0];
                                                var reader = new FileReader();

                                                reader.onload = function (e) {
                                                    previewImage.src = e.target.result;
                                                    previewImage.style.display = "block";
                                                }

                                                reader.readAsDataURL(file);
                                            }

                                            function editProduct(button) {
                                                let id = $(button).closest('tr').find('td[name="id"]').text().trim();
                                                let name = $(button).closest('tr').find('td[name="name"]').text().trim();
                                                let price = $(button).closest('tr').find('td[name="price"]').text().trim().split('$')[1];

                                                let categoryText = $(button).closest('tr').find('td[name="cate"]').text().trim();
                                                let description = $(button).closest('tr').find('td[name="info"]').text().trim();
                                                let image = $(button).closest('tr').find('td[name="image"]').find('img').attr('src');
                                                let status = $(button).closest('tr').find('td[name="status"]').data('status');

                                                $('#idEditInput').val(id);
                                                $('#nameEditInput').val(name);
                                                $('#priceEditInput').val(price);

                                                $('#descriptionEdit').val(description);

// Loop through category list to select the category
                                                $('#categoryEditInput option').each(function () {
                                                    if ($(this).text() === categoryText) {
                                                        $(this).prop('selected', true);
                                                    }
                                                });

                                                $('#descriptionEdit').val(description);
                                                $('#previewImage2').attr('src', image);
                                                console.log(image)

                                                $('#previewImage2').css('display', 'block');
                                                $('#currentImage').val(image);
                                                console.log($('#currentImage'))
// Set status radio button
                                                if (status === 1) {
                                                    $('#statusActive').prop('checked', true);
                                                } else {
                                                    $('#statusInactive').prop('checked', true);
                                                }
                                            }


        </script>
        <script type="text/javascript">

        </script>
        <!--Footer-->
        <jsp:include page="../layout/footer.jsp"/>
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
