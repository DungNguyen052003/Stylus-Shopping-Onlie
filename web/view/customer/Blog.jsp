<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Blog Page</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/style.css" type="text/css">
</head>
<body>
    <jsp:include page="../layout/header.jsp"></jsp:include><br>
    <div class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__links">
                        <a href="./index.html"><i class="fa fa-home"></i> Home</a>
                        <span>Blog</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <section class="blog spad">
        <div class="container">
            <div class="row">
                <c:forEach  items="${list}" var="blog">
                    <div class="col-lg-4 col-md-4 col-sm-6">
                        <div class="blog__item">
                            <img src="${blog.thumbNail}">
                            <div class="blog__item__text">
                                <h6><a href="blog?mode=1&id=${blog.getBlogID()}">${blog.blogTitle} </a></h6>
                                <ul>
                                    <li>by <span>${blog.author}</span></li>
                                    <li>${blog.createDate}</li>
                                </ul>                             
                            </div>
                        </div>
                    </div>
                </c:forEach>
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
