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
                            <a class="nav-link dropdown-toggle nav-item dropdown" href="" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Xin chào ${sessionScope.acc.HOTEN}!
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">

                                <c:choose>
                                    <c:when test="${sessionScope.istk}">
                                        <li><a class="dropdown-item" href="thongtintaikhoan?id=${sessionScope.acc.IDTAIKHOAN}">Thông tin tài khoản</a></li>
                                        </c:when>
                                        <c:otherwise>
                                        <li><a class="dropdown-item" href="thongtinkhachhang?id=${sessionScope.acc.IDKHACHHANG}">Thông tin khách hàng</a></li>
                                        </c:otherwise>
                                    </c:choose>


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

    <!--Top khách khách sạn-->

    <div style="margin-left: 1rem; margin-right: 1rem; margin-top: 2rem;">
        <div class="row">
            <div class="col">
                <div class="list-group shadow">
                    <div href="#" class="list-group-item list-group-item-success success" aria-current="true">
                        TOP KHÁCH SẠN
                    </div>

                    <c:forEach items="${listKS}" var="k">

                        <a href="detail?id=${k.MAKHACHSAN}" class="list-group-item list-group-item-action ${tag == k.MAKHACHSAN ? "list-group-item list-group-item-info": ""}">${k.TENKHACHSAN}</a>

                    </c:forEach>

                </div>
            </div>
            <div class="col-9">
                <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
                    <div class="carousel-indicators">
                        <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                        <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
                        <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
                    </div>
                    <div class="carousel-inner shadow">
                        <div class="carousel-item active">
                            <img style="height: 400px; width: 800px; object-fit:cover;" src="https://scontent.fhan3-1.fna.fbcdn.net/v/t1.6435-9/164998508_277877857072849_2166094987078944190_n.jpg?stp=dst-jpg_p600x600&_nc_cat=102&ccb=1-6&_nc_sid=e3f864&_nc_ohc=uHJTpDUGrNEAX-sXKa7&_nc_ht=scontent.fhan3-1.fna&oh=00_AT85Q0_2Raz8aFV7heMMFW3C2cjp0QmtSU0WKiQUGo2tTA&oe=62A50E32" class="d-block w-100" alt="...">
                            <div class="carousel-caption d-none d-md-block">
                                <h5>Không gian thoáng mái, thư thái</h5>
                                <p>Chúng tôi đem đến cho bạn những trải nghiệm ở vô cùng tuyệt vời.</p>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <img style="height: 400px; width: 800px; object-fit:cover;" src="https://pix10.agoda.net/hotelImages/10312958/-1/6eeb6357e51ded6b712e8fd32b1fbda2.jpg?ca=13&ce=1&s=1024x768" class="d-block w-100" alt="...">
                            <div class="carousel-caption d-none d-md-block">
                                <h5>Đẳng cấp làm nên thương hiệu</h5>
                                <p>Nhiều khách sạn đạt chuẩn 5 sao với những dịch vụ vô cùng sang trọng.</p>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <img style="height: 400px; width: 800px; object-fit:cover;" src="https://mrvivu.com/wp-content/uploads/2019/01/87172189.jpg" class="d-block w-100" alt="...">
                            <div class="carousel-caption d-none d-md-block">
                                <h5>Vô vàn những lựu chọn</h5>
                                <p>Chúng tôi liên tục cập nhật những khách sạn mới nhất cho quý khách có nhiều lựu chọn.</p>
                            </div>
                        </div>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>
            </div>

        </div>
    </div>

    <!--Quảng cáo-->
    <div style="margin-left: 1rem; margin-right: 1rem; margin-top: 2rem;">
        <div class="row">
            <div class="col-sm-6">
                <div class="card bg-light shadow text-white">
                    <a style="color:white" href="detail?id=${listKS[0].MAKHACHSAN}">
                        <img style="height: 400px; width: 800px; object-fit:cover;" src="${listKS[0].HINHANH}" class="d-block w-100 rounded" alt="...">
                        <div class="card-img-overlay">
                            <h5 class="card-title">${listKS[0].TENKHACHSAN}</h5>
                            <c:forEach var="temp" begin="1" end="${listKS[0].HANG}">
                                <svg xmlns="http://www.w3.org/2000/svg" style="color:orange; margin-top: -1rem" width="20" height="20" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
                                <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
                                </svg>
                            </c:forEach>
                            <p class="card-text">${listKS[0].DIACHI}</p>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-sm-3">
                <div class="card bg-light shadow text-white">
                    <a style="color:white" href="detail?id=${listKS[1].MAKHACHSAN}">
                        <img style="height: 400px; width: 800px; object-fit:cover;" src="${listKS[1].HINHANH}" class="d-block w-100 rounded" alt="...">
                        <div class="card-img-overlay">
                            <h5 class="card-title">${listKS[1].TENKHACHSAN}</h5>
                            <c:forEach var="temp" begin="1" end="${listKS[1].HANG}">
                                <svg xmlns="http://www.w3.org/2000/svg" style="color:orange; margin-top: -1rem" width="20" height="20" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
                                <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
                                </svg>
                            </c:forEach>
                            <p class="card-text">${listKS[1].DIACHI}</p>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-sm-3">
                <div class="card bg-light shadow text-white">
                    <a style="color:white" href="detail?id=${listKS[2].MAKHACHSAN}">
                        <img style="height: 400px; width: 800px; object-fit:cover;" src="${listKS[2].HINHANH}" class="d-block w-100 rounded" alt="...">
                        <div class="card-img-overlay">
                            <h5 class="card-title">${listKS[2].TENKHACHSAN}</h5>
                            <c:forEach var="temp" begin="1" end="${listKS[2].HANG}">
                                <svg xmlns="http://www.w3.org/2000/svg" style="color:orange; margin-top: -1rem" width="20" height="20" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
                                <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
                                </svg>
                            </c:forEach>
                            <p class="card-text">${listKS[2].DIACHI}</p>
                        </div>
                    </a>
                </div>
            </div>

        </div>
    </div>

    <!--Danh sách khách sạn-->

    <div style="margin-left: 1rem; margin-right: 1rem; margin-top: 5rem">
        <div class="row">
            <div class="col">

            </div>
            <div class="col-9">

                <h4>Danh mục khách sạn</h4>
                <c:forEach items="${listKSorder}" var="k">

                    <div class="card mb-3 shadow" style="max-width: 100%; text-decoration: none">
                        <div class="row g-0">
                            <div class="col-md-7">
                                <img style="height: 300px; width: 100%; object-fit:cover;" src="${k.HINHANH}" class="img-fluid rounded-start" alt="">
                            </div>
                            <div class="col-md-5">
                                <div class="card-body">


                                    <a style="text-decoration: none" href="detail?id=${k.MAKHACHSAN}">
                                        <h4 class="card-title">${k.TENKHACHSAN}</h4>
                                    </a>
                                    <c:forEach var="temp" begin="1" end="${k.HANG}">
                                        <svg xmlns="http://www.w3.org/2000/svg" style="color:orange; margin-top: -1rem" width="20" height="20" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
                                        <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
                                        </svg>
                                    </c:forEach>



                                    <p style="display: -webkit-box;-webkit-box-orient: vertical;-webkit-line-clamp: 4;overflow: hidden;" class="card-text">${k.MOTA}</p>
                                    <p class="card-text"> ${k.DIACHI}</p>
                                </div>
                            </div>
                        </div>
                    </div>


                </c:forEach>
            </div>

        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>
