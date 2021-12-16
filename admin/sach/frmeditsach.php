
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
</head>

<body>
    <div class="container-fluid mt-3">
        <h4>ADD</h4>
        <div class="container">
            <div class="row justify-content-center align-items-center">

                <form method="post" action="index.php?action=editsach" enctype="multipart/form-data">
                    <!-- Vertical -->
                    <div class="form-group">
                        <label for="myEmail">Mã sách</label>
                        <input type="text" id="id" name="id" class="form-control" value='<?php echo $ds['masach'] ?>' readonly>
                        <label for="myNameBook">Tên sách</label>
                        <input type="text" id="name" name="name" class="form-control"value='<?php echo $ds['tensach'] ?>'>
                        <label for="myPriceBook">Giá sách</label>
                        <input type="text" id="price" name="price" class="form-control"value='<?php echo $ds['gia'] ?>'>
                        <div class="form-group">
                            <label for="DescriptionBook">Mô tả</label>
                            <textarea class="form-control" id="description" name="description" rows="3"><?php echo $ds['mota'] ?></textarea>
                        </div>
                        <label for="myImageBook">Ảnh sách</label>
                        <input type="file" id="img"name="img" class="form-control" value='<?php echo $ds['hinh'] ?>' >
                        <label for="maNXB">Nhà xuất bản</label>

                        <select name="maNXB" class="form-control form-control-sm">
                            <?php foreach ($data as $k) { ?>
                                <option value="<?php echo $k["manxb"] ?>"><?php echo $k["tennxb"] ?></option>
                            <?php } ?>
                        </select>
                        <label for="maLoai">Loại sách</label>
                        <select name="maLoai" id="maLoai" class="form-control form-control-sm">
                            <?php foreach ($da as $k) { ?>
                                <option value="<?php echo $k["maloai"] ?>"><?php echo $k["tenloai"] ?></option>
                            <?php } ?>
                        </select>
                     

                       
                            <button type="submit" class="btn btn-primary mt-2">Submit</button>
                      
                    </div>
                </form>
            </div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
</body>

</html>