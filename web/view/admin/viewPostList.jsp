

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="asset/css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="asset/css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="asset/css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="asset/css/jquery-ui.min.css" type="text/css">
        <link rel="stylesheet" href="asset/css/magnific-popup.css" type="text/css">
        <link rel="stylesheet" href="asset/css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="asset/css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="asset/css/style.css?id=11" type="text/css">
        <style type="text/css">
            .flag-icon {
                font-size: 1.2em; /* Cỡ chữ của biểu tượng lá cờ */
            }

            .flag-icon.red {
                color: red; /* Màu đỏ cho trạng thái "featured" là 1 */
            }

            .flag-icon.gray {
                color: gray; /* Màu trắng cho trạng thái "featured" là 0 */
            }
        </style>

    </head>
    <body>

        <jsp:include page="../layout/header.jsp"></jsp:include><br>
            <div class="breadcrumb-option">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="breadcrumb__links">
                                <a href="./index.html"><i class="fa fa-home"></i> Home</a>
                                <a href="./blog">Blog</a>
                                <span>${blog.blogTitle}</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <section class="blog spad" style="padding-top: 10px;">
            <div class="container">
                <div class="row">


                    <div class="col-lg-10">
                        <section class="blog-details spad">
                            <div class="container">
                                <div class="row">
                                    <div class="col-lg-8 col-md-8">
                                        <div class="blog__details__content">
                                            <div class="blog__details__item">
                                                <img src="${blog.thumbnail}" >
                                                <div class="blog__details__item__title">

                                                    <h4>${blog.brief_info}</h4>
                                                    <ul>
                                                        <li>by <span>${blog.author}</span></li>
                                                        <li>${blog.createDate}</li>

                                                    </ul>
                                                    <ul>
                                                        <li>Category <span>${blog.category.name}</span></li>
                                                    </ul>
                                                    <ul>
                                                        <li>Status <span>
                                                                <div class="status-display" style="display: inline;">
                                                                    ${blog.status == 1 ? 'On' : 'Off'}
                                                                </div>
                                                            </span>
                                                        </li>
                                                        <li>
                                                            <i class="flag-icon ${blog.featured == 1 ? 'red' : 'gray'}"></i>
                                                        </li>

                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="blog__details__desc">
                                                <p>${blog.description}</p>

                                            </div>

                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4">
                                        <div class="blog__sidebar">

                                            <div class="blog__sidebar__item">
                                                <div class="section-title">
                                                    <h4>Feature posts</h4>
                                                </div>
                                                <c:forEach var="feat" items="${featureBlogs}">
                                                    <a href="blogdetail?mode=1&id=${feat.getBlogID()}" class="blog__feature__item" style="height: 200px">
                                                        <div class="blog__feature__item__pic blog__feature__item__text">
                                                            <img style="height: 50%; width: 50%" src="${feat.thumbnail}" >
                                                            <h6 style="font-size: 10px">${feat.blogTitle}</h6>
                                                            <span style="color: black">${feat.createDate}</span>
                                                            <hr>
                                                        </div>
                                                    </a>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                    </div>
                </div>
            </div>

            <div class="col-lg-12 text-center">
                <a href="#" class="primary-btn load-btn">Load more posts</a>
            </div>
        </div>
    </section>

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
    <jsp:include page="../layout/footer.jsp"></jsp:include>

</body>

</html>
