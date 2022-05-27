<%@page import="java.text.DecimalFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
        <title>VNBooking | Khách sạn</title>
        <link rel="icon" href="images/logo.svg" type="image/x-icon">
    </head>
    <body style="background-color: ${sessionScope.mamau}">

        <!--NAV-->
        <jsp:include page="Header.jsp"></jsp:include>

            <!--Top khách khách sạn-->

            <div style="margin-left: 1rem; margin-right: 1rem; margin-top: 2rem">
                <div class="row">
                    <div class="col">
                        <div class="list-group shadow border-1">
                            <div style="background-color: ${sessionScope.mamau}; color: ${sessionScope.mamauchu}; border-color: ${sessionScope.mamauchu}" href="" class="list-group-item list-group-item-success success" aria-current="true">
                            <b>KHÁCH SẠN HÀNG ĐẦU</b>
                        </div>

                        <c:forEach items="${listKS}" var="k">

                            <a style="background-color: ${sessionScope.mamau}; color: ${sessionScope.mamauchu}; border-color: ${sessionScope.mamauchu}" href="detail?id=${k.MAKHACHSAN}" class="list-group-item list-group-item-action ${tag == k.MAKHACHSAN ? "list-group-item list-group-item-info": ""}">${k.TENKHACHSAN}</a>

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
                                <img style="height: 370px; width: 800px; object-fit:cover;" src="https://scontent.fhan3-1.fna.fbcdn.net/v/t1.6435-9/164998508_277877857072849_2166094987078944190_n.jpg?stp=dst-jpg_p600x600&_nc_cat=102&ccb=1-6&_nc_sid=e3f864&_nc_ohc=uHJTpDUGrNEAX-sXKa7&_nc_ht=scontent.fhan3-1.fna&oh=00_AT85Q0_2Raz8aFV7heMMFW3C2cjp0QmtSU0WKiQUGo2tTA&oe=62A50E32" class="d-block w-100 rounded" alt="...">
                                <div class="carousel-caption d-none d-md-block">
                                    <h5 style="text-shadow: 2px 2px 4px #000000;">Không gian thoáng mái, thư thái</h5>
                                    <p style="text-shadow: 2px 2px 4px #000000;">Chúng tôi đem đến cho bạn những trải nghiệm ở vô cùng tuyệt vời.</p>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <img style="height: 370px; width: 800px; object-fit:cover;" src="https://pix10.agoda.net/hotelImages/10312958/-1/6eeb6357e51ded6b712e8fd32b1fbda2.jpg?ca=13&ce=1&s=1024x768" class="d-block w-100 rounded" alt="...">
                                <div class="carousel-caption d-none d-md-block">
                                    <h5 style="text-shadow: 2px 2px 4px #000000;">Đẳng cấp làm nên thương hiệu</h5>
                                    <p style="text-shadow: 2px 2px 4px #000000;">Nhiều khách sạn đạt chuẩn 5 sao với những dịch vụ vô cùng sang trọng.</p>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <img style="height: 370px; width: 800px; object-fit:cover;" src="https://mrvivu.com/wp-content/uploads/2019/01/87172189.jpg" class="d-block w-100 rounded" alt="...">
                                <div class="carousel-caption d-none d-md-block">
                                    <h5 style="text-shadow: 2px 2px 4px #000000;">Vô vàn những lựa chọn</h5>
                                    <p style="text-shadow: 2px 2px 4px #000000;">Chúng tôi liên tục cập nhật những khách sạn mới nhất cho quý khách có nhiều lựa chọn.</p>
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

        <!--Detail Khách sạn-->

        <div style="margin-left: 1rem; margin-right: 1rem; margin-top: 5rem">
            <div class="row">
                <div class="col-7">
                    <h4 style="color:${sessionScope.mamauchu}">Khách sạn ${ks.TENKHACHSAN}
                        <br/>
                        <c:forEach var="temp" begin="1" end="${ks.HANG}">
                            <svg xmlns="http://www.w3.org/2000/svg" style="color:orange" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
                            <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
                            </svg>
                        </c:forEach>(TCVN 4391: 2009)
                    </h4>
                    <img style="height: 350px; width: 100%; object-fit:cover;" src="${ks.HINHANH}" class="img-fluid rounded-start" alt="">
                    <p style="color:${sessionScope.mamauchu}" style="display: -webkit-box;-webkit-box-orient: vertical;-webkit-line-clamp: 4;overflow: hidden;" class="card-text">${ks.MOTA}</p>

                </div>
                <div class="col">
                    <h4 style="color:${sessionScope.mamauchu}">Địa điểm</h4>
                    <br/>
                    <iframe src="${ks.GGMAP}" class="img-fluid rounded-start" style="margin-top: 4px;height: 350px; width: 100%;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                    <p style="color:${sessionScope.mamauchu}" class="card-text"><svg style="color:${sessionScope.mamauchu}" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-geo-alt-fill" viewBox="0 0 16 16">
                        <path d="M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10zm0-7a3 3 0 1 1 0-6 3 3 0 0 1 0 6z"/>
                        </svg> ${ks.DIACHI}</p>
                </div>

            </div>
        </div>

        <!--Danh sách phòng-->

        <div style="margin-left: 1rem; margin-right: 1rem; margin-top: 3rem">
            <div class="row">
                <div class="col">
                    <h4 style="color:${sessionScope.mamauchu}">Danh mục phòng ở</h4>

                    <c:if test="${detail.size() < 1}">
                        <p style="color:${sessionScope.mamauchu}" class="card-text">Hiện chưa có phòng ở</p>
                    </c:if>

                    <c:forEach items="${detail}" var="k">

                        <div class="card mb-3" style="max-width: 100%; background-color: ${sessionScope.mamau}; color: ${sessionScope.mamauchu};border-color: ${sessionScope.mamauchu};">
                            <div class="row g-0">
                                <div class="col-md-7">
                                    <img style="height: 300px; width: 100%; object-fit:cover;" src="${k.HINHANH}" class="img-fluid rounded-start" alt="">
                                </div>
                                <div class="col-md-5">
                                    <div class="card-body">
                                        <a style="text-decoration: none" href="datphong?id=${k.IDLOAIPHONG}">
                                            <h4 class="card-title">${k.TENLOAIPHONG} - Khách sạn ${ks.TENKHACHSAN}</h4>
                                        </a>
                                        <p style="display: -webkit-box;-webkit-box-orient: vertical;-webkit-line-clamp: 8;overflow: hidden;" class="card-text">${k.MOTA}</p>

                                        <h6 style="color: red">Giá phòng: <fmt:formatNumber type = "number"  maxFractionDigits = "3" value = "${k.GIAPHONG}" />₫/ngày</h6>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </c:forEach>
                </div>

            </div>
        </div>
        <jsp:include page="Footer.jsp"></jsp:include>
        <!-- JavaScript Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
    </body>
</html>
