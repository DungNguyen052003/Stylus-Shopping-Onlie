<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--Edit-->
<div class="modal fade" id="user-form-modal" tabindex="-1" role="dialog" aria-labelledby="userFormModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header" style="background-color: transparent">
                <h5 class="modal-title" style="color:black">Edit Product</h5>
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">×</span>
                </button>
            </div>

            <form id="editProduct" action="ManageProduct?action=editProduct" method="POST" enctype="multipart/form-data">
                <div class="modal-body" name="filter">
                    <!--id-->
                    <div class="form-group" style="display: none">
                        <input type="text" class="form-control" id="idEditInput" name="id">
                    </div>
                    <!--Name-->
                    <div class="form-group">
                        <label for="name">Title:</label>
                        <input type="text" class="form-control" id="nameEditInput" name="name">
                        <div id="nameEditError" class="error"></div>
                    </div>
                    <!--Price-->
                    <div class="form-group">
                        <label for="price">Price:</label>
                        <input type="text" class="form-control" id="priceEditInput" name="price">
                        <div id="priceEditError" class="error"></div>
                    </div>

                    <!--Category-->
                    <div class="form-group">
                        <label for="category">Category:</label>
                        <div class="form-group">
                            <label for="price">Price </label>
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
                    </div>

                    <!--Image-->
                    <div class="form-group">
                        <label for="image">Image: </label>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text">Upload</span>
                            </div>
                            <div class="custom-file">
                                <input type="file" class="custom-file-input" id="imageEdit" name="image"
                                       onchange="displayImage2(this)">
                                <label class="custom-file-label">Choose file</label>
                            </div>
                        </div>
                        <img id="previewImage2" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="Preview"
                             style="display: none; max-width: 300px; max-height: 300px;">
                        <input type="hidden" id="currentImage" name="currentImage" value="">
                    </div>

                    <!--Description-->
                    <div class="form-group">
                        <label for="descriptionEditInput">Brief Information:</label>
                        <textarea class="form-control brief-info" id="descriptionEdit" name="description"></textarea>
                    </div>

                    <!--Status-->
                    <div class="form-group">
                        <label for="status">Status: </label>
                        <div>
                            <input type="radio" id="statusActive" name="status" value="1" />
                            <label for="statusActive">Active</label><br/>
                            <input type="radio" id="statusInactive" name="status" value="0"/>
                            <label for="statusInactive">Inactive</label>
                        </div>
                    </div>
                </div>
            </form>

            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" id="btn-cancel" data-dismiss="modal" ng-click="$hide()">Cancel</button>
                <button type="submit" class="btn btn-primary" form="editBookForm"
                        onclick="validateForm2(event)">Update</button>
            </div>
        </div>
    </div>
