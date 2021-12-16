<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bố cục trang web Bootstrap 4 --- dammio.com</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
  <style>
  .fakeimg {
    height: 200px;
    background: #aaa;
  }
  </style>
</head>
<body>
 
<div class="container">
 


 
<!-- Phần nội dung chính -->
<div class="row">
 
    <!-- Cột trái -->
    <div class="col-sm-3">
    </div>
    <!-- Kết thúc cột trái -->
     
    <!-- Cột phải -->
    <div class="col-sm-6">
      <h4>Chi tiết sách số:<?php echo $data['masach']?></h4>
      <h5> <?php echo $data['tensach']?></h5>
      <div ><img class="img-thumbnail"  width="350px" height="300px"src="../assets/img/book/<?php echo $data['hinh'] ?>" alt="#"></div>
      <h5>Loại: <?php echo $loai['tenloai']?></h5>
      <h5>Nhà xuất bản: <?php echo $nxb['tennxb']?></h5>     
      <h5>Mô tả</h5>
      <p> <?php echo $data['mota']?></p>     
    </div>
    <!-- Kết thúc cột phải -->
     
  </div>
</div>
<!-- Kết thúc phần nội dung chính -->
 

</body>
</html>