<%-- 
    Document   : EditLoaiPhong
    Created on : 10-May-2022, 09:25:28
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
        <title>VNBooking | Chỉnh sửa phòng ở</title>
        <link rel="icon" href="images/logo.svg" type="image/x-icon">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    </head>
    <body style="background-color: ${sessionScope.mamau}">
        <!--NAV-->
        <jsp:include page="Header.jsp"></jsp:include>
            <div class="container">
                <h2>Quản lý <b>Loại phòng</b></h2>
                <form action="EditLoaiPhongControl" method="post">
                    <div class="modal-header">
                        <h4 class="modal-title">Thông tin loại phòng</h4>
                        <a class="navbar-brand" href="LoaiPhongControl"> <button type="button" class="btn-close" aria-label="Close"></button></a>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label>ID loại phòng</label>
                            <input value="${detailLP.IDLOAIPHONG}" name="IDLP" type="text" class="form-control" readonly required>
                    </div>
                    <div class="form-group">
                        <label>Mã khách sạn</label>
                        <input value="${detailLP.MAKHACHSAN}" name="maks" type="text" class="form-control" readonly required>
                    </div>
                    <div class="form-group">
                        <label>Tên loại phòng</label>
                        <textarea name="tenloaiphong" class="form-control" required>${detailLP.TENLOAIPHONG}</textarea>
                    </div>
                    <div class="form-group">
                        <label>Mô tả</label>
                        <textarea name="mota" style="height: 20rem" class="form-control" required>${detailLP.MOTA}</textarea>
                    </div>
                    <div class="form-group">
                        <label>Hình ảnh</label>
                        <input value="${detailLP.HINHANH}" name="hinh" type="text" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Giá phòng</label>
                        <input value="${detailLP.GIAPHONG}" name="gia" type="text" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Số lượng</label>
                        <input value="${detailLP.SOLUONG}" name="sl" type="text" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Trạng thái: </label>
                        <c:choose>
                            <c:when test="${detailLP.TRANGTHAI==true}"><input name="trangthai" type="checkbox" value="true" checked="true"></c:when>
                            <c:otherwise><input name="trangthai" type="checkbox" value="true"></c:otherwise>
                        </c:choose>
                    </div>
                    <div class="form-group">
                        <label>Ngừng: </label>
                        <c:choose>
                            <c:when test="${detailLP.NGUNG==true}"><input name="ngung" type="checkbox" value="true" checked="true"></c:when>
                            <c:otherwise><input name="ngung" type="checkbox" value="true"></c:otherwise>
                        </c:choose>
                    </div>
                </div>
                <div class="modal-header">
                    <input type="submit" class="btn btn-success" value="Đồng ý">
                </div>
            </form>
        </div>
        <jsp:include page="Footer.jsp"></jsp:include>
        <script src="js/manager.js" type="text/javascript"></script>
        <!-- JavaScript Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
    </body>
</html>
