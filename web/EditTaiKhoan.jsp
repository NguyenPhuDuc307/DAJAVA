<%-- 
    Document   : EditTaiKhoan
    Created on : 10-May-2022, 13:38:58
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
        <title>VNBooking | Chỉnh tài khoản</title>
        <link rel="icon" href="images/logo.svg" type="image/x-icon">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <body style="color: ${sessionScope.mamauchu}; background-color: ${sessionScope.mamau}">
        <!--NAV-->
        <jsp:include page="Header.jsp"></jsp:include>
            <div class="container">

            <c:choose>
                <c:when test="${sessionScope.doimktc == true}">
                    <h4 style="color: green">Đổi mật khẩu thành công, mật khẩu mới có hiệu lực từ phiên đăng nhập kế tiếp.</h4>
                </c:when>
                <c:when test="${sessionScope.doimktc == false}">
                    <h4 style="color: red">Đổi mật khẩu không thành công, bạn vui lòng kiểm tra lại mật khẩu cũ.</h4>
                </c:when>
                <c:otherwise>

                </c:otherwise>
            </c:choose>


            <h2>Quản lý <b>Tài khoản</b></h2>

            <div class="position-relative" style="margin-top:19rem; margin-bottom: 12rem">
                <div class="position-absolute bottom-0 start-50 translate-middle-x">
                    <c:choose>
                        <c:when test="${detailTK.HINHANH == null}">
                            <img data-bs-toggle="modal" data-bs-target="#staticBackdropp" style="height:20rem; width:20rem; border-radius:50%; margin-top:1rem; object-fit:cover;" src="https://superawesomevectors.com/wp-content/uploads/2017/06/camera-flat-style-vector-icon-800x566.jpg" class="img-thumbnail shadow" alt="...">
                        </c:when>
                        <c:otherwise>
                            <img data-bs-toggle="modal" data-bs-target="#staticBackdropp" style="height:20rem; width:20rem; border-radius:50%; margin-top:1rem; object-fit:cover;" src="${detailTK.HINHANH}" class="img-thumbnail shadow" alt="...">
                        </c:otherwise>
                    </c:choose>
                </div>

                <c:choose>
                    <c:when test="${sessionScope.tttk == true }">
                        <!-- Modal -->
                        <div class="modal fade" id="staticBackdropp" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                            <div class="modal-dialog modal-lg" style="width: 534px">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="staticBackdropLabel">Thay đổi ảnh đại dien</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <form action="doianhdaidientk" method="post" enctype="multipart/form-data">
                                            <input name="idtk"value="${detailTK.IDTAIKHOAN}" hidden>

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
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                                                <button type="submit" class="btn btn-primary">Lưu thay đổi</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:when>
                    <c:otherwise>

                    </c:otherwise>
                </c:choose>

            </div>

            <form style="margin-top: 20rem" action="EditTaiKhoan" method="post" enctype="multipart/form-data">
                <div class="modal-body">
                    <input name="IDTK"value="${detailTK.IDTAIKHOAN}" hidden>

                    <div class="form-floating mb-3">
                        <select style="height: 4rem" name="maks" class="form-select" id="inputGroupSelect01" required>
                            <c:forEach items="${listKSorder}" var="k">
                                <c:choose>
                                    <c:when test="${k.MAKHACHSAN == detailTK.MAKHACHSAN}">
                                        <option selected value="${k.MAKHACHSAN}">${k.TENKHACHSAN}</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="${k.MAKHACHSAN}">${k.TENKHACHSAN}</option>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </select>
                        <label for="inputGroupSelect01">Nhân viên khách sạn</label>
                    </div>

                    <div class="form-floating mb-3">
                        <input id="a2" placeholder="Họ tên" value="${detailTK.HOTEN}" style="color: ${sessionScope.mamauchu}; background-color: ${sessionScope.mamau}" name="hoten" type="text" class="form-control" required>
                        <label for="a2">Họ tên</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input id="a3" placeholder="Số điện thoại" value="${detailTK.DIENTHOAI}" style="color: ${sessionScope.mamauchu}; background-color: ${sessionScope.mamau}" name="dt" type="text" class="form-control" required>
                        <label for="a3">Số điện thoại</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input id="a4" placeholder="Địa chỉ email" value="${detailTK.EMAIL}" style="color: ${sessionScope.mamauchu}; background-color: ${sessionScope.mamau}" name="email" type="text" class="form-control" required>
                        <label for="a4">Địa chỉ email</label>
                    </div>

                    <div class="form-floating mb-3">
                        <select style="height: 4rem" name="admin" class="form-select" id="inputGroupSelect05" required>
                            <c:choose>
                                <c:when test="${detailTK.ADMIN==true}">
                                    <option selected value="true">Cho phép</option>
                                </c:when>
                                <c:otherwise>
                                    <option value="true">Cho phép</option>
                                </c:otherwise>
                            </c:choose>

                            <c:choose>
                                <c:when test="${detailTK.ADMIN==false}">
                                    <option selected value="flase">Không cho phép</option>
                                </c:when>
                                <c:otherwise>
                                    <option value="false">Không cho phép</option>
                                </c:otherwise>
                            </c:choose>

                        </select>
                        <label for="inputGroupSelect05">Quyền điều khiển trang web</label>
                    </div>
                </div>

                <hr/>
                <c:choose>
                    <c:when test="${sessionScope.tttk == true }">

                        <div class="form-group" style="margin-top: 1rem">
                            <input type="button" data-bs-toggle="modal" data-bs-target="#staticBackdrop" class="btn btn-outline-primary" value=" Đổi mật khẩu">
                        </div>
                        <input value="${sessionScope.tttk}" name="tttk" hidden="">
                        <input value="${sessionScope.acc.IDTAIKHOAN}" name="idtttk" hidden="">
                        <div style="margin-top: 1rem">
                            <input type="submit" class="btn btn-success" value="Lưu thay đổi">

                            <a href="thongtintaikhoan">
                                <button style="width: 5rem" class="btn btn-outline-warning">Hủy</button>
                            </a>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <input value="${sessionScope.tttk}" name="tttk" hidden="">
                        <input value="${sessionScope.acc.IDTAIKHOAN}" name="idtttk" hidden="">
                        <div style="margin-top: 1rem">
                            <input type="submit" class="btn btn-success" value="Lưu thay đổi">
                            <a href="TaiKhoanControl">
                                <button style="width: 5rem" class="btn btn-outline-warning">Hủy</button>
                            </a>
                        </div>
                    </c:otherwise>
                </c:choose>
            </form>
            <!-- Modal -->
            <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="staticBackdropLabel">Thay đổi mật khẩu</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form action="doimatkhautk" method="post">
                                <input name="idtk"value="${detailTK.IDTAIKHOAN}" hidden>
                                <div class="form-floating mb-3">
                                    <input id="a2" placeholder="Mật khẩu cũ" style="color: ${sessionScope.mamauchu}; background-color: ${sessionScope.mamau}" name="passcu" type="password" class="form-control" required>
                                    <label for="a2">Mật khẩu cũ</label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input id="a3" placeholder="Mật khẩu mới" style="color: ${sessionScope.mamauchu}; background-color: ${sessionScope.mamau}" name="pass" type="password" class="form-control" required>
                                    <label for="a3">Mật khẩu mới</label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input id="a4" placeholder="Xác nhận mật khẩu mới" style="color: ${sessionScope.mamauchu}; background-color: ${sessionScope.mamau}" name="repass" type="password" class="form-control" required>
                                    <label for="a4">Xác nhận mật khẩu mới</label>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                                    <button type="submit" class="btn btn-primary">Lưu thay đổi</button>
                                </div>
                            </form>
                        </div>

                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="Footer.jsp"></jsp:include>
        <script src="js/manager.js" type="text/javascript"></script>
        <!-- JavaScript Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
    </body>
</html>
