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
if($action=='a'){
    $da=$sach->allloai();
    $data=$sach->allnxb();
  include 'sach/Frmaddsach.php';
}
?>
