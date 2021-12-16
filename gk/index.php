<?php 
    include 'config.php';
    function loadClass($className)
    {
        if (is_file("models/$className.php"))
            include "models/$className.php";
        else {
            echo 'Err';exit;
        }
    }

    spl_autoload_register('loadClass');

    $x= new Db();
    $controller= isset($_GET['controller'])?$_GET['controller']:'sach';
   
?>