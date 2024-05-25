<%-- 
    Document   : resetPass
    Created on : May 15, 2024, 6:57:46 PM
    Author     : TienP
--%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../../asset/css/login.css" type="text/css">
    </head>
    <body>
        <jsp:include page="../layout/header.jsp"/>
        <br>
        <br>

    <center>
        <h3 class="title">Forgot Password</h3>
        <p class="description">Enter your registered email to reset your password.</p>
        <form id="password-reset-form" method="post" action="/ProjectStylus/ResetPass">
            <div class="form-group">    
                <input type="email" class="form-control" placeholder="Enter email" 
                       id="email" name="email" style="width: 300px;" required>
            </div>
            <button type=submit class="btn" style=" background-color: #337ab7;">Reset Password</button>
        </form>
    <p id="error-message" style="color: red; display: none;">Please enter a valid email address.</p>    
    </center>
    <br><!-- comment -->
    <br><!-- comment -->
    <jsp:include page="../layout/footer.jsp"/>
    <script>
        document.getElementById('password-reset-form').addEventListener('submit', function (event) {
            var emailInput = document.getElementById('email');
            var errorMessage = document.getElementById('error-message');

            if (!emailInput.checkValidity()) {
                errorMessage.style.display = 'block';
                event.preventDefault(); // Prevent form submission
            } else {
                errorMessage.style.display = 'none';
            }
        });
    </script>
</body>
</html>
