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
        <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
        <title>VNBooking | Thanh toán</title>
        <link rel="icon" href="images/logo.svg" type="image/x-icon">

    </head>
    <body style="background-color: ${sessionScope.mamau}">

        <!--NAV-->
        <jsp:include page="Header.jsp"></jsp:include>
            <div class="container">


            <c:if test="${sessionScope.tb != null}" >
                <h5 style="margin-top: 1rem; color:green">Bạn đã đặt phòng thành công, chúng tôi sẽ sớm liên hệ tới bạn trong thời gian sớm nhất.</h5>
            </c:if>

            <form method="post" action="thanhtoan" style="color:${sessionScope.mamauchu}; background-color: ${sessionScope.mamau}">
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
                    <i>Giá phòng đã bao gồm thuế VAT 10%</i>
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
        <jsp:include page="Footer.jsp"></jsp:include>
        <!-- JavaScript Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
    </body>
</html>
