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
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
        <title>VNBooking | Chi tiết phòng ở</title>
        <link rel="icon" href="images/logo.svg" type="image/x-icon">
    </head>
    <body style="background-color: ${sessionScope.mamau}">

        <!--NAV-->
        <jsp:include page="Header.jsp"></jsp:include>


            <div style="margin-left: 1rem; margin-right: 1rem; margin-top: 1rem">
                <div class="row">
                    <div class="col-7">
                        <h4 style="color:${sessionScope.mamauchu}">Khách sạn ${ks.TENKHACHSAN}<br />
                        <c:forEach var="temp" begin="1" end="${ks.HANG}">
                            <svg xmlns="http://www.w3.org/2000/svg" style="color:orange" width="16"
                                 height="16" fill="currentColor" class="bi bi-star-fill"
                                 viewBox="0 0 16 16">
                            <path
                                d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
                            </svg>
                        </c:forEach>(TCVN 4391: 2009)</h4>
                    <img style="height: 350px; width: 100%; object-fit:cover;" src="${ks.HINHANH}"
                         class="img-fluid rounded-start" alt="">
                    <p style="color:${sessionScope.mamauchu}"
                       style="display: -webkit-box;-webkit-box-orient: vertical;-webkit-line-clamp: 4;overflow: hidden;"
                       class="card-text">${ks.MOTA}</p>

                </div>
                <div class="col">
                    <h4 style="color:${sessionScope.mamauchu}">Địa điểm</h4>
                    <br />
                    <iframe src="${ks.GGMAP}" class="img-fluid rounded-start"
                            style="margin-top: 4px;height: 350px; width: 100%;" allowfullscreen=""
                            loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                    <p style="color:${sessionScope.mamauchu}" class="card-text">
                        <svg style="color:${sessionScope.mamauchu}" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-geo-alt-fill" viewBox="0 0 16 16">
                        <path d="M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10zm0-7a3 3 0 1 1 0-6 3 3 0 0 1 0 6z"/>
                        </svg> ${ks.DIACHI}</p>
                </div>
            </div>
        </div>

        <div style="margin-left: 1rem; margin-right: 1rem; margin-top: 1rem">
            <div class="row">
                <div class="col-7">
                    <h4 style="color:${sessionScope.mamauchu}">Loại phòng: ${loaiphong.TENLOAIPHONG}</h4>
                    <img style="height: 380px; width: 100%; object-fit:cover;" src="${loaiphong.HINHANH}" class="img-fluid rounded-start" alt="">

                </div>
                <div class="col">
                    <br/>
                    <p style="color:${sessionScope.mamauchu}" style="display: -webkit-box;-webkit-box-orient: vertical;-webkit-line-clamp: 8;overflow: hidden;" class="card-text">${loaiphong.MOTA}</p>
                    <p style="color:${sessionScope.mamauchu}" class="card-text"> ${ks.DIACHI}</p>
                    <h5 style="color: red">
                        Giá phòng: <fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${loaiphong.GIAPHONG}" />₫/ngày
                    </h5>
                    <hr style="color:${sessionScope.mamauchu}"/>
                    <h5 style="color:${sessionScope.mamauchu}">Lưu ý</h5>
                    <i style="color:${sessionScope.mamauchu}">*Nếu quý khách ở từ 2 người trở lên, số tiền phải trả thêm cho mỗi người bằng 70% so với 1 người.</i><br/>
                    <i style="color:${sessionScope.mamauchu}">*Nếu quý khách ở ít hơn 1 ngày thì số tiền bằng với số tiền ở của 1 ngày.</i>
                    <c:choose>
                        <c:when test="${sessionScope.iskh}">
                            <!-- Button trigger modal -->
                            <button style="margin-top: 1rem" type="button" class="btn btn-outline-warning" data-bs-toggle="modal" data-bs-target="#exampleModal">
                                Ðặt phòng ngay
                            </button>
                        </c:when>
                        <c:otherwise>
                            <!-- Button trigger modal -->
                            <a style="margin-top: 1rem" type="button" class="btn btn-outline-success" href="Login.jsp">
                                Ðang nhập tài khoản khách hàng để đặt phòng
                            </a>
                        </c:otherwise>
                    </c:choose>
                    <!--Modal-->
                    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-xl">
                            <div class="modal-content" style="color:${sessionScope.mamauchu}; background-color: ${sessionScope.mamau}">
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
                                            <span style="width: 200px ;color:${sessionScope.mamauchu}; background-color: ${sessionScope.mamau}" class="input-group-text">Thời gian nhận phòng</span>
                                            <input style="color:${sessionScope.mamauchu}; background-color: ${sessionScope.mamau}" id="gdDateTime" type="date" name="gdDate" class="form-control" placeholder="gdDateTime" required="Chọn ngày đến">
                                            <input style="color:${sessionScope.mamauchu}; background-color: ${sessionScope.mamau}" id="gdDateTime" type="time" name="gdTime" class="form-control" placeholder="gdDateTime" required="Chọn giờ đến">
                                        </div>

                                        <div class="input-group mb-3">
                                            <span style="width: 200px; color:${sessionScope.mamauchu}; background-color: ${sessionScope.mamau}" class="input-group-text">Thời gian trả phòng</span>
                                            <input style="color:${sessionScope.mamauchu}; background-color: ${sessionScope.mamau}" id="gtDateTime" type="date" name="gtDate" class="form-control" placeholder="gtDateTime" required="Chọn ngày đi">
                                            <input style="color:${sessionScope.mamauchu}; background-color: ${sessionScope.mamau}" id="gtDateTime" type="time" name="gtTime" class="form-control" placeholder="gtDateTime" required="Chọn ngày đi">
                                        </div>

                                        <label for="SONGUOIO" class="form-label">Số người</label>
                                        <input style="color:${sessionScope.mamauchu}; background-color: ${sessionScope.mamau}" tyle="number" class="form-control mb-3" name="SONGUOIO" value="1" id="SONGUOIO" required="Nhập số người">

                                        <label for="GHICHU" class="form-label">Lời nhắn</label>
                                        <textarea style="color:${sessionScope.mamauchu}; background-color: ${sessionScope.mamau}" class="form-control" name="GHICHU" id="GHICHU" rows="3" placeholder="Để lại lời nhắn cho chúng tôi hoặc liên hệ trực tiếp qua hotline 1800.066.051."></textarea>

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

            </div>
        </div>


        <jsp:include page="Footer.jsp"></jsp:include>
        <!-- JavaScript Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
    </body>
</html>

