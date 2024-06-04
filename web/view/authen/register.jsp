<!DOCTYPE html>

<html lang="en">
    <head>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
       <link rel="stylesheet" href="asset/css/crud.css" type="text/css">
        <link rel="stylesheet" href="asset/css/authen.css" type="text/css">
    </head>
    <body>
<div class ="customModall">
            <link rel="stylesheet" href="asset/css/authen.css" type="text/css">
    <form method="POST" action="RegisterServlet" id="registerForm">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="modal-box">
                            <div class ="customeModal">
                          <!-- Modal -->
                            <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content clearfix">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                                        <div class="modal-body">
                                            <h3 class="title">Register</h3>
                                            <p class="description">Create an account free and enjoy it</p>
                                            <!--<h5 style="color: red">${requestScope.error}</h5>
                                            <h5 style="color: red">${requestScope.errorMessage}</h5>-->
                                            <div class="form-group">
                                                <span class="input-icon"><i class="fa fa-user"></i></span>
                                                <input type="email" class="form-control" placeholder="Enter email" name="email" required>
                                                <span class="validation" id="emailValidation"></span>
                                            </div>
                                            <div class="form-group">
                                                <span class="input-icon"><i class="fa fa-user"></i></span>
                                                <input type="text" class="form-control" placeholder="Full Name" name="name" required>
                                            </div>
                                            <div class="form-group">
                                                <span class="input-icon"><i class="fas fa-key"></i></span>
                                                <input type="password" class="form-control" placeholder="Password" name="password" id="password" required>
                                                <span class="validation" id="passwordValidation"></span>
                                            </div>
                                            <div class="form-group">
                                                <span class="input-icon"><i class="fas fa-key"></i></span>
                                                <input type="password" class="form-control" placeholder="Confirm Password" name="confirmPassword" id="confirmPassword" required>
                                                <span class="validation" id="confirmPasswordValidation"></span>
                                            </div>
                                            <p id="error-message" style="color: red; display: none;">Your password must be 8-16 characters long and include at least one lowercase letter,
                                                one uppercase letter, one number, and one special character (@$!%*?&)</p>
                                            <div class="form-group">
                                                <span class="input-icon"><i class="fa fa-user"></i></span>
                                                <input type="text " class="form-control" placeholder="Your Phone" name="phone" required>
                                                <span class="validation" id="phoneValidation"></span>
                                            </div>
                                            <div class="form-group">
                                                <span class="input-icon"><i class="fa fa-user"></i></span>
                                                <input type="text" class="form-control" placeholder="Address" name="address" required>
                                                <span class="validation" id="addressValidation"></span>
                                            </div>
                                            <div class="form-group">
                                                <div class="gender">
                                                    <input type="radio" value="1" id="male" name="gender" checked/>
                                                    <label for="male" class="radio" chec>Male</label>
                                                    <input type="radio" value="2" id="female" name="gender" />
                                                    <label for="female" class="radio">Female</label>
                                                    <input type="radio" value="0" id="other" name="gender" />
                                                    <label for="other" class="radio">Other</label>
                                                </div>
                                            </div>
                                            <div style="color:red;padding-block:5px">${error}</div>
                                            <div style="color:red;padding-block:5px">${errorMessage}</div>
                                            <button type="submit" class="btn">Register</button>
                                        </div>
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
</div>
    </body>
    <script>
        document.getElementById('registerForm').addEventListener('submit', function (event) {
            var password = document.getElementById('password').value;
            var confirmPassword = document.getElementById('confirmPassword').value;
            var errorMessage = document.getElementById('error-message');
            var passwordRegex = /^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*\W)(?!.* ).{8,16}$/;
            if (!passwordRegex.test(password)) {
                errorMessage.textContent = "Your password must be 8-16 characters long and include at least one lowercase letter, one uppercase letter, one number, and one special character (@$!%*?&)";
                errorMessage.style.display = 'block';
                event.preventDefault();
            } else if (password !== confirmPassword) {
                errorMessage.textContent = "Passwords do not match. Please try again.";
                errorMessage.style.display = 'block';
                event.preventDefault();
            } else {
                errorMessage.style.display = 'none';
            }
        });
    </script>
</html>