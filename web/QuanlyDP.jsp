<%-- 
    Document   : KhachSan
    Created on : 10-May-2022, 14:27:26
    Author     : bigbo
--%>
<%@page import="java.text.SimpleDateFormat"%>
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
        <title>VNBooking | Quản lý đặt phòng</title>
        <link rel="icon" href="images/logo.svg" type="image/x-icon">
        <!--NAV VÀ PHÂN QUYỀN-->

    </head>
    <body style="background-color: ${sessionScope.mamau}">
        <!--NAV-->
        <jsp:include page="Header.jsp"></jsp:include>
        <div class="container" style="color:${sessionScope.mamauchu}; background-color: ${sessionScope.mamau};">
            <h4>Quản lý <b>Đặt phòng</b></h4>


            <nav>
                <div class="nav nav-tabs" id="nav-tab" role="tablist">
                    <button class="nav-link active" id="nav-home-tab" data-bs-toggle="tab" data-bs-target="#nav-home" type="button" role="tab" aria-controls="nav-home" aria-selected="true">Tất cả</button>
                    <button class="nav-link" id="nav-profile-tab" data-bs-toggle="tab" data-bs-target="#nav-profile" type="button" role="tab" aria-controls="nav-profile" aria-selected="false">Hôm nay</button>
                    <button class="nav-link" id="nav-contact-tab" data-bs-toggle="tab" data-bs-target="#nav-contact" type="button" role="tab" aria-controls="nav-contact" aria-selected="false">Trong tuần</button>
                    <button class="nav-link" id="nav-disabled-tab" data-bs-toggle="tab" data-bs-target="#nav-disabled" type="button" role="tab" aria-controls="nav-disabled" aria-selected="false">Trong tháng</button>
                </div>
            </nav>
            <div class="tab-content" id="nav-tabContent">
                <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab" tabindex="0">
                    <c:set var="total" value="${0}"/>
                    <c:forEach items="${listDP}" var="o">
                        <c:set var="total" value="${total + o.THANHTIEN}" />



                    </c:forEach>
                    <br/>
                    Tổng đơn đặt phòng: ${listDPsum}
                    <h5 style="">Tổng tiền: <fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${total}" />₫</h5>
                    <br/>
                    <table class="table table-bordered">
                        <thead style="color:${sessionScope.mamauchu}; background-color: ${sessionScope.mamau};">
                            <tr>
                                <th>STT</th>
                                <th>Hủy</th>
                                <th>Trạng thái</th>
                                <th>Loại phòng</th>
                                <th>Khách hàng</th>
                                <th>Giờ đến</th>
                                <th>Giờ trả</th>
                                <th>Số người</th>
                                <th>Thành tiền</th>
                                <th>Liên hệ</th>
                                <th>Ghi chú</th>
                            </tr>
                        </thead>
                        <tbody style="color:${sessionScope.mamauchu};">
                            <c:forEach items="${listDP}" var="o" varStatus="loop">
                                <tr>
                                    <td>
                                        ${loop.count}
                                    </td>

                                    <c:choose>
                                        <c:when test="${o.TRANGTHAI}">
                                            <td style="color:green">
                                            </td>
                                            <td style="color:green">
                                                Ðã thanh toán
                                            </td>

                                        </c:when>
                                        <c:otherwise>
                                            <td>
                                                <a style="color:red; text-decoration: none" href="" data-bs-toggle="modal" data-bs-target="#aaa${o.IDDPCT}">
                                                    Hủy đơn
                                                </a>

                                                <!-- Modal -->
                                                <div class="modal fade" id="aaa${o.IDDPCT}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                    <div class="modal-dialog">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" id="exampleModalLabel">Bạn có chắc chắn muốn hủy đơn đặt phòng này?</h5>
                                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                            </div>
                                                            <div class="modal-footer">
                                                                <form action="HuyDon" method="post">
                                                                    <input value="${o.IDDPCT}" name="madon" hidden>
                                                                    <input value="${o.EMAIL}" name="email" hidden>
                                                                    <input value="${o.GIODAT}" name="gd" hidden>
                                                                    <button type="submit" class="btn btn-primary">Xác nhận</button>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>



                                            </td>

                                            <td>
                                                <a style="color:red; text-decoration: none" href="" data-bs-toggle="modal" data-bs-target="#a${o.IDDPCT}">
                                                    Nhấn để thanh toán
                                                </a>
                                                <!-- Modal -->
                                                <div class="modal fade" id="a${o.IDDPCT}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                    <div class="modal-dialog">
                                                        <div class="modal-content" style="color:${sessionScope.mamauchu}; background-color: ${sessionScope.mamau};">
                                                            <form asp-controller="" method="post" action="editdatphong">
                                                                <div class="modal-header">
                                                                    <h5 class="modal-title" id="exampleModalLabel">Trả phòng và thanh toán</h5>
                                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                </div>
                                                                <div class="modal-body">
                                                                    <h5 style="color: red">Khách Sạn ${o.TENKHACHSAN}</h5>
                                                                    <hr/>
                                                                    <div class="row">
                                                                        <div class="col">
                                                                            <div><h6>Khách hàng:</h6></div>
                                                                            <div><h6>Loại phòng:</h6></div>
                                                                            <div><h6>Giờ đặt phòng:</h6></div>
                                                                            <div><h6>Giờ trả phòng:</h6></div>
                                                                            <div><h6>Tổng giờ ở:</h6></div>
                                                                            <div>
                                                                                <c:choose>
                                                                                    <c:when test="${o.QUAGIO > 0}">
                                                                                        <h6>Trả phòng trễ:</h6>
                                                                                    </c:when>
                                                                                    <c:otherwise>
                                                                                        <h6>Trả phòng sớm:</h6>
                                                                                    </c:otherwise>
                                                                                </c:choose>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col">
                                                                            <div><h6>${o.HOTEN}</h6></div>
                                                                            <div><h6>${o.TENLOAIPHONG}</h6></div>
                                                                            <div><h6><fmt:formatDate pattern = "HH:mm dd/MM/yyyy" value = "${o.GIODAT}" /></h6></div>
                                                                            <div><% Date dNow = new Date();
                                                                                SimpleDateFormat ft = new SimpleDateFormat("HH:mm dd/MM/yyyy");
                                                                                out.print("<h6>" + ft.format(dNow) + "</h6>");%></div>
                                                                            <div><h6>${o.SOGIOHT}h</h6></div>
                                                                            <div>
                                                                                <c:choose>
                                                                                    <c:when test="${o.QUAGIO > 0}">
                                                                                        <h6 style="color: red">${o.QUAGIO < 0 ? -o.QUAGIO:o.QUAGIO}h</h6>
                                                                                    </c:when>
                                                                                    <c:otherwise>
                                                                                        <h6 style="color: green">${o.QUAGIO < 0 ? -o.QUAGIO:o.QUAGIO}h</h6>
                                                                                    </c:otherwise>
                                                                                </c:choose>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <hr/>
                                                                    <div class="row">
                                                                        <div class="col">
                                                                            <div><h6>THÀNH TIỀN</h6></div>
                                                                        </div>
                                                                        <div class="col">
                                                                            <div><h6 style="color:red"><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${o.THANHTIENHT}" />₫</h6></div>
                                                                        </div>
                                                                    </div>
                                                                    <i>Hóa đơn đã bao gồm thuế VAT 10%</i>
                                                                </div>
                                                                <div style="font-size: 1px; display: flex">
                                                                    <input type="text" value="${o.IDDATPHONG}" name="iddatphong" style="visibility: hidden">
                                                                    <input type="text" value="${o.GIAPHONG}" name="giaphong" style="visibility: hidden">
                                                                    <input type="text" value="${o.SONGUOIO}" name="songuoi" style="visibility: hidden">
                                                                    <input type="text" value="${o.GIODAT}" name="ngaydat" style="visibility: hidden">
                                                                    <input type="text" value="${o.IDDPCT}" name="iddpct" style="visibility: hidden">
                                                                </div>

                                                                <div class="modal-footer">
                                                                    <input type="submit" class="btn btn-primary" value="Thanh toán">
                                                                </div>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </td>
                                        </c:otherwise>
                                    </c:choose>

                                    <td style="color:${sessionScope.mamauchu}; background-color: ${sessionScope.mamau};">
                                        ${o.TENLOAIPHONG}
                                    </td>
                                    <td style="color:${sessionScope.mamauchu}; background-color: ${sessionScope.mamau};">
                                        ${o.HOTEN}
                                    </td>
                                    <td style="color:${sessionScope.mamauchu}; background-color: ${sessionScope.mamau};">
                                        <fmt:formatDate pattern = "HH:mm dd/MM/yyyy" value = "${o.GIODAT}" />
                                    </td>
                                    <td style="color:${sessionScope.mamauchu}; background-color: ${sessionScope.mamau};">
                                        <fmt:formatDate pattern = "HH:mm dd/MM/yyyy" value = "${o.GIOTRA}" />
                                    </td>
                                    <td style="color:${sessionScope.mamauchu}; background-color: ${sessionScope.mamau};">
                                        ${o.SONGUOIO}
                                    </td>
                                    <td style="color:${sessionScope.mamauchu}; background-color: ${sessionScope.mamau};"><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${o.THANHTIEN}" /></td>
                                    <td style="color:${sessionScope.mamauchu}; background-color: ${sessionScope.mamau};">
                                        ${o.DIENTHOAI}
                                    </td>
                                    <td style="color:${sessionScope.mamauchu}; background-color: ${sessionScope.mamau};">
                                        ${o.GHICHU}
                                    </td>

                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab" tabindex="0">

                    <c:set var="totalhn" value="${0}"/>
                    <c:forEach items="${listDPHN}" var="o">
                        <c:set var="totalhn" value="${totalhn + o.THANHTIEN}" />



                    </c:forEach>
                    <br/>
                    Tổng đơn đặt phòng: ${listDPsumhn}
                    <h5 style="">Tổng tiền: <fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${totalhn}" />₫</h5>
                    <br/>

                    <table class="table table-bordered">
                        <thead style="color:${sessionScope.mamauchu}; background-color: ${sessionScope.mamau};">
                            <tr>
                                <th>STT</th>
                                <th>Trạng thái</th>
                                <th>Loại phòng</th>
                                <th>Khách hàng</th>
                                <th>Giờ đến</th>
                                <th>Giờ trả</th>
                                <th>Số người</th>
                                <th>Thành tiền</th>
                                <th>Liên hệ</th>
                                <th>Ghi chú</th>
                            </tr>
                        </thead>
                        <tbody style="color:${sessionScope.mamauchu};">
                            <c:forEach items="${listDPHN}" var="o" varStatus="loop">
                                <tr>
                                    <td>
                                        ${loop.count}
                                    </td>
                                    <c:choose>
                                        <c:when test="${o.TRANGTHAI}">
                                            <td style="color:green">
                                                Ðã thanh toán
                                            </td>
                                        </c:when>
                                        <c:otherwise>
                                            <td>
                                                <a style="color:red; text-decoration: none" href="" data-bs-toggle="modal" data-bs-target="#aa${o.IDDPCT}">
                                                    Nhấn để thanh toán
                                                </a>
                                                <!-- Modal -->
                                                <div class="modal fade" id="aa${o.IDDPCT}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                    <div class="modal-dialog">
                                                        <div class="modal-content" style="color:${sessionScope.mamauchu}; background-color: ${sessionScope.mamau};">
                                                            <form asp-controller="" method="post" action="editdatphong">
                                                                <div class="modal-header">
                                                                    <h5 class="modal-title" id="exampleModalLabel">Trả phòng và thanh toán</h5>
                                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                </div>
                                                                <div class="modal-body">
                                                                    <h6>Giờ trả phòng: </h6>
                                                                    <% Date dNow1 = new Date();
                                                                        SimpleDateFormat ft1 = new SimpleDateFormat("HH:mm dd/MM/yyyy");
                                                                        out.print("<h6>" + ft1.format(dNow1) + "</h6>");%>
                                                                </div>
                                                                <input type="text" value="${o.IDDATPHONG}" name="iddatphong" style="visibility: hidden">
                                                                <input type="text" value="${o.GIAPHONG}" name="giaphong" style="visibility: hidden">
                                                                <input type="text" value="${o.SONGUOIO}" name="songuoi" style="visibility: hidden">
                                                                <input type="text" value="${o.GIODAT}" name="ngaydat" style="visibility: hidden">
                                                                <input type="text" value="${o.IDDPCT}" name="iddpct" style="visibility: hidden">
                                                                <div class="modal-footer">
                                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                                                                    <input type="submit" class="btn btn-primary" value="Đồng ý">
                                                                </div>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </td>
                                        </c:otherwise>
                                    </c:choose>

                                    <td style="color:${sessionScope.mamauchu}; background-color: ${sessionScope.mamau};">
                                        ${o.TENLOAIPHONG}
                                    </td>
                                    <td style="color:${sessionScope.mamauchu}; background-color: ${sessionScope.mamau};">
                                        ${o.HOTEN}
                                    </td>
                                    <td style="color:${sessionScope.mamauchu}; background-color: ${sessionScope.mamau};">
                                        <fmt:formatDate pattern = "HH:mm dd/MM/yyyy" value = "${o.GIODAT}" />
                                    </td>
                                    <td style="color:${sessionScope.mamauchu}; background-color: ${sessionScope.mamau};">
                                        <fmt:formatDate pattern = "HH:mm dd/MM/yyyy" value = "${o.GIOTRA}" />
                                    </td>
                                    <td style="color:${sessionScope.mamauchu}; background-color: ${sessionScope.mamau};">
                                        ${o.SONGUOIO}
                                    </td>
                                    <td style="color:${sessionScope.mamauchu}; background-color: ${sessionScope.mamau};"><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${o.THANHTIEN}" /></td>
                                    <td style="color:${sessionScope.mamauchu}; background-color: ${sessionScope.mamau};">
                                        ${o.DIENTHOAI}
                                    </td>
                                    <td style="color:${sessionScope.mamauchu}; background-color: ${sessionScope.mamau};">
                                        ${o.GHICHU}
                                    </td>

                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab" tabindex="0">
                    
                    <c:set var="totaltuan" value="${0}"/>
                    <c:forEach items="${listDPTUAN}" var="o">
                        <c:set var="totaltuan" value="${totaltuan + o.THANHTIEN}" />



                    </c:forEach>
                    <br/>
                    Tổng đơn đặt phòng: ${listDPsumtuan}
                    <h5 style="">Tổng tiền: <fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${totaltuan}" />₫</h5>
                    <br/>
                    
                    <table class="table table-bordered">
                        <thead style="color:${sessionScope.mamauchu}; background-color: ${sessionScope.mamau};">
                            <tr>
                                <th>STT</th>
                                <th>Trạng thái</th>
                                <th>Loại phòng</th>
                                <th>Khách hàng</th>
                                <th>Giờ đến</th>
                                <th>Giờ trả</th>
                                <th>Số người</th>
                                <th>Thành tiền</th>
                                <th>Liên hệ</th>
                                <th>Ghi chú</th>
                            </tr>
                        </thead>
                        <tbody style="color:${sessionScope.mamauchu};">

                            <c:forEach items="${listDPTUAN}" var="o" varStatus="loop">
                                <tr>
                                    <td>
                                        ${loop.count}
                                    </td>
                                    <c:choose>
                                        <c:when test="${o.TRANGTHAI}">
                                            <td style="color:green">
                                                Ðã thanh toán
                                            </td>
                                        </c:when>
                                        <c:otherwise>
                                            <td>
                                                <a style="color:red; text-decoration: none" href="" data-bs-toggle="modal" data-bs-target="#aaa${o.IDDPCT}">
                                                    Nhấn để thanh toán
                                                </a>
                                                <!-- Modal -->
                                                <div class="modal fade" id="aaa${o.IDDPCT}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                    <div class="modal-dialog">
                                                        <div class="modal-content" style="color:${sessionScope.mamauchu}; background-color: ${sessionScope.mamau};">
                                                            <form asp-controller="" method="post" action="editdatphong">
                                                                <div class="modal-header">
                                                                    <h5 class="modal-title" id="exampleModalLabel">Trả phòng và thanh toán</h5>
                                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                </div>
                                                                <div class="modal-body">
                                                                    <h6>Giờ trả phòng: </h6>
                                                                    <% Date dNow2 = new Date();
                                                                        SimpleDateFormat ft2 = new SimpleDateFormat("HH:mm dd/MM/yyyy");
                                                                        out.print("<h6>" + ft2.format(dNow2) + "</h6>");%>
                                                                </div>
                                                                <input type="text" value="${o.IDDATPHONG}" name="iddatphong" style="visibility: hidden">
                                                                <input type="text" value="${o.GIAPHONG}" name="giaphong" style="visibility: hidden">
                                                                <input type="text" value="${o.SONGUOIO}" name="songuoi" style="visibility: hidden">
                                                                <input type="text" value="${o.GIODAT}" name="ngaydat" style="visibility: hidden">
                                                                <input type="text" value="${o.IDDPCT}" name="iddpct" style="visibility: hidden">
                                                                <div class="modal-footer">
                                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                                                                    <input type="submit" class="btn btn-primary" value="Đồng ý">
                                                                </div>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </td>
                                        </c:otherwise>
                                    </c:choose>

                                    <td style="color:${sessionScope.mamauchu}; background-color: ${sessionScope.mamau};">
                                        ${o.TENLOAIPHONG}
                                    </td>
                                    <td style="color:${sessionScope.mamauchu}; background-color: ${sessionScope.mamau};">
                                        ${o.HOTEN}
                                    </td>
                                    <td style="color:${sessionScope.mamauchu}; background-color: ${sessionScope.mamau};">
                                        <fmt:formatDate pattern = "HH:mm dd/MM/yyyy" value = "${o.GIODAT}" />
                                    </td>
                                    <td style="color:${sessionScope.mamauchu}; background-color: ${sessionScope.mamau};">
                                        <fmt:formatDate pattern = "HH:mm dd/MM/yyyy" value = "${o.GIOTRA}" />
                                    </td>
                                    <td style="color:${sessionScope.mamauchu}; background-color: ${sessionScope.mamau};">
                                        ${o.SONGUOIO}
                                    </td>
                                    <td style="color:${sessionScope.mamauchu}; background-color: ${sessionScope.mamau};"><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${o.THANHTIEN}" /></td>
                                    <td style="color:${sessionScope.mamauchu}; background-color: ${sessionScope.mamau};">
                                        ${o.DIENTHOAI}
                                    </td>
                                    <td style="color:${sessionScope.mamauchu}; background-color: ${sessionScope.mamau};">
                                        ${o.GHICHU}
                                    </td>

                                </tr>
                            </c:forEach>
                        </tbody>
                    </table></div>
                <div class="tab-pane fade" id="nav-disabled" role="tabpanel" aria-labelledby="nav-disabled-tab" tabindex="0">
                    
                    <c:set var="totalthang" value="${0}"/>
                    <c:forEach items="${listDPTHANG}" var="o">
                        <c:set var="totalthang" value="${totalthang + o.THANHTIEN}" />



                    </c:forEach>
                    <br/>
                    Tổng đơn đặt phòng: ${listDPsumthang}
                    <h5 style="">Tổng tiền: <fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${totalthang}" />₫</h5>
                    <br/>
                    
                    <table class="table table-bordered">
                        <thead style="color:${sessionScope.mamauchu}; background-color: ${sessionScope.mamau};">
                            <tr>
                                <th>STT</th>
                                <th>Trạng thái</th>
                                <th>Loại phòng</th>
                                <th>Khách hàng</th>
                                <th>Giờ đến</th>
                                <th>Giờ trả</th>
                                <th>Số người</th>
                                <th>Thành tiền</th>
                                <th>Liên hệ</th>
                                <th>Ghi chú</th>
                            </tr>
                        </thead>
                        <tbody style="color:${sessionScope.mamauchu};">
                            <c:forEach items="${listDPTHANG}" var="o" varStatus="loop">
                                <tr>
                                    <td>
                                        ${loop.count}
                                    </td>
                                    <c:choose>
                                        <c:when test="${o.TRANGTHAI}">
                                            <td style="color:green">
                                                Ðã thanh toán
                                            </td>
                                        </c:when>
                                        <c:otherwise>
                                            <td>
                                                <a style="color:red; text-decoration: none" href="" data-bs-toggle="modal" data-bs-target="#aaaa${o.IDDPCT}">
                                                    Nhấn để thanh toán
                                                </a>
                                                <!-- Modal -->
                                                <div class="modal fade" id="aaaa${o.IDDPCT}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                    <div class="modal-dialog">
                                                        <div class="modal-content" style="color:${sessionScope.mamauchu}; background-color: ${sessionScope.mamau};">
                                                            <form asp-controller="" method="post" action="editdatphong">
                                                                <div class="modal-header">
                                                                    <h5 class="modal-title" id="exampleModalLabel">Trả phòng và thanh toán</h5>
                                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                </div>
                                                                <div class="modal-body">
                                                                    <h6>Giờ trả phòng: </h6>
                                                                    <% Date dNow3 = new Date();
                                                                        SimpleDateFormat ft3 = new SimpleDateFormat("HH:mm dd/MM/yyyy");
                                                                        out.print("<h6>" + ft3.format(dNow3) + "</h6>");%>
                                                                </div>
                                                                <input type="text" value="${o.IDDATPHONG}" name="iddatphong" style="visibility: hidden">
                                                                <input type="text" value="${o.GIAPHONG}" name="giaphong" style="visibility: hidden">
                                                                <input type="text" value="${o.SONGUOIO}" name="songuoi" style="visibility: hidden">
                                                                <input type="text" value="${o.GIODAT}" name="ngaydat" style="visibility: hidden">
                                                                <input type="text" value="${o.IDDPCT}" name="iddpct" style="visibility: hidden">
                                                                <div class="modal-footer">
                                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                                                                    <input type="submit" class="btn btn-primary" value="Đồng ý">
                                                                </div>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </td>
                                        </c:otherwise>
                                    </c:choose>

                                    <td style="color:${sessionScope.mamauchu}; background-color: ${sessionScope.mamau};">
                                        ${o.TENLOAIPHONG}
                                    </td>
                                    <td style="color:${sessionScope.mamauchu}; background-color: ${sessionScope.mamau};">
                                        ${o.HOTEN}
                                    </td>
                                    <td style="color:${sessionScope.mamauchu}; background-color: ${sessionScope.mamau};">
                                        <fmt:formatDate pattern = "HH:mm dd/MM/yyyy" value = "${o.GIODAT}" />
                                    </td>
                                    <td style="color:${sessionScope.mamauchu}; background-color: ${sessionScope.mamau};">
                                        <fmt:formatDate pattern = "HH:mm dd/MM/yyyy" value = "${o.GIOTRA}" />
                                    </td>
                                    <td style="color:${sessionScope.mamauchu}; background-color: ${sessionScope.mamau};">
                                        ${o.SONGUOIO}
                                    </td>
                                    <td style="color:${sessionScope.mamauchu}; background-color: ${sessionScope.mamau};"><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${o.THANHTIEN}" /></td>
                                    <td style="color:${sessionScope.mamauchu}; background-color: ${sessionScope.mamau};">
                                        ${o.DIENTHOAI}
                                    </td>
                                    <td style="color:${sessionScope.mamauchu}; background-color: ${sessionScope.mamau};">
                                        ${o.GHICHU}
                                    </td>

                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>


        </div>
        <jsp:include page="Footer.jsp"></jsp:include>

        <!-- JavaScript Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>

    </body>
</html>