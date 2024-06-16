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
                    <div class="col-xl-6 col-lg-7">
                        <nav class="header__menu">
                            <ul>
                                <li class="active"><a href="Home">Home</a></li>
                                <li><a href="#">Women’s</a></li>
                                <li><a href="#">Men’s</a></li>
                                <li><a href="ProductServlet">Shop</a></li>
                                <li><a href="#">Pages</a>
                                    <ul class="dropdown">
                                        <li><a href="./product-details.html">Product Details</a></li>
                                        <li><a href="./shop-cart.html">Shop Cart</a></li>
                                        <li><a href="./checkout.html">Checkout</a></li>
                                        <li><a href="./blog-details.html">Blog Details</a></li>
                                    </ul>
                                </li>
                                <li><a href="BlogServlet">Blog</a></li>
                                <li><a href="./contact.html">Contact</a></li>
                            </ul>
                        </nav>
                    </div>
                    <div class="col-lg-3">
                        <div class="header__right">

                            <ul class="header__right__widget">
                                <li><span class="icon_search search-switch"></span></li>
                                <li><a href="#"><span class="icon_heart_alt"></span>
                                        <div class="tip">2</div>
                                    </a></li>
                                <li><a href="cartDetails"><span class="icon_bag_alt"></span>
                                        <div class="tip">2</div>
                                    </a></li>
                            </ul>
                            <div class="header__right__auth">
                                <c:choose>
                                    <c:when test="${sessionScope.account eq null}">
                                        <span style="cursor:pointer" data-toggle="modal" data-target="#myModal" id="button_show">Login</span>/
                                        <span style="cursor:pointer" data-toggle="modal" data-target="#myModal2" id="button_show">Register</span>
                                    </c:when> 
                                    <c:otherwise>
                                        <div class="dropdown">   
                                            <c:set var="acc" value="${sessionScope.account}" />
                                            <span><img src="${acc.getImage()}" id="user_image" class="dropbtn" style="width: 50px; height: 50px;"/></span>
                                            <div class="dropdown-content">
                                                <a> <span style="cursor:pointer" data-toggle="modal" data-target="#profileModal" id="button_show">Change Profile</span></a>
                                                <a> <span style="cursor:pointer" data-toggle="modal" data-target="#myModal3" id="button_show">Change Password</span></a>
                                                <a href="myOrder">My Orders</a>
                                                <a href="LogOut">Log out</a>
                                            </div>
                                        </div>
                                    </c:otherwise>    
                                </c:choose>
                            </div>
                        </div>
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
