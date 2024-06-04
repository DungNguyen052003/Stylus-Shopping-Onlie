<%-- 
    Document   : verifySuccess
    Created on : May 21, 2024, 3:18:23 PM
    Author     : TienP
--%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="../layout/header.jsp"/>
        <br>
        <br>
    <center>
        <c:choose>
            <c:when test="${status == 1}">
                <img src="asset/img/check.png" alt="" style="width: 100px; height: auto;">
                <h3 class="title">Email Verified</h3>
                <p class="description">Your email address was successfully verified</p>
                <p class="description">Click on the link to complete the verification process</p>
                <p class="description">You might need to check your <b>spam folder</b></p>
                <form action="Home" method="get">          
                    <button type="submit" class="site-btn" style="background:#136a74">Back to homepage</button>
                </form>
            </c:when>
            <c:when test="${status == 2}">
                <img src="asset/img/expired.png" alt="" style="width: 100px; height: auto;">
                <h3 class="title">Email Verification Expired</h3>
                <p class="description">Sorry, the verification link has expired.</p>
                <p class="description">Please sign up again !.</p>
                <form action="ResendVerification" method="post">          
                    <button type="submit" class="site-btn" style="background:#136a74">Back to homepage</button>
                </form>
            </c:when>
            <c:when test="${status == 3}">
                <img src="asset/img/expired.png" alt="" style="width: 100px; height: auto;">
                <h3 class="title">Reset PassWord</h3>
                <p class="description">Sorry, the verification link has expired.</p>
                <p class="description">Please request a new verification link !.</p>
                <form action="ResetPass" method="get">          
                    <button type="submit" class="site-btn" style="background:#136a74">Resend Verification</button>
                </form>
            </c:when>
            <c:when test="${status == 4}">
                <img src="asset/img/expired.png" alt="" style="width: 100px; height: auto;">
                <h3 class="title">Reset PassWord</h3>
                <p class="description">Sorry, the verification link has expired.</p>
                <p class="description">Please request a new verification link !.</p>
                <form action="ResetPass" method="get">          
                    <button type="submit" class="site-btn" style="background:#136a74">Resend Verification</button>
                </form>
            </c:when>
            <c:when test="${status == 5}">
                <h3 class="title">Reset PassWord</h3>
                <p class="description"> If the email is registered, you will receive a password reset link..</p>
                <form action="ResendVerification" method="post">          
                    <button type="submit" class="site-btn" style="background:#136a74">Back to homepage</button>
                </form>
            </c:when>
            <c:when test="${status == 6}">
                <img src="asset/img/check.png" alt="" style="width: 100px; height: auto;">
                <h3 class="title">Change PassWord</h3>
                <p class="description"> Change Successfully!</p>
                <form action="ResendVerification" method="post">          
                    <button type="submit" class="site-btn" style="background:#136a74">Back to homepage</button>
                </form>
            </c:when>
        </c:choose>
    </center>
    <br><!-- comment -->       
    <br><!-- comment -->
    <jsp:include page="../layout/footer.jsp"/>
</body>
</html>