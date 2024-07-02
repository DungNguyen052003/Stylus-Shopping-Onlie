<%-- 
    Document   : updatecustomer
    Created on : May 29, 2024, 9:44:02 AM
    Author     : 84976
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
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
                    <li class="nav-item"><a class="nav-link active" href="#">Create Customers</a></li>
                </ul>
            </div>
            <form action="updatecustomer" method="post" enctype="multipart/form-data">
                <input type="hidden" name="customerID" value="${customer.customerID}">
                <div class="row">
                    <div class="form-group">
                        <label>Full Name</label>
                        <input value="${customer.name}" class="form-control" type="text" name="name" required>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group">
                        <label>Avatar</label>
                        <input class="form-control" type="file" id="imageInput" name="image" required onchange="displaySelectedImage(this)">
                        <img id="selectedImage" src="${customer.image}" alt="Selected Image" style="max-width: 300px; max-height: 300px;">
                    </div>
                </div>

                <div class="row">
                    <div class="form-group">
                        <label>Email</label>
                        <input value="${customer.email}" class="form-control" type="email" name="email" required>                    </div>
                </div>
                <div class="row">
                    <div class="form-group">
                        <label>Phone</label>
                        <input value="${customer.phone}" class="form-control" type="text" name="phone" required>
                    </div>
                </div>

                <div class="row">
                    <div class="form-group">
                        <label>Username</label>
                        <input value="${customer.email}" class="form-control" type="text" name="username" required>
                    </div>
                </div>

                <div class="row">
                    <div class="form-group">
                        <label>Address</label>
                        <input value="${customer.address}" class="form-control" type="text" name="address" required>
                    </div>
                </div>



                <div class="row">
                    <div class="form-group">
                        <label>Status</label>
                        <div class="custom-controls-stacked">
                            <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" id="status-blog"  value="1" name="status" ${customer.verifiedStatus == 1 ? 'checked' : ''}>
                                <label class="custom-control-label" for="status-blog">On</label>
                            </div>
                            <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" id="status-news" value="0" name="status" ${customer.verifiedStatus == 0 ? 'checked' : ''}>
                                <label class="custom-control-label" for="status-news">Off</label>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="form-group">
                        <label for="gender">Gender</label>
                        <div class="custom-controls-stacked">
                            <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" id="gender-male" value="1" name="gender" ${customer.gender == 1 ? 'checked' : ''}>
                                <label class="custom-control-label" for="gender-male">Male</label>
                            </div>
                            <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" id="gender-female" value="0" name="gender" ${customer.gender == 0 ? 'checked' : ''}>
                                <label class="custom-control-label" for="gender-female">Female</label>
                            </div>
                            <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" id="gender-other" value="2" name="gender" ${customer.gender == 2 ? 'checked' : ''}>
                                <label class="custom-control-label" for="gender-other">Other</label>
                            </div>
                        </div>
                    </div>
                </div>

                <button class="btn btn-primary" type="submit">Edit</button>
                <a class="btn btn-secondary" href="managercustomerlist">Back to Manager Post List</a>
            </form>
        </div>
        <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.1/dist/js/bootstrap.bundle.min.js"></script>
        <script type="text/javascript">

        </script>
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
        <jsp:include page="../layout/footer.jsp"></jsp:include><br>
    </body>
</html>
