<%-- 
    Document   : KhachSan
    Created on : 10-May-2022, 14:27:26
    Author     : bigbo
--%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
        <title>VNBooking | Lịch sử đặt phòng</title>
        <link rel="icon" href="images/logo.svg" type="image/x-icon">
    </head>
    <body style="background-color: ${sessionScope.mamau}">
        <!--NAV-->
        <jsp:include page="Header.jsp"></jsp:include>

            <div class="container" style="color:${sessionScope.mamauchu}; background-color: ${sessionScope.mamau}">
            <h4>Lịch sử <b>Đặt phòng</b></h4>
            <table class="table table-bordered">
                <thead>
                    <tr style="color:${sessionScope.mamauchu}; background-color: ${sessionScope.mamau}">
                        <th>Trạng thái</th>
                        <th>Loại phòng</th>
                        <th>Khách sạn</th>
                        <th>Giờ đến</th>
                        <th>Giờ trả</th>
                        <th>Số người</th>
                        <th>Thành tiền</th>
                        <th>Liên hệ</th>
                        <th>Ghi chú</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${listDP}" var="o">
                        <tr style="color:${sessionScope.mamauchu}; background-color: ${sessionScope.mamau}">
                            <c:choose>
                                <c:when test="${o.TRANGTHAI}">
                                    <td style="color:green">
                                        Ðã thanh toán
                                    </td>
                                </c:when>
                                <c:otherwise>
                                    <td style="color:red">
                                        Nhấn để hủy
                                    </td>
                                </c:otherwise>
                            </c:choose>
                            <td style="color:${sessionScope.mamauchu}; background-color: ${sessionScope.mamau}">
                                ${o.TENLOAIPHONG}
                            </td>
                            <td style="color:${sessionScope.mamauchu}; background-color: ${sessionScope.mamau}">
                                ${o.TENKHACHSAN}
                            </td>
                            <td style="color:${sessionScope.mamauchu}; background-color: ${sessionScope.mamau}">
                                <fmt:formatDate pattern = "HH:mm dd/MM/yyyy" value = "${o.GIODAT}" />
                            </td>
                            <td style="color:${sessionScope.mamauchu}; background-color: ${sessionScope.mamau}">
                                <fmt:formatDate pattern = "HH:mm dd/MM/yyyy" value = "${o.GIOTRA}" />
                            </td>
                            <td style="color:${sessionScope.mamauchu}; background-color: ${sessionScope.mamau}">
                                ${o.SONGUOIO}
                            </td>
                            <td style="color:${sessionScope.mamauchu}; background-color: ${sessionScope.mamau}"><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${o.THANHTIEN}" /></td>
                            <td style="color:${sessionScope.mamauchu}; background-color: ${sessionScope.mamau}">
                                ${o.DIENTHOAI}
                            </td>
                            <td style="color:${sessionScope.mamauchu}; background-color: ${sessionScope.mamau}">
                                ${o.GHICHU}
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <jsp:include page="Footer.jsp"></jsp:include>
        <!-- JavaScript Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>

    </body>
</html>