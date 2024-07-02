<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
    <head>
        <meta charset="utf-8">


        <title>account setting or edit profile - Bootdey.com</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--        <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css" rel="stylesheet">-->
        <!--        <link rel="stylesheet" href="asset/css/authen.css" type="text/css">-->
        <style>
            .modal-content {
                border-radius: 10px;
                overflow: hidden;
            }

            .modal-header {
                background-color: #007bff;
                color: #fff;
                border-bottom: none;
            }

            .modal-header .close {
                color: #fff;
                opacity: 1;
            }

            .modal-body {
                padding: 20px;
            }

            /* Form styles */
            #profileForm .container {
                max-width: 100%;
                padding: 0;
            }

            #profileForm .card {
                border: none;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
                margin-bottom: 20px;
            }

            #profileForm .card-body {
                padding: 20px;
            }

            #profileForm .form-group {
                margin-bottom: 20px;
            }

            #profileForm .form-group label {
                font-weight: 600;
            }

            #profileForm .form-control {
                border-radius: 5px;
                border: 1px solid #ccc;
                padding: 10px;
                font-size: 14px;
            }

            #profileForm .form-control:focus {
                border-color: #007bff;
                box-shadow: none;
            }

            #profileForm .text-primary {
                color: #007bff !important;
            }

            /* Gender radio buttons */
            #profileForm .form-check-inline {
                margin-right: 10px;
            }

            #profileForm .form-check-label {
                font-weight: 400;
                margin-left: 5px;
            }

            /* Buttons */
            #profileForm .btn {
                border-radius: 5px;
                padding: 10px 20px;
                font-size: 14px;
            }

            #profileForm .btn-primary {
                background-color: #007bff;
                border-color: #007bff;
            }

            #profileForm .btn-secondary {
                background-color: #6c757d;
                border-color: #6c757d;
            }

            /* Media Queries */
            @media (max-width: 767.98px) {
                #profileForm .row.gutters {
                    flex-direction: column;
                }

                #profileForm .col-xl-3,
                #profileForm .col-xl-9 {
                    max-width: 100%;
                    flex: 0 0 100%;
                }
            }
            .userProfile{
                .profile-pic {
                    color: transparent;
                    transition: all 0.3s ease;
                    display: flex;
                    justify-content: center;
                    align-items: center;
                    position: relative;
                    transition: all 0.3s ease;
                }
                .profile-pic input {
                    display: none;
                }
                .profile-pic img {
                    position: absolute;
                    object-fit: cover;
                    width: 165px;
                    height: 165px;
                    box-shadow: 0 0 10px 0 rgba(255, 255, 255, 0.35);
                    border-radius: 100px;
                    z-index: 0;
                }

                .profile-pic .-label {
                    cursor: pointer;
                    height: 165px;
                    width: 165px;
                }
                .profile-pic:hover .-label {
                    display: flex;
                    justify-content: center;
                    align-items: center;
                    background-color: rgba(0, 0, 0, 0.8);
                    z-index: 10000;
                    color: rgb(250, 250, 250);
                    transition: background-color 0.2s ease-in-out;
                    border-radius: 100px;
                    margin-bottom: 0;
                }
                .profile-pic span {
                    display: inline-flex;
                    padding: 0.2em;
                    height: 2em;
                }

                body {
                    height: 100vh;
                    background-color: rgb(25, 24, 21);
                    display: flex;
                    justify-content: center;
                    align-items: center;
                }
                body a:hover {
                    text-decoration: none;
                }
            }
            .userProfile2{
                .profile-pic label {
                    position: absolute;
                    top: 50%;
                    left: 50%;
                    transform: translate(-50%, -50%);
                    background-color: rgba(0,0,0,0.5);
                    color: white;
                    padding: 10px;
                    border-radius: 5px;
                    cursor: pointer;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                }
            }
        </style>

    </head>
    <body>

        <c:set var="x" value="${sessionScope.account}"/>
        <!--        <div class="profile-container">
                    <div class="modal" id="profileModal">
                        <div class="modal-dialog">
                            <div class="modal-content">                       
                                <div class="modal-body">
                                    <h2 class="title">Change Profile</h2>-->
        <!--        <div class="modal fade" id="profileModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">-->
        <!--            <div class="modal-dialog" role="document">-->
        <div class="modal fade" id="profileModal">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">Profile Form</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- Modal Body -->
                    <div class="modal-body">
                        <form id="profileForm" action="ChangeProfile" method="post" enctype="multipart/form-data">
                            <div class="container">
                                <div class="row gutters">
                                    <div class="col-xl-3 col-lg-3 col-md-12 col-sm-12 col-12">
                                        <div class="card h-100">
                                            <div class="card-body">
                                                <div class="account-settings">
                                                    <div class="userProfile">
                                                        <div class="profile-pic">
                                                            <label class="-label" for="file">
                                                                <span class="glyphicon glyphicon-camera"></span>
                                                                <span>Change Image</span>
                                                            </label>
                                                            <input type=hidden name="currentImage2" value="${account.image}"/>
                                                            <input id="file" type="file" onchange="loadFile(event)" name="image" value="${account.image}"/>
                                                            <img src="${account.image}" id="output" width="200" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-9 col-lg-9 col-md-12 col-sm-12 col-12">
                                        <div class="card h-100">
                                            <div class="card-body">
                                                <div class="row gutters">
                                                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                                        <h6 class="mb-2 text-primary">Personal Details</h6>
                                                    </div>
                                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                                        <div class="form-group">
                                                            <label for="eMail">Email</label>
                                                            <input type="email" class="form-control" id="eMail" placeholder="${account.email}" readonly
                                                                   name="email" value="${account.email}">

                                                        </div>
                                                    </div>
                                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                                        <div class="form-group">
                                                            <label for="fullName">Full Name</label>
                                                            <input type="text" class="form-control" id="fullName" placeholder="Enter phone name"
                                                                   value="${account.name}" name="name">
                                                        </div>
                                                    </div>
                                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                                        <div class="form-group">
                                                            <label for="phone">Phone</label>
                                                            <input type="text" class="form-control" id="phone"value="${account.phone}"
                                                                   name="phone">
                                                        </div>
                                                    </div>
                                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                                        <div class="form-group">
                                                            <label for="website">Address</label>
                                                            <input type="text" class="form-control" id="website"  value="${account.address}"
                                                                   name="address">
                                                        </div>
                                                    </div>
                                                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                                        <div class="form-group">
                                                            <label for="gender">Gender</label><br>
                                                            <div class="form-check form-check-inline">
                                                                <input class="form-check-input" type="radio" name="gender" id="unknown" value="0" ${account.gender == 0 ? 'checked' : ''}>
                                                                <label class="form-check-label" for="unknown">Unknown</label>
                                                            </div>
                                                            <div class="form-check form-check-inline">
                                                                <input class="form-check-input" type="radio" name="gender" id="male" value="1" ${account.gender == 1 ? 'checked' : ''}>
                                                                <label class="form-check-label" for="male">Male</label>
                                                            </div>
                                                            <div class="form-check form-check-inline">
                                                                <input class="form-check-input" type="radio" name="gender" id="female" value="2" ${account.gender == 2 ? 'checked' : ''}>
                                                                <label class="form-check-label" for="female">Female</label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row gutters">
                                                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                                        <div class="text-right">
                                                            <button type="button" id="cancel" name="cancel" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                                                            <button type="submit" id="update" name="submit" class="btn btn-primary">Update</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>



                </div>
            </div>
        </div>


        <script>
            var loadFile = function (event) {
                var image = document.getElementById("output");
                image.src = URL.createObjectURL(event.target.files[0]);
            };
        </script>


    </body>
</html>