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
                background: #f8f8f8
            }
            .dropdown-content {
                display: none;
                position: absolute;
                background-color: #fff;
                border: 1px solid #ddd;
                border-radius: 5px;
                padding: 5px 0;
                box-shadow: 0 2px 5px rgba(0,0,0,0.2);
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

                margin-bottom: 0.5rem; /* Khoảng cách dưới của nhãn */
            }

            /* Định dạng các ô nhập liệu */
            .form-group input[type="text"],
            .form-group input[type="email"],
            .form-group input[type="tel"],
            .form-group input[type="password"] {
                width: calc(100% - 120px); /* Độ rộng của ô nhập liệu sẽ chiếm phần còn lại sau khi đã trừ đi độ rộng của nhãn */
            }




        </style>
    </head>

    <body>
        <jsp:include page="../layout/header.jsp"></jsp:include><br>
            <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
        <c:if test="${not empty sessionScope.successMessage}">
            <div class="alert alert-success" role="alert">
                ${sessionScope.successMessage}
            </div>
            <%-- Xóa thông báo thành công từ session để tránh hiển thị lại khi làm mới trang --%>
            <% session.removeAttribute("successMessage"); %>
        </c:if>
        <div class="container">

            <div class="row flex-lg-nowrap">

                <div class="col">
                    <div class="e-tabs mb-3 px-3">
                        <ul class="nav nav-tabs">
                            <li class="nav-item"><a class="nav-link active" href="#">Customers</a></li>
                        </ul>
                    </div>

                    <div class="row flex-lg-nowrap">
                        <div class="col mb-3">
                            <div class="e-panel card">
                                <div class="card-body">
                                    <div class="card-title">
                                        <h6 class="mr-2"><span>Manager Customer List</span></h6>
                                    </div>
                                    <div class="e-table">
                                        <div class="table-responsive table-lg mt-3">
                                            <table class="table table-bordered">
                                                <!-- Đầu bảng -->
                                                <thead>
                                                    <tr>
                                                        <th>ID</th>
                                                        <th>Avatar</th>
                                                        <th class="max-width">Full Name</th>
                                                        <th class="sortable">Gender</th>
                                                        <th>Email</th>
                                                        <th>Phone</th>
                                                        <th>Status</th>
                                                        <th>Actions</th>
                                                    </tr>
                                                </thead>
                                                <!-- Thân bảng -->
                                                <tbody>
                                                    <!-- Lặp qua danh sách khách hàng trang hiện tại -->
                                                    <c:forEach items="${customerpage}" var="c">
                                                        <tr>
                                                            <td class="align-middle">${c.customerID}</td>
                                                            <td class="align-middle text-center">
                                                                <div class="bg-light d-inline-flex justify-content-center align-items-center align-top">
                                                                    <img style="width: 70px; height: auto" src="${c.image}">
                                                                </div>
                                                            </td>
                                                            <td class="text-nowrap align-middle">${c.name}</td>
                                                            <td class="text-nowrap align-middle">
                                                                <span>
                                                                    <c:choose>
                                                                        <c:when test="${c.gender == 1}">
                                                                            Male
                                                                        </c:when>
                                                                        <c:when test="${c.gender == 0}">
                                                                            Female
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            Other
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                </span>
                                                            </td>
                                                            <td class="align-middle">${c.email}</td>
                                                            <td class="align-middle">${c.phone}</td>

                                                    <form action="managercustomerlist" method="post">
                                                        <input type="hidden" name="productId" value="${c.customerID}">
                                                        <input type="hidden" name="status" value="${c.status}">
                                                        <td class="text-center align-middle">
                                                            <i class="fa cursor-pointer ${c.status eq 1 ? 'fa-toggle-on text-secondary' : 'fa-toggle-off'}" 
                                                               data-id="${c.customerID}" 
                                                               data-status="${c.status}" 
                                                               onclick="toggleStatus(this)">
                                                            </i>
                                                        </td>
                                                    </form>
                                                    <td class="text-center align-middle">
                                                        <div class="btn-group align-top">
                                                            <a href="updatecustomer?customerID=${c.customerID}">
                                                                <button class="btn btn-sm btn-outline-secondary badge" type="button"  data-target="#user-form-modal">Edit</button>
                                                            </a>
                                                            <a href="viewcustomerlist?customerID=${c.customerID}">
                                                                <button class="btn btn-sm btn-outline-secondary badge" type="button"  data-target="#user-form-modal">Show</button>
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
                                                            <a class="page-link" href="<c:url value='ManagerCustomerList'>
                                                                   <c:param name='page' value='${page - 1}'/>
                                                                    <c:if test='${param.action != null}'><c:param name='action' value='${param.action}'/></c:if>
                                                                   <c:if test='${param.sort != null}'><c:param name='sort' value='${param.sort}'/></c:if>
                                                                   <c:if test='${param.fullName != null}'><c:param name='fullName' value='${param.fullName}'/></c:if>
                                                                   <c:if test='${param.email != null}'><c:param name='email' value='${param.email}'/></c:if>
                                                                   <c:if test='${param.mobile != null}'><c:param name='mobile' value='${param.mobile}'/></c:if>
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
                                                        <a class="page-link" href="<c:url value='ManagerCustomerList'>
                                                               <c:param name='page' value='${i}'/>
                                                                <c:if test='${param.action != null}'><c:param name='action' value='${param.action}'/></c:if>
                                                               <c:if test='${param.sort != null}'><c:param name='sort' value='${param.sort}'/></c:if>
                                                               <c:if test='${param.fullName != null}'><c:param name='fullName' value='${param.fullName}'/></c:if>
                                                               <c:if test='${param.email != null}'><c:param name='email' value='${param.email}'/></c:if>
                                                               <c:if test='${param.mobile != null}'><c:param name='mobile' value='${param.mobile}'/></c:if>
                                                               <c:if test='${param.status != null}'><c:param name='status' value='${param.status}'/></c:if>
                                                           </c:url>">${i}</a>
                                                    </li>
                                                </c:forEach>

                                                <c:choose>
                                                    <c:when test="${page < numberpage}">
                                                        <li class="page-item">
                                                            <a class="page-link" href="<c:url value='ManagerCustomerList'>
                                                                   <c:param name='page' value='${page + 1}'/>
                                                                    <c:if test='${param.action != null}'><c:param name='action' value='${param.action}'/></c:if>
                                                                   <c:if test='${param.sort != null}'><c:param name='sort' value='${param.sort}'/></c:if>
                                                                   <c:if test='${param.fullName != null}'><c:param name='fullName' value='${param.fullName}'/></c:if>
                                                                   <c:if test='${param.email != null}'><c:param name='email' value='${param.email}'/></c:if>
                                                                   <c:if test='${param.mobile != null}'><c:param name='mobile' value='${param.mobile}'/></c:if>
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
                                                data-target="#user-form-modal">New User</button>
                                    </div>
                                    <hr class="my-3">
                                    <div class="search-container">
                                        <div class="form-group" id="searchDropdown">
                                            <form id="sortForm" action="ManagerCustomerList" method="GET">
                                                <!-- Sort Section -->
                                                <div class="search-input">
                                                    <label for="sortSelect">Sort:</label>
                                                    <select id="sortSelect" style="height:34px;" class="form-control" name="sort" onchange="document.getElementById('sortForm').submit();">
                                                        <option value="sort" <%= "sort".equals(request.getParameter("sort")) ? "selected" : "" %>>Sort by ....</option>
                                                        <option value="fullName" <%= "fullName".equals(request.getParameter("sort")) ? "selected" : "" %>>Sort by Name</option>
                                                        <option value="email" <%= "email".equals(request.getParameter("sort")) ? "selected" : "" %>>Sort by Email</option>
                                                        <option value="mobile" <%= "mobile".equals(request.getParameter("sort")) ? "selected" : "" %>>Sort by Mobile</option>
                                                        <option value="status" <%= "status".equals(request.getParameter("sort")) ? "selected" : "" %>>Sort by Status</option>
                                                    </select>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                    <form action="ManagerCustomerList" method="get">
                                        <input type="hidden" name="action" value="filterCustomer">
                                        <hr class="my-3">
                                        <div class="search-container">
                                            <div class="form-group" id="searchDropdown">
                                                <div class="search-input" value="fullName">
                                                    <label>Search by full name:</label>
                                                    <input class="form-control w-100" type="text" placeholder="Search" name="fullName">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="search-container">
                                            <div class="form-group" id="searchDropdown">
                                                <div class="search-input" value="email">
                                                    <label>Search by email:</label>
                                                    <input class="form-control w-100" type="text" placeholder="Search" name="email">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="search-container">
                                            <div class="form-group" id="searchDropdown">
                                                <div class="search-input" value="mobile">
                                                    <label>Search by mobile:</label>
                                                    <input class="form-control w-100" type="text" placeholder="Search" name="mobile">
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

                    <div class="modal fade" role="dialog" tabindex="-1" id="user-form-modal">
                        <div class="modal-dialog modal-lg" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title">New Customer</h5>
                                    <button type="button" class="close" data-dismiss="modal">
                                        <span aria-hidden="true">×</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <div class="py-1">
                                        <form class="form" action="add" method="post" enctype="multipart/form-data">
                                            <div class="row">
                                                <div class="col">
                                                    <div class="form-group">
                                                        <label>Full Name</label>
                                                        <input class="form-control" type="text" name="name" required>
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <div class="form-group">
                                                        <label>Phone</label>
                                                        <input class="form-control" type="text" name="phone" required>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col">
                                                    <div class="form-group">
                                                        <label>Thumbnail</label>
                                                        <input class="form-control" type="file" id="imageInput" name="image" required onchange="displaySelectedImage(this)">
                                                        <img id="selectedImage" src="#" alt="Selected Image" style="max-width: 300px; max-height: 300px; display: none;">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col">
                                                    <div class="form-group">
                                                        <label>Address</label>
                                                        <input class="form-control" type="text" name="address" required>
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <div class="form-group">
                                                        <label>Email</label>
                                                        <input class="form-control" type="text" name="email" required>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col">
                                                    <div class="form-group">
                                                        <label>Gender</label>
                                                        <div class="row">
                                                            <input type="radio" value="1" id="male" name="gender" checked/>
                                                            <label for="male" class="radio" chec >Male</label>
                                                        </div>
                                                        <div class="row">
                                                            <input type="radio" value="2" id="female" name="gender" />
                                                            <label for="female" class="radio" >Female</label>
                                                        </div>
                                                        <div class="row">
                                                            <input type="radio" value="0" id="other" name="gender" />
                                                            <label for="other" class="radio" >Other</label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col">
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
                                            </div>

                                            <div class="row">
                                                <div class="col d-flex justify-content-end">
                                                    <button class="btn btn-primary" type="submit">Add new</button>
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
                const customerID = $(icon).data('id');
                const newStatus = $(icon).data('status') === 1 ? 0 : 1;

                $.ajax({
                    url: 'managercustomerlist', // URL để xử lý yêu cầu cập nhật
                    type: 'POST',
                    data: {action: 'updateStatus', id: customerID, status: newStatus},
                    success: function (response) {
                        // Chuyển đổi trạng thái biểu tượng và giá trị data-status
                        if (newStatus === 1) {
                            $(icon).removeClass('fa-toggle-off').addClass('fa-toggle-on text-secondary');
                        } else {
                            $(icon).removeClass('fa-toggle-on text-secondary').addClass('fa-toggle-off');
                        }
                        $(icon).data('status', newStatus);
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
        <jsp:include page="../layout/footer.jsp"></jsp:include><br>
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