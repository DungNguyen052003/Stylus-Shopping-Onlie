<%-- 
    Document   : newPass
    Created on : May 20, 2024, 4:53:57 AM
    Author     : TienP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">  
        <link rel="stylesheet" href="asset/css/authen.css" type="text/css">
    </head>
    <body>
    <center>
        <form id="password-reset-form" method="post" action="NewPassword" >
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="modal-box">
                            <!-- Modal -->
                            <div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content clearfix">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                                        <div class="modal-body">
                                            <h3 class="title">New Password</h3>
                                            <p class="description">Set a new password.</p>
                                            <div class="form-group">
                                                <span class="input-icon"><i class="fas fa-key"></i></span>
                                                <input type="password" class="form-control" placeholder="Password" name="password"style="width: 300px;" required>
                                            </div>
                                            <div class="form-group">    
                                                <input type="password" class="form-control" placeholder="New password" 
                                                       id="newPass" name="newPass" style="width: 300px;" required>
                                                <br>
                                                <input type="password" class="form-control" placeholder="Confirm new password" 
                                                       id="confirmPass" name="confirmPass" style="width: 300px;" required>
                                            </div>
                                            <p id="error-message2" style="color: red; display: none;">
                                                Your password must be 8-16 characters long and include at least one lowercase letter,
                                                one uppercase letter, one number, and one special character (@$!%*?&)
                                            </p>
                                            <div style="color:red;padding-block:5px">${requestScope.error}</div>
                                            <button type="submit"class="btn" style=" background-color: #337ab7;">Set Password</button>                  
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.0.min.js"></script><script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
        </form>    
    </center>
    <br><!-- comment -->
    <br><!-- comment -->

</body>
<script>
    document.getElementById('password-reset-form').addEventListener('submit', function (event) {
        var password = document.getElementById('newPass').value;
        var confirmPassword = document.getElementById('confirmPass').value;
        var errorMessage = document.getElementById('error-message2');

        var passwordRegex = /^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*\W)(?!.* ).{8,16}$/;

        if (!passwordRegex.test(password)) {
            errorMessage.textContent = "Your password must be 8-16 characters long and include at least one lowercase letter, one uppercase letter, one number, and one special character (@$!%*?&)";
            errorMessage.style.display = 'block';
            console.log("Password does not match the criteria");
            event.preventDefault();
        } else if (password !== confirmPassword) {
            errorMessage.textContent = "Passwords do not match. Please try again.";
            errorMessage.style.display = 'block';
            console.log("Passwords do not match");
            event.preventDefault();
        } else {
            errorMessage.style.display = 'none';
            console.log("Form is submitted successfully");
        }
    });
//    function validatePassword() {
//        var newPass = document.getElementById("newPass").value;
//        var confirmPass = document.getElementById("confirmPass").value;
//        var errorMessage = document.getElementById("error-message");
//
//        if (!isValidPassword(newPass)) {
//            errorMessage.textContent = "Password must be 8-16 characters long, contain at least one lowercase letter, one uppercase letter, one digit, and one special character.";
//            errorMessage.style.display = "block";
//            return false;
//        }
//
//        if (newPass !== confirmPass) {
//            errorMessage.textContent = "Passwords do not match.";
//            errorMessage.style.display = "block";
//            return false;
//        }
//
//        errorMessage.style.display = "none";
//        return true;
//    }
//
//    function isValidPassword(password) {
//        // Kiểm tra độ dài
//        if (password.length < 8 || password.length > 16) {
//            return false;
//        }
//
//        // Kiểm tra chứa ít nhất một chữ cái thường, một chữ cái viết hoa, một chữ số và một ký tự đặc biệt
//        if (!password.match(/[a-z]/) || !password.match(/[A-Z]/) || !password.match(/\d/) || !password.match(/[!@#$%^&*()\-+=`~\[\]{}|;:'",.<>?/\\]/)) {
//            return false;
//        }
//
//        return true;
//    }
</script>


</html>
