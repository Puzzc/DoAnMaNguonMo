
<table class="table table-striped">
<thead class="thead-dark">
<th scope="col">Mã sách</th>
<th scope="col">Tên sách</th>
<th scope="col">Giá</th>


</thead>
    <?php
    foreach ($data as $r) {
    ?>
        <tr>
            <td><?php echo $r['masach']; ?></td>
            <td><?php echo $r['tensach']; ?></td>
            <td><?php echo $r['gia']; ?></td>
            <td>
                <a href="index.php?controller=sach&action=detail&id=<?php echo $r['masach'] ?>">
                    Chi tiet
                </a>
            </td>
            <td>
                <a href="index.php?controller=sach&action=delete&id=<?php echo $r['masach'] ?>">
                    xóa
                </a>
            </td>
            <td>
                <a href="index.php?controller=sach&action=edit&id=<?php echo $r['masach'] ?>">
                    sửa
                </a>
            </td>
        </tr>
    <?php
    }
    ?>
</table>