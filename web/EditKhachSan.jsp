<%-- 
    Document   : EditKhachSan
    Created on : 10-May-2022, 19:58:57
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
        <title>VNBooking | Chỉnh sửa khách sạn</title>
        <link rel="icon" href="images/logo.svg" type="image/x-icon">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <body style="background-color: ${sessionScope.mamau}">
        <!--NAV-->
        <jsp:include page="Header.jsp"></jsp:include>
            <div class="container">
                <h2>Quản lý <b>Khách sạn</b></h2>
                <div>
                    <form action="EditKhachSanControl" method="post">
                        <div class="modal-header">
                            <h4>Thông tin khách sạn</h4>
                            <a class="navbar-brand" href="KhachSanControl"> <button type="button" class="btn-close" aria-label="Close"></button></a>
                        </div>
                        <div class="">
                            <div class="form-group">
                                <label>Mã khách sạn</label>
                                <input value="${detailKS.MAKHACHSAN}" name="maks" type="text" class="form-control" readonly required>
                        </div>
                        <div class="form-group">
                            <label>Tên khách sạn</label>
                            <textarea name="tenkhachsan" class="form-control" required>${detailKS.TENKHACHSAN}</textarea>
                        </div>
                        <div class="form-group">
                            <label>Địa chỉ</label>
                            <textarea name="diachi" class="form-control" required>${detailKS.DIACHI}</textarea>
                        </div>
                        <div class="form-group">
                            <label>GG Map</label>
                            <input value="${detailKS.GGMAP}" name="ggmap" type="text" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label>Hình ảnh</label>
                            <input value="${detailKS.HINHANH}" name="hinh" type="text" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label>Hạng</label>
                            <input value="${detailKS.HANG}" name="hang" type="text" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label>Ngừng: </label>
                            <c:choose>
                                <c:when test="${detailLKS.NGUNG==true}">
                                    <input name="ngung" type="checkbox" value="true" checked>
                                </c:when>    
                                <c:otherwise>
                                    <input name="ngung" type="checkbox" value="true">
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                    <div style="margin-top: 1rem">
                        <input type="submit" class="btn btn-success" value="Lưu thay đổi">
                    </div>
                </form>
            </div>
        </div>
        <jsp:include page="Footer.jsp"></jsp:include>
        <script src="js/manager.js" type="text/javascript"></script>
        <!-- JavaScript Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
    </body>
</html>
