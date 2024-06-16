<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Customer Detail</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="https://fonts.googleapis.com/css2?family=Cookie&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800;900&display=swap" rel="stylesheet">

        <!-- Css Styles -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/jquery-ui.min.css" type="text/css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/magnific-popup.css" type="text/css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/style.css" type="text/css">

        <style>
            body {
                color: #566787;
                background: #f7f5f2;
                font-family: 'Roboto', sans-serif;
            }
            .table-wrapper {
                background: #fff;
                padding: 20px 25px;
                margin: 30px 0;
                border-radius: 3px;
                box-shadow: 0 1px 1px rgba(0,0,0,.05);
            }
            .table-title {
                color: #fff;
                background: #40b2cd;
                padding: 16px 25px;
                margin: 20px -25px 10px;
                border-radius: 3px 3px 0 0;
            }
            .table-title h2 {
                margin: 5px 0 0;
                font-size: 24px;
            }
            .form-control {
                border-color: #ddd;
                border-radius: 0;
                background-color: #f7f5f2; /* Adjust background color to match the form */
                color: #566787; /* Adjust text color to match the form */
            }
            .form-control:focus {
                border-color: #f4fcfd;
                background-color: #f7f5f2; /* Keep background color consistent on focus */
                color: #566787; /* Keep text color consistent on focus */
            }
            .modal-footer {
                background: #f9f9f9;
            }
            .table td {
                font-size: 16px; /* Adjust this value to make the font larger or smaller */
            }
            .table th {
                font-size: 16px; /* Adjust this value to match the font size of the table data */
            }

            .table-wrapper input[type="text"],
            .table-wrapper input[type="email"],
            .table-wrapper select,
            .table-wrapper textarea {
                background-color: #f7f5f2; /* Match background color */
                color: #566787; /* Match text color */
                border: 1px solid #ddd; /* Match border color */
                border-radius: 0; /* Match border radius */
                padding: 5px; /* Add padding for better appearance */
            }
        </style>
    </head>
    <body>
        <jsp:include page="../layout/header.jsp"></jsp:include>
            <div class="container">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                <h2>Customer <b>Details</b></h2>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 text-right">
                                <a href="#editCustomerModal" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Edit Details</span></a>
                                <button type="submit" form="customerForm" class="btn btn-primary"><i class="material-icons">&#xE161;</i> <span>Save Changes</span></button>
                            </div>

                        </div>
                    </div>
                    <form id="customerForm" action="CustomerDetail" method="post">
                        <table class="table table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>Full Name</th>
                                    <th>Gender</th>
                                    <th>Email</th>
                                    <th>Mobile</th>
                                    <th>Address</th>
                                    <th>Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><input type="text" class="form-control" name="name" value="${customer.name}" required></td>
                                <td><select class="form-control" name="gender" required>
                                        <option value="1" ${customer.getGender() == 1? "selected" : ""}>Male</option>
                                        <option value="2" ${customer.getGender() == 2? "selected" : ""}>Female</option>
                                        <option value="3" ${customer.getGender() == 3? "selected" : ""}>Other</option>
                                    </select></td>
                                <td>   <input type="email" class="form-control" name="email" value="${customer.email}" required></td>
                                <td><input type="text" class="form-control" name="phone" value="${customer.phone}" required></td>
                                <td> <textarea class="form-control" name="address" required>${customer.address}</textarea></td>
                                <td>${customer.status}</td>
                            </tr>
                        </tbody>

                    </table>
                </form> 
                <div class="table-title">
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                            <h2>Change <b>History</b></h2>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6"></div>
                    </div>
                </div>
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th>Email</th>
                            <th>Full Name</th>
                            <th>Gender</th>
                            <th>Mobile</th>
                            <th>Address</th>
                            <th>Updated By</th>
                            <th>Updated Date</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="history" items="${changeHistory}">
                            <tr>
                                <td>${history.email}</td>
                                <td>${history.name}</td>
                                <td><c:choose>
                                        <c:when test="${history.gender == 1}">Male</c:when>
                                        <c:when test="${history.gender == 2}">Female</c:when>

                                        <c:otherwise>Other</c:otherwise>
                                    </c:choose></td>
                                <td>${history.phone}</td>
                                <td>${history.address}</td>
                                <td>${history.updatedBy}</td>
                                <td>${history.updatedDate}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

            <!-- Edit Modal HTML -->
            <div id="editCustomerModal" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="" method="post">
                            <div class="modal-header">                        
                                <h4 class="modal-title">Edit Customer Details</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body">                    
                                <div class="form-group">
                                    <label>Full Name</label>
                                    <input type="text" class="form-control" name="name" value="${customer.name}" required>
                                </div>
                                <div class="form-group">
                                    <label>Gender</label>
                                    <select class="form-control" name="gender" required>
                                        <option value="1" ${customer.getGender() == 1? "selected" : ""}>Male</option>
                                        <option value="2" ${customer.getGender() == 2? "selected" : ""}>Female</option>
                                        <option value="3" ${customer.getGender() == 3? "selected" : ""}>Other</option>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label>Email</label>
                                    <input type="email" class="form-control" name="email" value="${customer.email}" required>
                                </div>
                                <div class="form-group">
                                    <label>Mobile</label>
                                    <input type="text" class="form-control" name="phone" value="${customer.phone}" required>
                                </div>
                                <div class="form-group">
                                    <label>Address</label>
                                    <textarea class="form-control" name="address" required>${customer.address}</textarea>
                                </div>              
                            </div>
                            <div class="modal-footer">
                                <input type="hidden" name="customerID" value="${customer.customerID}">
                                <input type="submit" class="btn btn-info" value="Save">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <script src="${pageContext.request.contextPath}/asset/js/jquery-3.3.1.min.js"></script>
            <script src="${pageContext.request.contextPath}/asset/js/bootstrap.min.js"></script>
            <script src="${pageContext.request.contextPath}/asset/js/jquery.magnific-popup.min.js"></script>
            <script src="${pageContext.request.contextPath}/asset/js/jquery-ui.min.js"></script>
            <script src="${pageContext.request.contextPath}/asset/js/mixitup.min.js"></script>
            <script src="${pageContext.request.contextPath}/asset/js/jquery.countdown.min.js"></script>
            <script src="${pageContext.request.contextPath}/asset/js/jquery.slicknav.js"></script>
            <script src="${pageContext.request.contextPath}/asset/js/owl.carousel.min.js"></script>
            <script src="${pageContext.request.contextPath}/asset/js/jquery.nicescroll.min.js"></script>
            <script src="${pageContext.request.contextPath}/asset/js/main.js"></script>                        
    </body>
</html>
