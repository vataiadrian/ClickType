<?php
    header('Access-Control-Allow-Origin: *');
    header('Content-Type: application/JSON; charset: utf-8;');
    require("adatok.php");
    $conn = new PDO("mysql:host=$dbhost;dbname=$dbname;", $dbuser, $dbpass);
    $conn->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
    $conn->exec("SET NAMES utf8");
    // a frontendről érkezett adatok fogadása
    $data = json_decode(file_get_contents("php://input"));

    $table = $data->table;
    $values = $data->values;
    $str = '';
    foreach($values as $value)
    {
       $str .= ', '.$value;
    }
  
    $conn->beginTransaction();
    $res = $conn->exec("INSERT INTO $table VALUES(null $str)");
    if ($res)
    {
        $conn->commit();
        $result = array(
            'error' => '',
            'message' => 'Rekord felvéve!'
        );
    }
    else
    {
        $conn->rollBack();
        $result = array(
            'error' => $conn->errorInfo(),
            'message' => 'Hiba az adatbázis művelet során!'
        );
    }
    
    echo json_encode($result);
?>