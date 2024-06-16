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
                        <div class="col-lg-3 col-md-3">
                            <div class="shop__sidebar">
                                <div class="sidebar__categories">
                                    <div class="section-title">
                                        <a href="last">Latest Blogs</a>
                                    </div>
                                    <div class="section-title">
                                        <h4>Categories</h4>
                                    </div>
                                    <div class="categories__accordion">
                                        <div class="accordion" id="accordionExample">
                                        <c:forEach items="${listCate}" var="l">
                                            <div class="card">
                                                <div class="card-heading active">
                                                    <a data-target="#collapseOne" href="last?category=1&id=${l.getCateID()}">${l.name}</a>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                    </div><br>
                                <div class="section-title" style="margin-bottom: 20px;">
                                    <h4>Search By Name</h4>
                                </div>
                                <form action="last" method="get">
                                    <div class="search-box">
                                        <input type="text" name="search" placeholder="Search...">
                                        <button type="submit"><i class="fa fa-search"></i></button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-9">
                        <div class="row">
                            <c:forEach items="${list}" var="blog">
                                <div class="col-lg-4 col-md-6 col-sm-6">
                                    <div class="blog__item">
                                        <img src="${blog.thumbNail}" alt="${blog.blogTitle}">
                                        <div class="blog__item__text">
                                            <h6><a href="blogdetail?mode=1&id=${blog.getBlogID()}">${blog.blogTitle}</a></h6>
                                            <ul>
                                                <li>by <span>${blog.author}</span></li>
                                                <li>${blog.createDate}</li>
                                            </ul>                             
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
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
