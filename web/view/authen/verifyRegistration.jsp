<%-- 
    Document   : verifyRegistration
    Created on : May 21, 2024, 3:03:01 PM
    Author     : TienP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
        <jsp:include page="../layout/header.jsp"/>
        <br>
        <br>
    <center>
        <h3 class="title">Registration Validation</h3>
        <p class="description">We have sent a verification link to <b>${email}</b>.</p>
        <p class="description">Click on the link to complete the verification process</p>
        <p class="description">You might need to check your <b>spam folder</b></p>
        <form action="Home" method="get">          
            <button type="submit" class="site-btn" style="background:#136a74">Back to homepage</button>
        </form>
    </center>
    <br><!-- comment -->       
    <br><!-- comment -->
    <jsp:include page="../layout/footer.jsp"/>
</body>
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
</html>
