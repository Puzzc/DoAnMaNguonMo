<?php 
$action = isset($_GET['action'])?$_GET['action']:'index';
$controller = isset($_GET['controlleraction'])?$_GET['action']:'sach';
$sach = new Sach();
if ($action=='index')
{
    $data =$sach->random(4);
    $locloai=$sach->allloai();
    $locnxb=$sach->allnxb();
//print_r($data);
    include 'views/sach/index.php';
}
if($action=='about'){
    include 'views/sach/about.php';
}
if ($action=='tatca')
{
    $locloai=$sach->allloai();
    $locnxb=$sach->allnxb();
    $data =$sach->all();
//print_r($data);
    include 'views/sach/index.php';
}
if ($action=='search')
{
    $kw = isset($_GET['kw'])?$_GET['kw']:'';
    $data = $sach->search($kw);
    $locloai=$sach->allloai();
    $locnxb=$sach->allnxb();
    include 'views/sach/index.php';
}
if($action=='locnxb'){
    $id = isset($_GET['id'])?$_GET['id']:'';
 
    $locloai=$sach->allloai();
    $locnxb=$sach->allnxb();
    $data=$sach->locnxb($id);
 
    include 'views/sach/index.php';
}
if($action=='locloai'){
    $id = isset($_GET['id'])?$_GET['id']:'';
 
    $locloai=$sach->allloai();
    $locnxb=$sach->allnxb();
    $data=$sach->locloai($id);
 
    include 'views/sach/index.php';
}
if ($action=='detail')
{
    $id = isset($_GET['id'])?$_GET['id']:'';
    $data =$sach->detail($id);
    $loai=$sach->seltenloai($data['maloai']);
    $nxb=$sach->seltennxb($data['manxb']);
 
    include 'views/sach/detail.php';
}
