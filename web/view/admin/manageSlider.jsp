<%-- 
    Document   : product_details
    Created on : May 31, 2024, 10:38:58 AM
    Author     : ASUS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Stylus</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

        <style type="text/css">
            .body {
                margin-top: 20px;
                background: #f8f8f8
            }
            .thumbnail-img {
                width: 300px; /* Adjust the width as needed */
                height: auto;
                max-height: 100px !important; /* Adjust the max-height as needed */
                object-fit: cover;
            }

            .align-middle img {
                max-width: 100%;
                max-height: 100px;
            }

        </style>
    </head>

    <body>
        <!-- Header -->

        <jsp:include page="../layout/header.jsp"></jsp:include>


            <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.1/dist/css/bootstrap.min.css" rel="stylesheet">
            <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">

            <div class="container" style="max-width: 100%">
                <div class="row flex-lg-nowrap">
                    <div class="col">

                        <div class="row flex-lg-nowrap">
                            <div class="col">
                                <div class="e-panel card">
                                    <div class="card-body">
                                        <div class="card-title">
                                            <h6 class="mr-2"><span>Manager Slider List</span></h6>
                                        </div>
                                        <div class="e-table">
                                            <div class="table table-lg">
                                                <table class="table table-bordered" style="width: 100%">
                                                    <thead>
                                                        <tr>
                                                            <th class="align-middle">SliderID</th>
                                                            <th class="align-middle">Title</th>
                                                            <th class="align-middle">Image</th>
                                                            <th class="align-middle">CampainID</th>
                                                            <th class="align-middle">Status</th>
                                                            <th class="align-middle">Action</th>
                                                        </tr>
                                                    </thead>

                                                <c:forEach items="${listSlider}" var="s">
                                                    <tr>
                                                        <td class="align-middle" name="id">${s.id}</td>
                                                        <td class="align-middle" style="white-space: normal;" name="name">${s.title}</td>
                                                        <td class="align-middle text-center" style="max-width: 150px" name="image">
                                                            <div class="bg-light d-inline-flex justify-content-center align-items-center align-top">
                                                                <img class="thumbnail-img" style="max-width: 100%; max-height: 100%;" src="${s.image}">
                                                            </div>
                                                        </td>
                                                        <td class="align-middle" name="campain">${s.getCampainID()}</td>
                                                    <form action="ManageSliders" method="POST">
                                                        <td class="text-center align-middle" name="status" data-status="${s.getStatus()}">
                                                            <i class="fa cursor-pointer
                                                               <c:choose>
                                                                   <c:when test="${s.getStatus() eq 1}">fa-toggle-on text-secondary</c:when>
                                                                   <c:otherwise>fa-toggle-off</c:otherwise>
                                                               </c:choose>"
                                                               data-id="${s.id}" 
                                                               data-status="${s.getStatus()}" 
                                                               onclick="toggleStatus(this)">
                                                            </i>
                                                        </td>
                                                    </form>
                                                    <script>
                                                        function toggleStatus(icon) {
                                                            // Lấy trạng thái hiện tại từ lớp của biểu tượng
                                                            const currentClass = $(icon).hasClass('fa-toggle-on') ? 'fa-toggle-on' : 'fa-toggle-off';

                                                            // Chuyển đổi trạng thái
                                                            if (currentClass === 'fa-toggle-on') {
                                                                $(icon).removeClass('fa-toggle-on text-secondary').addClass('fa-toggle-off');
                                                            } else {
                                                                $(icon).removeClass('fa-toggle-off').addClass('fa-toggle-on text-secondary');
                                                            }

                                                            // Gửi yêu cầu AJAX để cập nhật trạng thái trên máy chủ
                                                            const sliderID = $(icon).data('id');
                                                            const newStatus = currentClass === 'fa-toggle-on' ? 0 : 1;

                                                            $.ajax({
                                                                url: 'ManageSliders', // URL để xử lý yêu cầu cập nhật
                                                                type: 'POST',
                                                                data: {action: 'updateStatus', id: sliderID, status: newStatus},
                                                                success: function (response) {
                                                                    console.log('Status updated successfully');
                                                                },
                                                                error: function (xhr, status, error) {
                                                                    console.error('Error updating status:', error);
                                                                }
                                                            });
                                                        }
                                                    </script>
                                                    <td class="text-center align-middle">
                                                        <div class="btn-group align-top">
                                                            <button class="btn btn-sm btn-outline-secondary badge" type="button" 
                                                                    data-toggle="modal" data-target="#user-form-modal"
                                                                    onclick="editProduct(this)">
                                                                <i class="fa fa-edit"></i> Edit
                                                            </button>
                                                            <button class="btn btn-sm btn-outline-secondary badge" type="button">
                                                                <i class="fa-regular fa-eye"></i> View
                                                            </button>
                                                        </div>
                                                    </td>
                                                    </tr>
                                                </c:forEach>

                                            </table>

                                        </div>
                                        <div class="d-flex justify-content-center">
                                            <ul class="pagination mt-3 mb-0">
                                                <c:forEach begin="1" end="${pageControl.totalPage}" var="pageNumber">
                                                    <li class="page-item"><a href="${pageControl.urlPattern}page=${pageNumber}" class="page-link">${pageNumber}</a></li>
                                                    </c:forEach>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-lg-3 mb-3">
                            <div class="card">
                                <div class="card-body">
                                    <div class="search-container">
                                        <div class="form-group" id="searchDropdown">
                                            <form action="ManageSliders" method="GET">
                                                <input type="hidden" name="action" value="filterSliders">


                                                <!--Search Section-->
                                                <div class="search-container">
                                                    <div class="form-group" id="searchDropdown">
                                                        <div class="search-input" value="search">
                                                            <label>Search:</label>
                                                            <input class="form-control w-100" type="text" placeholder="Search" name="search">
                                                        </div>
                                                    </div>
                                                </div>

                                                
                                                <!--Status Filter Section--> 
                                                <hr class="my-3">
                                                <div value="status">
                                                    <label>Status:</label>
                                                    <div class="px-2">
                                                        <div class="custom-control custom-radio">
                                                            <input type="radio" class="custom-control-input" name="status" id="users-status-active" value="active" />
                                                            <label class="custom-control-label" for="users-status-active">Active</label>
                                                        </div>
                                                    </div>
                                                    <div class="px-2">
                                                        <div class="custom-control custom-radio">
                                                            <input type="radio" class="custom-control-input" name="status" id="users-status-any" value="inactive" />
                                                            <label class="custom-control-label" for="users-status-any">Inactive</label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <hr class="my-3">
                                                <div>
                                                    <button type="submit" class="btn btn-primary w-100">Filter</button>
                                                </div>
                                            </form>


                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>

                </div>


                <div class="modal fade" id="user-form-modal" tabindex="-1" role="dialog" aria-labelledby="userFormModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg" role="document">
                        <div class="modal-content">
                            <div class="modal-header" style="background-color: transparent">
                                <h5 class="modal-title" style="color:black">Edit Product</h5>
                                <button type="button" class="close" data-dismiss="modal">
                                    <span aria-hidden="true">×</span>
                                </button>
                            </div>

                            <form id="editProduct" action="ManageSliders?action=editProduct" method="POST" enctype="multipart/form-data">
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

                                    <!--Campaign-->
                                    <div class="form-group">
                                        <label for="category">CampainID: </label>
                                        <input type="text" class="form-control" id="campainEditInput" name="campain">
                                        <div id="campainEditError" class="error"></div>
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

        </div>
        <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.1/dist/js/bootstrap.bundle.min.js"></script>
        <script>
                                            // Hàm kiểm tra và gửi form cập nhật sản phẩm
                                            function validateForm2(event) {
                                                event.preventDefault(); // Ngăn chặn hành vi mặc định của form

                                                let name = $('#nameEditInput').val().trim();
                                                let campain = $('#campainEditInput').val().trim();
                                                let status = $('input[name="status"]:checked').val();
                                                let image = $('#imageEdit').val().trim();

                                                // Xóa thông báo lỗi hiện tại
                                                $('.error').html('');

                                                // Kiểm tra đầu vào
                                                if (name === '') {
                                                    $('#nameEditError').html('Name cannot be blank');
                                                }

                                                if (campain === '') {
                                                    $('#campainEditError').html('CampainID cannot be blank');
                                                }

                                                if (status === undefined) {
                                                    $('#statusEditError').html('Please select a status');
                                                }

                                                if (image === '') {
                                                    $('#imageEditError').html('Please select an image');
                                                }

                                                // Nếu không có lỗi thì submit form bằng AJAX
                                                let error = '';
                                                $('.error').each(function () {
                                                    error += $(this).html();
                                                });

                                                if (error === '') {
                                                    let formData = new FormData($('#editProduct')[0]); // Lấy dữ liệu từ form

                                                    $.ajax({
                                                        url: 'ManageSliders?action=editProduct',
                                                        type: 'POST',
                                                        data: formData,
                                                        processData: false,
                                                        contentType: false,
                                                        success: function (response) {
                                                            // Xử lý khi cập nhật thành công    
                                                            $('#user-form-modal').modal('hide');
                                                            location.reload(); // reload page

                                                            // Cập nhật thông tin sản phẩm trong bảng
                                                            let id = $('#idEditInput').val();
                                                            let updatedRow = $('td[name="id"]').filter(function () {
                                                                return $(this).text().trim() == id;
                                                            }).closest('tr');

                                                            updatedRow.find('td[name="name"]').text(name);
                                                            updatedRow.find('td[name="campain"]').text(campain);
                                                            updatedRow.find('td[name="image"] img').attr('src', $('#previewImage2').attr('src'));

                                                            let status = $('input[name="status"]:checked').val();
                                                            let statusIcon = updatedRow.find('td[name="status"] i');
                                                            statusIcon.removeClass('fa-toggle-on fa-toggle-off text-secondary');
                                                            if (status == 1) {
                                                                statusIcon.addClass('fa-toggle-on text-secondary');
                                                            } else {
                                                                statusIcon.addClass('fa-toggle-off');
                                                            }
                                                        },
                                                        error: function (xhr, status, error) {
                                                            console.error('Error updating product:', error);
                                                        }
                                                    });
                                                }
                                            }


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
                                                let campain = $(button).closest('tr').find('td[name="campain"]').text().trim();
                                                let image = $(button).closest('tr').find('td[name="image"]').find('img').attr('src');
                                                let status = $(button).closest('tr').find('td[name="status"]').data('status');
                                       
                                                $('#idEditInput').val(id);
                                                $('#nameEditInput').val(name);

                                                if (campain) {
                                                    $('#campainEditInput').val(campain);
                                                }

                                                $('#previewImage2').attr('src', image);
                                                $('#previewImage2').css('display', 'block');
                                                $('#currentImage').val(image);

                                                // Set status radio button
                                                if (status === 1) {
                                                    $('#statusActive').prop('checked', true);
                                                } else {
                                                    $('#statusInactive').prop('checked', true);
                                                }
                                            }
        </script>





        <script type="text/javascript">

        </script>
        <!--Footer-->
        <jsp:include page="../layout/footer.jsp"/>



    </body>

</html>
