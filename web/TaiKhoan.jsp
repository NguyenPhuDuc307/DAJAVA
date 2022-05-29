<%-- 
    Document   : TaiKhoan
    Created on : 10-May-2022, 13:17:24
    Author     : bigbo
--%>
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
        <title>VNBooking | Quản lý tài khoản</title>
        <link rel="icon" href="images/logo.svg" type="image/x-icon">

    </head>
    <body style="color: ${sessionScope.mamauchu}; background-color: ${sessionScope.mamau}">
        <!--NAV-->
        <jsp:include page="Header.jsp"></jsp:include>
            <div class="container">
                <h4>Quản lý <b>Tài khoản</b></h4>
                <!-- Button trigger modal -->
                <button style="margin-bottom: 1rem" type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
                    Thêm nhân viên
                </button>
                <!-- Modal -->
                <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content" style="color: ${sessionScope.mamauchu}; background-color: ${sessionScope.mamau}">
                        <div class="modal-header">
                            <h5 class="modal-title" id="staticBackdropLabel">Thêm nhân viên</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <form action="AddTaiKhoan" method="post">
                            <div class="modal-body">
                                <div class="form-floating mb-3">
                                    <select class="form-select" id="inputGroupSelect01" name="MAKHACHSAN" required>
                                        <option selected>Chọn khách sạn</option>

                                        <c:forEach items="${listKSorder}" var="k">
                                            <option value="${k.MAKHACHSAN}">${k.TENKHACHSAN}</option>
                                        </c:forEach>
                                    </select>
                                    <label for="inputGroupSelect01">Nhân viên khách sạn</label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input id="a2" placeholder="Họ tên" style="color: ${sessionScope.mamauchu}; background-color: ${sessionScope.mamau}" name="HOTEN" type="text" class="form-control" required>
                                    <label for="a2">Họ tên</label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input id="a3" placeholder="Số điện thoại" style="color: ${sessionScope.mamauchu}; background-color: ${sessionScope.mamau}" name="DIENTHOAI" type="text" class="form-control" required>
                                    <label for="a3">Số điện thoại</label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input id="a4" placeholder="Địa chỉ email" style="color: ${sessionScope.mamauchu}; background-color: ${sessionScope.mamau}" name="EMAIL" type="text" class="form-control" required>
                                    <label for="a4">Địa chỉ email</label>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy bỏ</button>
                                <button type="submit" class="btn btn-primary">Đồng ý</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <table class="table table-bordered" style="color: ${sessionScope.mamauchu}; background-color: ${sessionScope.mamau}">
                <thead>
                    <tr>
                        <th>Khách sạn</th>
                        <th>Họ tên</th>
                        <th>Điện thoại</th>
                        <th>Email</th>
                        <th>Chỉnh sửa</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${listTK}" var="o">
                        <tr>
                            <td>${o.TENKHACHSAN}</td>
                            <td data-bs-toggle="modal" data-bs-target="#exam${o.IDTAIKHOAN}pleModal">${o.HOTEN}</td>
                            <!-- Modal -->
                    <div class="modal fade" id="exam${o.IDTAIKHOAN}pleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Hình ảnh</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    
                                    <c:choose>
                                        <c:when test="${o.HINHANH == null}">
                                            <img data-bs-toggle="modal" data-bs-target="#staticBackdropp" src="https://superawesomevectors.com/wp-content/uploads/2017/06/camera-flat-style-vector-icon-800x566.jpg" class="img-thumbnail shadow" alt="...">
                                        </c:when>
                                        <c:otherwise>
                                            <img data-bs-toggle="modal" data-bs-target="#staticBackdropp" src="${o.HINHANH}" class="img-thumbnail shadow" alt="...">
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                <div class="modal-footer">
                                </div>
                            </div>
                        </div>
                    </div>
                    <td>${o.DIENTHOAI}</td>
                    <td>${o.EMAIL}</td>
                    <td>
                        <a href="loadTaiKhoanControl?IDTK=${o.IDTAIKHOAN}"  class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Sửa"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                                <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                                <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
                                </svg></i></a>


                        <a class="delete" data-bs-toggle="modal" data-bs-target="#a${o.IDTAIKHOAN}a"><i class="material-icons" data-toggle="tooltip" title="Xóa"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-x-fill" viewBox="0 0 16 16">
                                <path fill-rule="evenodd" d="M1 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm6.146-2.854a.5.5 0 0 1 .708 0L14 6.293l1.146-1.147a.5.5 0 0 1 .708.708L14.707 7l1.147 1.146a.5.5 0 0 1-.708.708L14 7.707l-1.146 1.147a.5.5 0 0 1-.708-.708L13.293 7l-1.147-1.146a.5.5 0 0 1 0-.708z"/>
                                </svg></i></a>

                        <!-- Modal -->
                        <div class="modal fade" id="a${o.IDTAIKHOAN}a" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Bạn có chắc chắn muốn xóa tài khoản ${o.HOTEN}?</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-footer">
                                        <a class="btn btn-primary" href="DeleteTaiKhoanControl?IDTK=${o.IDTAIKHOAN}">Xác nhận
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>


                    </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <jsp:include page="Footer.jsp"></jsp:include>
        <script src="js/manager.js" type="text/javascript"></script>
        <!-- JavaScript Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
    </body>
</html>