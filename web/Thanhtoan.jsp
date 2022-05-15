<%-- 
    Document   : Thanhtoan
    Created on : May 15, 2022, 10:42:05 AM
    Author     : nguye
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
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


        <c:if test="${sessionScope.tb != null}" >
            <h5 style="margin-top: 1rem; color:green">Bạn đã đặt phòng thành công, chúng tôi sẽ sớm liên hệ tới bạn trong thời gian sớm nhất.</h5>
        </c:if>

        <form method="post" action="thanhtoan">
            <input type="text" value="${loaiphong.IDLOAIPHONG}" name="MALOAIPHONG" style="visibility: hidden">
            <input type="text" value="${loaiphong.IDLOAIPHONG}" name="idLP" style="visibility: hidden">
            <h4 class="modal-title mb-3" id="exampleModalLabel">THÔNG TIN ĐẶT PHÒNG</h4>
            <div class="input-group mb-3">
                <h6 style="width: 12rem">Khách hàng: </h6>
                <h6>${sessionScope.acc.HOTEN}</h6>
            </div>

            <div class="input-group mb-3">
                <h6 style="width: 12rem">Loại phòng: </h6>
                <h6>${sessionScope.loaiphong1}</h6>
            </div>

            <div class="input-group mb-3" style="color:red">
                <h6 style="width: 12rem">Giá phòng: </h6>
                <h6 style="color: red; width: 12rem""><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${sessionScope.giaphong}" /> VND
            </div>

            <hr/>

            <div class="input-group mb-3">
                <h6 style="width: 12rem">Thời gian nhận phòng: </h6>
                <h6>${sessionScope.ngayden}</h6>
            </div>

            <div class="input-group mb-3">
                <h6 style="width: 12rem">Thời gian trả phòng: </h6>
                <h6>${sessionScope.ngaydi}</h6>

            </div>

            <hr/>

            <div class="input-group mb-3">
                <h6 style="width: 12rem">Số người ở: </h6>
                <h6>${sessionScope.songuoi}</h6>
            </div>

            <div class="input-group mb-3">
                <h6 style="width: 12rem">Thời gian thuê phòng: </h6>
                <h6>${sessionScope.sogio} giờ</h6>
            </div>

            <div class="input-group" style="color:red">
                <h6 style="width: 12rem">THÀNH TIỀN </h6>
                <h6 style="color: red; width: 12rem""><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${sessionScope.thanhtien}" /> VND
            </div>
            <div class="mb-3">
                <i>*Nếu quý khách ở từ 2 người trở lên, số tiền phải trả thêm cho mỗi người bằng 70% so với 1 người.</i><br/>
                <i>*Nếu quý khách ở ít hơn 1 ngày thì số tiền bằng với số tiền ở của 1 ngày.</i>
            </div>

            <div class="group mb-3">
                <c:if test="${sessionScope.tb == null}" >
                    <input type="submit" class="btn btn-primary" value="Đặt phòng">
                </c:if>
                <a class="navbar-brand" href="datphong?id=${sessionScope.maloaiphong}"><button type="button" class="btn btn-success" aria-label="Close">Trở về</button></a>
            </div>

            <input type="text" value="${sessionScope.idkh}" name="idkh" style="visibility: hidden">
            <input type="text" value="${sessionScope.maloaiphong}" name="maloaiphong" style="visibility: hidden">
            <input type="text" value="${sessionScope.ngayden}" name="ngayden" style="visibility: hidden">
            <input type="text" value="${sessionScope.ngaydi}" name="ngaydi" style="visibility: hidden">
            <input type="text" value="${sessionScope.thanhtien}" name="thanhtien" style="visibility: hidden">
            <input type="text" value="${sessionScope.idDP}" name="idDP" style="visibility: hidden">
            <input type="text" value="${sessionScope.songuoi}" name="songuoi" style="visibility: hidden">
            <input type="text" value="${sessionScope.acc.IDKHACHHANG}" name="IDKHACHHANG"style="visibility: hidden">
        </form>

    </div>
</body>
</html>
