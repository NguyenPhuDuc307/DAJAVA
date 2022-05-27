<%-- 
    Document   : Quenmk
    Created on : May 25, 2022, 12:58:28 PM
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
        <title>VNBooking | Quên mật khẩu</title>
        <link rel="icon" href="images/logo.svg" type="image/x-icon">
    </head>
    <body style="background-color: ${sessionScope.mamau}">
        <jsp:include page="Header.jsp"></jsp:include>

            <div class="container">
                <h4 style="color: green">${sessionScope.mes}</h4>
            <form action="Quenmk" method="post">
                <h5>Bạn quên mật khẩu?</h5>
                <p>Hãy điền email vào đây, một email đặt lại mật khẩu sẽ được gửi tới bạn.</p>
                <div class="form-floating mb-3">
                    <input id="user" type="text" name="email" class="form-control" aria-describedby="emailHelp" placeholder="name@example.com">
                    <label for="user" class="form-label">Địa chỉ Email</label>
                </div>
                <div class="form-floating mb-3">
                    <input type="submit" class="btn btn-primary" value="Gửi email đặt mật khẩu">
                </div>
            </form>

        </div>

        <jsp:include page="Footer.jsp"></jsp:include>
        <!-- JavaScript Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
    </body>
</html>
