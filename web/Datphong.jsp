<%-- 
    Document   : Home
    Created on : Apr 14, 2022, 9:17:28 PM
    Author     : nguye
--%>

<%@page import="java.text.DecimalFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
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

        <div class="card mb-3" style="max-width: 100%;">
            <div class="row g-0">
                <div class="col-md-7">
                    <img style="height: 300px; width: 100%; object-fit:cover;" src="${loaiphong.HINHANH}" class="img-fluid rounded-start" alt="">
                </div>
                <div class="col-md-5">
                    <div class="card-body">
                        <a style="text-decoration: none" href="datphong?id=${loaiphong.IDLOAIPHONG}">
                            <h4 class="card-title">${loaiphong.TENLOAIPHONG}</h4>
                        </a>
                        <p style="display: -webkit-box;-webkit-box-orient: vertical;-webkit-line-clamp: 8;overflow: hidden;" class="card-text">${loaiphong.MOTA}</p>

                        <h6 style="color: red">Giá phòng: <fmt:formatNumber type = "number" 
                                          maxFractionDigits = "3" value = "${loaiphong.GIAPHONG}" /> VND
                        </h6>
                    </div>
                </div>
            </div>
        </div>


        <!-- Button trigger modal -->
        <button type="button" class="btn btn-outline-warning" data-bs-toggle="modal" data-bs-target="#exampleModal">
            Ðặt phòng
        </button>

        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-xl">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">THÔNG TIN ĐẶT PHÒNG</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form method="post" action="adddatphong">
                            <img style="height: 300px; width: 100%; object-fit:cover;" src="${loaiphong.HINHANH}" class="img-fluid rounded-start" alt="">

                            <div style="display:flex">
                                <input type="text" value="${sessionScope.acc.IDKHACHHANG}" name="IDKHACHHANG"style="visibility: hidden">
                                <input type="text" value="${loaiphong.IDLOAIPHONG}" name="MALOAIPHONG" style="visibility: hidden">
                                <input type="text" value="${loaiphong.IDLOAIPHONG}" name="idLP" style="visibility: hidden">
                            </div>


                            <div>
                                <h6>Khách hàng: ${sessionScope.acc.HOTEN}</h6>
                                <h6>Loại phòng: ${loaiphong.TENLOAIPHONG}</h6>
                                <h6 style="color: red">Giá phòng: <fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${loaiphong.GIAPHONG}" /> VND
                                </h6>
                            </div>
                            <hr/>

                            <div class="input-group mb-3">
                                <span style="width: 200px" class="input-group-text">Thời gian nhận phòng</span>
                                <input id="gdDateTime" type="date" name="gdDate" class="form-control" placeholder="gdDateTime" required="Chọn ngày đến">
                                <input id="gdDateTime" type="time" name="gdTime" class="form-control" placeholder="gdDateTime" required="Chọn giờ đến">
                            </div>

                            <div class="input-group mb-3">
                                <span style="width: 200px" class="input-group-text">Thời gian trả phòng</span>
                                <input id="gtDateTime" type="date" name="gtDate" class="form-control" placeholder="gtDateTime" required="Chọn ngày đi">
                                <input id="gtDateTime" type="time" name="gtTime" class="form-control" placeholder="gtDateTime" required="Chọn ngày đi">
                            </div>

                            <label for="SONGUOIO" class="form-label">Số người</label>
                            <input tyle="number" class="form-control mb-3" name="SONGUOIO" value="1" id="SONGUOIO" required="Nhập số người">

                            <label for="GHICHU" class="form-label">Lời nhắn</label>
                            <textarea class="form-control" name="GHICHU" id="GHICHU" rows="3" placeholder="Để lại lời nhắn cho chúng tôi hoặc liên hệ trực tiếp qua hotline 1800.066.051."></textarea>

                            <br/>
                            <div class="group modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                                <input type="submit" class="btn btn-primary" value="Đặt phòng">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>


    </div>




    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>
