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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/_all-skins.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/morris.css">


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
                    <span class="logo-lg"><b>Sale</b></span>
                </a>
                <!-- Header Navbar: style can be found in header.less -->
                <nav class="navbar navbar-static-top"><!-- Sidebar toggle button-->
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
                                <ul class="dropdown-menu"><li class="header">You have 10 notifications</li>
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
                            </li><!-- User Account: style can be found in dropdown.less -->
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
                            <a href="SaleDashBoard">
                                <i class="fa fa-th"></i> <span>DashBoard</span>
                            </a>
                        </li>
                        <li>
                            <a href="OrderListOfSaleAdmin">
                                <i class="fa fa-th"></i> <span>Manage Order</span>
                            </a>
                        </li>
                       
                        <!--                        <li class="treeview">
                                                    <a href="#"><i class="fa fa-pie-chart"></i>
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
                        DASHBOARD
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

                    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
                    <div class="container" >
                        <div class="row">
                            <c:choose >
                                <c:when test="${view == 'dashboard'}">
                                    <div class="col-lg-3 col-xs-6">
                                        <!-- small box -->
                                        <div class="small-box bg-aqua">
                                            <div class="inner">
                                                <h3>${totalOrders}</h3>

                                                <p>Total Order</p>
                                            </div>
                                            <div class="icon">
                                                <i class="ion ion-bag"></i>
                                            </div>
                                            <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                                        </div>
                                    </div>
                                    <!-- ./col -->
                                    <div class="col-lg-3 col-xs-6">
                                        <!-- small box -->
                                        <div class="small-box bg-green">
                                            <div class="inner">
                                                <h3>${totalAmount}$<sup style="font-size: 20px">VNĐ</sup></h3>

                                                <p>Total Amount</p>
                                            </div>
                                            <div class="icon">
                                                <i class="ion ion-stats-bars"></i>
                                            </div>
                                            <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                                        </div>
                                    </div>
                                    <!-- ./col -->
                                    <div class="col-lg-3 col-xs-6">
                                        <!-- small box -->
                                        <div class="small-box bg-yellow">
                                            <div class="inner">
                                                <h3>${totalCustomers}</h3>

                                                <p>
                                                    Total Customer</p>
                                            </div>
                                            <div class="icon">
                                                <i class="ion ion-person-add"></i>
                                            </div>
                                            <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                                        </div>
                                    </div>
                                    <!-- ./col -->
                                    <div class="col-lg-3 col-xs-6">
                                        <!-- small box -->
                                        <div class="small-box bg-red">
                                            <div class="inner">
                                                <h3>
                                                    ${totalProducts}</h3>

                                                <p>Total Product</p>
                                            </div>
                                            <div class="icon">
                                                <i class="ion ion-pie-graph"></i>
                                            </div>
                                            <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                                        </div>
                                    </div>
                                    <!-- ./col -->

                                </c:when>
                            </c:choose>
                        </div>
                        <div class="box box-info">
                            <div class="box-header with-border">
                                <h3 class="box-title">Bar Chart</h3>
                                <div class="box-tools pull-right">
                                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                                    <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                                </div>
                                <form id="f1" method="get" action="SaleDashBoard">
                                    <input type="hidden" name="view" value="totalOrder">
                                    <select name="year" class="form-control" id="dropdownYear" style="width: 120px;">
                                        <c:set var="currentYear" value="2024"/>
                                        <c:set var="endYear" value="2018"/>
                                        <c:forEach var="year" begin="0" end="${currentYear - endYear}">
                                            <option ${requestScope.year == (currentYear - year) ? "selected" : ""} value="${currentYear - year}">${currentYear - year}</option>
                                        </c:forEach>
                                    </select>
                                    <input style="width: 200px;" value="" type="week" class="form-control" id="weekInput" onclick="setDefaultWeek()">
                                    <input value="" type="hidden" class="form-control" name="from" id="from">
                                    <input value="" type="hidden" class="form-control" name="to" id="to">
                                    <input value="" type="hidden" class="form-control" name="month" id="month">
                                    <button style="width: 100px; padding: 0" class="form-control" type="button" onclick="submitForm()">Submit</button>
                                </form>
                            </div>
                            <div class="chart w-100">
                                <div id="apexcharts-column"></div>
                            </div>

                            <!-- /.box-body -->
                        </div>

                        <!--                        <div class="box box-info">
                                                    <div class="box-header with-border">
                                                        <h3 class="box-title">Line Chart</h3>
                                                        <div class="box-tools pull-right">
                                                            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                                                            <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                                                        </div>
                                                        <form id="f1" method="get" action="saledashboard">
                                                            
                                                            <select name="year" class="form-control" id="dropdownYear" style="width: 120px;">
                        <c:set var="currentYear" value="2024"/>
                        <c:set var="endYear" value="2018"/>
                        <c:forEach var="year" begin="0" end="${currentYear - endYear}">
                            <option ${requestScope.year == (currentYear - year) ? "selected" : ""} value="${currentYear - year}">${currentYear - year}</option>
                        </c:forEach>
                    </select>
                    <input style="width: 200px;" value="" type="week" class="form-control" id="weekInput" onclick="setDefaultWeek()">
                    <input value="" type="hidden" class="form-control" name="from" id="from">
                    <input value="" type="hidden" class="form-control" name="to" id="to">
                    <input value="" type="hidden" class="form-control" name="month" id="month">
                    <button style="width: 100px; padding: 0" class="form-control" type="button" onclick="submitForm()">Submit</button>
                </form>
            </div>
             
             /.box-body 
        </div>-->
                        <div class="box-body chart-responsive">
                            <canvas id="totalOrderCanvas" width="920" height="400"></canvas>
                        </div>     

                    </div>

                    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.1/dist/js/bootstrap.bundle.min.js"></script>


                    <script type="text/javascript">

                    </script>
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
            <aside class="control-sidebar control-sidebar-dark"><!-- Create the tabs -->
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
                        <!-- /.control-sidebar-menu --><h3 class="control-sidebar-heading">Tasks Progress</h3>
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
                    <!-- /.tab-pane --><!-- Stats tab content -->
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
                            <!-- /.form-group --><div class="form-group">
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
        <script src="${pageContext.request.contextPath}/asset/js/app.js"></script>
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
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                const orderDates = [
                    "${orderDate1}", "${orderDate2}", "${orderDate3}",
                    "${orderDate4}", "${orderDate5}", "${orderDate6}", "${orderDate7}"
                ];

                const successfulOrders = [
            ${successfulOrders1}, ${successfulOrders2}, ${successfulOrders3},
            ${successfulOrders4}, ${successfulOrders5}, ${successfulOrders6}, ${successfulOrders7}
                ];
                const cancelledOrders = [
            ${cancelledOrders1}, ${cancelledOrders2}, ${cancelledOrders3},
            ${cancelledOrders4}, ${cancelledOrders5}, ${cancelledOrders6}, ${cancelledOrders7}
                ];
                const pendingOrders = [
            ${pendingOrders1}, ${pendingOrders2}, ${pendingOrders3},
            ${pendingOrders4}, ${pendingOrders5}, ${pendingOrders6}, ${pendingOrders7}
                ];
                const processingOrders = [
            ${processingOrders1}, ${processingOrders2}, ${processingOrders3},
            ${processingOrders4}, ${processingOrders5}, ${processingOrders6}, ${processingOrders7}
                ];

                var options = {
                    chart: {
                        height: 350,
                        type: "bar",
                    },
                    plotOptions: {
                        bar: {
                            horizontal: false,
                            endingShape: "rounded",
                            columnWidth: "55%",
                        },
                    },
                    dataLabels: {
                        enabled: false
                    },
                    stroke: {
                        show: true,
                        width: 2,
                        colors: ["transparent"]
                    },
                    series: [{
                            name: "Successful Orders",
                            data: successfulOrders
                        }, {
                            name: "Cancelled Orders",
                            data: cancelledOrders
                        }, {
                            name: "Pending Orders",
                            data: pendingOrders
                        }, {
                            name: "Processing Orders",
                            data: processingOrders
                        }],
                    xaxis: {
                        categories: ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"],
                    },
                    yaxis: {
                        title: {
                            text: "Orders"
                        }
                    },
                    fill: {
                        opacity: 1
                    },
                    tooltip: {
                        y: {
                            formatter: function (val, opts) {
                                return val + " orders on " + orderDates[opts.dataPointIndex];
                            }
                        }
                    }
                };

                var chart = new ApexCharts(
                        document.querySelector("#apexcharts-column"),
                        options
                        );
                chart.render();
            });



            function submitForm() {
                var year = document.getElementById("dropdownYear").value;
                var weekInput = document.getElementById('weekInput');
                var selectedWeek = weekInput.value;
                var [, week] = selectedWeek.split('-W');

                var startDate = getDateFromWeek(year, parseInt(week));

                var endDate = new Date(startDate);
                endDate.setDate(startDate.getDate() + 6);

                var month = startDate.toLocaleString('en-US', {month: 'long'});
                var monthNumber = getMonthNumber(month);

                var startDay = startDate.getDate();
                var endDay = endDate.getDate();

                document.getElementById("from").value = startDay;
                document.getElementById("to").value = endDay;
                document.getElementById("month").value = monthNumber;

                document.getElementById("f1").submit();
            }

            function getDateFromWeek(year, week) {
                var januaryFourth = new Date(year, 0, 4);
                var daysToAdd = (week - 1) * 7;
                januaryFourth.setDate(januaryFourth.getDate() + daysToAdd - januaryFourth.getDay() + 1);
                return januaryFourth;
            }

            function getMonthNumber(monthName) {
                var monthsMap = {
                    'January': 1, 'February': 2, 'March': 3, 'April': 4,
                    'May': 5, 'June': 6, 'July': 7, 'August': 8,
                    'September': 9, 'October': 10, 'November': 11, 'December': 12
                };
                return monthsMap[monthName];
            }
        </script>

        <script>
            document.addEventListener("DOMContentLoaded", function () {
                var ctx = document.getElementById("totalOrderCanvas").getContext("2d");

                // Define gradients for light and dark themes
                var gradientLight = ctx.createLinearGradient(0, 0, 0, 225);
                gradientLight.addColorStop(0, "rgba(215, 227, 244, 1)");
                gradientLight.addColorStop(1, "rgba(215, 227, 244, 0)");

                var gradientDark = ctx.createLinearGradient(0, 0, 0, 225);
                gradientDark.addColorStop(0, "rgba(51, 66, 84, 1)");
                gradientDark.addColorStop(1, "rgba(51, 66, 84, 0)");

                // Total money data array
                var totalMoneyData = [
            ${amountOrders1},
            ${amountOrders2},
            ${amountOrders3},
            ${amountOrders4},
            ${amountOrders5},
            ${amountOrders6},
            ${amountOrders7}
                ];

                // Order dates array
                var orderDates = [
                    "${orderDate1}",
                    "${orderDate2}",
                    "${orderDate3}",
                    "${orderDate4}",
                    "${orderDate5}",
                    "${orderDate6}",
                    "${orderDate7}"
                ];

                // Create chart
                new Chart(ctx, {
                    type: "line",
                    data: {
                        labels: ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"],
                        datasets: [{
                                label: "Amount ($)",
                                fill: true,
                                backgroundColor: window.theme && window.theme.id === "light" ? gradientLight : gradientDark,
                                borderColor: window.theme && window.theme.primary ? window.theme.primary : '#000',
                                data: totalMoneyData
                            }]
                    },
                    options: {
                        maintainAspectRatio: false,
                        legend: {
                            display: false
                        },
                        tooltips: {
                            intersect: false,
                            callbacks: {
                                title: function (tooltipItem) {
                                    var index = tooltipItem[0].index;
                                    return "Date: " + orderDates[index]; // Display the order date in the tooltip
                                },
                                label: function (tooltipItem) {
                                    return "Amount: $" + tooltipItem.yLabel;
                                }
                            }
                        },
                        hover: {
                            intersect: true
                        },
                        plugins: {
                            filler: {
                                propagate: false
                            }
                        },
                        scales: {
                            x: {
                                reverse: false,
                                grid: {
                                    color: "rgba(0,0,0,0.0)"
                                }
                            },
                            y: {
                                ticks: {
                                    stepSize: 1000
                                },
                                grid: {
                                    color: "rgba(0,0,0,0.0)"
                                }
                            }
                        }
                    }
                });
            });

            function submitForm() {
                var year = document.getElementById("dropdownYear").value;
                var weekInput = document.getElementById('weekInput');
                var selectedWeek = weekInput.value;
                var [, week] = selectedWeek.split('-W');

                var startDate = getDateFromWeek(year, parseInt(week));
                var endDate = new Date(startDate);
                endDate.setDate(startDate.getDate() + 6);

                var month = startDate.getMonth() + 1;
                var startDay = startDate.getDate();
                var endDay = endDate.getDate();

                document.getElementById("from").value = startDay;
                document.getElementById("to").value = endDay;
                document.getElementById("month").value = month;

                document.getElementById("f1").submit();
            }

            function getDateFromWeek(year, week) {
                var januaryFourth = new Date(year, 0, 4);
                var daysToAdd = (week - 1) * 7;
                januaryFourth.setDate(januaryFourth.getDate() + daysToAdd - januaryFourth.getDay() + 1);
                return januaryFourth;
            }
        </script>

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