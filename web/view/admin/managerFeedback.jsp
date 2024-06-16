

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Stylus</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

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
        <link rel="stylesheet" href="asset/css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="asset/css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="asset/css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="asset/css/jquery-ui.min.css" type="text/css">
        <link rel="stylesheet" href="asset/css/magnific-popup.css" type="text/css">
        <link rel="stylesheet" href="asset/css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="asset/css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="asset/css/style.css?id=11" type="text/css">
    </head>

    <body>
        <!-- Header -->

        <jsp:include page="../layout/header.jsp"></jsp:include>


            <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.1/dist/css/bootstrap.min.css" rel="stylesheet">
            <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">

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

        <script type="text/javascript">

        </script>
        <!--Footer-->
        <jsp:include page="../layout/footer.jsp"/>
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
    </body>

</html>
