<?php

    $host = "mysql:host=localhost;dbname=clicktype";
    $user = "root";
    $pass = "";
    $option = array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8");
    try{
        $con = new PDO($host, $user, $pass, $option);
        $con -> setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    }
    catch(PDOException){
        echo "Valami nem gyóóóúúú";
    }

?>