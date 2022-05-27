<%-- 
    Document   : Xacnhan
    Created on : May 20, 2022, 10:22:13 AM
    Author     : nguye
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
        <title>VNBooking | Xác nhận</title>
        <link rel="icon" href="images/logo.svg" type="image/x-icon">
    </head>
    <body>
        <jsp:include page="Header.jsp"></jsp:include>

            <div class="container" style="margin-top: 1rem; margin-bottom: 25rem">
                <form action="hoantatxacnhan" method="post">
                    <h5>
                        Ðây là bước cuối cùng để xác nhận tài khoản.
                    </h5>
                    <h6>
                        Vui lòng nhấn vào <a href="hoantatxacnhan?idtk=${sessionScope.idtkchuaxn}"><u style="color: blue">đây</u></a> để kích hoạt tài khoản.
                </h6>
            </form>
        </div>

        <jsp:include page="Footer.jsp"></jsp:include>
        <!-- JavaScript Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
    </body>
</html>
