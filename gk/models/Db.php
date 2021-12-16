<?php 
class Db{
    protected static $pdo;
    function __construct()
    {
        self::$pdo = new PDO('mysql:host='. HOST .';dbname='. DB, USER , PW);
        self::$pdo->query('set names utf8');
    }
    ?>