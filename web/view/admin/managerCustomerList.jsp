<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>AdminLTE 2 | Blank Page</title>
        <!-- Tell the browser to be responsive to screen width -->
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <!-- Bootstrap 3.3.6 -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/bootstrap2.min.css">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
        <!-- Ionicons -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
        <!-- Theme style -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/AdminLTE.min.css">
        <!-- AdminLTE Skins. Choose a skin from the css/skins folder instead of downloading all of them to reduce the load. -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/_all-skins.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/morris.css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">


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
    <body class="hold-transition skin-blue sidebar-mini">
        <!-- Site wrapper -->
        <div class="wrapper">

            <header class="main-header">
                <!-- Logo -->
                <a href="../../index2.html" class="logo">
                    <!-- mini logo for sidebar mini 50x50 pixels -->
                    <span class="logo-mini"><b>A</b>LT</span>
                    <!-- logo for regular state and mobile devices -->
                    <span class="logo-lg"><b>Admin</b>LTE</span>
                </a>
                <!-- Header Navbar: style can be found in header.less -->
                <nav class="navbar navbar-static-top"><!-- Sidebar toggle button-->
                    <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </a>
                </nav>
            </header><!-- =============================================== -->

            <!-- Left side column. contains the sidebar -->
            <aside class="main-sidebar">
                <!-- sidebar: style can be found in sidebar.less -->
                <section class="sidebar">
                    <!-- Sidebar user panel -->
                    <div class="user-panel">
                        <div class="pull-left image">
                            <img src="../../dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
                        </div>
                        <div class="pull-left info">
                            <p>Alexander Pierce</p>
                            <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
                        </div>
                    </div>
                    <!-- search form -->
                    <form action="#" method="get" class="sidebar-form">
                        <div class="input-group">
                            <input type="text" name="q" class="form-control" placeholder="Search...">
                            <span class="input-group-btn">
                                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
                                </button>
                            </span>
                        </div>
                    </form>
                    <!-- /.search form -->
                    <!-- sidebar menu: : style can be found in sidebar.less -->
                    <ul class="sidebar-menu">
                        <li class="header">MAIN NAVIGATION</li>
                        <li>
                            <a href="ManageProduct">
                                <i class="fa fa-th"></i> <span>Manage Product</span>
                            </a>
                        </li>
                        <li>
                            <a href="ManagerCustomerList">
                                <i class="fa fa-th"></i> <span>Manage Customers</span>
                            </a>
                        </li>
                        <li>
                            <a href="ManageSliders">
                                <i class="fa fa-th"></i> <span>Manage Sliders</span>
                            </a>
                        </li>
                        <li>
                            <a href="ManagerPostList">
                                <i class="fa fa-th"></i> <span>Manage Post</span>
                            </a>
                        </li>
                        <li>
                            <a href="ManageFeedback">
                                <i class="fa fa-th"></i> <span>Manage Feedback</span>
                            </a>
                        </li>
                    </ul>
                </section>
                <!-- /.sidebar -->
            </aside>

            <!-- =============================================== -->

            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                        Manager Customer List

                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li><a href="#">Examples</a></li>
                        <li class="active">Blank page</li>
                    </ol>
                </section>
                <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
                <c:if test="${not empty sessionScope.successMessage}">
                    <div class="alert alert-success" role="alert">
                        ${sessionScope.successMessage}
                    </div>
                    <%-- Xóa thông báo thành công từ session để tránh hiển thị lại khi làm mới trang --%>
                    <% session.removeAttribute("successMessage"); %>
                </c:if>
                <!-- Main content -->
                <section class="content">

                    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
                    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">

                    <div class="row flex-lg-nowrap" class="padding-button:500">

                        <div class="col">


                            <div class="row flex-lg-nowrap">
                                <div class="col mb-3">
                                    <div class="e-panel card">
                                        <div class="card-body">

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
                                                                    <a href="UpdateCustomer?customerID=${c.customerID}">
                                                                        <button class="btn btn-sm btn-outline-secondary badge" type="button"  data-target="#user-form-modal">Edit</button>
                                                                    </a>
                                                                    <a href="CustomerDetail?customerID=${c.customerID}">
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
                                                <form class="form" action="AddCustomer" method="post" enctype="multipart/form-data">
                                                    <div class="row">
                                                        <div class="col-6">
                                                            <div class="form-group">
                                                                <h6>Full Name</h6>
                                                                <input class="form-control" type="text" name="name" required>
                                                            </div>
                                                        </div>
                                                        <div class="col-6">
                                                            <div class="form-group">
                                                                <h6>Phone</h6>
                                                                <input class="form-control" type="text" name="phone" required>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="row">
                                                        <div class="col-6">
                                                            <div class="form-group">
                                                                <h6>Address</h6>
                                                                <input class="form-control" type="text" name="address" required>
                                                            </div>
                                                        </div>
                                                        <div class="col-6">
                                                            <div class="form-group">
                                                                <h6>Email</h6>
                                                                <input class="form-control" type="text" name="email" required>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col">
                                                            <div class="form-group">
                                                                <h6>Avatar</h6>
                                                                <input class="form-control" type="file" id="imageInput" name="image" required onchange="displaySelectedImage(this)">
                                                                <img id="selectedImage" src="#" alt="Selected Image" style="max-width: 300px; max-height: 300px; display: none;">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row mx-3">
                                                        <div class="col">
                                                            <div class="form-group">
                                                                <h6>Gender</h6>
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
                                                                <h6>Status</h6>
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
                </section>
                <!-- /.content -->
            </div>
            <!-- /.content-wrapper -->
            <div class="control-sidebar-bg"></div>
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


        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
        <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
        <!-- ./wrapper -->
        <script src="${pageContext.request.contextPath}/asset/js/app.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
        <!-- jQuery 2.2.3 -->
        <script src="${pageContext.request.contextPath}/asset/js/jquery-2.2.3.min.js"></script>
        <!-- Bootstrap 3.3.6 -->
        <script src="${pageContext.request.contextPath}/asset/js/bootstrap2.min.js"></script>
        <!-- SlimScroll -->
        <script src="${pageContext.request.contextPath}/asset/js/jquery.slimscroll.min.js"></script>
        <!-- FastClick -->
        <script src="${pageContext.request.contextPath}/asset/js/fastclick.js"></script>
        <!-- AdminLTE App -->
        <script src="${pageContext.request.contextPath}/asset/js/app.min.js"></script>
        <!-- AdminLTE for demo purposes -->
        <script src="${pageContext.request.contextPath}/asset/js/demo.js"></script>
        <script src="${pageContext.request.contextPath}/asset/js/morris.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
    </body>
</html>
