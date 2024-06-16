<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Modal -->

<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="addModal" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addBookModalLabel">Add</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="addProductForm" action="ManageProduct" method="POST" enctype="multipart/form-data">
                    <input type="hidden" name="action" value="addProduct">

                    <!--Name-->
                    <div class="form-group">
                        <label for="name">Name:</label>
                        <input type="text" class="form-control" id="nameInput" name="name">
                        <div id="nameError" class="error text-danger"></div>
                    </div>
                    <!--Price-->
                    <div class="form-group">
                        <label for="price">Price:</label>
                        <input type="text" class="form-control" id="priceInput" name="price">
                        <div id="priceError" class="error text-danger"></div>
                    </div>
                    <!--Category-->
                    <div class="form-group">
                        <label for="category">Category: </label>
                        <div class="input-group">
                            <select class="custom-select" id="categoryEditInput" name="category">
                                <optgroup label="Women">
                                    <c:forEach items="${categoriesWomen}" var="category">
                                        <option value="${category.cateID}">${category.name}</option>
                                    </c:forEach>
                                </optgroup>
                                <optgroup label="Men">
                                    <c:forEach items="${categoriesMen}" var="category">
                                        <option value="${category.cateID}">${category.name}</option>
                                    </c:forEach>
                                </optgroup>
                            </select>
                            <div class="input-group-append">
                                <button class="btn btn-outline-secondary" type="button">Category</button>
                            </div>
                        </div>
                    </div>
                    <!--Image-->
                    <div class="form-group">
                        <label for="image">Image: </label>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text">Upload</span>
                            </div>
                            <div class="custom-file">
                                <input type="file" class="custom-file-input" id="imageEdit" name="image" onchange="displayImage(this)">
                                <label class="custom-file-label">Choose file</label>
                            </div>
                        </div>
                        <img id="previewImage2" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="Preview" style="display: none; max-width: 300px; max-height: 300px;">
                        <input type="hidden" id="currentImage" name="currentImage" value="">
                    </div>
                    <!--Brief Information-->
                    <div class="form-group">
                        <label for="brief">Brief Information:</label>
                        <textarea class="form-control" name="brief"></textarea>
                    </div>
                    <!--Description-->
                    <div class="form-group">
                        <label for="description">Description:</label>
                        <textarea class="form-control" name="description"></textarea>
                    </div>
                    <!-- Status -->
                    <div class="form-group">
                        <label>Status:</label>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" id="statusActive" name="status" value="1" />
                            <label class="form-check-label" for="statusActive">Active</label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" id="statusInactive" name="status" value="0" />
                            <label class="form-check-label" for="statusInactive">Inactive</label>
                        </div>
                    </div>

                    <!-- Feature -->
                    <div class="form-group">
                        <label>Feature:</label>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" id="featureActive" name="feature" value="1" />
                            <label class="form-check-label" for="featureActive">Active</label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" id="featureInactive" name="feature" value="0" />
                            <label class="form-check-label" for="featureInactive">Inactive</label>
                        </div>
                    </div>
                    <!-- Color -->
                    <div class="form-group">
                        <label for="color">Color:</label>
                        <select class="form-control" id="color" name="color">
                            <c:forEach items="${color}" var="color">
                                <option value="${color.id}">${color.name}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <!-- Size -->
                    <div class="form-group">
                        <label for="size">Size:</label>
                        <select class="form-control" id="size" name="size">
                            <c:forEach items="${size}" var="size">
                                <option value="${size.id}">${size.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <!-- Quantity -->
                    <div class="form-group">
                        <label for="quantity">Quantity:</label>
                        <input type="number" class="form-control" id="quantity" name="quantity" min="1" required />
                    </div>
            </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-primary" onclick="validateForm(event)">Add</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    function validateForm(event) {
        let name = $('#nameInput').val();
        let price = $('#priceInput').val();
        let isValid = true;

        // Xoá thông báo lỗi hiện tại
        $('.error').html('');

        if (name === '') {
            $('#nameError').html('Name không được để trống');
            isValid = false;
        }

        if (price === '') {
            $('#priceError').html('Price không được để trống');
            isValid = false;
        } else if (!$.isNumeric(price) || parseFloat(price) < 0) {
            $('#priceError').html('Giá phải là số và không được nhỏ hơn 0');
            isValid = false;
        }

        if (!isValid) {
            event.preventDefault();
        }
    }

    function displayImage(input) {
        var previewImage = document.getElementById("previewImage2");
        var file = input.files[0];
        var reader = new FileReader();

        reader.onload = function (e) {
            previewImage.src = e.target.result;
            previewImage.style.display = "block";
        }

        reader.readAsDataURL(file);
    }

    $(document).ready(function () {
        bsCustomFileInput.init();
    });
</script>
