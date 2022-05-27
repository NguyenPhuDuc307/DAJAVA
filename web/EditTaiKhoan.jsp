<%-- 
    Document   : EditTaiKhoan
    Created on : 10-May-2022, 13:38:58
    Author     : bigbo
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
        <title>VNBooking | Thông tin tài khoản</title>
        <link rel="icon" href="images/logo.svg" type="image/x-icon">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


    </head>
    <body style="color: ${sessionScope.mamauchu}; background-color: ${sessionScope.mamau}">
        <!--NAV-->
        <jsp:include page="Header.jsp"></jsp:include>
            <div class="container">
                <h2>Quản lý <b>Tài khoản</b></h2>
                <div>
                    <form action="EditTaiKhoanControl" method="post">
                        <div class="modal-header">
                            <h4 class="modal-title">Thông tin</h4>
                            <a class="navbar-brand" href="TaiKhoanControl"> <button type="button" class="btn-close" aria-label="Close"></button></a>

                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>Mã khách sạn</label>
                                <textarea style="color: ${sessionScope.mamauchu}; background-color: ${sessionScope.mamau}" name="maks" class="form-control" required>${detailTK.MAKHACHSAN}</textarea>
                        </div>
                        <div class="form-group">
                            <label>Họ tên</label>
                            <textarea style="color: ${sessionScope.mamauchu}; background-color: ${sessionScope.mamau}" name="hoten" class="form-control" required>${detailTK.HOTEN}</textarea>
                        </div>
                        <div class="form-group">
                            <label>Điện thoại</label>
                            <textarea style="color: ${sessionScope.mamauchu}; background-color: ${sessionScope.mamau}" name="dt" class="form-control" required>${detailTK.DIENTHOAI}</textarea>
                        </div>
                        <div class="form-group">
                            <label>Email</label>
                            <textarea style="color: ${sessionScope.mamauchu}; background-color: ${sessionScope.mamau}" name="email" type="text" class="form-control"required>${detailTK.EMAIL}</textarea>
                        </div>
                        <div class="form-group">
                            <c:choose>
                                <c:when test="${detailTK.ADMIN==true}"><input name="admin" type="checkbox" value="true" checked="true"></c:when>
                                <c:otherwise><input name="admin" type="checkbox" value="true"></c:otherwise>
                            </c:choose>
                            <label>Quyền quản lý trang web </label>
                        </div>
                    </div>
                    <div class="container">
                        <input type="submit" class="btn btn-success" value="Lưu thay đổi">
                    </div>
                </form>
            </div>
        </div>
        <jsp:include page="Footer.jsp"></jsp:include>
        <!-- JavaScript Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
    </body>
</html>
