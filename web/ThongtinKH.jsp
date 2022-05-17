<%-- 
    Document   : Home
    Created on : Apr 14, 2022, 9:17:28 PM
    Author     : nguye
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
                            <a class="nav-link dropdown-toggle nav-item dropdown" href="" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Xin chào ${sessionScope.acc.HOTEN}!
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <c:choose>
                                    <c:when test="${sessionScope.istk}">
                                        <li><a class="dropdown-item" href="thongtintaikhoan?id=${sessionScope.acc.IDTAIKHOAN}">Thông tin tài khoản</a></li>
                                        </c:when>
                                        <c:otherwise>
                                        <li><a class="dropdown-item" href="thongtinkhachhang?id=${sessionScope.acc.IDKHACHHANG}">Thông tin khách hàng</a></li>
                                        </c:otherwise>
                                    </c:choose>
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

    <div class="container" style="margin-top:2rem;">
        <!--Button-->
        <div class="position-relative" style="margin-top:23rem; margin-bottom: 12rem">
            <div class="position-absolute bottom-0 start-50 translate-middle-x">
                <c:choose>
                    <c:when test="${tk.HINHANH == null}">
                        <img data-bs-toggle="modal" data-bs-target="#staticBackdrop" style="height:20rem; width:20rem; border-radius:50%; margin-top:1rem; object-fit:cover;" src="https://superawesomevectors.com/wp-content/uploads/2017/06/camera-flat-style-vector-icon-800x566.jpg" class="img-thumbnail shadow" alt="...">
                    </c:when>
                    <c:otherwise>
                        <img data-bs-toggle="modal" data-bs-target="#staticBackdrop" style="height:20rem; width:20rem; border-radius:50%; margin-top:1rem; object-fit:cover;" src="${tk.HINHANH}" class="img-thumbnail shadow" alt="...">
                    </c:otherwise>
                </c:choose>
            </div>
        </div>

        <div class="modal fade" id="staticBackdrop1" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog modal-xl">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="staticBackdropLabel"></h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <img style="width:100%; height: auto" src="" class="img-thumbnail" alt="...">
                    </div>
                </div>
            </div>
        </div>


        <div class="row justify-content-md-center">
            <div class="col col-lg-2" style="margin-top: 2rem">
                <div class="justify-content-end" style="display: flex">
                    <h6>Họ tên:</h6>
                </div>
                <div class="justify-content-end" style="display: flex">
                    <h6>Số điện thoại:</h6>
                </div>
                <div class="justify-content-end" style="display: flex">
                    <h6>Địa chỉ Email:</h6>
                </div>
            </div>
            <div class="col col-lg-2" style="margin-top: 2rem">
                <div style="display: flex">
                    <h6>${tk.HOTEN}</h6>
                </div>
                <div style="display: flex">
                    <h6>${tk.DIENTHOAI}</h6>
                </div>
                <div style="display: flex">
                    <h6>${tk.EMAIL}</h6>
                </div>
            </div>
        </div>

        <div class="row justify-content-md-center">
            <div class="col col-lg-4">
                <hr/>
            </div>
        </div>
        <div class="row justify-content-md-center" style="margin-bottom:10rem">
            <div class="col col-lg-2">
                <a type="button" href="loadTaiKhoanControl?IDTK=" class="btn btn-outline-success">Thay đổi thông tin</a>
            </div>
        </div>


    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>
