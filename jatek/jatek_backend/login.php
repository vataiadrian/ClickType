<?php

    include_once("DBManager.php");

    if(isset($_POST["Nev"]) && !empty($_POST["Nev"]) && isset($_POST["jelszo"]) && !empty($_POST["jelszo"]))
    {
        Login($_POST["Nev"], $_POST["jelszo"]);
    }

    function Login($username, $password){
        GLOBAL $con;

        $sql = "SELECT id,Nev FROM users WHERE Nev=? AND jelszo=?";
        $st = $con -> prepare($sql);

        $st -> execute(array($username, sha1($password)));
        $all = $st -> fetchAll();
        if(count($all) == 1){
            echo "SERVER: ID#".$all[0]["id"]." - ".$all[0]["Nev"];
            exit();
        }

        echo "SERVER: error, invalid username or password";
        exit();
    }

    echo "SERVER: error, enter a valid username and password";

?>