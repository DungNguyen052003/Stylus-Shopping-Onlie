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
                width: 100%;
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
                display: block; /* Thay đổi từ inline-block thành block để mỗi label nằm trên một dòng */
                width: 100%; /* Đặt chiều rộng của label là 100% */
                margin-bottom: 0.5rem; /* Khoảng cách dưới của nhãn */
            }

            /* Định dạng các ô nhập liệu */
            .form-group input[type="text"],
            .form-group input[type="email"],
            .form-group input[type="tel"],
            .form-group input[type="password"],
            .form-group .custom-control {
                width: 100%; /* Đặt chiều rộng của các input là 100% */
            }

            .max-width {
                max-width: 200px; /* Đặt chiều rộng tối đa cho cột tiêu đề */
            }

            .text-nowrap {
                white-space: pre-wrap; /* Cho phép nội dung xuống dòng khi quá dài */
            }

        </style>
    </head>
    <body>
    
        <c:if test="${not empty sessionScope.successMessage}">
            <div class="alert alert-success" role="alert">
                ${sessionScope.successMessage}
            </div>
            <%-- Xóa thông báo thành công từ session để tránh hiển thị lại khi làm mới trang --%>
            <% session.removeAttribute("successMessage"); %>
        </c:if>
        <div class="container">
            <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">

            <div class="e-tabs mb-3 px-3">
                <ul class="nav nav-tabs">
                    <li class="nav-item"><a class="nav-link active" href="#">Edit Blog</a></li>
                </ul>
            </div>
            <form action="EditPostList" method="post" enctype="multipart/form-data">
                <input type="hidden" name="blogID" value="${blog.blogID}">
                <div class="row">
                    <div class="form-group">
                        <label>Title</label>
                        <input value="${blog.blogTitle}" class="form-control" type="text" name="title" required>
                    </div>
                </div>

                <div class="row">
                    <div class="form-group">
                        <label>Thumbnail</label>
                        <input class="form-control" type="file" id="imageInput" name="image" required onchange="displaySelectedImage(this)">
                        <img id="selectedImage" src="${blog.thumbnail}" alt="Selected Image" style="max-width: 300px; max-height: 300px;">
                    </div>
                </div>

                <script>
                    function displaySelectedImage(input) {
                        if (input.files && input.files[0]) {
                            var reader = new FileReader();

                            reader.onload = function (e) {
                                document.getElementById('selectedImage').src = e.target.result;
                            }

                            reader.readAsDataURL(input.files[0]); // Đọc tệp hình ảnh dưới dạng URL dữ liệu
                        }
                    }
                </script>

                <div class="row">
                    <div class="form-group">
                        <label>ProductID</label>
                        <input value="${blog.productID}" class="form-control" type="text" name="productID" required>
                    </div>
                </div>

                <div class="row">
                    <div class="form-group">
                        <label>Author</label>
                        <input value="${blog.author}" class="form-control" type="text" name="author" required>
                    </div>
                </div>

                <div class="row">
                    <div class="form-group">
                        <label>Description</label>
                        <textarea style="width:100%;"class="form-control" name="description" rows="7" required>${blog.description}</textarea>
                    </div>
                </div>

                <div class="row">
                    <div class="form-group">
                        <label>Brief Info</label>
                        <textarea style="width:100%;"class="form-control" name="brief_info" rows="5" required>${blog.brief_info}</textarea>
                    </div>
                </div>

                <button class="btn btn-primary" type="submit">Edit</button>
                <a class="btn btn-secondary" href="ManagerPostList">Back to Manager Post List</a>
            </form>
        </div>


        <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.1/dist/js/bootstrap.bundle.min.js"></script>
        <script type="text/javascript">

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
    </script>
  
</body>

</html>
