<?php
    include_once("DBManager.php");

    echo "server: error";
    if(isset($_POST["username"]) && !empty($_POST["username"]) && isset($_POST["password"]) && !empty($_POST["password"])&&($_POST["point"])&&!empty($_POST["point"]))
    {
        Update($_POST["username"], $_POST["password"],$_POST["point"]);
        
    }



    function Update($username,$passwd,$point){
        GLOBAL $con;
        
        $sql="UPDATE `users` SET `ido`=? WHERE Nev=? AND jelszo=? ";
        $st=$con->prepare($sql);

        $st->execute(array($point,$username,sha1($passwd)));

        
        
        

    }
    
?>