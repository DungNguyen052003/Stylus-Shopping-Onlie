
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="col-lg-3 col-md-3">
            <div class="shop__sidebar">
                <div class="sidebar__categories">
                    <div class="section-title">
                        <h4>Categories</h4>
                    </div>
                    <div class="categories__accordion">
                        <div class="accordion" id="accordionExample">
                            <div class="card">
                                <div class="card-heading active">
                                    <a data-toggle="collapse" data-target="#collapseOne">Women</a>
                                </div>
                                <div id="collapseOne" class="collapse show" data-parent="#accordionExample">
                                    <div class="card-body">
                                        <ul>
                                            <li><a href="#">Shirts</a></li>
                                            <li><a href="#">T-shirts</a></li>
                                            <li><a href="#">Jeans</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-heading">
                                    <a data-toggle="collapse" data-target="#collapseTwo">Men</a>
                                </div>
                                <div id="collapseTwo" class="collapse" data-parent="#accordionExample">
                                    <div class="card-body">
                                        <ul>
                                            <li><a href="#">Shirts</a></li>
                                            <li><a href="#">T-shirts</a></li>
                                            <li><a href="#">Jeans</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="sidebar__filter">
                    <div class="section-title">
                        <h4>Shop by price</h4>
                    </div>
                    <div class="filter-range-wrap">
                        <div class="price-range ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content"
                             data-min="33" data-max="99"></div>
                        <div class="range-slider">
                            <div class="price-input">
                                <p>Price:</p>
                                <input type="text" id="minamount">
                                <input type="text" id="maxamount">
                            </div>
                        </div>
                    </div>
                    <a href="#">Filter</a>
                </div>
                <div class="sidebar__sizes">
                    <div class="section-title">
                        <h4>Shop by size</h4>
                    </div>
                    <div class="size__list">
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
                        <h4>Shop by Color</h4>
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

                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
