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
</html>
