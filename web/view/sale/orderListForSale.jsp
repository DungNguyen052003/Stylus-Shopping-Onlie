

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Sale Manager</title>
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/bootstrap2.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/AdminLTE.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/_all-skins.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/morris.css">
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
        <style>
            body {
                color: #566787;
                background: #f5f5f5;
                font-family: 'Varela Round', sans-serif;
                font-size: 13px;
            }
            .table-responsive {
                margin: 30px 0;
            }
            .table-wrapper {
                min-width: 1000px;
                background: #fff;
                padding: 20px 25px;
                border-radius: 3px;
                box-shadow: 0 1px 1px rgba(0,0,0,.05);
            }
            .table-wrapper .btn {
                float: right;
                color: #333;
                background-color: #fff;
                border-radius: 3px;
                border: none;
                outline: none !important;
                margin-left: 10px;
            }
            .table-wrapper .btn:hover {
                color: #333;
                background: #f2f2f2;
            }
            .table-wrapper .btn.btn-primary {
                color: #fff;
                background: #03A9F4;
            }
            .table-wrapper .btn.btn-primary:hover {
                background: #03a3e7;
            }
            .table-title .btn {
                font-size: 13px;
                border: none;
            }
            .table-title .btn i {
                float: left;
                font-size: 21px;
                margin-right: 5px;
            }
            .table-title .btn span {
                float: left;
                margin-top: 2px;
            }
            .table-title {
                color: #fff;
                background: #4b5366;
                padding: 16px 25px;
                margin: -20px -25px 10px;
                border-radius: 3px 3px 0 0;
            }
            .table-title h2 {
                margin: 5px 0 0;
                font-size: 24px;
            }
            .show-entries select.form-control {
                width: 60px;
                margin: 0 5px;
            }
            .table-filter .filter-group {
                float: right;
                margin-left: 15px;
            }
            .table-filter input, .table-filter select {
                height: 34px;
                border-radius: 3px;
                border-color: #ddd;
                box-shadow: none;
            }
            .table-filter {
                padding: 5px 0 15px;
                border-bottom: 1px solid #e9e9e9;
                margin-bottom: 5px;
            }
            .table-filter .btn {
                height: 34px;
            }
            .table-filter label {
                font-weight: normal;
                margin-left: 10px;
            }
            .table-filter select, .table-filter input {
                display: inline-block;
                margin-left: 5px;
            }
            .table-filter input {
                width: 200px;
                display: inline-block;
            }
            .filter-group select.form-control {
                width: 110px;
            }
            .filter-icon {
                float: right;
                margin-top: 7px;
            }
            .filter-icon i {
                font-size: 18px;
                opacity: 0.7;
            }
            table.table tr th, table.table tr td {
                border-color: #e9e9e9;
                padding: 12px 15px;
                vertical-align: middle;
            }
            table.table tr th:first-child {
                width: 30px;
            }
            table.table tr th:last-child {
                width: 80px;
            }
            table.table-striped tbody tr:nth-of-type(odd) {
                background-color: #fcfcfc;
            }
            table.table-striped.table-hover tbody tr:hover {
                background: #f5f5f5;
            }
            table.table th i {
                font-size: 13px;
                margin: 0 5px;
                cursor: pointer;
            }
            table.table td a {
                font-weight: bold;
                color: #566787;
                display: inline-block;
                text-decoration: none;
            }
            table.table td a:hover {
                color: #2196F3;
            }
            table.table td a.view {
                width: 30px;
                height: 30px;
                color: #2196F3;
                border: 2px solid;
                border-radius: 30px;
                text-align: center;
            }
            table.table td a.view i {
                font-size: 22px;
                margin: 2px 0 0 1px;
            }
            table.table .avatar {
                border-radius: 50%;
                vertical-align: middle;
                margin-right: 10px;
            }
            .status {
                font-size: 30px;
                margin: 2px 2px 0 0;
                display: inline-block;
                vertical-align: middle;
                line-height: 10px;
            }
            .text-success {
                color: #10c469;
            }
            .text-info {
                color: #62c9e8;
            }
            .text-warning {
                color: #FFC107;
            }
            .text-danger {
                color: #ff5b5b;
            }
            .pagination {
                float: right;
                margin: 0 0 5px;
            }
            .pagination li a {
                border: none;
                font-size: 13px;
                min-width: 30px;
                min-height: 30px;
                color: #999;
                margin: 0 2px;
                line-height: 30px;
                border-radius: 2px !important;
                text-align: center;
                padding: 0 6px;
            }
            .pagination li a:hover {
                color: #666;
            }
            .pagination li.active a {
                background: #03A9F4;
            }
            .pagination li.active a:hover {
                background: #0397d6;
            }
            .pagination li.disabled i {
                color: #ccc;
            }
            .pagination li i {
                font-size: 16px;
                padding-top: 6px
            }
            .hint-text {
                float: left;
                margin-top: 10px;
                font-size: 13px;
            }
            table.table th:nth-child(3), table.table td:nth-child(3) {
                width: 250px; /* Adjust as necessary to make the Customer Name column wider */
            }
            table.table th:nth-child(2), table.table td:nth-child(2) {
                width: 150px; /* Adjust as necessary to make the Customer Name column wider */
            }
            table.table th:nth-child(4), table.table td:nth-child(4) {
                width: 400px; /* Adjust as necessary to make the Product column smaller */
            }
            table.table th:nth-child(7), table.table td:nth-child(7) {
                width: 200px; /* Adjust as necessary to make the Sale Name column wider */
            }

        </style>
    </head>
    <body class="skin-blue sidebar-mini sidebar-collapse">
        <div class="wrapper">

            <header class="main-header">
                <!-- Logo -->
                <a href="../../index2.html" class="logo">
                    <span class="logo-mini"><b>S</b>M</span>
                    <span class="logo-lg"><b>Sale Manager</b></span>
                </a>
                <nav class="navbar navbar-static-top">
                    <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </a>
                </nav>
            </header><!-- =============================================== -->
            <aside class="main-sidebar">
                <section class="sidebar">
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
                    <ul class="sidebar-menu">
                        <li class="header">MAIN NAVIGATION</li>

                        <li>
                            <a href="OrderListOfSale">
                                <i class="fa fa-th"></i> <span>Manage Order</span>
                            </a>
                        </li>


                    </ul>
                </section>
            </aside>
            <div class="content-wrapper">
                <section class="content-header">
                    <h1>
                        Order List
                    </h1>
                </section>
                <!-- Main content -->
                <section class="content">

                    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
                    <div class="container" >
                        <div class="container-xl">
                            <div class="table-responsive">
                                <div class="table-wrapper">
                                    <div class="table-title">
                                        <div class="row">
                                            <div class="col-sm-4">
                                                <h2>Order <b>List</b></h2>
                                            </div>

                                        </div>
                                    </div>
                                    <div class="table-filter">
                                        <div class="row">

                                            <div class="col-sm-12">
                                                <div class="filter-group">
                                                    <form action="OrderListOfSale" method="get">
                                                        <input type="hidden" name="action" value="filter"/>
                                                        <div class="filter-group">
                                                            <label>OrderID</label>
                                                            <input type="text" name="orderId" class="form-control">
                                                            <button type="submit" class="btn btn-primary"><i class="fa fa-search"></i></button>
                                                        </div>
                                                    </form>
                                                </div>


                                                <div class="filter-group">
                                                    <form action="OrderListOfSale" method="get">
                                                        <input type="hidden" name="action" value="filter"/>
                                                        <label>Status</label>
                                                        <select class="form-control" name="statusId">
                                                            <option value="all">All</option>
                                                            <c:forEach items="${status}" var="st">
                                                                <option value="${st.id}">${st.name}</option>
                                                            </c:forEach>
                                                        </select>
                                                        <button type="submit" class="btn btn-primary">
                                                            <i class="fa fa-search"></i>
                                                        </button>
                                                    </form>

                                                </div>
                                            </div>
                                            <table class="table table-striped table-hover">
                                                <thead>
                                                    <tr>
                                                        <th>ID</th>
                                                        <th>Order Date</th>
                                                        <th>Customer Name</th>
                                                        <th>Product</th>						
                                                        <th>Total</th>						
                                                        <th><center>Status</center></th>
                                                <th>Payment</th>
                                                <th>Action</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${saleOrder}" var="c">
                                                        <tr>
                                                            <td>
                                                                <a href="OrderDetailOfSale?id=${c.orderId}">${c.orderId}</a>
                                                            </td>
                                                            <td>${c.formattedOrderDateTime}</td>
                                                            <td>${c.fullName}</td>
                                                            <td>
                                                                ${c.productName}
                                                                <c:if test="${c.countOtherproduct > 0}">
                                                                    ${c.countOtherproduct} other products
                                                                </c:if>
                                                            </td>
                                                            <td>$${c.totalAmount}</td>
                                                            <td>  <c:choose>
                                                                    <c:when test="${c.orderStatus.id == 1}">
                                                                        <form method="POST" action="OrderDetailOfSale" class="update-form">
                                                                            <input type="hidden" name="orderId" value="${c.orderId}">
                                                                            <select name="statusId" class="form-control" 
                                                                                    style="width: 110px; font-size: 13px;">
                                                                                <option value="1">${c.orderStatus.name}</option>
                                                                                <option value="2">Confirm</option>
                                                                                <option value="8">Reject</option>
                                                                            </select>
                                                                        </form>
                                                                    </c:when>
                                                                    <c:when test="${c.orderStatus.id == 4}">
                                                                        <form method="POST" action="OrderDetailOfSale" class="update-form">
                                                                            <input type="hidden" name="orderId" value="${c.orderId}">
                                                                            <select name="statusId" class="form-control"
                                                                                    style="width: 110px; font-size: 13px;">
                                                                                <option value="4">${c.order.orderStatus.name}</option>
                                                                                <option value="5">Success</option>
                                                                            </select>
                                                                        </form>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                            <center>${c.orderStatus.name}</center>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                    <td>
                                                        <c:if test="${c.method.id == 1}">
                                                            Đã thanh toán
                                                        </c:if>
                                                        <c:if test="${c.method.id == 2}">
                                                            Thanh toán khi nhận hàng
                                                        </c:if>
                                                    </td>
                                                    <td><a href="OrderDetailOfSale?id=${c.orderId}">View
                                                            <a href="#" class="update-link" onclick="confirmUpdate(event, this)">Update</a>
                                                    </td>
                                                    </tr>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                            <script>
                                                function confirmUpdate(event, link) {
                                                    event.preventDefault();
                                                    if (confirm("Are you sure ?")) {
                                                        var form = link.closest('tr').querySelector('.update-form');
                                                        form.submit();
                                                    }
                                                }
                                            </script>
                                            <div class="clearfix">
                                                <ul class="pagination">
                                                    <c:choose>
                                                        <c:when test="${page > 1}">
                                                            <li class="page-item">
                                                                <a class="page-link" href="<c:url value='OrderListOfSale'>
                                                                       <c:param name='page' value='${page - 1}'/>
                                                                       <c:if test='${param.action != null}'><c:param name='action' value='${param.action}'/></c:if>
                                                                       <c:if test='${param.statusId != null}'><c:param name='statusId' value='${param.statusId}'/></c:if>
                                                                       <c:if test='${param.orderId != null}'><c:param name='orderId' value='${param.orderId}'/></c:if>
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
                                                            <a class="page-link" href="<c:url value='OrderListOfSale'>
                                                                   <c:param name='page' value='${i}'/>
                                                                   <c:if test='${param.action != null}'><c:param name='action' value='${param.action}'/></c:if>
                                                                   <c:if test='${param.statusId != null}'><c:param name='statusId' value='${param.statusId}'/></c:if>
                                                                   <c:if test='${param.orderId != null}'><c:param name='orderId' value='${param.orderId}'/></c:if>
                                                               </c:url>">${i}</a>   
                                                        </li>
                                                    </c:forEach>

                                                    <c:choose>
                                                        <c:when test="${page < numberpage}">
                                                            <li class="page-item">
                                                                <a class="page-link" href="<c:url value='OrderListOfSale'>
                                                                       <c:param name='page' value='${page + 1}'/>
                                                                       <c:if test='${param.action != null}'><c:param name='action' value='${param.action}'/></c:if>
                                                                       <c:if test='${param.statusId != null}'><c:param name='statusId' value='${param.statusId}'/></c:if>
                                                                       <c:if test='${param.orderId != null}'><c:param name='orderId' value='${param.orderId}'/></c:if>
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

                            <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
                            <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.1/dist/js/bootstrap.bundle.min.js"></script>
                            <script type="text/javascript">

                            </script>
                            </section>
                        </div>
                    </div>
                    <script src="${pageContext.request.contextPath}/asset/js/app.js"></script>
                    <script src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
                    <script src="${pageContext.request.contextPath}/asset/js/jquery-2.2.3.min.js"></script>
                    <script src="${pageContext.request.contextPath}/asset/js/bootstrap2.min.js"></script>
                    <script src="${pageContext.request.contextPath}/asset/js/jquery.slimscroll.min.js"></script>
                    <script src="${pageContext.request.contextPath}/asset/js/fastclick.js"></script>
                    <script src="${pageContext.request.contextPath}/asset/js/app.min.js"></script>
                    <script src="${pageContext.request.contextPath}/asset/js/demo.js"></script>
                    <script src="${pageContext.request.contextPath}/asset/js/morris.min.js"></script>
                    <script src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
                    </body>
                    </html>
                    </body>
                    </html>
