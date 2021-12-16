<?php 
if (!defined('HOST')){
    exit;
}
class Sach extends Db 
{
    function all()
    {
        return $this->selectQuery('select * from sach');
    }
    
    function random($n)
    {
        return $this->selectQuery("select * from sach order by rand() limit 0, $n");
    }
}