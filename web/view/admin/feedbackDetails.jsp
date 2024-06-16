<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Ashion Template">
        <meta name="keywords" content="Ashion, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Order Info</title>
        <jsp:include page="../layout/header.jsp"></jsp:include>
            <!-- Google Font -->
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
    </head>
    <style>
        /*        .gender-options {
                    display: flex;
                    align-items: center;
                    gap: 10px;
                }
        
                .gender-options input[type="radio"] {
                    transform: scale(0.5);
                    margin-right: 5px;
                }
        
                .gender-options label {
                    font-size: 1.3rem;
                }*/

        .btn-primary,
        .btn-secondary {
            margin: 2px;
        }
    </style>

    <body>
        <div class="breadcrumb-option">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="breadcrumb__links">
                            <a href="./index.jsp"><i class="fa fa-home"></i> Home</a>
                            <span>Feedback Details</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <section class="checkout spad">
            <div class="container">
                <form action="#" class="checkout__form">
                    <div class="row">

                        <div class="col-lg-9 col-md-9">
                            <h5>Customer Details</h5>

                            <c:set var="customer" value="${customer}"/>
                            <c:set var="feedback" value="${feedback}"/>
                            <c:set var="product" value="${product}"/>
                            <div class="order">
                                <div class="row order-header">


                                    <div class="col-lg-6 col-md-6 col-sm-6">
                                        <div class="checkout__form__input">
                                            <p>Full Name <span>*</span></p>
                                            <input type="text" name="fullname" value="${customer.name}" readonly >
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6">
                                        <div class="checkout__form__input">
                                            <p>Gender <span>*</span></p>
                                            <input type="text" id="gender-input" readonly>
                                        </div>
                                    </div>

                                    <div class="col-lg-6 col-md-6 col-sm-6">
                                        <div class="checkout__form__input">
                                            <p>Email <span>*</span></p>
                                            <input type="text" name="email" value="${customer.email}" readonly>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6">
                                        <div class="checkout__form__input">
                                            <p>Mobile <span>*</span></p>
                                            <input type="text" name="mobile" value="${customer.phone}" readonly>
                                        </div>
                                    </div>
                                </div>

                                <div class="order-products">
                                    <h5>Ordered Products</h5>
                                    <table class="table table-striped">
                                        <thead>
                                            <tr>
                                                <th>Product</th>
                                                <th>Name</th>
                                                <th>Rated Star</th>
                                                <th>Feedback</th>
                                                <th>Image</th>
                                                <th>Status</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td><img src="${pageContext.request.contextPath}/${product.thumbnail}" style="width:50px;height:50px;"></td>
                                                <td>${product.productName}</td>
                                                <td>${feedback.rateStar}</td>
                                                <td>${feedback.comment}</td>
                                                <td><img src="${pageContext.request.contextPath}/${feedback.feedbackImage}" style="width:50px;height:50px;"></td>
                                                
                                        <form action="ManageFeedback" method="POST">
                                            <td class="text-center align-middle" name="status" data-status="${feedback.status}">
                                                <i class="fa cursor-pointer
                                                   <c:choose>
                                                       <c:when test="${feedback.status eq 1}">fa-toggle-on text-secondary</c:when>
                                                       <c:otherwise>fa-toggle-off</c:otherwise>
                                                   </c:choose>"
                                                   data-id="${feedback.id}" 
                                                   data-status="${feedback.status}" 
                                                   onclick="toggleStatus(this)">
                                                </i>
                                            </td>
                                        </form>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="order-actions">
                                    <button type="button" class="btn btn-secondary" onclick="window.location.href = 'ManageFeedback'">Manage Feedback</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </section>


        <jsp:include page="../layout/footer.jsp"></jsp:include>

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
                                        // Assuming customer.gender holds the value 1, 2, or 3
                                        var customerGender = ${customer.gender}; // Replace with the actual value from the server-side

                                        // Function to convert gender value to text
                                        function getGenderText(gender) {
                                            switch (gender) {
                                                case 1:
                                                    return "Male";
                                                case 2:
                                                    return "Female";
                                                case 3:
                                                    return "Unknown";
                                                default:
                                                    return "Unknown";
                                            }
                                        }

                                        // Get the gender text
                                        var genderText = getGenderText(customerGender);

                                        // Set the value of the input field
                                        document.getElementById('gender-input').value = genderText;
        </script>
    </body>
</html>