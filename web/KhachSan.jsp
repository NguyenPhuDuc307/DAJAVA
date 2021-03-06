<%-- 
    Document   : KhachSan
    Created on : 10-May-2022, 14:27:26
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
        <title>VNBooking | Quản lý khách sạn</title>
        <link rel="icon" href="images/logo.svg" type="image/x-icon">
    </head>
    <body style="color: ${sessionScope.mamauchu}; background-color: ${sessionScope.mamau}">
        <!--NAV-->
        <jsp:include page="Header.jsp"></jsp:include>
            <div class="container">
                <h4>Quản lý <b>Khách sạn</b></h4>
                <!-- Button trigger modal -->
                <button style="margin-bottom: 1rem" type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
                    Thêm khách sạn
                </button>
                <table class="table table-bordered" style="color: ${sessionScope.mamauchu}; background-color: ${sessionScope.mamau}">
                <thead>
                    <tr>
                        <th>Tên khách sạn</th>
                        <th>Địa chỉ</th>
                        <th>Trạng thái</th>
                        <th>Chỉnh sửa</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${listKS}" var="o">
                        <tr>
                            <td style="width: 400px">
                                <!-- Button trigger modal -->
                                <div type="text" class="" data-bs-toggle="modal" data-bs-target="#${o.MAKHACHSAN}1">
                                    <h6>${o.TENKHACHSAN}</h6>
                                </div>

                                <!-- Modal -->
                                <div class="modal fade" id="${o.MAKHACHSAN}1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog modal-lg">
                                        <div class="modal-content" style="color: ${sessionScope.mamauchu}; background-color: ${sessionScope.mamau}">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">Hình ảnh - ${o.TENKHACHSAN}</h5>

                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                <img src="${o.HINHANH}" width="767" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div>
                                    <c:forEach var="temp" begin="1" end="${o.HANG}">
                                        <svg xmlns="http://www.w3.org/2000/svg" style="color:orange" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
                                        <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
                                        </svg>
                                    </c:forEach>
                                </div>
                            </td>
                            <td style="width: 600px">
                                <!-- Button trigger modal -->
                                <div type="text" class="" data-bs-toggle="modal" data-bs-target="#${o.MAKHACHSAN}">
                                    ${o.DIACHI}
                                </div>

                                <!-- Modal -->
                                <div class="modal fade" id="${o.MAKHACHSAN}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog modal-lg">
                                        <div class="modal-content" style="color: ${sessionScope.mamauchu}; background-color: ${sessionScope.mamau}">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">Địa chỉ</h5>

                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                <iframe src="${o.GGMAP}" width="767" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${o.NGUNG==true}">
                                        <p style="color:red">Đã ngừng hoạt động</p>
                                    </c:when>    
                                    <c:otherwise>
                                        <p style="color:green">Đang hoạt động</p>
                                    </c:otherwise>
                                </c:choose>

                            </td>
                            <td>
                                <a href="loadKhachSanControl?IDKS=${o.MAKHACHSAN}"  class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Sửa"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                                        <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                                        <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
                                        </svg></i>
                                </a>
                                <a href="detail?id=${o.MAKHACHSAN}" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Chi tiết"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-info-circle" viewBox="0 0 16 16">
                                        <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                        <path d="m8.93 6.588-2.29.287-.082.38.45.083c.294.07.352.176.288.469l-.738 3.468c-.194.897.105 1.319.808 1.319.545 0 1.178-.252 1.465-.598l.088-.416c-.2.176-.492.246-.686.246-.275 0-.375-.193-.304-.533L8.93 6.588zM9 4.5a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
                                        </svg></i></a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <!-- Modal -->
        <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog modal-xl">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="staticBackdropLabel">Thêm khách sạn</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form action="AddKhachSanControl" method="post" enctype="multipart/form-data">
                        <div class="modal-body">
                            <div class="form-floating mb-3">
                                <input name="MAKHACHSAN" placeholder="Mã khách sạn" id="floatingTextarea1" type="text" class="form-control" required>
                                <label for="floatingTextarea1">Mã khách sạn</label>
                            </div>
                            <div class="form-floating mb-3">
                                <input name="TENKHACHSAN" placeholder="Tên khách sạn" id="floatingTextarea2" type="text" class="form-control" required>
                                <label for="floatingTextarea3">Tên khách sạn</label>
                            </div>

                            <div class="form-floating mb-3">
                                <textarea name="MOTA" style="height: 200px" type="text" class="form-control" placeholder="Tên khách sạn" id="floatingTextarea4" required></textarea>
                                <label for="floatingTextarea4">Mô tả về khách sạn</label>
                            </div>

                            <div class="form-floating mb-3">
                                <textarea name="DIACHI" placeholder="Địa chỉ" style="height: 6rem" type="text" id="floatingTextarea5" class="form-control" required></textarea>
                                <label for="floatingTextarea5">Địa chỉ khách sạn</label>
                            </div>

                            <div class="form-floating mb-3">
                                <textarea placeholder="Nhúng bản đồ Google Maps" style="height: 6rem" id="floatingTextarea6" name="GGMAP" class="form-control" required></textarea>
                                <label for="floatingTextarea6">Nhúng bản đồ Google Maps</label>
                            </div>

                            <div class="input-group mb-3">
                                <input style="height: 4rem" placeholder="Hình ảnh" style="color:${sessionScope.mamauchu}; background-color: ${sessionScope.mamau};" type="file" class="form-control" id="image" name="image" accept="image/*" onchange="ImagesFileAsURL()"/>
                                <label style="height: 4rem" style="color:${sessionScope.mamauchu}; background-color: ${sessionScope.mamau};" class="input-group-text" for="image">Hình ảnh khách sạn</label>
                            </div>

                            <div id="displayImg">
                            </div>
                            <script type="text/javascript">
                                function ImagesFileAsURL() {
                                    var fileSelected = document.getElementById('image').files;
                                    if (fileSelected.length > 0) {
                                        var fileToLoad = fileSelected[0];
                                        var fileReader = new FileReader();
                                        fileReader.onload = function (fileLoaderEvent) {
                                            var srcData = fileLoaderEvent.target.result;
                                            var newImage = document.createElement('img');
                                            newImage.src = srcData;
                                            document.getElementById('displayImg').innerHTML = newImage.outerHTML;
                                        }
                                        fileReader.readAsDataURL(fileToLoad);
                                    }
                                }
                            </script>

                            <div class="form-floating mb-3">
                                <select style="height: 4rem" class="form-select" id="inputGroupSelect01" name="HANG" required>
                                    <option selected>Chọn tiêu chuẩn</option>
                                    <option value="1">1 sao</option>
                                    <option value="2">2 sao</option>
                                    <option value="3">3 sao</option>
                                    <option value="4">4 sao</option>
                                    <option value="5">5 sao</option>
                                </select>
                                <label for="inputGroupSelect01">Tiêu chuẩn khách sạn (TCVN 4391: 2009)</label>
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
        <jsp:include page="Footer.jsp"></jsp:include>

        <!-- JavaScript Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>

    </body>
</html>