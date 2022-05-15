<%-- 
    Document   : Login
    Created on : Apr 24, 2022, 5:34:26 PM
    Author     : ASUS
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>

<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

        <!--NAV VÀ PHÂN QUYỀN-->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <a class="navbar-brand" href="home">
                <b style="color:blue">VN</b><b style="color:orange">BOOKING</b>
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

        </div>
    </nav>
</head>

<body>

    <div style="margin-top:1rem" class="container">
        <nav>
            <div class="nav nav-tabs" id="nav-tab" role="tablist">
                <button class="nav-link active" id="nav-home-tab" data-bs-toggle="tab" data-bs-target="#nav-home" type="button" role="tab" aria-controls="nav-home" aria-selected="true">Đăng nhập</button>
                <button class="nav-link" id="nav-profile-tab" data-bs-toggle="tab" data-bs-target="#nav-profile" type="button" role="tab" aria-controls="nav-profile" aria-selected="false">Đăng ký</button>
            </div>
        </nav>
        <div class="tab-content" id="nav-tabContent">
            <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                <form asp-controller="" action="login" method="post">

                    <br/>

                    <p>Vui lòng điền thông tin đăng nhập.</p>

                    <div class="form-floating mb-3">
                        <input id="user" type="text" name="email" class="form-control" aria-describedby="emailHelp" placeholder="name@example.com">
                        <label for="user" class="form-label">Địa chỉ Email</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input id="pass" type="password" name="password" class="form-control" data-type="password" placeholder="Password">
                        <label for="pass" class="form-label">Mật khẩu</label>
                    </div>

                    <div class="mb-3 form-check">
                        <input type="checkbox" class="form-check-input" id="check" checked>
                        <label class="form-check-label" for="check">Lưu đăng nhập?</label>
                    </div>

                    <div class="group">
                        <input type="submit" class="btn btn-primary" value="Đăng nhập">
                        <br />
                        <span class="text-danger">${mess}</span>
                    </div>
                </form>
            </div>
            <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
                <form method="post" action="signup">
                    <br/>

                    <p>Vui lòng điền thông tin đăng ký.</p>                   

                    <div class="form-floating mb-3">
                        <input id="hoten" type="text" name="hoten" class="form-control" placeholder="Hoten">
                        <label for="hoten" class="form-label">Họ tên</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input id="dt" type="text" name="dienthoai" class="form-control" placeholder="Sodienthoai">
                        <label for="dt" class="form-label">Số điện thoại</label>
                    </div>
                    
                    <div class="form-floating mb-3">
                        <textarea id="user" type="text" name="emaiy" class="form-control" placeholder="Email"></textarea>
                        <label for="user" class="form-label">Địa chỉ Email</label>
                    </div>

                    <div class="form-floating mb-3">
                        <textarea id="pass" type="password" name="password" class="form-control" data-type="password" placeholder="Password"></textarea>
                        <label for="pass" class="form-label">Mật khẩu</label>
                    </div>
                    <div class="form-floating mb-3">
                        <textarea id="passx" type="password" name="re_password" class="form-control" data-type="password" placeholder="Password"></textarea>
                        <label for="passx" class="form-label">Xác nhận mật khẩu</label>
                    </div>

                    <div class="group">
                        <input type="submit" class="btn btn-primary" value="Đăng ký">
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>