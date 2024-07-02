<%-- 
    Document   : header
    Created on : May 15, 2024, 4:41:04 PM
    Author     : TienP
--%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Ashion Template">
        <meta name="keywords" content="Ashion, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Ashion | Template</title>
        

        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css2?family=Cookie&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800;900&display=swap"
              rel="stylesheet">

        <style>
            .dropbtn {
                color: white;
                font-size: 16px;
                border: none;
            }

            .dropdown {
                position: relative;
                display: inline-block;
            }

            .dropdown-content {
                display: none;
                position: absolute;
                background-color: #f1f1f1;
                min-width: 160px;
                box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
                z-index: 1;
            }

            .dropdown-content a {
                color: black;
                padding: 12px 16px;
                text-decoration: none;
                display: block;
                text-align: left;
            }

            .dropdown-content a:hover {
                background-color: #ddd;
            }

            .dropdown:hover .dropdown-content {
                display: block;
            }

            .dropdown:hover .dropbtn {
                background-color: #3e8e41;
            }
        </style>

    </head>
    <body>

        <div id="preloder">
            <div class="loader"></div>
        </div>

        <!-- Offcanvas Menu Begin -->
        <div class="offcanvas-menu-overlay"></div>
        <div class="offcanvas-menu-wrapper">
            <div class="offcanvas__close">+</div>
            <ul class="offcanvas__widget">
                <li><span class="icon_search search-switch"></span></li>
                <li><a href="#"><span class="icon_heart_alt"></span>
                        <div class="tip">2</div>
                    </a></li>
                <li><a href="#"><span class="icon_bag_alt"></span>
                        <div class="tip">2</div>
                    </a></li>
            </ul>
            <div class="offcanvas__logo">
                <a href="./index.html"><img src="" alt=""></a>
            </div>
            <div id="mobile-menu-wrap"></div>
            <div class="offcanvas__auth">
                <span style="cursor:pointer" data-toggle="modal" data-target="#myModal" id="button_show">Login</span>
                <a href="#">Register</a>
            </div>
        </div>
        <!-- Offcanvas Menu End -->

        <!-- Header Section Begin -->
        <header class="header">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-xl-3 col-lg-2">
                        <div class="header__logo">
                            <a href="./index.html"><img src="" alt=""></a>
                        </div>
                    </div>
                    <div class="col-xl-6 col-lg-7" style="width: 200%;">
                        <nav class="header__menu">
                            <ul>
                                <li><a href="ManageProduct">Product</a></li>
                                <li><a href="ManagerCustomerList">Customers</a></li>
                                <li><a href="ManageSliders">Sliders</a></li>
                                <li><a href="ManagerPostList">Post</a></li>
                                <li><a href="ManageFeedback">Feedback</a></li>
                            </ul>
                        </nav>
                    </div>
                    
                </div>
                <div class="canvas__open">
                    <i class="fa fa-bars"></i>
                </div>
            </div>
        </header>
        <%@include file="../authen/login.jsp" %>
        <%@include file="../authen/register.jsp" %>
        <%@include file="../authen/newPass.jsp" %>
        <%@include file="../customer/userProfile.jsp" %>
        <script>
            const urlParams = new URLSearchParams(window.location.search);
            const isError = urlParams.get('error');
            if (isError) {
                const button = document.querySelector('#button_show');
                button.click();
            }
            function showDropdownMenu() {
                document.getElementById("dropdown_menu").style.display = "block";
            }

            function hideDropdownMenu() {
                document.getElementById("dropdown_menu").style.display = "none";
            }
        </script>
        <!-- Header Section End -->

    </body>
</html>
