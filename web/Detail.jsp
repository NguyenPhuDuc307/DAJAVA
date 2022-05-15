<%@page import="java.text.DecimalFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    </head>
    <body>

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

    <!--BANNER-->
    <div>
        <div style="position: relative; width: 100%; height: 0; padding-top: 16.6667%;
             padding-bottom: 48px; box-shadow: 0 2px 8px 0 rgba(63,69,81,0.16); margin-bottom: 0.9em; overflow: hidden;
             border-radius: 0px; will-change: transform;">
            <iframe loading="lazy" style="position: absolute; width: 100%; height: 100%; top: 0; left: 0; border: none; padding: 0;margin: 0;"
                    src="https:&#x2F;&#x2F;www.canva.com&#x2F;design&#x2F;DAE-ZlpJbms&#x2F;view?embed" allowfullscreen="allowfullscreen" allow="fullscreen">
            </iframe>
        </div>

    </div>

    <!--    Quảng cáo-->

    <div style="margin-left: 1rem; margin-right: 1rem; margin-top: 2rem;">
        <div class="row">
            <div class="col-6">
                <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
                    <div class="carousel-indicators">
                        <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                        <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
                        <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
                    </div>
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img style="height: 400px; width: 800px; object-fit:cover;" src="https://media-cdn.tripadvisor.com/media/photo-m/1280/19/5e/39/28/khach-s-n-elizabeth.jpg" class="d-block w-100" alt="...">
                            <div class="carousel-caption d-none d-md-block">
                                <h5>First slide label</h5>
                                <p>Some representative placeholder content for the first slide.</p>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <img style="height: 400px; width: 800px; object-fit:cover;" src="https://cafebiz.cafebizcdn.vn/162123310254002176/2020/7/30/10237632531677338065902776227669564146919983n-159195314299898026978-15960821099871068256115.png" class="d-block w-100" alt="...">
                            <div class="carousel-caption d-none d-md-block">
                                <h5>Second slide label</h5>
                                <p>Some representative placeholder content for the second slide.</p>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <img style="height: 400px; width: 800px; object-fit:cover;" src="https://hoanghaihotel.vn/Data/images/tintuc/10032021170917-gioi-thieu-ve-khach-san-hoang-hai.jpg" class="d-block w-100" alt="...">
                            <div class="carousel-caption d-none d-md-block">
                                <h5>Third slide label</h5>
                                <p>Some representative placeholder content for the third slide.</p>
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
            <div class="col-sm-3">
                <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
                    <div class="carousel-indicators">
                        <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                        <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
                        <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
                    </div>
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img style="height: 400px; width: 800px; object-fit:cover;" src="https://media-cdn.tripadvisor.com/media/photo-m/1280/19/5e/39/28/khach-s-n-elizabeth.jpg" class="d-block w-100" alt="...">
                            <div class="carousel-caption d-none d-md-block">
                                <h5>First slide label</h5>
                                <p>Some representative placeholder content for the first slide.</p>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <img style="height: 400px; width: 800px; object-fit:cover;" src="https://cafebiz.cafebizcdn.vn/162123310254002176/2020/7/30/10237632531677338065902776227669564146919983n-159195314299898026978-15960821099871068256115.png" class="d-block w-100" alt="...">
                            <div class="carousel-caption d-none d-md-block">
                                <h5>Second slide label</h5>
                                <p>Some representative placeholder content for the second slide.</p>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <img style="height: 400px; width: 800px; object-fit:cover;" src="https://hoanghaihotel.vn/Data/images/tintuc/10032021170917-gioi-thieu-ve-khach-san-hoang-hai.jpg" class="d-block w-100" alt="...">
                            <div class="carousel-caption d-none d-md-block">
                                <h5>Third slide label</h5>
                                <p>Some representative placeholder content for the third slide.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-3">
                <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
                    <div class="carousel-indicators">
                        <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                        <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
                        <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
                    </div>
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img style="height: 400px; width: 800px; object-fit:cover;" src="https://media-cdn.tripadvisor.com/media/photo-m/1280/19/5e/39/28/khach-s-n-elizabeth.jpg" class="d-block w-100" alt="...">
                            <div class="carousel-caption d-none d-md-block">
                                <h5>First slide label</h5>
                                <p>Some representative placeholder content for the first slide.</p>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <img style="height: 400px; width: 800px; object-fit:cover;" src="https://cafebiz.cafebizcdn.vn/162123310254002176/2020/7/30/10237632531677338065902776227669564146919983n-159195314299898026978-15960821099871068256115.png" class="d-block w-100" alt="...">
                        </div>
                        <div class="carousel-item">
                            <img style="height: 400px; width: 800px; object-fit:cover;" src="https://hoanghaihotel.vn/Data/images/tintuc/10032021170917-gioi-thieu-ve-khach-san-hoang-hai.jpg" class="d-block w-100" alt="...">
                            <div class="carousel-caption d-none d-md-block">
                                <h5>Third slide label</h5>
                                <p>Some representative placeholder content for the third slide.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <!--Detail Khách sạn-->

    <div style="margin-left: 1rem; margin-right: 1rem; margin-top: 10rem">
        <div class="row">
            <div class="col">

            </div>
            <div class="col-9">
                <h4>Khách sạn </h4>
                <div class="card mb-3" style="max-width: 100%;">
                    <div class="row g-0">
                        <div class="col-md-7">
                            <img style="height: 300px; width: 100%; object-fit:cover;" src="${ks.HINHANH}" class="img-fluid rounded-start" alt="">
                        </div>
                        <div class="col-md-5">
                            <div class="card-body">
                                <h4 class="card-title">${ks.TENKHACHSAN}</h4>
                                <c:forEach var="temp" begin="1" end="${ks.HANG}">
                                    <svg xmlns="http://www.w3.org/2000/svg" style="color:orange" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
                                    <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
                                    </svg>
                                </c:forEach>



                                <p style="display: -webkit-box;-webkit-box-orient: vertical;-webkit-line-clamp: 4;overflow: hidden;" class="card-text">${ks.MOTA}</p>
                                <p class="card-text"> ${ks.DIACHI}</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <!--Danh sách phòng-->

    <div style="margin-left: 1rem; margin-right: 1rem; margin-top: 10rem">
        <div class="row">
            <div class="col">

            </div>
            <div class="col-9">
                <h4>Danh mục phòng ở</h4>
                <c:forEach items="${detail}" var="k">

                    <div class="card mb-3" style="max-width: 100%;">
                        <div class="row g-0">
                            <div class="col-md-7">
                                <img style="height: 300px; width: 100%; object-fit:cover;" src="${k.HINHANH}" class="img-fluid rounded-start" alt="">
                            </div>
                            <div class="col-md-5">
                                <div class="card-body">
                                    <a style="text-decoration: none" href="datphong?id=${k.IDLOAIPHONG}">
                                        <h4 class="card-title">${k.TENLOAIPHONG}</h4>
                                    </a>
                                    <p style="display: -webkit-box;-webkit-box-orient: vertical;-webkit-line-clamp: 8;overflow: hidden;" class="card-text">${k.MOTA}</p>

                                    <h6 style="color: red">Giá phòng: <fmt:formatNumber type = "number" 
                                                      maxFractionDigits = "3" value = "${k.GIAPHONG}" /> VND
                                    </h6>
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
