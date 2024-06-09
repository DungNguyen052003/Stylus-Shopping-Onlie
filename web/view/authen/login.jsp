<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
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
    <div class ="customModall">
        <form method="POST" action="login">
            <div class="container">
                <div class ="customeModal">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="modal-box">
                                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content clearfix">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                                            <div class="modal-body">
                                                <h3 class="title">Login</h3>
                                                <p class="description">Login here Using Email & Password</p>
                                                <div class="form-group">
                                                    <span class="input-icon"><i class="fa fa-user"></i></span>
                                                    <input type="email" class="form-control" placeholder="Enter email" name="email" required>
                                                </div>
                                                <div class="form-group">
                                                    <span class="input-icon"><i class="fas fa-key"></i></span>
                                                    <input type="password" class="form-control" placeholder="Password" name="pass" required>
                                                </div>
                                                <div class="form-group checkbox">
                                                    <input type="checkbox">
                                                    <label>Remember me</label> 
                                                </div>
                                                <a href="ForgotPasss" class="forgot-pass">Forgot Password?</a>
                                                <div style="color:red;padding-block:5px">${error}</div>
                                                <button class="btn">Login</button>
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