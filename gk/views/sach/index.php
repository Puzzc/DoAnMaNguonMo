<div class="container">
    <div class="row">
        <div class="col-sm-6">
            <div></div>
            <div class="col-sm-8">
                <div class="dropdown">
                    <button class="dropbtn">Nhà xuất bản</button>
                    <div class="dropdown-content">
                        <?php foreach ($locnxb as $k) { ?>

                            <a href="index.php?action=locnxb&id=<?php echo $k['manxb'] ?>"><?php echo $k['tennxb'] ?></a>


                        <?php } ?>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-6">

            <div class="col-sm-8">
                <div class="dropdown">
                    <button class="dropbtn">Loại</button>
                    <div class="dropdown-content">
                        <?php foreach ($locloai as $k) { ?>

                            <a href="index.php?action=locloai&id=<?php echo $k['maloai'] ?>"><?php echo $k['tenloai'] ?></a>


                        <?php } ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<table class="table table-striped">
    <thead class="thead-dark">

        <th scope="col">Ảnh sách</th>
        <th scope="col">Tên sách</th>
        <th scope="col">Giá</th>


    </thead>
    <?php
    foreach ($data as $r) {
    ?>
        <tr>
            <td><img class="img-thumbnail" width="150px" height="150px" src="assets/img/book/<?php echo $r['hinh'] ?>" alt="#"></td>
            <td> <a href="index.php?controller=sach&action=detail&id=<?php echo $r['masach'] ?>"><?php echo $r['tensach']; ?></a></td>
            <td><?php echo $r['gia']; ?></td>
        </tr>
    <?php
    }
    ?>
</table>