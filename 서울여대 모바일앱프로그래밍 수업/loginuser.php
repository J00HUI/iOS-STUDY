<?php
    $conn = mysqli_connect('localhost', 'root', 'root', 'iphone');
    $userid = ($_POST['id']);
    $sql = "select userid, passwd, name from user where userid = '$userid' limit 1";
    $result = mysqli_query($conn, $sql);
    if(mysqli_num_rows($result) > 0) {
        while($row = mysqli_fetch_row($result)) {
            $dbUserid = $row[0];
            $dbPassword = $row[1];
            $dbName = $row[2];

            $password = ($_POST['password']);
            $password = md5($password);

            if($userid == $dbUserid && $password == $dbPassword) {
                echo json_encode(array("success"=>"YES", "name"=>$dbName));
            } else {
                echo json_encode(array("success"=>"NO", "error"=>"Password is invalid"));
            }
        }
    } else {
        echo json_encode(array("success"=>"NO", "error"=>"ID not exist"));
    }

    mysqli_close($conn);
?>
