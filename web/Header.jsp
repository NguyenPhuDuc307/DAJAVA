<%-- 
    Document   : Header
    Created on : May 19, 2022, 9:09:55 AM
    Author     : nguye
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- CSS only -->
        <!--<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">-->
    </head>
    <body>
        <!--NAV VÀ PHÂN QUYỀN-->
        <nav class="navbar navbar-expand-lg">
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
                                <a style="color:  ${sessionScope.mamauchu}" class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    Quản lý&ensp;<span class="rounded-pill badge bg-danger">${sessionScope.countQL}</span>
                                </a>
                                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">

                                    <c:if test="${sessionScope.acc.ADMIN == 1 }" >
                                        <li>
                                            <a style="color:  ${sessionScope.mamauchu}; background-color: ${sessionScope.mamau}" class="dropdown-item" href="TaiKhoanControl">Quản lý tài khoản</a>
                                        </li>

                                        <li>
                                            <a class="dropdown-item" href="KhachSanControl">Quản lý khách sạn</a>
                                        </li>
                                    </c:if>


                                    <c:if test="${sessionScope.acc.ADMIN == 0 }" >
                                        <li>
                                            <a class="dropdown-item" href="LoaiPhongControl">Quản lý phòng khách sạn</a>
                                        </li>
                                        <li>
                                            <a class="dropdown-item" href="quanlydatphong">Quản lý đặt phòng <span class="rounded-pill badge bg-danger">${sessionScope.countQL}</span></a>
                                        </li>
                                    </c:if>
                                </ul>
                            </li>
                        </c:if>
                        <form asp-controller="" method="post" action="giaodien">


                            <c:choose>
                                <c:when test="${sessionScope.mamau ge '#ffffff'}">
                                    <button class=" btn" type="submit" style="text-decoration: none" href="giaodien">
                                        <svg style="color:${sessionScope.mamauchu}" xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-moon-stars-fill" viewBox="0 0 16 16">
                                        <path d="M6 .278a.768.768 0 0 1 .08.858 7.208 7.208 0 0 0-.878 3.46c0 4.021 3.278 7.277 7.318 7.277.527 0 1.04-.055 1.533-.16a.787.787 0 0 1 .81.316.733.733 0 0 1-.031.893A8.349 8.349 0 0 1 8.344 16C3.734 16 0 12.286 0 7.71 0 4.266 2.114 1.312 5.124.06A.752.752 0 0 1 6 .278z"/>
                                        <path d="M10.794 3.148a.217.217 0 0 1 .412 0l.387 1.162c.173.518.579.924 1.097 1.097l1.162.387a.217.217 0 0 1 0 .412l-1.162.387a1.734 1.734 0 0 0-1.097 1.097l-.387 1.162a.217.217 0 0 1-.412 0l-.387-1.162A1.734 1.734 0 0 0 9.31 6.593l-1.162-.387a.217.217 0 0 1 0-.412l1.162-.387a1.734 1.734 0 0 0 1.097-1.097l.387-1.162zM13.863.099a.145.145 0 0 1 .274 0l.258.774c.115.346.386.617.732.732l.774.258a.145.145 0 0 1 0 .274l-.774.258a1.156 1.156 0 0 0-.732.732l-.258.774a.145.145 0 0 1-.274 0l-.258-.774a1.156 1.156 0 0 0-.732-.732l-.774-.258a.145.145 0 0 1 0-.274l.774-.258c.346-.115.617-.386.732-.732L13.863.1z"/>
                                        </svg>
                                    </button>
                                </c:when>
                                <c:when test="${sessionScope.mamau ge '#002233'}">
                                    <button class=" btn" type="submit" style="text-decoration: none" href="giaodien">
                                        <svg style="color:${sessionScope.mamauchu}" xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-brightness-high-fill" viewBox="0 0 16 16">
                                        <path d="M12 8a4 4 0 1 1-8 0 4 4 0 0 1 8 0zM8 0a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0v-2A.5.5 0 0 1 8 0zm0 13a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0v-2A.5.5 0 0 1 8 13zm8-5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2a.5.5 0 0 1 .5.5zM3 8a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2A.5.5 0 0 1 3 8zm10.657-5.657a.5.5 0 0 1 0 .707l-1.414 1.415a.5.5 0 1 1-.707-.708l1.414-1.414a.5.5 0 0 1 .707 0zm-9.193 9.193a.5.5 0 0 1 0 .707L3.05 13.657a.5.5 0 0 1-.707-.707l1.414-1.414a.5.5 0 0 1 .707 0zm9.193 2.121a.5.5 0 0 1-.707 0l-1.414-1.414a.5.5 0 0 1 .707-.707l1.414 1.414a.5.5 0 0 1 0 .707zM4.464 4.465a.5.5 0 0 1-.707 0L2.343 3.05a.5.5 0 1 1 .707-.707l1.414 1.414a.5.5 0 0 1 0 .708z"/>
                                        </svg>
                                    </button>
                                </c:when>
                                <c:otherwise>
                                    <button class=" btn" type="submit" style="text-decoration: none" href="giaodien">
                                        <svg style="color:${sessionScope.mamauchu}" xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-moon-stars-fill" viewBox="0 0 16 16">
                                        <path d="M6 .278a.768.768 0 0 1 .08.858 7.208 7.208 0 0 0-.878 3.46c0 4.021 3.278 7.277 7.318 7.277.527 0 1.04-.055 1.533-.16a.787.787 0 0 1 .81.316.733.733 0 0 1-.031.893A8.349 8.349 0 0 1 8.344 16C3.734 16 0 12.286 0 7.71 0 4.266 2.114 1.312 5.124.06A.752.752 0 0 1 6 .278z"/>
                                        <path d="M10.794 3.148a.217.217 0 0 1 .412 0l.387 1.162c.173.518.579.924 1.097 1.097l1.162.387a.217.217 0 0 1 0 .412l-1.162.387a1.734 1.734 0 0 0-1.097 1.097l-.387 1.162a.217.217 0 0 1-.412 0l-.387-1.162A1.734 1.734 0 0 0 9.31 6.593l-1.162-.387a.217.217 0 0 1 0-.412l1.162-.387a1.734 1.734 0 0 0 1.097-1.097l.387-1.162zM13.863.099a.145.145 0 0 1 .274 0l.258.774c.115.346.386.617.732.732l.774.258a.145.145 0 0 1 0 .274l-.774.258a1.156 1.156 0 0 0-.732.732l-.258.774a.145.145 0 0 1-.274 0l-.258-.774a1.156 1.156 0 0 0-.732-.732l-.774-.258a.145.145 0 0 1 0-.274l.774-.258c.346-.115.617-.386.732-.732L13.863.1z"/>
                                        </svg>
                                    </button>
                                </c:otherwise>
                            </c:choose>
                            <input type="text" value="${sessionScope.mamau}" name="mamau" style="visibility: hidden">
                        </form>


                    </ul>

                    <form class="d-flex">
                        <c:if test="${sessionScope.acc == null}" >
                            <div class="nav-item">
                                <a style="color:  ${sessionScope.mamauchu}" class="nav-link" href="Login.jsp">Đăng nhập</a>
                            </div>
                        </c:if>
                        <c:if test="${sessionScope.acc != null}" >
                            <div class="nav-item dropdown">
                                <a style="color:  ${sessionScope.mamauchu}" class="nav-link dropdown-toggle nav-item dropdown" href="" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    Xin chào ${sessionScope.acc.HOTEN}!&ensp;<span class="badge bg-danger rounded-pill">${sessionScope.count}</span>
                                </a>
                                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">

                                    <c:choose>
                                        <c:when test="${sessionScope.istk}">
                                            <li><a class="dropdown-item" href="thongtintaikhoan?id=${sessionScope.acc.IDTAIKHOAN}">Thông tin tài khoản</a></li>
                                            </c:when>
                                            <c:otherwise>
                                            <li><a class="dropdown-item" href="thongtinkhachhang?id=${sessionScope.acc.IDKHACHHANG}">Thông tin khách hàng</a></li>
                                            <li><a class="dropdown-item" href="lichsudatphong?id=${sessionScope.acc.IDKHACHHANG}">Danh sách đặt phòng <span class="badge rounded-pill bg-danger">${sessionScope.count}</span></a></li>
                                                </c:otherwise>
                                            </c:choose>


                                    <li><hr class="dropdown-divider"></li>

                                    <c:if test="${sessionScope.acc != null}" >              
                                        <li class="nav-item">
                                            <a style="color: red" class="nav-link" href="logout">Đăng xuất</a>
                                        </li>
                                    </c:if>

                                </ul>
                            </div>

                        </c:if>
                    </form>
                </div>
            </div>
        </nav>
        <div class="position-absolute top-0 start-50 translate-middle-x">
            <form asp-controller="" method="post" action="timkiem" style="width:760px; margin-top: 10px" class="container-fluid col-md-6">
                <div class="input-group">
                    <input style="background-color: ${sessionScope.mamau}; color:  ${sessionScope.mamauchu}" name="tukhoa" type="text" class="form-control" placeholder="Nhập vào tên khách sạn hoặc tên phòng mà bạn muốn tìm" aria-label="Username" aria-describedby="basic-addon1">
                    <button type="submit" style="width:42px" class="input-group-text" id="basic-addon1">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                        <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                        </svg>
                    </button>
                </div>
                <div>
                    <c:if test="${sessionScope.soluongks !=null}">
                        <p style="color:  ${sessionScope.mamauchu}">Hiển thị <b>${sessionScope.soluongks}</b> khách sạn/ loại phòng <i>${sessionScope.tukhoa}</i></p>
                    </c:if>
                </div>
            </form>
        </div>
    </body>
</html>
