<?php

    include_once("DBManager.php");

    if(isset($_POST["username"]) && !empty($_POST["username"]) && isset($_POST["password"]) && !empty($_POST["password"]))
    {
        Login($_POST["username"], $_POST["password"]);
    }

    function Login($username, $password){
        GLOBAL $con;

        $sql = "SELECT Id,Nev FROM users WHERE Nev=? AND jelszo=?";
        $st = $con -> prepare($sql);

        $st -> execute(array($username, sha1($password)));
        $all = $st -> fetchAll();
        if(count($all) == 1){
            echo "SERVER: ID#".$all[0]["Id"]." - ".$all[0]["Nev"];
            exit();
        }

        echo "SERVER: error, invalid username or password";
        exit();
    }

    echo "SERVER: error, enter a valid username and password";

?>