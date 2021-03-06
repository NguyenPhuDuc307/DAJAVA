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
        <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">

        <title>VNBooking | Phòng ở</title>
        <link rel="icon" href="images/logo.svg" type="image/x-icon">

    </head>

    <body style="background-color: ${sessionScope.mamau}">
        <!--NAV-->
        <jsp:include page="Header.jsp"></jsp:include>
        <div class="container" style="color:${sessionScope.mamauchu}; background-color: ${sessionScope.mamau};">
            <h4 style="color:${sessionScope.mamauchu}; background-color: ${sessionScope.mamau}; margin-top:1rem">Quản lý <b>Loại phòng</b></h4>
            <!-- Button trigger modal -->
            <button type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
                Thêm loại phòng
            </button>
            <hr/>
            <!-- Modal -->
            <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                <div class="modal-dialog modal-xl">
                    <div class="modal-content" style="color:${sessionScope.mamauchu}; background-color: ${sessionScope.mamau};">
                        <div class="modal-header">
                            <h5 class="modal-title" id="staticBackdropLabel">Thêm loại phòng</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <form action="AddLoaiPhongControl" method="post" enctype="multipart/form-data">
                            <div class="modal-body">
                                <div class="form-floating mb-3">
                                    <input class="form-control" placeholder="Loại phòng" id="floatingTextarea1" style="color:${sessionScope.mamauchu}; background-color: ${sessionScope.mamau};" name="TENLOAIPHONG" required>
                                    <label for="floatingTextarea1">Loại phòng</label>
                                </div>
                                <div class="form-floating mb-3">
                                    <textarea class="form-control" placeholder="Hãy viết mô tả" id="floatingTextarea2" style="color:${sessionScope.mamauchu}; background-color: ${sessionScope.mamau}; height: 200px" name="MOTA"></textarea>
                                    <label for="floatingTextarea2">Mô tả</label>
                                </div>
                                <div class="input-group mb-3">
                                    <input placeholder="Hình ảnh" style="color:${sessionScope.mamauchu}; background-color: ${sessionScope.mamau}; height: 4rem" type="file" class="form-control" id="image" name="image" accept="image/*" onchange="ImagesFileAsURL()"/>
                                    <label style="color:${sessionScope.mamauchu}; background-color: ${sessionScope.mamau}; ; height: 4rem" class="input-group-text" for="image">Hình ảnh phòng ở</label>
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
                                    <input type="number" class="form-control" placeholder="Giá" id="floatingTextarea3" style="color:${sessionScope.mamauchu}; background-color: ${sessionScope.mamau};" name="GIAPHONG" required>
                                    <label for="floatingTextarea3">Giá</label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input type="number" class="form-control" placeholder="Số lượng phòng" id="floatingTextarea4" style="color:${sessionScope.mamauchu}; background-color: ${sessionScope.mamau};" name="SOLUONG" required>
                                    <label for="floatingTextarea4">Số lượng phòng</label>
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
            <table style="margin-bottom:5rem; color:${sessionScope.mamauchu}; background-color: ${sessionScope.mamau};" class="table table-bordered">
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
                            <td style="color:${sessionScope.mamauchu}; background-color: ${sessionScope.mamau};"><b>${o.TENLOAIPHONG}</b></td>
                            <td style="width:310px; color:${sessionScope.mamauchu}; background-color: ${sessionScope.mamau};"><i style="display: -webkit-box;-webkit-box-orient: vertical;-webkit-line-clamp: 8;overflow: hidden;" class="card-text">${o.MOTA}</i></td>

                            <td>
                                <b style="color:red"><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${o.GIAPHONG}"/> VND/ngày</b>
                            </td>
                            <td style="color:${sessionScope.mamauchu}; background-color: ${sessionScope.mamau};"><b>${o.SOLUONG}</b></td>
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
                                        </svg></i></a>
                                <a href="datphong?id=${o.IDLOAIPHONG}" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Chi tiết"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-info-circle" viewBox="0 0 16 16">
                                        <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                        <path d="m8.93 6.588-2.29.287-.082.38.45.083c.294.07.352.176.288.469l-.738 3.468c-.194.897.105 1.319.808 1.319.545 0 1.178-.252 1.465-.598l.088-.416c-.2.176-.492.246-.686.246-.275 0-.375-.193-.304-.533L8.93 6.588zM9 4.5a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
                                        </svg></i></a>
                            </td>

                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <jsp:include page="Footer.jsp"></jsp:include>

        <!-- JavaScript Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>

    </body>
</html>