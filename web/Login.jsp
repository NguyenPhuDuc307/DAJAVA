<%-- 
    Document   : Login
    Created on : Apr 24, 2022, 5:34:26 PM
    Author     : ASUS
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
        <title>VNBooking | Đăng nhập</title>
        <link rel="icon" href="images/logo.svg" type="image/x-icon">
    </head>

    <body style="background-color: ${sessionScope.mamau}">
        <!--NAV-->
        <%--<jsp:include page="Header.jsp"></jsp:include>--%>

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
                                            <a style="margin-left: 1rem; color: red" class="nav-link" href="logout">Đăng xuất</a>
                                        </li>
                                    </c:if>

                                </ul>
                            </div>

                        </c:if>
                    </form>
                </div>
            </div>
        </nav>




        <div style="margin-top:1rem" class="container">
            <c:if test="${sessionScope.isxnthanhcong != null}">
                <h5 style="color:green">${sessionScope.isxnthanhcong}.</h5>
            </c:if>
            <nav>
                <div class="nav nav-tabs" id="nav-tab" role="tablist">
                    <button class="nav-link active" id="nav-home-tab" data-bs-toggle="tab" data-bs-target="#nav-home" type="button" role="tab" aria-controls="nav-home" aria-selected="true">Đăng nhập</button>
                    <button class="nav-link" id="nav-profile-tab" data-bs-toggle="tab" data-bs-target="#nav-profile" type="button" role="tab" aria-controls="nav-profile" aria-selected="false">Đăng ký</button>
                </div>
            </nav>
            <div class="tab-content" id="nav-tabContent">
                <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                    <form asp-controller="" action="login" method="post">

                        <br/>

                        <p style="color: ${sessionScope.mamauchu}">Vui lòng điền thông tin đăng nhập.</p>

                        <div class="form-floating mb-3">
                            <input id="user" type="text" name="email" class="form-control" aria-describedby="emailHelp" placeholder="name@example.com">
                            <label for="user" class="form-label">Địa chỉ Email</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input id="pass" type="password" name="password" class="form-control" data-type="password" placeholder="Password">
                            <label for="pass" class="form-label">Mật khẩu</label>
                        </div>

                        <div class="mb-3 form-check">
                            <input type="checkbox" class="form-check-input" id="check" checked>
                            <label style="color: ${sessionScope.mamauchu}" class="form-check-label" for="check">Lưu đăng nhập?</label>
                        </div>

                        <div class="group" style="margin-bottom: 5px">
                            <input type="submit" class="btn btn-primary" value="Đăng nhập">
                            <br />
                            <span style="color: ${sessionScope.mamauchu}" class="text-danger">${mess}</span>
                        </div>
                        <a style="text-decoration: none" href="http://localhost:8080/vnbooking.com/Quenmk.jsp">Bạn quên mật khẩu?</a>
                    </form>
                </div>
                <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
                    <form autocomplete="off" method="post" action="signup">
                        <br/>

                        <p style="color: ${sessionScope.mamauchu}">Vui lòng điền thông tin đăng ký.</p>                   

                        <div class="form-floating mb-3">
                            <textarea id="hoten" type="text" name="hoten" class="form-control" placeholder="Hoten"></textarea>
                            <label for="hoten" class="form-label">Họ tên</label>
                        </div>
                        <div class="form-floating mb-3">
                            <textarea id="new_dt" type="text" name="new_dienthoai" class="form-control" placeholder="Sodienthoai"></textarea>
                            <label for="new_dt" class="form-label">Số điện thoại</label>
                        </div>

                        <div class="form-floating mb-3">
                            <textarea id="suser" type="text" name="new_email" class="form-control" placeholder="Email"></textarea>
                            <label for="suser" class="form-label">Địa chỉ Email</label>
                        </div>

                        <div class="form-floating mb-3">
                            <input id="passn" type="password" name="new_password" class="form-control" placeholder="Password">
                            <label for="passn" class="form-label">Mật khẩu</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input autocomplete="off" id="n_pass" type="password" name="re_password" class="form-control" placeholder="Password">
                            <label for="n_pass" class="form-label">Xác nhận mật khẩu</label>
                        </div>

                        <div class="group">
                            <input type="submit" class="btn btn-primary" value="Đăng ký">
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- JavaScript Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
    </body>
</html>