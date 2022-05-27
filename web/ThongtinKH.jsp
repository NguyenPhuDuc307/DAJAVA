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
        <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
        <title>VNBooking | Thông tin tài khoản</title>
        <link rel="icon" href="images/logo.svg" type="image/x-icon">
    </head>
    <body style="background-color: ${sessionScope.mamau}">
        <!--NAV-->
        <jsp:include page="Header.jsp"></jsp:include>
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


            <div style="color:${sessionScope.mamauchu}; background-color: ${sessionScope.mamau}" class="row justify-content-md-center">
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
        <jsp:include page="Footer.jsp"></jsp:include>

        <!-- JavaScript Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
    </body>
</html>
