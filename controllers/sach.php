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
