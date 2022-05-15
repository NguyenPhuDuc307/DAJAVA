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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <!--NAV VÀ PHÂN QUYỀN-->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <a class="navbar-brand" href="home">
                <b style="color:blue">VN</b><b style="color:orange">BOOKING</b>
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">

                    <c:if test="${sessionScope.istk == true }" >
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Quản lý
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">

                                <c:if test="${sessionScope.acc.ADMIN == 1 }" >
                                    <li>
                                        <a class="dropdown-item" href="TaiKhoanControl">Quản lý tài khoản</a>
                                    </li>

                                    <li>
                                        <a class="dropdown-item" href="KhachSanControl">Quản lý khách sạn</a>
                                    </li>
                                </c:if>


                                <c:if test="${sessionScope.acc.ADMIN == 0 }" >
                                    <li>
                                        <a class="dropdown-item" href="LoaiPhongControl">Quản lý phòng khách sạn</a>
                                    </li> 
                                </c:if>
                            </ul>
                        </li>
                    </c:if>


                </ul>
                <form class="d-flex">
                    <c:if test="${sessionScope.acc == null}" >
                        <div class="nav-item">
                            <a class="nav-link" href="Login.jsp">Đăng nhập</a>
                        </div>
                    </c:if>


                    <c:if test="${sessionScope.acc != null}" >
                        <div class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle nav-item dropdown" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Xin chào ${sessionScope.acc.HOTEN}!
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#">Thông tin tài khoản</a></li>
                                <li><hr class="dropdown-divider"></li>

                                <c:if test="${sessionScope.acc != null}" >              
                                    <li class="nav-item">
                                        <a class="nav-link" href="logout">Đăng xuất</a>
                                    </li>
                                </c:if>

                            </ul>
                        </div>

                    </c:if>
                </form>
            </div>
        </div>
    </nav>
</head>
<body>
    <div class="container">
        <h2>Quản lý <b>Khách sạn</b></h2>
        <div id="editEmployeeModal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="EditKhachSanControl" method="post">
                        <div class="modal-header">
                            <h4 class="modal-title">Thông tin khách sạn</h4>
                            <a class="navbar-brand" href="KhachSanControl"> <button type="button" class="btn-close" aria-label="Close"></button></a>
                        </div>
                        <div class="modal-body">
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
                        <div class="modal-footer">
                            <input type="submit" class="btn btn-success" value="Đồng ý">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <script src="js/manager.js" type="text/javascript">
    </script>
</body>
</html>
