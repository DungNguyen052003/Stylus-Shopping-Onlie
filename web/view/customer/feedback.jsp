<%-- 
    Document   : feedback
    Created on : Jun 2, 2024, 5:21:56 PM
    Author     : TienP
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/font-awesome.min.css" type="text/css">   
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/jquery-ui.min.css" type="text/css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/magnific-popup.css" type="text/css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/style.css" type="text/css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/elegant-icons.css" type="text/css">
        <style>
            .contact__form form input{
                margin-bottom: 0;
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
            .form-row {
                display: flex;
                justify-content: space-between; /* Phân phối không gian giữa các phần tử */
                margin-bottom: 10px; /* Khoảng cách giữa các dòng */
            }

            .form-group {
                display: flex;
                align-items: center; /* Căn giữa theo trục dọc */
                margin-right: 20px; /* Khoảng cách giữa các nhóm form-group trong cùng một dòng */
                flex: 1; /* Giúp các phần tử chia đều không gian có sẵn */
            }

            .form-group label {
                width: 100px; /* Đặt độ rộng cố định cho tất cả các label */
                margin-right: 10px;
                text-align: left; /* Canh trái để các label thẳng hàng */
                display: flex;
                align-items: center; /* Căn giữa nội dung của label theo trục dọc */
            }

            .form-group input {
                flex: 1; /* Ô nhập liệu sẽ chiếm phần còn lại của dòng */
                height: 30px; /* Đặt chiều cao cho ô nhập liệu để giúp căn giữa tốt hơn */
            }

            .form-group input[type="file"] {
                flex: 0; /* Không chiếm phần còn lại của dòng */
            }
            .rate * {
                margin: 0;
                padding: 0;
            }

            .rate {

                float:left;
                height: 46px;

            }

            .rate:not(:checked) > input {
                position: absolute;
                top: -9999px;
            }

            .rate:not(:checked) > label {
                float: right;
                width: 1em;
                overflow: hidden;
                white-space: nowrap;
                cursor: pointer;
                font-size: 30px;
                color: #ccc;
            }

            .rate:not(:checked) > label:before {
                content: '★ ';
            }

            .rate > input:checked ~ label {
                color: #ffc700;
            }

            .rate:not(:checked) > label:hover,
            .rate:not(:checked) > label:hover ~ label {
                color: #deb217;
            }

            .rate > input:checked + label:hover,
            .rate > input:checked + label:hover ~ label,
            .rate > input:checked ~ label:hover,
            .rate > input:checked ~ label:hover ~ label,
            .rate > label:hover ~ input:checked ~ label {
                color: #c59b08;
            }
        </style>
       
    </head>
    <body>
        <jsp:include page="../layout/header.jsp"></jsp:include><br>
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-md-3">
                        <div class="shop__sidebar">
                            <div class="sidebar__categories">
                                <div class="section-title">
                                    <form action="ProductServlet" method="get" style="display: inline;">
                                        <input type="hidden" name="action" value="newest">
                                        <button type="submit" style="background: none; border: none; color: black; font-size: 1.25em;">
                                            <h4>New</h4>
                                        </button>
                                    </form>
                                </div>
                                <div class="Trang">
                                    <div class="search-box">
                                        <form action="ProductServlet" method="get">
                                            <input type="hidden" name="action" value="search">
                                            <input type="text" id="search-input" placeholder="Search here....." name="keyword">
                                            <button type="submit"><i class="fa fa-search"></i></button>
                                        </form>
                                    </div>
                                </div>

                                <div class="section-title">
                                    <h4>Categories</h4>
                                </div>
                                <div class="categories__accordion">
                                    <div class="accordion" id="accordionExample">
                                        <input type="hidden" name="action" value="cate">
                                        <div class="card">
                                            <div class="card-heading active">
                                                <a data-toggle="collapse" data-target="#collapseOne">Women</a>
                                            </div>
                                            <div id="collapseOne" class="collapse show" data-parent="#accordionExample">
                                                <div class="card-body">
                                                <c:forEach items="${categoriesWomen}" var="cW">
                                                    <ul>
                                                        <li><a href="ProductServlet?id=${cW.cateID}" value="${cW.cateID}">${cW.name}</a></li>
                                                    </ul>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="card">
                                        <div class="card-heading">
                                            <a data-toggle="collapse" data-target="#collapseTwo">Men</a>
                                        </div>
                                        <div id="collapseTwo" class="collapse" data-parent="#accordionExample">
                                            <div class="card-body">
                                                <c:forEach items="${categoriesMen}" var="cM">
                                                    <ul>
                                                        <li><a href="ProductServlet?id=${cM.cateID}">${cM.name}</a></li>
                                                    </ul>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <form action="ProductServlet" method="get" id="productForm">
                            <div class="sidebar__filter">
                                <div class="section-title">
                                    <h4>Shop by price</h4>
                                </div>
                                <div class="filter-range-wrap">
                                    <input type="hidden" name="action" value="sortByPrice">
                                    <div class="price-range ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content"
                                         data-min="10" data-max="500"></div>
                                    <div class="range-slider">
                                        <div class="price-input">
                                            <p>Price:</p>
                                            <input type="text" id="minamount" name="mini">
                                            <input type="text" id="maxamount" name="max">
                                        </div>
                                    </div>
                                    </form>
                                </div>
                                <a href="#" onclick="document.getElementById('productForm').submit();">Filter</a>
                            </div>
                        </form>
                        <div class="sidebar__sizes">
                            <div class="section-title">
                                <h4>Shop by size</h4>
                            </div>
                            <div class="size__list">
                                <label for="xxs">
                                    xxs
                                    <input type="checkbox" id="xxs">
                                    <span class="checkmark"></span>
                                </label>
                                <label for="xs">
                                    xs
                                    <input type="checkbox" id="xs">
                                    <span class="checkmark"></span>
                                </label>
                                <label for="s">
                                    s
                                    <input type="checkbox" id="s">
                                    <span class="checkmark"></span>
                                </label>
                                <label for="m">
                                    m
                                    <input type="checkbox" id="m">
                                    <span class="checkmark"></span>
                                </label>
                                <label for="l">
                                    l
                                    <input type="checkbox" id="l">
                                    <span class="checkmark"></span>
                                </label>
                                <label for="xl">
                                    xl
                                    <input type="checkbox" id="xl">
                                    <span class="checkmark"></span>
                                </label>
                            </div>
                        </div>
                        <div class="sidebar__color">
                            <div class="section-title">
                                <h4>Shop by size</h4>
                            </div>
                            <div class="size__list color__list">
                                <label for="black">
                                    Blacks
                                    <input type="checkbox" id="black">
                                    <span class="checkmark"></span>
                                </label>
                                <label for="whites">
                                    Whites
                                    <input type="checkbox" id="whites">
                                    <span class="checkmark"></span>
                                </label>
                                <label for="reds">
                                    Reds
                                    <input type="checkbox" id="reds">
                                    <span class="checkmark"></span>
                                </label>
                                <label for="greys">
                                    Greys
                                    <input type="checkbox" id="greys">
                                    <span class="checkmark"></span>
                                </label>
                                <label for="blues">
                                    Blues
                                    <input type="checkbox" id="blues">
                                    <span class="checkmark"></span>
                                </label>
                                <label for="beige">
                                    Beige Tones
                                    <input type="checkbox" id="beige">
                                    <span class="checkmark"></span>
                                </label>
                                <label for="greens">
                                    Greens
                                    <input type="checkbox" id="greens">
                                    <span class="checkmark"></span>
                                </label>
                                <label for="yellows">
                                    Yellows
                                    <input type="checkbox" id="yellows">
                                    <span class="checkmark"></span>
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9 col-md-9">

                    <div class="contact__content">

                        <div class="contact__form">
                            <center>
                                <h5>SEND FEEDBACK</h5>
                            </center>
                            <form action="FeedBack" method="post">
                                <input type="hidden" name="orderDetailID" value="${orderDetailID}"/>
                                <div class="form-row">
                                    <div class="form-group">
                                        <label>Full Name: </label>
                                        <input type="text" value="${account.name}" readonly>
                                    </div>
                                    <div class="form-group">
                                        <label>Email:</label>
                                        <input type="text" value="${account.email}" readonly>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group">
                                        <label for="gender">Gender:</label>
                                        <input type="text" id="gender" 
                                                   value="<c:choose><c:when test='${account.gender == 1}'>Male</c:when>
                                                   <c:when test='${account.gender == 2}'>Female</c:when>
                                                   <c:otherwise>Unknown</c:otherwise>
                                               </c:choose>" readonly>
                                    </div>
                                    <div class="form-group">
                                        <label>Mobile:</label>
                                        <input type="text" value="${account.phone}" readonly>
                                    </div>
                                </div>
                                <label>Add Image:</label>
                                <input type='file' id="imgInp" name="image" />
                             
                                <br>

                                <label>Rating</label>
                                <br>
                                <div class="rate">
                                    <input type="radio" id="star5" name="rate" value="5" />
                                    <label for="star5" title="text">5 stars</label>
                                    <input type="radio" id="star4" name="rate" value="4" />
                                    <label for="star4" title="text">4 stars</label>
                                    <input type="radio" id="star3" name="rate" value="3" />
                                    <label for="star3" title="text">3 stars</label>
                                    <input type="radio" id="star2" name="rate" value="2" />
                                    <label for="star2" title="text">2 stars</label>
                                    <input type="radio" id="star1" name="rate" value="1" />
                                    <label for="star1" title="text">1 star</label>
                                </div>
                                <br><br><br>   

                                <div class="message-container">
                                    <label for="message">Message:</label>
                                    <textarea id="message" placeholder="Message" name="message"></textarea>
                                </div>
                                <button type="submit" class="site-btn">Send Feedback</button>    
                            </form>
                        </div>
                    </div>
                    <br><!-- comment -->
                    <br>
                    <div class="contact__address">
                        <h5>Contact info</h5>
                        <ul>
                            <li>
                                <h6><i class="fa fa-map-marker"></i> Address</h6>
                                <p>160 Pennsylvania Ave NW, Washington, Castle, PA 16101-5161</p>
                            </li>
                            <li>
                                <h6><i class="fa fa-phone"></i> Phone</h6>
                                <p><span>125-711-811</span><span>125-668-886</span></p>
                            </li>
                            <li>
                                <h6><i class="fa fa-headphones"></i> Support</h6>
                                <p>Support.photography@gmail.com</p>
                            </li>
                        </ul>
                    </div>
                </div>
            </div><!-- comment -->
        </div>
        <jsp:include page="../layout/footer.jsp"/>
    </body>
    <script src="asset/js/jquery-3.3.1.min.js"></script>
    <script src="asset/js/bootstrap.min.js"></script>
    <script src="asset/js/jquery.magnific-popup.min.js"></script>
    <script src="asset/js/jquery-ui.min.js"></script>
    <script src="asset/js/mixitup.min.js"></script>
    <script src="asset/js/jquery.countdown.min.js"></script>
    <script src="asset/js/jquery.slicknav.js"></script>
    <script src="asset/js/owl.carousel.min.js"></script>
    <script src="asset/js/jquery.nicescroll.min.js"></script>
    <script src="asset/js/main.js"></script>
    <script>
                                    function readURL(input) {
                                        if (input.files && input.files[0]) {
                                            var reader = new FileReader();

                                            reader.onload = function (e) {
                                                $('#blah').attr('src', e.target.result);
                                            }

                                            reader.readAsDataURL(input.files[0]);
                                        }
                                    }

                                    $("#imgInp").change(function () {
                                        readURL(this);
                                    });
                                    let scrollPos = 0;

                                    // Cập nhật vị trí cuộn
                                    function updateScrollPos() {
                                        scrollPos = window.pageYOffset || document.documentElement.scrollTop;
                                    }

                                    // Khôi phục vị trí cuộn
                                    function restoreScrollPos() {
                                        window.scrollTo(0, scrollPos);
                                    }

                                    // Nghe sự kiện scroll để cập nhật vị trí cuộn
                                    window.addEventListener('scroll', updateScrollPos);

                                    // Ngăn chặn hành động mặc định và khôi phục vị trí cuộn khi chọn radio button
                                    document.querySelectorAll('.rate input').forEach(input => {
                                        input.addEventListener('change', function (e) {
                                            restoreScrollPos();
                                        });
                                    });
    </script>
</html>