</div>
</div>
<script>
// Hàm kiểm tra và gửi form cập nhật sản phẩm
    function validateForm2(event) {
        event.preventDefault(); // Ngăn chặn hành vi mặc định của form

        let name = $('#nameEditInput').val();
        let price = $('#priceEditInput').val();

// Xóa thông báo lỗi hiện tại
        $('.error').html('');

// Kiểm tra đầu vào
        if (name === '') {
            $('#nameEditError').html('Name cannot be blank');
        }

        if (price === '') {
            $('#priceEditError').html('Price cannot be empty');
        } else if (!$.isNumeric(price) || parseFloat(price) < 0) {
            $('#priceEditError').html('The product price must be a number and cannot be less than 0');
        }

// Nếu không có lỗi thì submit form bằng AJAX
        let error = '';
        $('.error').each(function () {
            error += $(this).html();
        });

        if (error === '') {
            let formData = new FormData($('#editProduct')[0]); // Lấy dữ liệu từ form

            $.ajax({
                url: 'ManageProduct?action=editProduct',
                type: 'POST',
                data: formData,
                processData: false,
                contentType: false,
                success: function (response) {
                    // Xử lý khi cập nhật thành công    
//                            $('#user-form-modal').modal('hide'); // Đóng modal
//            $('#user-form-modal').modal().hide();
//                    $('#user-form-modal').modal('hide');
                     // reload page
//$('.modal').modal('hide');
                    // Cập nhật thông tin sản phẩm trong bảng
                    let id = $('#idEditInput').val();
                    let updatedRow = $('td[name="id"]').filter(function () {
                        return $(this).text().trim() == id;
                    }).closest('tr');

                    updatedRow.find('td[name="name"]').text($('#nameEditInput').val());
                    updatedRow.find('td[name="price"]').text('$' + $('#priceEditInput').val());
                    updatedRow.find('td[name="cate"]').text($('#categoryEditInput option:selected').text());
                    updatedRow.find('td[name="info"]').text($('#descriptionEdit').val());
                    updatedRow.find('td[name="image"] img').attr('src', $('#previewImage2').attr('src'));

                    let status = $('input[name="status"]:checked').val();
                    let statusIcon = updatedRow.find('td[name="status"] i');
                    statusIcon.removeClass('fa-toggle-on fa-toggle-off text-secondary');
                    if (status == 1) {
                        statusIcon.addClass('fa-toggle-on text-secondary');
                    } else {
                        statusIcon.addClass('fa-toggle-off');
                    }
//setInterval(() => {
//        $(`#${id}`) =  
//    })


                    // Loại bỏ backdrop thừa
//                            $('.modal-backdrop').remove();
//                            $('body').removeClass('modal-open');
                                            setTimeout(() => {location.reload();},1500)
                },

                error: function (xhr, status, error) {
                    console.error('Error updating product:', error);
                }
            });
        }
    }


//            // Loại bỏ backdrop khi modal đóng
//            $('#user-form-modal').on('hidden.bs.modal', function () {
//                $('.modal-backdrop').remove();
//                $('body').removeClass('modal-open');
//            });
//
//            // Xóa backdrop thừa trước khi mở modal
//            $('#user-form-modal').on('show.bs.modal', function () {
//                $('.modal-backdrop').remove();
//                $('body').removeClass('modal-open');
//            });

// Hiển thị hình ảnh xem trước
    function displayImage2(input) {
        var previewImage = document.getElementById("previewImage2");
        var file = input.files[0];
        var reader = new FileReader();

        reader.onload = function (e) {
            previewImage.src = e.target.result;
            previewImage.style.display = "block";
        }

        reader.readAsDataURL(file);
    }

// Điền thông tin sản phẩm vào form chỉnh sửa
    function editProduct(button) {
        let id = $(button).closest('tr').find('td[name="id"]').text().trim();
        let name = $(button).closest('tr').find('td[name="name"]').text().trim();
        let price = $(button).closest('tr').find('td[name="price"]').text().trim().split('$')[1];

        let categoryText = $(button).closest('tr').find('td[name="cate"]').text().trim();
        let description = $(button).closest('tr').find('td[name="info"]').text().trim();
        let image = $(button).closest('tr').find('td[name="image"]').find('img').attr('src');
        let status = $(button).closest('tr').find('td[name="status"]').data('status');

        $('#idEditInput').val(id);
        $('#nameEditInput').val(name);
        $('#priceEditInput').val(price);

        $('#descriptionEdit').val(description);

// Loop through category list to select the category
        $('#categoryEditInput option').each(function () {
            if ($(this).text() === categoryText) {
                $(this).prop('selected', true);
            }
        });

        $('#descriptionEdit').val(description);
        $('#previewImage2').attr('src', image);
        console.log(image)

        $('#previewImage2').css('display', 'block');
        $('#currentImage').val(image);
        console.log($('#currentImage'))
// Set status radio button
        if (status === 1) {
            $('#statusActive').prop('checked', true);
        } else {
            $('#statusInactive').prop('checked', true);
        }
    }
    
    
</script>
