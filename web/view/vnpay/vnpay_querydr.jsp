<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <meta name="description" content="">
        <meta name="author" content="">
        <title>qerydr</title>
        <!-- Bootstrap core CSS -->
        <link href="../../asset/bootstrap.min.css" rel="stylesheet"/>
        <!-- Custom styles for this template -->
        <link href="../../asset/jumbotron-narrow.css" rel="stylesheet">      
        <script src="../../asset/jquery-1.11.3.min.js"></script>
    </head>

    <body>

        <div class="container">
            <div class="header clearfix">

                <h3 class="text-muted">VNPAY DEMO</h3>
            </div>
            <h3>Query</h3>
            <div class="table-responsive">
            <form action="/vnpay_jsp/vnpayquery" id="frmQerydr" method="Post">
                <div class="form-group">
                <label for="order_id">Mã giao dịch cần truy vấn (Giá trị của vnp_TxnRef)</label>
                <input class="form-control" id="order_id"
                       name="order_id" type="text"/>
                </div>
                <div class="form-group">
                <label for="trans_date">Thời gian khởi tạo giao dịch (Giá trị của vnp_CreateDate yêu cầu thanh toán)</label>
                <input class="form-control" id="trans_date"
                       name="trans_date" type="text" placeholder="yyyyMMddHHmmss"/>
            </div>
                <div class="form-group">
                <button type="submit" class="btn btn-primary">QueryDr</button>
            </div>
            </form>   
            <p>
                &nbsp;
            </p>
            <footer class="footer">
                <p>&copy; VNPAY 2020</p>
            </footer>
        </div> 
        </div>
    </body>
</html>
