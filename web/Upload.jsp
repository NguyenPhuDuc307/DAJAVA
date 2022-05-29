<%-- 
    Document   : Upload
    Created on : May 22, 2022, 9:17:49 AM
    Author     : nguye
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <title>File Uploading Form</title>
        <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    </head>
    <body class="container">
        <h1>File Upload Form</h1>
        <form action="AddLoaiPhongControl" method="post" enctype="multipart/form-data">
            <div class="modal-body">
                <div class="form-group">
                    <label>Tên loại phòng</label>
                    <input style="color:${sessionScope.mamauchu}; background-color: ${sessionScope.mamau};" name="TENLOAIPHONG" type="text" class="form-control" required>
                </div>
                <div class="form-group mb-3">
                    <label>Mô tả</label>
                    <input style="color:${sessionScope.mamauchu}; background-color: ${sessionScope.mamau};" name="MOTA" type="text" class="form-control" required>
                </div>
                <div class="input-group mb-3">
                    <input type="file" class="form-control" id="image" name="image">
                    <label class="input-group-text" for="image">Upload</label>
                </div>
                <div class="form-group">
                    <label>Giá</label>
                    <textarea style="color:${sessionScope.mamauchu}; background-color: ${sessionScope.mamau};" name="GIAPHONG" class="form-control" required></textarea>
                </div>
                <div class="form-group">
                    <label>Số lượng</label>
                    <textarea style="color:${sessionScope.mamauchu}; background-color: ${sessionScope.mamau};" name="SOLUONG" class="form-control" required></textarea>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy bỏ</button>
                <button type="submit" class="btn btn-primary">Đồng ý</button>
            </div>

        </form>
    </body>
</html>
