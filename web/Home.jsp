<%-- 
    Document   : Home
    Created on : Apr 14, 2022, 9:17:28 PM
    Author     : nguye
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>VNBooking | Trang chủ</title>
        <link rel="icon" href="images/logo.svg" type="image/x-icon">
        <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
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

        <!--Quảng cáo-->
        <div style="margin-left: 1rem; margin-right: 1rem; margin-top: 2rem;">
            <div class="row">
                <div class="col-sm-6">
                    <div class="card bg-light shadow text-white">
                        <a style="color:white" href="detail?id=${listKS[0].MAKHACHSAN}">
                            <img style="height: 400px; width: 800px; object-fit:cover;" src="${listKS[0].HINHANH}" class="d-block w-100 rounded" alt="...">
                            <div class="card-img-overlay">
                                <h5 style="text-shadow: 2px 2px 4px #000000;" class="card-title">${listKS[0].TENKHACHSAN}</h5>
                                <c:forEach var="temp" begin="1" end="${listKS[0].HANG}">
                                    <svg xmlns="http://www.w3.org/2000/svg" style="color:orange; margin-top: -1rem" width="20" height="20" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
                                    <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
                                    </svg>
                                </c:forEach>
                                <p style="text-shadow: 2px 2px 4px #000000;" class="card-text">${listKS[0].DIACHI}</p>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="card bg-light shadow text-white">
                        <a style="color:white" href="detail?id=${listKS[1].MAKHACHSAN}">
                            <img style="height: 400px; width: 800px; object-fit:cover;" src="${listKS[1].HINHANH}" class="d-block w-100 rounded" alt="...">
                            <div class="card-img-overlay">
                                <h5 style="text-shadow: 2px 2px 4px #000000;" class="card-title">${listKS[1].TENKHACHSAN}</h5>
                                <c:forEach var="temp" begin="1" end="${listKS[1].HANG}">
                                    <svg xmlns="http://www.w3.org/2000/svg" style="color:orange; margin-top: -1rem" width="20" height="20" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
                                    <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
                                    </svg>
                                </c:forEach>
                                <p style="text-shadow: 2px 2px 4px #000000;" class="card-text">${listKS[1].DIACHI}</p>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="card bg-light shadow text-white">
                        <a style="color:white" href="detail?id=${listKS[2].MAKHACHSAN}">
                            <img style="height: 400px; width: 800px; object-fit:cover;" src="${listKS[2].HINHANH}" class="d-block w-100 rounded" alt="...">
                            <div class="card-img-overlay">
                                <h5 style="text-shadow: 2px 2px 4px #000000;" class="card-title">${listKS[2].TENKHACHSAN}</h5>
                                <c:forEach var="temp" begin="1" end="${listKS[2].HANG}">
                                    <svg xmlns="http://www.w3.org/2000/svg" style="color:orange; margin-top: -1rem" width="20" height="20" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
                                    <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
                                    </svg>
                                </c:forEach>
                                <p style="text-shadow: 2px 2px 4px #000000;" class="card-text">${listKS[2].DIACHI}</p>
                            </div>
                        </a>
                    </div>
                </div>

            </div>
        </div>

        <!--Danh sách khách sạn-->

        <div style="margin-left: 1rem; margin-right: 1rem; margin-top: 3rem">
            <div class="row">
                <div class="col-7">
                    <h5 style="color:${sessionScope.mamauchu}">Danh mục khách sạn</h5>
                    <p style="color:${sessionScope.mamauchu}">Lọc theo hạng</p>
                    <div style="margin-bottom: 81px">
                        <svg style="color:${sessionScope.mamauchu}" xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-funnel-fill" viewBox="0 0 16 16">
                        <path d="M1.5 1.5A.5.5 0 0 1 2 1h12a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-.128.334L10 8.692V13.5a.5.5 0 0 1-.342.474l-3 1A.5.5 0 0 1 6 14.5V8.692L1.628 3.834A.5.5 0 0 1 1.5 3.5v-2z"/>
                        </svg>
                        <a style="color:orange; margin: 1rem" href="timkiem?sao=1"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
                            <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
                            </svg></a>
                        <a style="color:orange; margin: 1rem" href="timkiem?sao=2"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
                            <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
                            </svg><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
                            <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
                            </svg></a>
                        <a style="color:orange; margin: 1rem" href="timkiem?sao=3"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
                            <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
                            </svg><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
                            <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
                            </svg><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
                            <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
                            </svg></a>
                        <a style="color:orange; margin: 1rem" href="timkiem?sao=4"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
                            <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
                            </svg><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
                            <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
                            </svg><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
                            <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
                            </svg><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
                            <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
                            </svg></a>
                        <a style="color:orange; margin: 1rem" href="timkiem?sao=5"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
                            <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
                            </svg><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
                            <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
                            </svg><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
                            <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
                            </svg><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
                            <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
                            </svg><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
                            <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
                            </svg></a>
                    </div>

                    <hr style="color:${sessionScope.mamauchu}"/>
                    <c:forEach items="${listKSorder}" var="k">

                        <div class="card mb-3 shadow" style="max-width: 100%; text-decoration: none; background-color: ${sessionScope.mamau}; color: ${sessionScope.mamauchu}; border-color: ${sessionScope.mamauchu};">
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
                    <nav aria-label="Page navigation example">
                        <ul class="pagination">

                            <c:choose>
                                <c:when test="${sessionScope.truocdoKS != 0}">
                                    <li class="page-item"><a class="page-link" href="home?idKS=${sessionScope.truocdoKS}">Trước đó</a></li>
                                    </c:when>
                                    <c:otherwise>
                                    <li class="page-item disabled"><a class="page-link" href="home?idKS=${sessionScope.truocdoKS}">Trước đó</a></li>
                                    </c:otherwise>
                                </c:choose>

                            <c:forEach begin="1" end="${countKS}" var="i">
                                <c:choose>
                                    <c:when test="${sessionScope.ketiepKS == i+1}">

                                        <li class="page-item active"><span class="page-link">${i}</span></li>
                                        </c:when>
                                        <c:otherwise>
                                        <li class="page-item"><a class="page-link active" href="home?idKS=${i}">${i}</a></li>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>

                            <c:choose>
                                <c:when test="${sessionScope.ketiepKS > countKS}">
                                    <li class="page-item disabled"><a class="page-link" href="home?idKS=${sessionScope.ketiepKS}">Kế tiếp</a></li>
                                    </c:when>
                                    <c:otherwise>
                                    <li class="page-item"><a class="page-link" href="home?idKS=${sessionScope.ketiepKS}">Kế tiếp</a></li>
                                    </c:otherwise>
                                </c:choose>
                        </ul>
                    </nav>
                    <div>
                        <i style="color:${sessionScope.mamauchu}">
                            Hiển thị ${listKSorder.size()} trong tổng số ${countAllKS} khách sạn
                        </i>
                    </div>
                </div>
                <div class="col">
                    <h5 style="color:${sessionScope.mamauchu}">Danh mục phòng ở</h5>
                    <div class="wrapper">
                        <form method="post" action="timkiem" style="color:${sessionScope.mamauchu}; background-color: ${sessionScope.mamau}">
                            <div class="price-input">
                                <div class="row g-3" style="color:${sessionScope.mamauchu}">
                                    <div class="col-md-1">
                                        <svg style="color:${sessionScope.mamauchu}; margin-top: 40px" xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-funnel-fill" viewBox="0 0 16 16">
                                        <path d="M1.5 1.5A.5.5 0 0 1 2 1h12a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-.128.334L10 8.692V13.5a.5.5 0 0 1-.342.474l-3 1A.5.5 0 0 1 6 14.5V8.692L1.628 3.834A.5.5 0 0 1 1.5 3.5v-2z"/>
                                        </svg>
                                    </div>
                                    <div class="col-md-4">
                                        <label class="form-label">Giá tối thiểu</label>
                                        <input type="number" name="giatt" maxFractionDigits = "3" class="form-control" value="800000">
                                    </div>
                                    <div class="col-md-4">
                                        <label class="form-label">Giá tối đa</label>
                                        <input type="number" name="giatd" maxFractionDigits = "3" class="form-control" value="1200000">
                                    </div>
                                    <div class="col-md-3">
                                        <input style="margin-top: 32px" type="submit" class="btn btn-outline-warning" value="Lọc theo giá">
                                    </div>
                                </div>
                            </div>
                        </form>
                        <div class="range-input">
                            <input type="range" class="form-range" min="0" max="2000000" value="800000" step="1000">
                            <input type="range" class="form-range" min="0" max="2000000" value="1200000" step="1000">
                        </div>
                    </div>

                    <hr style="color:${sessionScope.mamauchu}"/>
                    <c:forEach items="${listLP}" var="k">

                        <div class="card mb-3 shadow" style="max-width: 100%; text-decoration: none; background-color: ${sessionScope.mamau}; color: ${sessionScope.mamauchu}; border-color: ${sessionScope.mamauchu};">
                            <div class="row g-0">
                                <div class="col-md-7">
                                    <img style="height: 300px; width: 100%; object-fit:cover;" src="${k.HINHANH}" class="img-fluid rounded-start" alt="">
                                </div>
                                <div class="col-md-5">
                                    <div class="card-body">
                                        <a style="text-decoration: none" href="datphong?id=${k.IDLOAIPHONG}">
                                            <h4 class="card-title">${k.TENLOAIPHONG}</h4>
                                        </a>
                                        <p style="display: -webkit-box;-webkit-box-orient: vertical;-webkit-line-clamp: 7;overflow: hidden;" class="card-text">${k.MOTA}</p>
                                        <h6 style="color: red">Giá phòng: <fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${k.GIAPHONG}" />₫/ngày</h6>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </c:forEach>
                    <nav aria-label="Page navigation example">
                        <ul class="pagination">

                            <c:choose>
                                <c:when test="${sessionScope.truocdoLP != 0}">
                                    <li class="page-item"><a class="page-link" href="home?idKS=${sessionScope.truocdoLP}">Trước đó</a></li>
                                    </c:when>
                                    <c:otherwise>
                                    <li class="page-item disabled"><a class="page-link" href="home?idKS=${sessionScope.truocdoLP}">Trước đó</a></li>
                                    </c:otherwise>
                                </c:choose>


                            <c:forEach begin="1" end="${countLP}" var="i">

                                <c:choose>
                                    <c:when test="${sessionScope.ketiepLP == i+1}">

                                        <li class="page-item active"><span class="page-link">${i}</span></li>
                                        </c:when>
                                        <c:otherwise>
                                        <li class="page-item"><a class="page-link active" href="home?idLP=${i}">${i}</a></li>
                                        </c:otherwise>
                                    </c:choose>

                            </c:forEach>

                            <c:choose>
                                <c:when test="${sessionScope.ketiepLP > countLP}">
                                    <li class="page-item disabled"><a class="page-link" href="home?idKS=${sessionScope.ketiepLP}">Kế tiếp</a></li>
                                    </c:when>
                                    <c:otherwise>
                                    <li class="page-item"><a class="page-link" href="home?idKS=${sessionScope.ketiepLP}">Kế tiếp</a></li>
                                    </c:otherwise>
                                </c:choose>
                        </ul>
                    </nav>
                    <div>
                        <i style="color:${sessionScope.mamauchu}">
                            Hiển thị ${listLP.size()} trong tổng số ${countAllLP} loại phòng
                        </i>
                    </div>
                </div>

            </div>
        </div>

        <jsp:include page="Footer.jsp"></jsp:include>
        <script>
            const rangeInput = document.querySelectorAll(".range-input input"),
                    priceInput = document.querySelectorAll(".price-input input"),
                    range = document.querySelector(".slider .progress");
            let priceGap = 1000;
            priceInput.forEach(input => {
                input.addEventListener("input", e => {
                    let minPrice = parseInt(priceInput[0].value),
                            maxPrice = parseInt(priceInput[1].value);
                    if ((maxPrice - minPrice >= priceGap) && maxPrice <= rangeInput[1].max) {
                        if (e.target.className === "input-min") {
                            rangeInput[0].value = minPrice;
                            range.style.left = ((minPrice / rangeInput[0].max) * 100) + "%";
                        } else {
                            rangeInput[1].value = maxPrice;
                            range.style.right = 100 - (maxPrice / rangeInput[1].max) * 100 + "%";
                        }
                    }
                });
            });
            rangeInput.forEach(input => {
                input.addEventListener("input", e => {
                    let minVal = parseInt(rangeInput[0].value),
                            maxVal = parseInt(rangeInput[1].value);
                    if ((maxVal - minVal) < priceGap) {
                        if (e.target.className === "range-min") {
                            rangeInput[0].value = maxVal - priceGap
                        } else {
                            rangeInput[1].value = minVal + priceGap;
                        }
                    } else {
                        priceInput[0].value = minVal;
                        priceInput[1].value = maxVal;
                        range.style.left = ((minVal / rangeInput[0].max) * 100) + "%";
                        range.style.right = 100 - (maxVal / rangeInput[1].max) * 100 + "%";
                    }
                });
            });
        </script>

        <!-- JavaScript Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>


    </body>
</html>
