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
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <head>
        <!-- Morris.js CSS -->
        <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css">
        <!-- jQuery -->
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
        <!-- Raphael.js -->
        <script src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
        <!-- Morris.js -->
        <script src="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>
    </head>

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

        .small-box {
            height: 150px;
        }

        .small-box .inner h3 {
            font-size: 28px;
            margin: 0;
            padding: 0;
        }

        .small-box .inner p {
            font-size: 14px;
            margin: 5px 0;
        }

        .small-box .category-stars p {
            font-size: 12px;
            margin: 3px 0;
        }
        .fa-star {
            color: #000;
            margin-left: 2px; /* Khoảng cách giữa văn bản và biểu tượng sao */
            font-size: 10px; /* Kích thước biểu tượng sao */
        }

        .chart-container {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 100%;
            margin-top: 10px; /* Adjust as needed */
        }

        .box-primary {
            width: 100%; /* Adjust as needed */
            max-width: 100%; /* Adjust as needed */
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
                    <span class="logo-lg"><b>Admin</b></span>
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
                                                        <img src="${account.image}" class="img-circle" alt="User Image">
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
                                    <img src="${account.image}" class="user-image" alt="acc Image">
                                    <span class="hidden-xs">Alexander Pierce</span>
                                </a>
                                <ul class="dropdown-menu">
                                    <!-- User image -->
                                    <li class="user-header">
                                        <img src="${account.image}" class="img-circle" alt="acc Image">

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

        <!-- Left side column. contains the sidebar -->
        <aside class="main-sidebar">
            <!-- sidebar: style can be found in sidebar.less -->
            <section class="sidebar">
                <!-- Sidebar user panel -->
                <div class="user-panel">
                    <div class="pull-left image">
                        <img src="${account.image}" class="img-circle" alt="User Image">
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
                        <a href="AdminDashBoard">
                            <i class="fa fa-th"></i> <span>Dashboard</span>
                        </a>
                    </li>
                    <li>
                        <a href="AccountList">
                            <i class="fa fa-th"></i> <span>Account List</span>
                        </a>
                    </li>
                    <li>
                        <a href="CustomerList">
                            <i class="fa fa-th"></i> <span>Customer List</span>
                        </a>
                    </li>
                    <li>
                            <a href="SettingList">
                                <i class="fa fa-th"></i> <span>Setting List</span>
                            </a>
                    </li>
            </section>
        </aside>
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <h1>
                    Admin Dashboard

                </h1>
                <ol class="breadcrumb">
                    <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                    <li><a href="#">Examples</a></li>
                    <li class="active">Blank page</li>
                </ol>
            </section>
            <!-- Main content -->

            <section class="content">
                <form action="AdminDashBoard" >
                    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
                    <section class="content">

                        <!-- Small boxes (Stat box) -->
                        <div class="row">
                            <div class="col-lg-3 col-xs-6">
                                <div class="small-box bg-aqua">
                                    <div class="inner">
                                        <h3>${totalOrders}</h3>
                                        <p>Total Orders</p>
                                    </div>
                                    <div class="icon">
                                        <i class="ion ion-bag"></i>
                                    </div>
                                    <a href="#" class="small-box-footer"><i class="fa"></i></a>
                                </div>
                            </div>
                            <div class="col-lg-3 col-xs-6">
                                <div class="small-box bg-red">
                                    <div class="inner">
                                        <h3>${totalRevenue}</h3>
                                        <p>Total Revenue</p>
                                    </div>
                                    <div class="icon">
                                        <i class="ion ion-close"></i>
                                    </div>
                                    <a href="#" class="small-box-footer"><i class="fa"></i></a>
                                </div>
                            </div>
                            <div class="col-lg-3 col-xs-6">
                                <div class="small-box bg-yellow">
                                    <div class="inner">
                                        <h3>${totalFeedbacks}</h3>
                                        <p>Total Feedbacks</p>
                                        <p>Average Feedback Stars: ${avgFeedbackStars} <i class="fas fa-star"></i></p>
                                        <div class="category-stars">
                                            <c:forEach var="entry" items="${avgStarsByCategory}">
                                                <p>${entry.key}: ${entry.value} <i class="fas fa-star"></i></p>
                                                </c:forEach>
                                        </div>
                                    </div>
                                    <div class="icon">
                                        <i class="ion ion-document"></i>
                                    </div>
                                    <!-- <a href="#" class="small-box-footer"><i class="fa"></i></a> -->
                                </div>
                            </div>

                            <div class="col-lg-3 col-xs-6">
                                <div class="small-box bg-green">
                                    <div class="inner">
                                        <h3>${totalCustomers}</h3>
                                        <p>Total Customers</p>
                                    </div>
                                    <div class="icon">
                                        <i class="ion ion-stats-bars"></i>
                                    </div>
                                    <a href="#" class="small-box-footer"><i class="fa"></i></a>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-6 col-xs-12">
                                <div  class="nav-tabs-custom" style="cursor: move;">
                                    <ul class="nav nav-tabs pull-right ui-sortable-handle">
                                        <li class="active"><a href="#revenue-chart" data-toggle="tab">Revenue by category</a></li>
                                        <li><a href="#sales-chart" data-toggle="tab">Orders Status</a></li>
                                        <li class="pull-left header"><i class="fa fa-inbox"></i> Statistics</li>
                                    </ul>
                                    <div class="tab-content no-padding">
                                        <div class="chart tab-pane active" id="revenue-chart" style="position: relative; height: 270px;">
                                            <canvas id="revenueChart"></canvas>
                                        </div>
                                        <div class="chart tab-pane" id="sales-chart" style="height: 270px; position: relative;">
                                            <canvas id="donutChart"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-6 col-xs-12">
                                <div style="width: 100%" class="box box-success">
                                    <div class="box-header with-border">
                                        <h3 class="box-title">Bar Chart</h3>

                                        <div class="box-tools pull-right">
                                            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                                            </button>
                                            <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                                        </div>
                                    </div>
                                    <div class="box-body">
                                        <div class="chart">
                                            <canvas id="barChart" style="height: 200px; width: 300px;" height="158" width="412"></canvas>
                                        </div>
                                    </div>
                                    <!-- /.box-body -->
                                </div>
                            </div>
                        </div>
                    </section>

                    <!-- Main row --> 
                    <div class="chart-container">
                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title">Order Trend Chart</h3>
                                <div class="box-tools pull-right">
                                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                                    <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                                </div>
                            </div>
                            <div class="box-body">
                                <form method="get" action="AdminDashboard">
                                    <label for="startDate">Start Date:</label>
                                    <input type="date" id="startDate" name="startDate" value="${startDate}">
                                    <label for="endDate">End Date:</label>
                                    <input type="date" id="endDate" name="endDate" value="${endDate}">
                                    <button type="submit">Filter</button>
                                </form>
                                <div class="chart-responsive">
                                    <div class="chart" style="height: 300px;">
                                        <canvas id="orderTrendChart"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <script>
                        // Donut chart data
                        const ctxDonut = document.getElementById('donutChart').getContext('2d');
                        const donutChart = new Chart(ctxDonut, {
                        type: 'doughnut',
                                data: {
                                labels: ['Success', 'Cancelled', 'Submitted'],
                                        datasets: [{
                                        data: [${newSuccessOrders}, ${newCancelledOrders}, ${newSubmittedOrders}],
                                                backgroundColor: ['#00a65a', '#f56954', '#f39c12'],
                                                hoverBackgroundColor: ['#00a65a', '#f56954', '#f39c12']
                                        }]
                                },
                                options: {
                                responsive: true,
                                        maintainAspectRatio: false,
                                        cutoutPercentage: 50,
                                        legend: {
                                        display: true
                                        },
                                        animation: {
                                        animateScale: true,
                                                animateRotate: true
                                        }
                                }
                        });
                        // Revenue by category chart
                        const ctxRevenue = document.getElementById('revenueChart').getContext('2d');
                        const revenueChart = new Chart(ctxRevenue, {
                        type: 'doughnut',
                                data: {
                                labels: [<c:forEach var="category" items="${revenueByCategory.keySet()}">
                                '${category}',</c:forEach>],
                                        datasets: [{
                                        data: [<c:forEach var="revenue" items="${revenueByCategory.values()}">
                            ${revenue},</c:forEach>],
                                                backgroundColor: ['#f56954', '#00a65a', '#f39c12', '#00c0ef', '#3c8dbc'],
                                                hoverBackgroundColor: ['#f56954', '#00a65a', '#f39c12', '#00c0ef', '#3c8dbc']
                                        }]
                                },
                                options: {
                                responsive: true,
                                        maintainAspectRatio: false,
                                        cutoutPercentage: 50,
                                        legend: {
                                        display: true
                                        },
                                        animation: {
                                        animateScale: true,
                                                animateRotate: true
                                        }
                                }
                        });
                        //bar chart
                        // Date labels for other charts
                        // Data for other charts
                        var last7DaysForOtherCharts = [
                        <c:forEach var="day" items="${last7DaysForOtherCharts}">
                        '${day}',
                        </c:forEach>
                        ];
                        var newlyRegisteredData = [
                        <c:forEach var="day" items="${last7DaysForOtherCharts}">
                            ${newCustomers[day] != null ? newCustomers[day] : 0},
                        </c:forEach>
                        ];
                        var newlyBoughtData = [
                        <c:forEach var="day" items="${last7DaysForOtherCharts}">
                            ${newlyBoughtCustomers[day] != null ? newlyBoughtCustomers[day] : 0},
                        </c:forEach>
                        ];
// Chart for other data
                        const ctxBar = document.getElementById('barChart').getContext('2d');
                        const barChart = new Chart(ctxBar, {
                        type: 'bar',
                                data: {
                                labels: last7DaysForOtherCharts,
                                        datasets: [{
                                        label: 'Newly Registered',
                                                data: newlyRegisteredData,
                                                backgroundColor: '#00a65a',
                                                borderColor: '#00a65a',
                                                borderWidth: 1
                                        }, {
                                        label: 'Newly Bought',
                                                data: newlyBoughtData,
                                                backgroundColor: '#f56954',
                                                borderColor: '#f56954',
                                                borderWidth: 1
                                        }]
                                },
                                options: {
                                responsive: true,
                                        scales: {
                                        yAxes: [{
                                        ticks: {
                                        beginAtZero: true
                                        }
                                        }]
                                        }
                                }
                        });
// Order trends chart
                        const ctx = document.getElementById('orderTrendChart').getContext('2d');
                        const labelsForOrderTrend = [
                        <c:forEach var="date" items="${last7DaysForOrderTrend}">
                        '${date}',
                        </c:forEach>
                        ];
                        const totalOrderData = [
                        <c:forEach var="date" items="${last7DaysForOrderTrend}">
                            ${orderTrend[date] != null ? orderTrend[date]['TotalOrders'] : 0},
                        </c:forEach>
                        ];
                        const successOrderData = [
                        <c:forEach var="date" items="${last7DaysForOrderTrend}">
                            ${orderTrend[date] != null ? orderTrend[date]['SuccessfulOrders'] : 0},
                        </c:forEach>
                        ];
                        const orderTrendChart = new Chart(ctx, {
                        type: 'bar',
                                data: {
                                labels: labelsForOrderTrend,
                                        datasets: [
                                        {
                                        label: 'Total Orders',
                                                data: totalOrderData,
                                                backgroundColor: '#3c8dbc',
                                                borderColor: '#3c8dbc',
                                                fill: false
                                        },
                                        {
                                        label: 'Successful Orders',
                                                data: successOrderData,
                                                backgroundColor: '#00a65a',
                                                borderColor: '#00a65a',
                                                fill: false
                                        }
                                        ]
                                },
                                options: {
                                responsive: true,
                                        maintainAspectRatio: false,
                                        scales: {
                                        yAxes: [{
                                        ticks: {
                                        beginAtZero: true,
                                                stepSize: 1
                                        }
                                        }]
                                        }
                                }
                        });
                        console.log("Labels for Order Trend: ", labelsForOrderTrend);
                        console.log("Total Order Data: ", totalOrderData);
                        console.log("Successful Order Data: ", successOrderData);
                        // Average feedback stars by category chart
                        const ctxCustomerFeedback = document.getElementById('customerFeedbackChart').getContext('2d');
                        const customerFeedbackChart = new Chart(ctxCustomerFeedback, {
                        type: 'bar',
                                data: {
                                labels: [<c:forEach var="category" items="${avgStarsByCategory.keySet()}">${category},</c:forEach>],
                                        datasets: [{
                                        label: 'Average Stars',
                                                data: [<c:forEach var="avgStars" items="${avgStarsByCategory.values()}">${avgStars},</c:forEach>],
                                                backgroundColor: 'rgba(255, 206, 86, 0.2)',
                                                borderColor: 'rgba(255, 206, 86, 1)',
                                                borderWidth: 1
                                        }]
                                }
                        });
                        </script>
                    </form>
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
            <aside class="control-sidebar control-sidebar-dark">/-strong/-heart:>:o:-((:-h<!-- Create the tabs -->
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
                        <!-- /.control-sidebar-menu -->/-strong/-heart:>:o:-((:-h<h3 class="control-sidebar-heading">Tasks Progress</h3>
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
                    <!-- /.tab-pane -->/-strong/-heart:>:o:-((:-h<!-- Stats tab content -->
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
                            <!-- /.form-group -->/-strong/-heart:>:o:-((:-h<div class="form-group">
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
    <script src="${pageContext.request.contextPath}/asset/js/Chart.min.js"></script>

</body>
</html>