<%-- 
    Document   : Datlaimatkhau
    Created on : May 25, 2022, 1:29:11 PM
    Author     : nguye
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
        <title>VNBooking | Đặt lại mật khẩu</title>
        <link rel="icon" href="images/logo.svg" type="image/x-icon">
    </head>
    <body style="background-color: ${sessionScope.mamau}">
        <jsp:include page="Header.jsp"></jsp:include>
            <div class="container">
                <form action="xacnhandatlaimatkhau" method="post">
                    <h5>Đặt lại mật khẩu cho tài khoản của bạn.</h5>
                    <div class="form-floating mb-3">
                        <input id="passn" type="password" name="new_password" class="form-control" placeholder="Password">
                        <label for="passn" class="form-label">Mật khẩu mới</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input autocomplete="off" id="n_pass" type="password" name="re_password" class="form-control" placeholder="Password">
                        <label for="n_pass" class="form-label">Xác nhận mật khẩu</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="submit" class="btn btn-primary" value="Lưu thay đổi và quay về trang đăng nhập">
                    </div>
                    <input type="text" value="${sessionScope.emaildatlai}" name="email" style="visibility: hidden">

            </form>

        </div>
        <jsp:include page="Footer.jsp"></jsp:include>
        <!-- JavaScript Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
    </body>
</html>
