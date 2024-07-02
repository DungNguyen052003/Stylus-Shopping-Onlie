<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Ashion Template">
        <meta name="keywords" content="Ashion, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Blog Page</title>
    <jsp:include page="../layout/header.jsp"></jsp:include><br>
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


    <div class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__links">
                        <a href="Home"><i class="fa fa-home"></i> Home</a>
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
                            <div class="section-title" style="margin-bottom: 20px;">
                                <h4>Search Post</h4>
                            </div>
                            <form action="BlogServlet" method="get" style="padding-bottom: 15px;">
                                <input type="hidden" name="action" value="searchBlog">
                                <div class="search-box">
                                    <input type="text" name="keyword" placeholder="Search...">
                                    <button type="submit"><i class="fa fa-search"></i></button>
                                </div>
                            </form>
                            <br>
                            <div class="section-title">
                                <h4>Categories</h4>
                            </div>
                            <div class="categories__accordion" style="padding-bottom:25px;">
                                <div class="accordion" id="accordionExample">

                                    <div class="card">
                                        <div class="card-heading ">
                                            <a data-toggle="collapse" data-target="#collapseOne">Women</a>
                                        </div>
                                        <div id="collapseOne" class="collapse " data-parent="#accordionExample">
                                            <div class="card-body">
                                                <c:forEach items="${categoriesWomen}" var="cW">
                                                    <ul>
                                                        <li><a href="BlogServlet?action=filterBlogbyCate&blogCateId=${cW.cateID}" value="${cW.cateID}">${cW.name}</a></li>
                                                    </ul>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="card">
                                        <div class="card-heading">
                                            <a data-toggle="collapse" data-target="#collapseTwo">Men</a>
                                        </div>
                                        <div id="collapseTwo" class="collapse" data-parent="#accordionExample">
                                            <div class="card-body">
                                                <c:forEach items="${categoriesMen}" var="cM">
                                                    <ul>
                                                        <li><a href="BlogServlet?action=filterBlogbyCate&blogCateId=${cM.cateID}">${cM.name}</a></li>
                                                    </ul>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="section-title">
                                <a href="#new-post"><h4>New Post</h4></a>
                            </div>
                            <div class="new-posts">
                                <div class="new-post-item">
                                    <img src="${blog.thumbnail}" alt="${blog.blogTitle}">
                                    <div class="new-post-content">
                                        <h5>${blog.blogTitle}</h5>
                                        <p class="card-text" style="overflow: hidden;
                                           display: -webkit-box;
                                           -webkit-line-clamp: 3;
                                           -webkit-box-orient: vertical;
                                           width: 250px;
                                           word-wrap: break-word;">
                                            ${blog.brief_info}
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-9">
                    <div class="row">
                        <c:forEach items="${list}" var="blog">
                            <div class="col-lg-4 col-md-6 col-sm-6">
                                <div class="blog__item">
                                    <img src="${blog.thumbnail}" alt="${blog.blogTitle}">
                                    <div class="blog__item__text">
                                        <h6><a href="BlogDetail?mode=1&id=${blog.getBlogID()}">${blog.blogTitle}</a></h6>
                                        <p class="card-text" style="overflow: hidden;
                                           display: -webkit-box;
                                           -webkit-line-clamp: 3;
                                           -webkit-box-orient: vertical;
                                           width: 250px;
                                           word-wrap: break-word;">
                                            ${blog.brief_info}
                                        </p>
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

        <div class="d-flex justify-content-center">
            <ul class="pagination mt-3 mb-0">
                <c:choose>
                    <c:when test="${page > 1}">
                        <li class="page-item">
                            <a class="page-link" href="<c:url value='BlogServlet'>
                                   <c:param name='page' value='${page - 1}'/>
                                   <c:if test='${param.action != null}'><c:param name='action' value='${param.action}'/></c:if>
                                   <c:if test='${param.blogCateId != null}'><c:param name='blogCateId' value='${param.blogCateId}'/></c:if>
                                   <c:if test='${param.keyword != null}'><c:param name='keyword' value='${param.keyword}'/></c:if>
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
                        <a class="page-link" href="<c:url value='BlogServlet'>
                               <c:param name='page' value='${i}'/>
                               <c:if test='${param.action != null}'><c:param name='action' value='${param.action}'/></c:if>
                               <c:if test='${param.blogCateId != null}'><c:param name='blogCateId' value='${param.blogCateId}'/></c:if>
                               <c:if test='${param.keyword != null}'><c:param name='keyword' value='${param.keyword}'/></c:if>
                           </c:url>">${i}</a>
                    </li>
                </c:forEach>

                <c:choose>
                    <c:when test="${page < numberpage}">
                        <li class="page-item">
                            <a class="page-link" href="<c:url value='BlogServlet'>
                                   <c:param name='page' value='${page + 1}'/>
                                   <c:if test='${param.action != null}'><c:param name='action' value='${param.action}'/></c:if>
                                   <c:if test='${param.blogCateId != null}'><c:param name='blogCateId' value='${param.blogCateId}'/></c:if>
                                   <c:if test='${param.keyword != null}'><c:param name='keyword' value='${param.keyword}'/></c:if>
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
