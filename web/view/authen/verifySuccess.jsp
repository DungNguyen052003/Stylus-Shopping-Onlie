



<%-- 
    Document   : verify
    Created on : May 19, 2024, 9:18:04 PM
    Author     : TienP
--%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../../asset/css/authen.css" type="text/css">
        <style>
            .container {
                display: flex;
                justify-content: center;
                align-items: center;

            }

            .input {
                width: 40px;
                border: none;
                border-bottom: 3px solid rgba(0, 0, 0, 0.5);
                margin: 0 10px;
                text-align: center;
                font-size: 36px;
                cursor: not-allowed;
                pointer-events: none;
            }

            .input:focus {
                border-bottom: 3px solid orange;
                outline: none;
            }

            .input:nth-child(1) {
                cursor: pointer;
                pointer-events: all;
            }
        </style>
    </head>
    <body>
        <jsp:include page="../layout/header.jsp"/>
        <br>
        <br><!-- comment -->
    <center>
        <!--        <h3 class="title">Verify Your Account</h3>
                <p class="description">Enter the 6 digit OTP send to your email.</p>
                <div class="container">
                    <form action="VerifyOTP" method="post">
                        <div id="inputs" class="inputs">
                            <input class="input" type="text"
                                   inputmode="numeric" maxlength="1" name="digit1"/>
                            <input class="input" type="text"
                                   inputmode="numeric" maxlength="1" name="digit2"/>
                            <input class="input" type="text"
                                   inputmode="numeric" maxlength="1" name="digit3"/>
                            <input class="input" type="text"
                                   inputmode="numeric" maxlength="1" name="digit4"/>
                            <input class="input" type="text"
                                   inputmode="numeric" maxlength="1" name="digit5"/>
                            <input class="input" type="text"
                                   inputmode="numeric" maxlength="1" name="digit6"/>
                        </div>
                        <br>
                        <button class="btn" style=" background-color: #337ab7;">Verify</button>
                    </form>
                </div>-->
        <h3 class="title">Make new password</h3>
        <form id="password-reset-form2" method="post" action="NewPassword">
            <div class="form-group">    
                <input type="password" class="form-control" placeholder="New password" 
                       id="newPass2" name="newPass" style="width: 300px;" required>
                <br>
                <input type="password" class="form-control" placeholder="Confirm new password" 
                       id="confirmPass2" name="confirmPass" style="width: 300px;" required>
                
            </div>
             <p id="error-message-2" style="color: red; display: none;">Your password must be 8-16 characters long and include at least one lowercase letter,
                                                one uppercase letter, one number, and one special character (@$!%*?&)</p> 
            <button type="submit" class="btn" style=" background-color: #337ab7;">Reset Password</button>
        </form>
    </center>
    <br>
    <br><!-- comment -->
    <jsp:include page="../layout/footer.jsp"/>
</body>
<script>
    document.getElementById('password-reset-form2').addEventListener('submit', function (event) {
        var password = document.getElementById('newPass2').value;
        var confirmPassword = document.getElementById('confirmPass2').value;
        var errorMessage2 = document.getElementById('error-message-2');

        var passwordRegex = /^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*\W)(?!.* ).{8,16}$/;

        if (!passwordRegex.test(password)) {
            errorMessage2.textContent = "Your password must be 8-16 characters long and include at least one lowercase letter, one uppercase letter, one number, and one special character (@$!%*?&)";
            errorMessage2.style.display = 'block';
            console.log("Password does not match the criteria 1");
            event.preventDefault();
        } else if (password !== confirmPassword) {
            errorMessage2.textContent = "Passwords do not match. Please try again.";
            errorMessage2.style.display = 'block';
            console.log("Passwords do not match 1");
            event.preventDefault();
        } else {
            errorMessage2.style.display = 'none';
            console.log("Form is submitted successfully");
        }
    });
//    const inputs = document.getElementById("inputs");
//
//    inputs.addEventListener("input", function (e) {
//        const target = e.target;
//        const val = target.value;
//
//        if (isNaN(val)) {
//            target.value = "";
//            return;
//        }
//
//        if (val != "") {
//            const next = target.nextElementSibling;
//            if (next) {
//                next.focus();
//            }
//        }
//    });
//
//    inputs.addEventListener("keyup", function (e) {
//        const target = e.target;
//        const key = e.key.toLowerCase();
//
//        if (key == "backspace" || key == "delete") {
//            target.value = "";
//            const prev = target.previousElementSibling;
//            if (prev) {
//                prev.focus();
//            }
//            return;
//        }
//    });

</script>
</html>
