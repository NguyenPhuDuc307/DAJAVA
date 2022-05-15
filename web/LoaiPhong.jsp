<%-- 
    Document   : LoaiPhong
    Created on : 10-May-2022, 09:24:39
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
        <h3 style="margin-top:1rem">Quản lý <b>Loại phòng</b></h3>
        <!-- Button trigger modal -->
        <button type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
            Thêm loại phòng
        </button>
        <hr/>
        <!-- Modal -->
        <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="staticBackdropLabel">Thêm khách sạn</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form action="AddLoaiPhongControl" method="post">
                        <div class="modal-body">
                            <div class="form-group">
                                <label>Tên loại phòng</label>
                                <input name="TENLOAIPHONG" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Mô tả</label>
                                <input name="MOTA" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Hình ảnh</label>
                                <textarea name="HINHANH" class="form-control" required></textarea>
                            </div>
                            <div class="form-group">
                                <label>Giá</label>
                                <textarea name="GIAPHONG" class="form-control" required></textarea>
                            </div>
                            <div class="form-group">
                                <label>Số lượng</label>
                                <textarea name="SOLUONG" class="form-control" required></textarea>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy bỏ</button>
                            <button type="submit" class="btn btn-primary">Đồng ý</button>
                        </div>
                </div>
                </form>
            </div>
        </div>
        <table style="margin-bottom:5rem" class="table table-striped table-hover">
            <thead>
                <tr>
                    <th></th>
                    <th>Tên loại phòng</th>
                    <th>Mô tả</th>
                    <th>Giá phòng</th>
                    <th>Số lượng</th>
                    <th>Trạng thái</th>
                    <th>Chỉnh sửa</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${listLoaiP}" var="o">
                    <tr>
                        <td style="width:310px">
                            <img class="img-thumbnail" style="width: 300px; height: 200px; object-fit:cover;" src="${o.HINHANH}">
                        </td>
                        <td><b>${o.TENLOAIPHONG}</b></td>
                        <td style="width:310px"><i style="display: -webkit-box;-webkit-box-orient: vertical;-webkit-line-clamp: 8;overflow: hidden;" class="card-text">${o.MOTA}</i></td>

                        <td>
                            <b style="color:red"><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${o.GIAPHONG}"/> VND/ngày</b>
                        </td>
                        <td><b>${o.SOLUONG}</b></td>
                        <td>
                            <c:choose>
                                <c:when test="${o.TRANGTHAI==true}">
                                    <p style="color:red">Hết phòng</p>
                                </c:when>    
                                <c:otherwise>
                                    <p style="color:green">Còn phòng</p>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <a href="loadLoaiPhongControl?IDLP=${o.IDLOAIPHONG}"  class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Sửa"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                                    <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                                    <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
                                    </svg></i>
                            </a>
                        </td>

                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>





    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</body>
</html>