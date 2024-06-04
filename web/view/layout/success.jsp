<%-- 
    Document   : success
    Created on : May 25, 2024, 8:06:31 AM
    Author     : TienP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Profile</title>
        <!-- Bao gồm các thư viện cần thiết cho Bootstrap và jQuery -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <style>
            /* CSS tùy chỉnh của bạn */
        </style>
    </head>
    <body>
        <div class="modal fade" id="successModal" tabindex="-1" role="dialog" aria-labelledby="successModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="successModalLabel">Notification</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body" id="modalMessage">
                        <!-- Thông điệp sẽ được đặt tại đây -->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-dismiss="modal">OK</button>
                    </div>
                </div>
            </div>
        </div>

        <script>
            $(document).ready(function () {
                // Kiểm tra các thuộc tính được đặt bởi NotificationServlet
                const update = '<%= request.getAttribute("update") %>';
                const message = '<%= request.getAttribute("message") %>';

                if (update === 'success' && message) {
                    // Đặt thông điệp vào modal
                    $('#modalMessage').text(decodeURIComponent(message));
                    // Hiển thị modal thông báo thành công
                    $('#successModal').modal('show');
                }
            });
        </script>
    </body>
</html>
