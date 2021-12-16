<?php 
$action = isset($_GET['action'])?$_GET['action']:'index';

$sach = new Sach();
if ($action=='index')
{
    $data =$sach->random(4);
//print_r($data);
    include './views/sach/index.php';
}
if ($action=='tatca')
{
    $data =$sach->all();
//print_r($data);
    include './views/sach/index.php';
}
if ($action=='search')
{
    $kw = isset($_GET['kw'])?$_GET['kw']:'';
    $data = $sach->search($kw);
    include './views/sach/index.php';
}
if($action=='about'){
    include './views/sach/about_admin.php';
}
if ($action=='detail')
{
    $id = isset($_GET['id'])?$_GET['id']:'';
    $data =$sach->detail($id);
    $loai=$sach->seltenloai($data['maloai']);
    $nxb=$sach->seltennxb($data['manxb']);
    include './views/sach/detail.php';
}

if ($action=='delete') {
    $id = isset($_GET['id'])?$_GET['id']:'';
    $data=$sach->delete($id);
     include './views/sach/index.php';
}

?>
