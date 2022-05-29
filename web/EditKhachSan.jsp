<%-- 
    Document   : EditKhachSan
    Created on : 10-May-2022, 19:58:57
    Author     : bigbo
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
        <title>VNBooking | Chỉnh sửa khách sạn</title>
        <link rel="icon" href="images/logo.svg" type="image/x-icon">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <body style="background-color: ${sessionScope.mamau}">
        <!--NAV-->
        <jsp:include page="Header.jsp"></jsp:include>
            <div class="container">
                <h2>Quản lý <b>Khách sạn</b></h2>
                
                <form action="EditKhachSanControl" method="post" enctype="multipart/form-data">
                    <input name="maks"value="${detailKS.MAKHACHSAN}" hidden>
                <input name="ha"value="${detailKS.HINHANH}" hidden>
                <div class="form-floating mb-3">
                    <input name="tenkhachsan" id="a1" placeholder="Tên khách sạn" class="form-control" value="${detailKS.TENKHACHSAN}" required>
                    <label for="a1">Tên khách sạn</label>
                </div>

                <div class="form-floating mb-3">
                    <textarea style="height: 10rem" id="a0" placeholder="Mô tả" name="mota" class="form-control" required>${detailKS.MOTA}</textarea>
                    <label for="a0">Mô tả</label>
                </div>

                <div class="form-floating mb-3">
                    <textarea id="addressinput" placeholder="Địa chỉ khách sạn" name="diachi" class="form-control" required>${detailKS.DIACHI}</textarea>
                    <label for="addressinput">Địa chỉ khách sạn</label>
                </div>


                <div class="form-floating mb-3">
                    <textarea style="height: 7rem" id="a3" placeholder="Nhúng bản đồ Google Maps" name="ggmap" class="form-control" required>${detailKS.GGMAP}</textarea>
                    <label for="a3">Nhúng bản đồ Google Maps</label>
                </div>

                <div class="input-group mb-3">
                    <input style="height: 4rem" value="${detailKS.HINHANH}" placeholder="Hình ảnh" style="color:${sessionScope.mamauchu}; background-color: ${sessionScope.mamau};" type="file" class="form-control" id="image" name="image" accept="image/*" onchange="ImagesFileAsURL()"/>
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
                    <select style="height: 4rem" class="form-select" id="inputGroupSelect01" name="hang" required>
                        <option selected>Tiêu chuẩn khách sạn (TCVN 4391: 2009)</option>
                        <c:choose>
                            <c:when test="${detailKS.HANG==1}">
                                <option selected value="1">1 sao</option>
                            </c:when>
                            <c:otherwise>
                                <option value="1">1 sao</option>
                            </c:otherwise>
                        </c:choose>

                        <c:choose>
                            <c:when test="${detailKS.HANG==2}">
                                <option selected value="2">2 sao</option>
                            </c:when>
                            <c:otherwise>
                                <option value="2">2 sao</option>
                            </c:otherwise>
                        </c:choose>

                        <c:choose>
                            <c:when test="${detailKS.HANG==3}">
                                <option selected value="3">3 sao</option>
                            </c:when>
                            <c:otherwise>
                                <option value="3">3 sao</option>
                            </c:otherwise>
                        </c:choose>

                        <c:choose>
                            <c:when test="${detailKS.HANG==4}">
                                <option selected value="4">4 sao</option>
                            </c:when>
                            <c:otherwise>
                                <option value="4">4 sao</option>
                            </c:otherwise>
                        </c:choose>

                        <c:choose>
                            <c:when test="${detailKS.HANG==5}">
                                <option selected value="5">5 sao</option>
                            </c:when>
                            <c:otherwise>
                                <option value="5">5 sao</option>
                            </c:otherwise>
                        </c:choose>
                    </select>
                    <label for="inputGroupSelect01">Tiêu chuẩn khách sạn (TCVN 4391: 2009)</label>
                </div>

                <div class="form-floating mb-3">
                    <select style="height: 4rem" class="form-select" id="inputGroupSelect01" name="ngung" required>
                        <option selected>Trạng thái hoạt động</option>
                        <c:choose>
                            <c:when test="${detailKS.NGUNG==true}">
                                <option selected value="true">Đã ngừng hoạt động</option>
                            </c:when>
                            <c:otherwise>
                                <option value="true">Đã ngừng hoạt động</option>
                            </c:otherwise>
                        </c:choose>

                        <c:choose>
                            <c:when test="${detailKS.NGUNG==false}">
                                <option selected value="false">Đang hoạt động</option>
                            </c:when>
                            <c:otherwise>
                                <option value="false">Đang hoạt động</option>
                            </c:otherwise>
                        </c:choose>
                    </select>
                    <label for="inputGroupSelect01">Trạng thái hoạt động</label>
                </div>
                <div style="margin-top: 1rem">
                    <input type="submit" class="btn btn-success" value="Lưu thay đổi">
                    <a href="KhachSanControl">
                        <button style="width: 5rem" class="btn btn-outline-warning">Hủy</button>
                    </a>
                </div>
            </form>
        </div>
        <jsp:include page="Footer.jsp"></jsp:include>
        <script src="js/manager.js" type="text/javascript"></script>
        <!-- JavaScript Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
    </body>
</html>
