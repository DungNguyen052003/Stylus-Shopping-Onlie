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
        <!-- AdminLTE Skins. Choose a skin from the css/skins
             folder instead of downloading all of them to reduce the load. -->
        <link rel="stylesheet" href=".${pageContext.request.contextPath}/asset/css/skins/_all-skins.min.css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

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
                <nav class="navbar navbar-static-top">
                    <!-- Sidebar toggle button-->
                    <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </a>

                    <div class="navbar-custom-menu">
                        <ul class="nav navbar-nav">
                            <!-- Messages: style can be found in dropdown.less-->
                            <li class="dropdown messages-menu">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <i class="fa fa-envelope-o"></i>
                                    <span class="label label-success">4</span>
                                </a>
                                <ul class="dropdown-menu">
                                    <li class="header">You have 4 messages</li>
                                    <li>
                                        <!-- inner menu: contains the actual data -->
                                        <ul class="menu">
                                            <li><!-- start message -->
                                                <a href="#">
                                                    <div class="pull-left">
                                                        <img src="../../dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
                                                    </div>
                                                    <h4>
                                                        Support Team
                                                        <small><i class="fa fa-clock-o"></i> 5 mins</small>
                                                    </h4>
                                                    <p>Why not buy a new awesome theme?</p>
                                                </a>
                                            </li>
                                            <!-- end message -->
                                        </ul>
                                    </li>
                                    <li class="footer"><a href="#">See All Messages</a></li>
                                </ul>
                            </li>
                            <!-- Notifications: style can be found in dropdown.less -->
                            <li class="dropdown notifications-menu">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <i class="fa fa-bell-o"></i>
                                    <span class="label label-warning">10</span>
                                </a>
                                <ul class="dropdown-menu">
                                    <li class="header">You have 10 notifications</li>
                                    <li>
                                        <!-- inner menu: contains the actual data -->
                                        <ul class="menu">
                                            <li>
                                                <a href="#">
                                                    <i class="fa fa-users text-aqua"></i> 5 new members joined today
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li class="footer"><a href="#">View all</a></li>
                                </ul>
                            </li>
                            <!-- Tasks: style can be found in dropdown.less -->
                            <li class="dropdown tasks-menu">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <i class="fa fa-flag-o"></i>
                                    <span class="label label-danger">9</span>
                                </a>
                                <ul class="dropdown-menu">
                                    <li class="header">You have 9 tasks</li>
                                    <li>
                                        <!-- inner menu: contains the actual data -->
                                        <ul class="menu">
                                            <li><!-- Task item -->
                                                <a href="#">
                                                    <h3>
                                                        Design some buttons
                                                        <small class="pull-right">20%</small>
                                                    </h3>
                                                    <div class="progress xs">
                                                        <div class="progress-bar progress-bar-aqua" style="width: 20%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                                                            <span class="sr-only">20% Complete</span>
                                                        </div>
                                                    </div>
                                                </a>
                                            </li>
                                            <!-- end task item -->
                                        </ul>
                                    </li>
                                    <li class="footer">
                                        <a href="#">View all tasks</a>
                                    </li>
                                </ul>
                            </li>
                            <!-- User Account: style can be found in dropdown.less -->
                            <li class="dropdown user user-menu">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <img src="../../dist/img/user2-160x160.jpg" class="user-image" alt="User Image">
                                    <span class="hidden-xs">Alexander Pierce</span>
                                </a>
                                <ul class="dropdown-menu">
                                    <!-- User image -->
                                    <li class="user-header">
                                        <img src="../../dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">

                                        <p>
                                            Alexander Pierce - Web Developer
                                            <small>Member since Nov. 2012</small>
                                        </p>
                                    </li>
                                    <!-- Menu Body -->
                                    <li class="user-body">
                                        <div class="row">
                                            <div class="col-xs-4 text-center">
                                                <a href="#">Followers</a>
                                            </div>
                                            <div class="col-xs-4 text-center">
                                                <a href="#">Sales</a>
                                            </div>
                                            <div class="col-xs-4 text-center">
                                                <a href="#">Friends</a>
                                            </div>
                                        </div>
                                        <!-- /.row -->
                                    </li>
                                    <!-- Menu Footer-->
                                    <li class="user-footer">
                                        <div class="pull-left">
                                            <a href="#" class="btn btn-default btn-flat">Profile</a>
                                        </div>
                                        <div class="pull-right">
                                            <a href="#" class="btn btn-default btn-flat">Sign out</a>
                                        </div>
                                    </li>
                                </ul>
                            </li>
                            <!-- Control Sidebar Toggle Button -->
                            <li>
                                <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
                            </li>
                        </ul>
                    </div>
                </nav>
            </header>

            <!-- =============================================== -->

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
                            <a href="MktDashboard">
                                <i class="fa fa-th"></i> <span>Dashboard</span>
                            </a>
                        </li>

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
                        <!--                        <li class="treeview">
                                                    <a href="#">
                                                        <i class="fa fa-pie-chart"></i>
                                                        <span>Charts</span>
                                                        <span class="pull-right-container">
                                                            <i class="fa fa-angle-left pull-right"></i>
                                                        </span>
                                                    </a>
                                                    <ul class="treeview-menu">
                                                        <li><a href="../charts/chartjs.html"><i class="fa fa-circle-o"></i> ChartJS</a></li>
                                                        <li><a href="../charts/morris.html"><i class="fa fa-circle-o"></i> Morris</a></li>
                                                        <li><a href="../charts/flot.html"><i class="fa fa-circle-o"></i> Flot</a></li>
                                                        <li><a href="../charts/inline.html"><i class="fa fa-circle-o"></i> Inline charts</a></li>
                                                    </ul>
                                                </li>-->


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
                        Blank page
                        <small>it all starts here</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li><a href="#">Examples</a></li>
                        <li class="active">Blank page</li>
                    </ol>
                </section>
                <!-- Main content -->
                <section class="content">
                    <div class="container" style="max-width: 100%">
                        <div class="row flex-lg-nowrap">
                            <div class="col">

                                <div class="row flex-lg-nowrap">
                                    <div class="col">
                                        <div class="e-panel card">
                                            <div class="card-body">
                                                <div class="card-title">
                                                    <h6 class="mr-2"><span>Manager Feedback List</span></h6>
                                                </div>
                                                <div class="e-table">
                                                    <div class="table table-lg">
                                                        <table class="table table-bordered" style="width: 100%">
                                                            <thead>
                                                                <tr>
                                                                    <th class="align-middle">ID</th>
                                                                    <th class="align-middle">Customer's Name</th>
                                                                    <th class="align-middle">Product's Name</th>
                                                                    <th class="align-middle" style="width: 80px;">Rated Star</th>
                                                                    <th class="align-middle">Feedback</th>
                                                                    <th class="align-middle">Status</th>
                                                                    <th class="align-middle">Actions</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <c:forEach items="${FeedbackList}" var="m">
                                                                    <tr>
                                                                        <td class="align-middle" name="id">${m.id}</td>
                                                                        <td class="align-middle" style="white-space: normal;" name="name">${m.productName}</td>
                                                                        <td class="align-middle" style="white-space: normal;" name="name">${m.customerName}</td>
                                                                        <td class="align-middle" name="ratedStar">
                                                                            <c:forEach begin="1" end="5" var="i">
                                                                                <i class="fa fa-star <c:if test='${i <= m.rateStar}'>text-warning</c:if>"></i>
                                                                            </c:forEach>
                                                                        </td>
                                                                        <td class="align-middle" name="info" >
                                                                            <p style="overflow: hidden;
                                                                               display: -webkit-box;
                                                                               -webkit-line-clamp: 3;
                                                                               -webkit-box-orient: vertical;
                                                                               width: 250px;
                                                                               word-wrap: break-word;">
                                                                                ${m.comment}
                                                                            </p>
                                                                            <form action="ManageFeedback" method="POST">
                                                                                <td class="text-center align-middle" name="status" data-status="${m.status}">
                                                                                    <i class="fa cursor-pointer
                                                                                       <c:choose>
                                                                                           <c:when test="${m.status eq 1}">fa-toggle-on text-secondary</c:when>
                                                                                           <c:otherwise>fa-toggle-off</c:otherwise>
                                                                                       </c:choose>"
                                                                                       data-id="${m.id}" 
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
                                                                                    const feedbackID = $(icon).data('id');
                                                                                    const newStatus = currentClass === 'fa-toggle-on' ? 0 : 1;

                                                                                    $.ajax({
                                                                                        url: 'ManageFeedback', // URL để xử lý yêu cầu cập nhật
                                                                                        type: 'POST',
                                                                                        data: {action: 'updateStatus', id: feedbackID, status: newStatus},
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
                                                                                        onclick="location.href = 'FeedbackDetails?id=${m.id}'">
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
                                                        <form id="sortForm" action="ManageFeedback" method="GET">
                                                            <!-- Sort Section -->
                                                            <div class="search-input">
                                                                <label for="sortSelect">Sort:</label>
                                                                <select id="sortSelect" class="form-control" name="sort" onchange="document.getElementById('sortForm').submit();">
                                                                    <option value="sort" <%= "sort".equals(request.getParameter("sort")) ? "selected" : "" %>>Sort by ....</option>
                                                                    <option value="fullName" <%= "fullName".equals(request.getParameter("sort")) ? "selected" : "" %>>Sort by Customer's Name</option>
                                                                    <option value="productName" <%= "productName".equals(request.getParameter("sort")) ? "selected" : "" %>>Sort by Product's Name</option>
                                                                    <option value="ratedStar" <%= "ratedStar".equals(request.getParameter("sort")) ? "selected" : "" %>>Sort by Rate</option>
                                                                    <option value="status" <%= "status".equals(request.getParameter("sort")) ? "selected" : "" %>>Sort by Sale Status</option>
                                                                </select>
                                                            </div>

                                                        </form>   

                                                        <form action="ManageFeedback" method="get">
                                                            <input type="hidden" name="action" value="filterFeedback">
                                                            <!--Price Filter Section--> 
                                                            <hr class="my-3">


                                                            <!--Search Section--> 
                                                            <hr class="my-3">
                                                            <div class="search-container">
                                                                <div class="form-group" id="searchDropdown">
                                                                    <div class="search-input" value="productName">
                                                                        <label>Search by product :</label>
                                                                        <input class="form-control w-100" type="text" placeholder="Search" name="productName">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="search-container">
                                                                <div class="form-group" id="searchDropdown">
                                                                    <div class="search-input" value="fullName">
                                                                        <label>Search by customer's name:</label>
                                                                        <input class="form-control w-100" type="text" placeholder="Search" name="fullName">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="search-container">
                                                                <div class="form-group" id="searchDropdown">
                                                                    <div class="search-input" value="content">
                                                                        <label>Search by feedback:</label>
                                                                        <input class="form-control w-100" type="text" placeholder="Search" name="content">
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <!--Rate Filter Section--> 
                                                            <hr class="my-3">
                                                            <div value="rate">
                                                                <label>Rated Star:</label>
                                                                <div class="px-2">
                                                                    <div class="custom-control custom-radio">
                                                                        <input type="radio" class="custom-control-input" name="rate" id="rate-1-star" value="1" />
                                                                        <label class="custom-control-label" for="rate-1-star">
                                                                            <i class="fa fa-star text-warning"></i>
                                                                        </label>
                                                                    </div>
                                                                    <div class="custom-control custom-radio">
                                                                        <input type="radio" class="custom-control-input" name="rate" id="rate-2-stars" value="2" />
                                                                        <label class="custom-control-label" for="rate-2-stars">
                                                                            <i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i>
                                                                        </label>
                                                                    </div>
                                                                    <div class="custom-control custom-radio">
                                                                        <input type="radio" class="custom-control-input" name="rate" id="rate-3-stars" value="3" />
                                                                        <label class="custom-control-label" for="rate-3-stars">
                                                                            <i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i>
                                                                        </label>
                                                                    </div>
                                                                    <div class="custom-control custom-radio">
                                                                        <input type="radio" class="custom-control-input" name="rate" id="rate-4-stars" value="4" />
                                                                        <label class="custom-control-label" for="rate-4-stars">
                                                                            <i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i>
                                                                        </label>
                                                                    </div>
                                                                    <div class="custom-control custom-radio">
                                                                        <input type="radio" class="custom-control-input" name="rate" id="rate-5-stars" value="5" />
                                                                        <label class="custom-control-label" for="rate-5-stars">
                                                                            <i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                            </div>

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



                        </div>

                    </div>
                    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.1/dist/js/bootstrap.bundle.min.js"></script>

                </section>
                <!-- /.content -->
            </div>
            <!-- /.content-wrapper -->

            <footer class="main-footer">
                <div class="pull-right hidden-xs">
                    <b>Version</b> 2.3.12
                </div>
                <strong>Copyright &copy; 2014-2016 <a href="http://almsaeedstudio.com">Almsaeed Studio</a>.</strong> All rights
                reserved.
            </footer>

            <!-- Control Sidebar -->
            <aside class="control-sidebar control-sidebar-dark">
                <!-- Create the tabs -->
                <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
                    <li><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>

                    <li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>
                </ul>
                <!-- Tab panes -->
                <div class="tab-content">
                    <!-- Home tab content -->
                    <div class="tab-pane" id="control-sidebar-home-tab">
                        <h3 class="control-sidebar-heading">Recent Activity</h3>
                        <ul class="control-sidebar-menu">
                            <li>
                                <a href="javascript:void(0)">
                                    <i class="menu-icon fa fa-birthday-cake bg-red"></i>

                                    <div class="menu-info">
                                        <h4 class="control-sidebar-subheading">Langdon's Birthday</h4>

                                        <p>Will be 23 on April 24th</p>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:void(0)">
                                    <i class="menu-icon fa fa-user bg-yellow"></i>

                                    <div class="menu-info">
                                        <h4 class="control-sidebar-subheading">Frodo Updated His Profile</h4>

                                        <p>New phone +1(800)555-1234</p>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:void(0)">
                                    <i class="menu-icon fa fa-envelope-o bg-light-blue"></i>

                                    <div class="menu-info">
                                        <h4 class="control-sidebar-subheading">Nora Joined Mailing List</h4>

                                        <p>nora@example.com</p>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:void(0)">
                                    <i class="menu-icon fa fa-file-code-o bg-green"></i>

                                    <div class="menu-info">
                                        <h4 class="control-sidebar-subheading">Cron Job 254 Executed</h4>

                                        <p>Execution time 5 seconds</p>
                                    </div>
                                </a>
                            </li>
                        </ul>
                        <!-- /.control-sidebar-menu -->

                        <h3 class="control-sidebar-heading">Tasks Progress</h3>
                        <ul class="control-sidebar-menu">
                            <li>
                                <a href="javascript:void(0)">
                                    <h4 class="control-sidebar-subheading">
                                        Custom Template Design
                                        <span class="label label-danger pull-right">70%</span>
                                    </h4>

                                    <div class="progress progress-xxs">
                                        <div class="progress-bar progress-bar-danger" style="width: 70%"></div>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:void(0)">
                                    <h4 class="control-sidebar-subheading">
                                        Update Resume
                                        <span class="label label-success pull-right">95%</span>
                                    </h4>

                                    <div class="progress progress-xxs">
                                        <div class="progress-bar progress-bar-success" style="width: 95%"></div>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:void(0)">
                                    <h4 class="control-sidebar-subheading">
                                        Laravel Integration
                                        <span class="label label-warning pull-right">50%</span>
                                    </h4>

                                    <div class="progress progress-xxs">
                                        <div class="progress-bar progress-bar-warning" style="width: 50%"></div>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:void(0)">
                                    <h4 class="control-sidebar-subheading">
                                        Back End Framework
                                        <span class="label label-primary pull-right">68%</span>
                                    </h4>

                                    <div class="progress progress-xxs">
                                        <div class="progress-bar progress-bar-primary" style="width: 68%"></div>
                                    </div>
                                </a>
                            </li>
                        </ul>
                        <!-- /.control-sidebar-menu -->

                    </div>
                    <!-- /.tab-pane -->
                    <!-- Stats tab content -->
                    <div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div>
                    <!-- /.tab-pane -->
                    <!-- Settings tab content -->
                    <div class="tab-pane" id="control-sidebar-settings-tab">
                        <form method="post">
                            <h3 class="control-sidebar-heading">General Settings</h3>

                            <div class="form-group">
                                <label class="control-sidebar-subheading">
                                    Report panel usage
                                    <input type="checkbox" class="pull-right" checked>
                                </label>

                                <p>
                                    Some information about this general settings option
                                </p>
                            </div>
                            <!-- /.form-group -->

                            <div class="form-group">
                                <label class="control-sidebar-subheading">
                                    Allow mail redirect
                                    <input type="checkbox" class="pull-right" checked>
                                </label>

                                <p>
                                    Other sets of options are available
                                </p>
                            </div>
                            <!-- /.form-group -->

                            <div class="form-group">
                                <label class="control-sidebar-subheading">
                                    Expose author name in posts
                                    <input type="checkbox" class="pull-right" checked>
                                </label>

                                <p>
                                    Allow the user to show his name in blog posts
                                </p>
                            </div>
                            <!-- /.form-group -->

                            <h3 class="control-sidebar-heading">Chat Settings</h3>

                            <div class="form-group">
                                <label class="control-sidebar-subheading">
                                    Show me as online
                                    <input type="checkbox" class="pull-right" checked>
                                </label>
                            </div>
                            <!-- /.form-group -->

                            <div class="form-group">
                                <label class="control-sidebar-subheading">
                                    Turn off notifications
                                    <input type="checkbox" class="pull-right">
                                </label>
                            </div>
                            <!-- /.form-group -->

                            <div class="form-group">
                                <label class="control-sidebar-subheading">
                                    Delete chat history
                                    <a href="javascript:void(0)" class="text-red pull-right"><i class="fa fa-trash-o"></i></a>
                                </label>
                            </div>
                            <!-- /.form-group -->
                        </form>
                    </div>
                    <!-- /.tab-pane -->
                </div>
            </aside>
            <!-- /.control-sidebar -->
            <!-- Add the sidebar's background. This div must be placed
                 immediately after the control sidebar -->
            <div class="control-sidebar-bg"></div>
        </div>
        <!-- ./wrapper -->
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
                                                                            url: 'ManageFeedback', // URL để xử lý yêu cầu cập nhật
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
    </body>
</html>
