<?php 
$action = isset($_GET['action'])?$_GET['action']:'index';

$sach = new Sach();
if ($action=='index')
{
    $data =$sach->random(4);
//print_r($data);
    include './sach/index.php';
}
if ($action=='tatca')
{
    $data =$sach->all();
//print_r($data);
    include './sach/index.php';
}
if ($action=='search')
{
    $kw = isset($_GET['kw'])?$_GET['kw']:'';
    $data = $sach->search($kw);
    include './sach/index.php';
}
if($action=='about'){
    include './sach/about_admin.php';
}
if ($action=='detail')
{
    $id = isset($_GET['id'])?$_GET['id']:'';
    $data =$sach->detail($id);
    $loai=$sach->seltenloai($data['maloai']);
    $nxb=$sach->seltennxb($data['manxb']);
    include './sach/detail.php';
}

if ($action=='delete') {
    $id = isset($_GET['id'])?$_GET['id']:'';
    $data=$sach->delete($id);
     include './sach/index.php';
}
if($action=='add'){
    $da=$sach->allloai();
    $data=$sach->allnxb();
  include 'sach/Frmaddsach.php';
}
if($action=='addbook'){
    $id=isset($_POST['id'])?$_POST['id']:'';
    $name=isset($_POST['name'])?$_POST['name']:'';
    $price=isset($_POST['price'])?$_POST['price']:'';
    $description=isset($_POST['description'])?$_POST['description']:'';
    $img="";
    if($_FILES['img']['error']==0){
        $img=$_FILES['img']['name'];
        $rootDir = realpath($_SERVER["DOCUMENT_ROOT"]);
    move_uploaded_file($_FILES['img']['tmp_name'],$rootDir.'/tuan6-1123/gk/assets/img/book/'.$img);
    
    }
    $maNXB=isset($_POST['maNXB'])?$_POST['maNXB']:'';
    $maLoai=isset($_POST['maLoai'])?$_POST['maLoai']:'';
    $data=$sach->add($id,$name,$description,$price,$img,$maNXB,$maLoai);
    include './views/sach/index.php';
}
?>
