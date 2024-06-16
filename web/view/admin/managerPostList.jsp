<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Stylus Shopping</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="asset/css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="asset/css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="asset/css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="asset/css/jquery-ui.min.css" type="text/css">
        <link rel="stylesheet" href="asset/css/magnific-popup.css" type="text/css">
        <link rel="stylesheet" href="asset/css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="asset/css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="asset/css/style.css?id=11" type="text/css">
        <style type="text/css">
            body {
                margin-top: 20px;
                background: #f8f8f8;
            }
            .content {
                max-height: calc(100vh - 100px);
            }

            .dropdown-content {
                display: none;
                position: absolute;
                background-color: #fff;
                border: 1px solid #ddd;
                border-radius: 5px;
                padding: 5px 0;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
                z-index: 1;
                width: 180px;
            }

            .dropdown-content a {
                color: black;
                padding: 12px 16px;
                text-decoration: none;
                display: block;
                font-size: 14px;
            }

            .dropdown-content a:hover {
                background-color: #f1f1f1;
            }

            .search-input {
                position: relative;
            }

            .search-input:hover .dropdown-content {
                display: block;
            }

            /* Định dạng select box */
            .form-control {
                display: inline-block;
                width: 180px; /* Điều chỉnh độ rộng select box */
                vertical-align: middle;
            }

            /* Định dạng form */
            .form-group {
                margin-bottom: 1.5rem;
            }

            /* Định dạng các checkbox */
            .custom-control-label {
                padding-left: 1.25rem;
                margin-left: 1.25rem;
            }

            .custom-control-input:checked~.custom-control-label::before {
                background-color: #007bff;
                border-color: #007bff;
            }

            /* Định dạng các nhãn */
            .form-group label {
                display: inline-block;
                width: 120px; /* Độ rộng cố định của nhãn */
                margin-bottom: 0.5rem; /* Khoảng cách dưới của nhãn */
            }

            /* Định dạng các ô nhập liệu */
            .form-group input[type="text"],
            .form-group input[type="email"],
            .form-group input[type="tel"],
            .form-group input[type="password"] {
                width: calc(100% - 120px); /* Độ rộng của ô nhập liệu sẽ chiếm phần còn lại sau khi đã trừ đi độ rộng của nhãn */
            }
            .max-width {
                max-width: 200px; /* Đặt chiều rộng tối đa cho cột tiêu đề */
            }

            .text-nowrap {
                white-space: normal; /* Cho phép nội dung xuống dòng khi quá dài */
            }

        </style>
    </head>
    <body>
        <jsp:include page="../layout/header.jsp"></jsp:include><br>
        <c:if test="${not empty sessionScope.successMessage}">
            <div class="alert alert-success" role="alert">
                ${sessionScope.successMessage}
            </div>
            <%-- Xóa thông báo thành công từ session để tránh hiển thị lại khi làm mới trang --%>
            <% session.removeAttribute("successMessage"); %>
        </c:if>
        <div class="container">
            <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">

            <div class="row flex-lg-nowrap">
                <div class="col">
                    <div class="e-tabs mb-3 px-3">
                        <ul class="nav nav-tabs">
                            <li class="nav-item"><a class="nav-link active" href="#">Post</a></li>
                        </ul>
                    </div>

                    <div class="row flex-lg-nowrap">
                        <div class="col">
                            <div class="e-panel card">
                                <div class="card-body">
                                    <div class="card-title">
                                        <h6 class="mr-2"><span>Manager Blog List</span></h6>
                                    </div>
                                    <div class="e-table">
                                        <div class="table table-lg">
                                            <table class="table table-bordered">
                                                <thead>
                                                    <tr>
                                                        <th class="align-middle">ID</th>
                                                        <th class="align-middle">Thumbnail</th>
                                                        <th class="align-middle">Title</th>
                                                        <th class="align-middle">Category</th>
                                                        <th class="align-middle">Authors</th>
                                                        <th class="align-middle">Featured</th>
                                                        <th class="align-middle">Status</th>
                                                        <th class="align-middle">Actions</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <!-- Lặp qua danh sách bài viết của trang hiện tại -->
                                                    <c:forEach items="${blogpage}" var="b">
                                                        <tr>
                                                            <td class="align-middle">${b.blogID}</td>
                                                            <td class="align-middle text-center">
                                                                <div class="bg-light d-inline-flex justify-content-center align-items-center align-top">
                                                                    <img style="width: 70px; height: auto" src="${b.thumbnail}">
                                                                </div>
                                                            </td>
                                                            <td class="align-middle" style="white-space: normal;">${b.blogTitle}</td>
                                                            <td class="align-middle">${b.category.name}</td>
                                                            <td class="align-middle">${b.author}</td>
                                                            <!-- Form điều chỉnh tính năng Nổi bật của bài viết -->
                                                    <form action="managerpostlist" method="post">
                                                        <input type="hidden" name="productId" value="${b.blogID}">
                                                        <input type="hidden" name="status" value="${b.featured}">
                                                        <td class="text-center align-middle">
                                                            <i class="fa cursor-pointer ${b.featured eq 1 ? 'fa-toggle-on text-secondary' : 'fa-toggle-off'}" 
                                                               data-id="${b.blogID}" 
                                                               data-status="${b.featured}" 
                                                               onclick="toggleStatus2(this)">
                                                            </i>
                                                        </td>
                                                    </form>
                                                    <!-- Form điều chỉnh trạng thái của bài viết -->
                                                    <form action="managerpostlist" method="post">
                                                        <input type="hidden" name="productId" value="${b.blogID}">
                                                        <input type="hidden" name="status" value="${b.status}">
                                                        <td class="text-center align-middle">
                                                            <i class="fa cursor-pointer ${b.status eq 1 ? 'fa-toggle-on text-secondary' : 'fa-toggle-off'}" 
                                                               data-id="${b.blogID}" 
                                                               data-status="${b.status}" 
                                                               onclick="toggleStatus(this)">
                                                            </i>
                                                        </td>
                                                    </form>
                                                    <td class="align-middle">
                                                        <div class="btn-group">
                                                            <a href="EditPostList?blogID=${b.blogID}">
                                                                <button class="btn btn-sm btn-outline-secondary" type="button"  data-target="#user-form-modal">Edit</button>
                                                            </a>
                                                            <a href="ViewPostList?blogID=${b.blogID}">
                                                                <button class="btn btn-sm btn-outline-secondary" type="button"  data-target="#user-form-modal">Show</button>
                                                            </a>
                                                        </div>
                                                    </td>
                                                    </tr>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                        <!-- Phân trang -->
                                        <div class="d-flex justify-content-center">
                                            <ul class="pagination mt-3 mb-0">
                                                <c:choose>
                                                    <c:when test="${page > 1}">
                                                        <li class="page-item">
                                                            <a class="page-link" href="<c:url value='ManagerPostList'>
                                                                   <c:param name='page' value='${page - 1}'/>
                                                                   <c:if test='${param.action != null}'><c:param name='action' value='${param.action}'/></c:if>
                                                                   <c:if test='${param.sort != null}'><c:param name='sort' value='${param.sort}'/></c:if>
                                                                   <c:if test='${param.author != null}'><c:param name='author' value='${param.author}'/></c:if>
                                                                   <c:if test='${param.title != null}'><c:param name='title' value='${param.title}'/></c:if>
                                                                   <c:if test='${param.category != null}'><c:param name='category' value='${param.category}'/></c:if>
                                                                   <c:if test='${param.status != null}'><c:param name='status' value='${param.status}'/></c:if>
                                                               </c:url>">Previous</a>
                                                        </li>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <li class="page-item disabled">
                                                            <span class="page-link">Previous</span>
                                                        </li>
                                                    </c:otherwise>
                                                </c:choose>

                                                <!-- Nút trang -->
                                                <c:forEach begin="1" end="${numberpage}" var="i">
                                                    <li class="page-item ${page == i ? 'active' : ''}">
                                                        <a class="page-link" href="<c:url value='ManagerPostList'>
                                                               <c:param name='page' value='${i}'/>
                                                               <c:if test='${param.action != null}'><c:param name='action' value='${param.action}'/></c:if>
                                                               <c:if test='${param.sort != null}'><c:param name='sort' value='${param.sort}'/></c:if>
                                                               <c:if test='${param.author != null}'><c:param name='author' value='${param.author}'/></c:if>
                                                               <c:if test='${param.title != null}'><c:param name='title' value='${param.title}'/></c:if>
                                                               <c:if test='${param.category != null}'><c:param name='category' value='${param.category}'/></c:if>
                                                               <c:if test='${param.status != null}'><c:param name='status' value='${param.status}'/></c:if>
                                                           </c:url>">${i}</a>
                                                    </li>
                                                </c:forEach>

                                                <c:choose>
                                                    <c:when test="${page < numberpage}">
                                                        <li class="page-item">
                                                            <a class="page-link" href="<c:url value='ManagerPostList'>
                                                                   <c:param name='page' value='${page + 1}'/>
                                                                   <c:if test='${param.action != null}'><c:param name='action' value='${param.action}'/></c:if>
                                                                   <c:if test='${param.sort != null}'><c:param name='sort' value='${param.sort}'/></c:if>
                                                                   <c:if test='${param.author != null}'><c:param name='author' value='${param.author}'/></c:if>
                                                                   <c:if test='${param.title != null}'><c:param name='title' value='${param.title}'/></c:if>
                                                                   <c:if test='${param.category != null}'><c:param name='category' value='${param.category}'/></c:if>
                                                                   <c:if test='${param.status != null}'><c:param name='status' value='${param.status}'/></c:if>
                                                               </c:url>">Next</a>
                                                        </li>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <li class="page-item disabled">
                                                            <span class="page-link">Next</span>
                                                        </li>
                                                    </c:otherwise>
                                                </c:choose>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-lg-3 mb-3">
                            <div class="card">
                                <div class="card-body">
                                    <div class="text-center px-xl-3">
                                        <button class="btn btn-success btn-block" type="button" data-toggle="modal"
                                                data-target="#user-form-modal">Add Post</button>
                                    </div>
                                    <hr class="my-3">
                                    <div class="search-container">
                                        <div class="form-group" id="searchDropdown">
                                            <form id="sortForm" action="ManagerPostList" method="GET">
                                                <div class="search-input">
                                                    <label for="sortSelect" >Sort:</label>
                                                    <select id="sortSelect" style="height:34px;" class="form-control" name="sort" onchange="document.getElementById('sortForm').submit();">
                                                        <option value="sort" <%= "sort".equals(request.getParameter("sort")) ? "selected" : "" %>>Sort by ....</option>
                                                        <option value="title" <%= "title".equals(request.getParameter("sort")) ? "selected" : "" %>>Sort by Title</option>
                                                        <option value="category" <%= "category".equals(request.getParameter("sort")) ? "selected" : "" %>>Sort by Category</option>
                                                        <option value="author" <%= "author".equals(request.getParameter("sort")) ? "selected" : "" %>>Sort by Author</option>
                                                        <option value="feature" <%= "feature".equals(request.getParameter("sort")) ? "selected" : "" %>>Sort by Featured</option>
                                                        <option value="status" <%= "status".equals(request.getParameter("sort")) ? "selected" : "" %>>Sort by Status</option>
                                                    </select>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                    <form action="ManagerPostList" method="get">
                                        <input type="hidden" name="action" value="filterPost">
                                        <hr class="my-3">
                                        <div class="search-container">
                                            <div class="form-group" id="searchDropdown">
                                                <div class="search-input" value="title">
                                                    <label>Search by title:</label>
                                                    <input class="form-control w-100" type="text" placeholder="Search" name="title">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="search-container">
                                            <div class="form-group" id="searchDropdown">
                                                <div class="search-input" value="author">
                                                    <label>Search by author:</label>
                                                    <input class="form-control w-100" type="text" placeholder="Search" name="author">
                                                </div>
                                            </div>
                                        </div>
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
                <div class="modal fade" role="dialog" tabindex="-1" id="user-form-modal">
                    <div class="modal-dialog modal-lg" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Create New Post</h5>
                                <button type="button" class="close" data-dismiss="modal">
                                    <span aria-hidden="true">×</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div class="py-1">
                                    <form class="form" action="AddNewPost" method="post" enctype="multipart/form-data" >
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Title</label>
                                                    <input class="form-control" type="text" name="title" required>
                                                </div>
                                                <div class="form-group">
                                                    <label>Thumbnail</label>
                                                    <input class="form-control" type="file" id="imageInput" name="image" required onchange="displaySelectedImage(this)">
                                                    <img id="selectedImage" src="#" alt="Selected Image" style="max-width: 300px; max-height: 300px; display: none;">
                                                </div>
                                                <div class="form-group">
                                                    <label>Author</label>
                                                    <input class="form-control" type="text" name="author" required>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Description</label>
                                                    <input class="form-control" type="text" name="description" required>
                                                </div>
                                                <div class="form-group">
                                                    <label>Brief_Info</label>
                                                    <input class="form-control" type="text" name="briefinfor" required>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6 mb-3">
                                                <div class="form-group">
                                                    <label>Status</label>
                                                    <div class="custom-controls-stacked">
                                                        <div class="custom-control custom-checkbox">
                                                            <input type="checkbox" class="custom-control-input" id="status-blog" name="status" value="on" checked>
                                                            <label class="custom-control-label" for="status-blog">On</label>
                                                        </div>
                                                        <div class="custom-control custom-checkbox">
                                                            <input type="checkbox" class="custom-control-input" id="status-news" name="status" value="off">
                                                            <label class="custom-control-label" for="status-news">Off</label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6 mb-3">
                                                <div class="form-group">
                                                    <label>Featured</label>
                                                    <div class="custom-controls-stacked">
                                                        <div class="custom-control custom-checkbox">
                                                            <input type="checkbox" class="custom-control-input" id="featured-male" name="featured" value="on" checked>
                                                            <label class="custom-control-label" for="featured-male">On</label>
                                                        </div>
                                                        <div class="custom-control custom-checkbox">
                                                            <input type="checkbox" class="custom-control-input" id="featured-female" name="featured" value="off">
                                                            <label class="custom-control-label" for="featured-female">Off</label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col d-flex justify-content-end">
                                                <button class="btn btn-primary" type="submit">Add</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.1/dist/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript">

    </script>
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
            const blogID = $(icon).data('id');
            const newStatus = currentClass === 'fa-toggle-on' ? 0 : 1;

            $.ajax({
                url: 'ManagerPostList', // URL để xử lý yêu cầu cập nhật
                type: 'POST',
                data: {action: 'updateStatus', id: blogID, status: newStatus},
                success: function (response) {
                    console.log('Status updated successfully');
                },
                error: function (xhr, status, error) {
                    console.error('Error updating status:', error);
                }
            });
        }
        function toggleStatus2(icon) {
            // Lấy trạng thái hiện tại từ lớp của biểu tượng
            const currentClass = $(icon).hasClass('fa-toggle-on') ? 'fa-toggle-on' : 'fa-toggle-off';

            // Chuyển đổi trạng thái
            if (currentClass === 'fa-toggle-on') {
                $(icon).removeClass('fa-toggle-on text-secondary').addClass('fa-toggle-off');
            } else {
                $(icon).removeClass('fa-toggle-off').addClass('fa-toggle-on text-secondary');
            }

            // Gửi yêu cầu AJAX để cập nhật trạng thái trên máy chủ
            const blogID = $(icon).data('id');
            const newStatus = currentClass === 'fa-toggle-on' ? 0 : 1;

            $.ajax({
                url: 'ManagerPostList', // URL để xử lý yêu cầu cập nhật
                type: 'POST',
                data: {action: 'updateFeature', id: blogID, status: newStatus},
                success: function (response) {
                    console.log('Status updated successfully');
                },
                error: function (xhr, status, error) {
                    console.error('Error updating status:', error);
                }
            });
        }
        function displaySelectedImage(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    document.getElementById('selectedImage').src = e.target.result;
                    document.getElementById('selectedImage').style.display = 'block';
                }

                reader.readAsDataURL(input.files[0]); // Đọc tệp hình ảnh dưới dạng URL dữ liệu
            }
        }
    </script>
    <script>
        document.getElementById("searchInput").addEventListener("input", function () {
            var keyword = this.value;
            var xhr = new XMLHttpRequest();
            xhr.open("GET", "managerpostlist?keyword=" + keyword, true); // Thêm keyword vào URL
            xhr.onreadystatechange = function () {
                if (xhr.readyState == 4 && xhr.status == 200) {
                    document.getElementById("searchResults").innerHTML = xhr.responseText;
                }
            };
            xhr.send();
        });
        function searchByTitle() {
            var text = document.querySelector("#searchId").value;
            $.ajax({
                url: "/Stylus Shopping/search",
                type: "get",
                data: {
                    txt: text
                },
                success: function (data) {
                    var row = document.getElementById("contentt");
                    row.innerHTML = data;
                },
                error: function (xhr) {
                }
            });
        }
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
    
    <jsp:include page="../layout/footer.jsp"></jsp:include><br>
</body>
</html>
